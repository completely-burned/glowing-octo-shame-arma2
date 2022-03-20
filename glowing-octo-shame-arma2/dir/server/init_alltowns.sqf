/*
скрипт создает бункеры у городов.
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

		if (missionNamespace getVariable "gosa_camps" == 1) then {
			_composition = gosa_depotCompositions Call BIS_fnc_selectRandom;
			_constructed = [_depotPosition,_depotDirection,_composition] Call _constructFunction;
			gosa_constructedList set [count gosa_constructedList, _constructed];
			// мед палатка
			//[_depot] Call BIS_WF_InitDefenseLayout;
		};

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

					if (missionNamespace getVariable "gosa_camps" == 1) then {
						_composition = gosa_campCompositions Call BIS_fnc_selectRandom;
						_constructed = [_destination,_x Select 1,_composition] Call _constructFunction;
						gosa_constructedList set [count gosa_constructedList, _constructed];
					};
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
