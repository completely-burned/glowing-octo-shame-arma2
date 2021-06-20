/* скрипт создает бункеры у городов.
*/

// gosa_constructedList = [];

[] call compile preprocessFileLineNumbers "dir\server\server_getlocations.sqf";

Private["_buildings","_constructFunction","_count","_customCamps","_customOwners","_locationsInitialized"];
Private["_marker","_markedPosition","_markedRegions","_path","_rangeSize","_side","_townNodeNames","_total","_towns"];

_constructFunction = Compile preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf";

_locationsInitialized = 0;
_towns = [];
_townNodeNames = [];//CityCenter classnames of towns.

Private["_campAreas","_cityCenters","_className","_direction","_name","_names","_nodeName","_nodeName1","_neighbors","_position","_townName","_townNames","_type"];

_cityCenters = BIS_WF_TownCenters;	//Data from Config entry on towns' center, node name, & neighbors.
_townNames = BIS_WF_TownNames;	//Data from Config entry on towns' actual name (taken from town map label).
_campAreas = BIS_WF_CampAreas;	//Data from Config entry on towns' camps (position and direction).

Private["_cityCenter","_depotDirection","_depotPosition","_depots","_depots","_flatAreas","_objects"];
Private["_camp","_camps","_conflictingCamps","_destination","_minSize","_range","_size"];
Private["_composition","_constructed","_nearestDistance","_newCamps","_previousTown"];
Private["_minSizeMod","_sizeMod"];

_total = Count _cityCenters;

private["_speech"];

for [{_count = 0},{_count < _total},{_count = _count + 1}] do
{

	_cityCenter = _cityCenters Select _count;
	_position = _cityCenter Select 0;
	_townName = _cityCenter Select 1;
	_neighbors = _cityCenter Select 2;	//Connected city centers.
	_className = _cityCenter Select 3;	//Name of this town's CityCenter class.

	_speech = "village";

	ScopeName "CreateTown";

	//Find town's actual name.
	_nearestDistance = 1500; //Berezino: (CC dist name_location) > 700

	private["_replaceTownName"]; _replaceTownName = false;
	if (_townName == "" || _townName == _className) then {_replaceTownName = true;};

	{//match name locations (labels in 2D map) - for speech array + _townName eventually
		_distance = (_x Select 0) Distance _position;
		if (_distance < _nearestDistance) then
		{
			_nearestDistance = _distance;

			if (_replaceTownName) then {_townName = _x Select 1;};
			_speech = _x select 2;

			if (_distance < 150) then {BreakTo "CreateTown"};
		};
	} ForEach _townNames;

	//If no name was found then set to class name.
	if (_townName == "") then {_townName == _className};

	//Do not use map location if a custom location is already present.
	_objects = _position NearEntities["LocationLogicCity",350];
	_depots = [];

/*
	{
		if (_x In BIS_WF_CustomLocations) then {_depots = _depots + [_x]};
	} ForEach _objects;
*/

	//Check if this area is being used by a custom location.
	if (Count _depots < 1) then
	{
		//TODO:FIXME: nearObjects read map -> bad at startup
		  //... news:gg6e8i$r75$1@new-server.localdomain - going thru whole map & using nearestObjects crashes the game
		//Calculate size.
		//debugLog ("WF_NEAROBJ  "+ str call compile "350" + " in o:\arma\ca\warfare2\Scripts\Server\Init\Init_AllTowns.sqf");
		_buildings = Count (_position NearObjects ["house",350]);
		_size = Round (_buildings / 15) * 10 + 30;
		if (_size > 200) then {_size = 200};

		_rangeSize = Round (_buildings / 20) * 10 + 20;
		if (_rangeSize > 150) then {_rangeSize = 150};

		_minSize = (Round (_size / 40)) * 10;
		if (_minSize < 20) then {_minSize = 20};

		_depotPosition = _position;
		_depotDirection = 0;
		_flatAreas = NearestLocations[_position,["FlatAreaCity"],350];

		if (Count _flatAreas > 0) then
		{
			_depotPosition = LocationPosition (_flatAreas Select 0);
			_depotDirection = Direction (_flatAreas Select 0);
		};

		_town = group_logic CreateUnit ["LocationLogicCity",_position,[],0,"NONE"];
		_depot = group_logic CreateUnit ["LocationLogicDepot",_depotPosition,[],0,"NONE"];
		_depot SetDir _depotDirection;

		_town SetVariable["name",_townName];
		_town SetVariable["speech",_speech,true]; //speech - string that matches word/sentence definition in voice protocol; also can be usually converted to localized string (str_location_<speech>)

		_composition = gosa_depotCompositions Call BIS_fnc_selectRandom;
		_constructed = [_depotPosition,_depotDirection,_composition] Call _constructFunction;
		gosa_constructedList set [count gosa_constructedList, _constructed];
		//[_depot] Call BIS_WF_InitDefenseLayout; // мед палатка

		[[_town]] Call BIS_fnc_locations;

		//For Alice compatibility - Remove if BIS_fnc_locations is modified to allow registering locations.
		_town SetVariable ["type","FlatAreaCity"];
		//_town SetVariable ["class","BIS_loc_" + (_town GetVariable "name")];

		Textlog Format ["WF Debug: town Created %1 at _depotPosition %2",_town, _depotPosition];

		//Link logic and depot.
		_depot SetVariable["location",_town,true];
		_town SetVariable["depot",_depot,true];

		_towns = _towns + [_town];
		_townNodeNames = _townNodeNames + [_className];

		//These will be converted from strings to town depots after all depots have been created.
		_town SetVariable["neighbors",_neighbors];

		//Calculate range based on size.
		_sizeMod = 5 + gosa_rangeSizeModifier;
		if (_sizeMod < 0) then {_sizeMod = 0};

		_minSizeMod = gosa_rangeModifier;
		if (_minSizeMod < -300) then {_minSizeMod = -300};

		_range = (400 + _minSizeMod) + _rangeSize * _sizeMod;

		//Cap very high values.
		if (_range > 5000) then {_range = 5000};

		_town SetVariable["range",_range];
		_town SetVariable["minSV",_minSize];
		_town SetVariable["SV",_minSize];

		_town SetVariable["maxSV",_size];
		//if (BIS_WF_LimitedWarfare) then {_town SetVariable["maxSV",_minSize]};

		_town SetVariable["centerPosition",_position,true];

		_camps = [];

		//Create camps.
		{
			_destination = _x Select 0;

			if (_destination Distance _position < _range) then
			{
				_conflictingCamps = _destination NearEntities["LocationLogicCamp",20];

				if (Count _conflictingCamps < 1) then
				{
					_camp = group_logic CreateUnit ["LocationLogicCamp",_destination,[],0,"NONE"];

					_camp SetVariable["town",_town,true];
					_camp SetDir (_x Select 1);
					_camps = _camps + [_camp];

					_composition = gosa_campCompositions Call BIS_fnc_selectRandom;
					_constructed = [_destination,_x Select 1,_composition] Call _constructFunction;
					gosa_constructedList set [count gosa_constructedList, _constructed];
				}
				else
				{
					//Check if this camp is closer to current town then one it was created for.
					_camp = _conflictingCamps Select 0;
					_previousTown = _camp GetVariable "town";

					if (_camp Distance _town < _camp Distance _previousTown) then
					{
						_camp SetVariable["town",_town,true];
						_camps = _camps + [_camp];

						_newCamps = _previousTown GetVariable "camps";
						_newCamps = _newCamps - [_camp];
						_previousTown SetVariable["camps",_newCamps,true];
					};
				};
			};
		} ForEach _campAreas;

		_town SetVariable["camps",_camps,true];
	};
};

/*
Private["_closestLocation","_found","_index","_location","_locationLinks","_name","_neighbors","_nearNames"];

//Add any custom locations.
{
Textlog Format["WF Debug: Custom town %1 initialized.",_x GetVariable "name"];

	_depot = _x GetVariable "depot";
	if (IsNil "_depot") then
	{
		_depot = group_logic CreateUnit ["LocationLogicDepot",Position _x,[],0,"NONE"];
		_x SetVariable ["depot",_depot,true];
Textlog Format["WF Debug: %1 depot created: %1",_x GetVariable "name"];
	};

	_composition = [BIS_WF_Constants GetVariable "depotCompositions"] Call BIS_fnc_selectRandom;
	_constructed = [Position _depot,Direction _depot,_composition] Call _constructFunction;
	gosa_constructedList set [count gosa_constructedList, _constructed];
	[_depot] Call BIS_WF_InitDefenseLayout;

	//Link depot to logic.
	_depot SetVariable["location",_x,true];

	//Use any LocationLogicCityLinks to attach this location to others.
	_location = _x;
	_neighbors = [];
	_locationLinks = _x GetVariable "neighborLinks";
	if (IsNil "_locationLinks") then {_x SetVariable["neighborLinks",[]]};

	{
		_objects = _x NearEntities["LocationLogicCity",350];

		if (Count _objects > 0) then
		{
			//Get closest location to link.
			_closestLocation = [_x,_objects] Call BIS_WF_GetClosest;

			_closestNeighbors = _closestLocation GetVariable "neighbors";
			if (_closestLocation In BIS_WF_CustomLocations) then {_closestNeighbors = _closestLocation GetVariable "neighborLinks"};

			//If this location has not already been linked then do so.
			if (!(_location In _closestNeighbors)) then
			{
				//Link this location to nearby location.
				_closestNeighbors = _closestNeighbors + [_location];

				if (_closestLocation In BIS_WF_CustomLocations) then
				{
					_closestLocation SetVariable["neighborLinks",_closestNeighbors];
				}
				else
				{
					_closestLocation SetVariable["neighbors",_closestNeighbors];
				};
Textlog Format["WF Debug: Custom town %1 linked to %2.",_location GetVariable "name",_closestLocation GetVariable "name"];
			};

			//Link nearby location to this location.
			if (!(_closestLocation In _neighbors)) then
			{
				_neighbors = _neighbors + [_closestLocation];
			};
		};
	} ForEach _locationLinks;

    [[_x]] Call BIS_fnc_locations;

	//Now that link locations have been resolved replace links list with list of locations.
	_location SetVariable["neighborLinks",_neighbors];

	//If value was not defined in editor then do so now.
	if (IsNil {_x GetVariable "range"}) then {_x SetVariable["range",350]};
	if (IsNil {_x GetVariable "minSV"}) then {_x SetVariable["minSV",10]};
	if (IsNil {_x GetVariable "SV"}) then {_x SetVariable["SV",_x GetVariable "minSV"]};

	if (IsNil {_x GetVariable "maxSV"}) then {_x SetVariable["maxSV",60]};
	if (BIS_WF_LimitedWarfare) then {_x SetVariable["maxSV",_x GetVariable "minSV"]};

	if (IsNil {_x GetVariable "centerPosition"}) then {_x SetVariable["centerPosition",Position _x,true]};

	//Create town's camps.
	{
		_camp = _x;

		_composition = [BIS_WF_Constants GetVariable "campCompositions"] Call BIS_fnc_selectRandom;
		_constructed = [Position _camp,Direction _camp,_composition] Call _constructFunction;
		gosa_constructedList set [count gosa_constructedList, _constructed];
		_camp SetVariable ["town",_location,true];

		{
			switch (TypeOf _x) do
			{
				//If camp is linked to an owner, then set it.
				case "LocationLogicOwnerCivilian": {_camp SetVariable["side",Civilian,true]};
				case "LocationLogicOwnerEast": {_camp SetVariable["side",East,true]};
				case "LocationLogicOwnerWest": {_camp SetVariable["side",West,true]};
				case "LocationLogicOwnerResistance": {_camp SetVariable["side",Resistance,true]};
			};
		} ForEach SynchronizedObjects _x;
	} ForEach (_x GetVariable "camps");

Textlog Format["WF Debug: Custom town %1 camps created: %2.",_location GetVariable "name",Count (_location GetVariable "camps")];
} ForEach BIS_WF_CustomLocations;

{
	_x SetVariable["neighbors",_x GetVariable "neighborLinks"];
	_x SetVariable["neighborLinks",nil];
} ForEach BIS_WF_CustomLocations;

(_towns + BIS_WF_CustomLocations) Spawn
{
	WaitUntil {!IsNil "BIS_fnc_locations"};

//	[_this] Call BIS_fnc_locations;

	//For compatibility - Remove if BIS_fnc_locations does this.
	_locations = bis_functions_mainscope GetVariable "locations";
	_locations = _locations + _this;
	bis_functions_mainscope SetVariable["locations",_locations,true];
};

//Add any custom camps.
{
	//Find town(s) within range of custom camp.
	_objects = _x NearEntities["LocationLogicCity",750];

	//ToDo: Use:
	//_objects = _x NearEntities["LocationLogicCityCenter",750];

	if (Count _objects > 0) then
	{
		//Get closest town.
		_closestLocation = [_x,_objects] Call BIS_WF_GetClosest;
Textlog Format["WF Debug: Custom camp near location %1",_closestLocation GetVariable "name"];

		//If there is not already a camp near by.
		_conflictingCamps = _x NearEntities["LocationLogicCamp",40];
		_conflictingCamps = _conflictingCamps - [_x];

		if (Count _conflictingCamps < 1) then
		{
			//Link this camp to town.
			_x SetVariable["town",_closestLocation,true];
			_camps = _closestLocation GetVariable "camps";
			_camps = _camps + [_x];
			_closestLocation SetVariable["camps",_camps,true];

			//Create the camp's objects.
			_composition = [BIS_WF_Constants GetVariable "campCompositions"] Call BIS_fnc_selectRandom;
			_constructed = [GetPos _x,GetDir _x,_composition] Call _constructFunction;
			gosa_constructedList set [count gosa_constructedList, _constructed];
		}
	};

} ForEach _customCamps;
*/
