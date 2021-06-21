

Private["_constructFunction","_count","_marker","_markedPosition","_markedRegions"];
Private["_MINBASEFROMTOWNRANGE","_objects","_side","_sidePlacementRules","_total","_useDefaultStarts"];

_sidePlacementRules = [];

_useDefaultStarts = true;
if (Count _sidePlacementRules > 0) then {_useDefaultStarts = _sidePlacementRules Select 0};

// textLogFormat["WF Debug: GetLocations - Custom Locations %2",Count BIS_WF_CustomLocations];

_MINBASEFROMTOWNRANGE = 300;
// хз if (!IsNil {BIS_WF_Constants GetVariable "MINBASEFROMTOWNRANGE"}) then {_MINBASEFROMTOWNRANGE = (BIS_WF_Constants GetVariable "MINBASEFROMTOWNRANGE") * 2};

_markedRegions = [];//Rectangular regions marked in editor (if regions are marked, only custom towns & towns in those areas are used).

// хз _marker = "BIS_WF_InitRegion0";
// хз _markedPosition = GetMarkerPos _marker;

Private["_length","_width","_x1","_x2","_y1","_y2"];
/*
_count = 0;
while {(_markedPosition Select 0) != 0 && (_markedPosition Select 1) != 0 && _count < 100} do
{
	_width = GetMarkerSize _marker Select 0;
	_length = GetMarkerSize _marker Select 1;

	_x1 = (_markedPosition Select 0) - _width;
	_x2 = (_markedPosition Select 0) + _width;
	_y1 = (_markedPosition Select 1) - _length;
	_y2 = (_markedPosition Select 1) + _length;

	_markedRegions = _markedRegions + [[_x1,_y1,_x2,_y2]];

	_count = _count + 1;

	DeleteMarker _marker;
	_marker = Format["BIS_WF_InitRegion%1",_count];
	_markedPosition = GetMarkerPos _marker;
};
*/
Private["_className","_direction","_name","_names","_nodeName","_nodeName1","_neighbors","_position","_townName","_type"];

BIS_WF_TownCenters = [];
BIS_WF_TownNames = [];
BIS_WF_CampAreas = [];

BIS_WF_StartingLocations = [];
BIS_WF_StartingDirections = [];

//Collect all mission's custom starting locations.
ScopeName "InitStartingLocations";

Private["_location"];
/*
for [{_count = 0},{_count < 100},{_count = _count + 1}] do
{
	//When an unformatted value has been reached then all locations have been found.
	if (IsNil Format["StartingLocation%1",_count]) then {BreakTo "InitStartingLocations"};

	_location = Call Compile Format["StartingLocation%1",_count];
	BIS_WF_StartingLocations = BIS_WF_StartingLocations + [Position _location];
	BIS_WF_StartingDirections = BIS_WF_StartingDirections + [Direction _location];

	//Clean up unneeded logics.
	DeleteVehicle _location;
};
*/
_names = configfile >> "cfgWorlds" >> WorldName >> "Names";
_total = Count _names;

//Collect all important locations.
for [{_count = 0},{_count < _total},{_count = _count + 1}] do
{
	_name = _names Select _count;

	if (IsClass _name) then
	{
		_type = GetText (_name >> "type");

		if (_type == "CityCenter") then
		{
			_position = GetArray (_name >> "position");
			_townName = GetText (_name >> "name");
			_className = ConfigName _name;
			_neighbors = GetArray (_name >> "neighbors");

			ScopeName "GetCityCenter";

/*			//If there are marked regions then filter out all towns not in them.
			if (Count _markedRegions > 0) then
			{
				{
					if ((_position Select 0) >= (_x Select 0) && (_position Select 0) <= (_x Select 2)) then
					{
						if ((_position Select 1) >= (_x Select 1) && (_position Select 1) <= (_x Select 3)) then
						{
							BIS_WF_TownCenters = BIS_WF_TownCenters + [[_position,_townName,_neighbors,_className]];
							BreakTo "GetCityCenter";
						};
					};
				} ForEach _markedRegions;
			}
			else
			{*/
				BIS_WF_TownCenters = BIS_WF_TownCenters + [[_position,_townName,_neighbors,_className]];
			//};
		};

		if (_type In ["NameCityCapital","NameCity","NameVillage"]) then
		{
			_position = GetArray (_name >> "position");
			_position Resize 2;
			_townName = GetText (_name >> "name");
			_speech = GetArray (_name >> "speech");

			if ((count _speech) == 0) then
			{
			  if (_type in ["NameCityCapital","NameCity"]) then {_speech = "City";} else {_speech = "Village";};
			}
			else
			{
			  _speech = _speech select 0;
			};

			BIS_WF_TownNames = BIS_WF_TownNames + [[_position,_townName,_speech]];
		};

		if (_type == "StrongpointArea") then
		{
			_position = GetArray (_name >> "position");
			_position Resize 2;
			_direction = GetNumber (_name >> "angle");
			BIS_WF_CampAreas = BIS_WF_CampAreas + [[_position,_direction]];
		};

		if (_useDefaultStarts && _type == "FlatArea") then
		{
			_position = GetArray (_name >> "position");
			_direction = GetNumber (_name >> "angle");
			_ignore = false;

			ScopeName "GetLocation";

/*			//If there are marked regions then filter out all locations not in them.
			{
				_ignore = true;

				if ((_position Select 0) >= (_x Select 0) && (_position Select 0) <= (_x Select 2)) then
				{
					if ((_position Select 1) >= (_x Select 1) && (_position Select 1) <= (_x Select 3)) then
					{
						_ignore = false;
						BreakTo "GetLocation";
					};
				};
			} ForEach _markedRegions;
*/
/*			if (!IsNil "BIS_WF_StartingLocationsAdjustments") then
			{
				{
					if (ConfigName _name == (_x Select 0)) then
					{
						//Adjust position
						if (Count _x > 2) then
						{
							_position Set[0,(_position Select 0) + (_x select 1)];
							_position Set[1,(_position Select 1) + (_x select 2)];
						}
						//Blacklist position.
						else {_ignore = true};
					};
				} ForEach BIS_WF_StartingLocationsAdjustments;
			};
*/
			_nearbyTowns = NearestLocations[_position,["CityCenter"],_MINBASEFROMTOWNRANGE];

			if (Count _nearbyTowns < 1 && !_ignore) then
			{
				BIS_WF_StartingLocations = BIS_WF_StartingLocations + [_position];
				BIS_WF_StartingDirections = BIS_WF_StartingDirections + [_direction];
			};
		};
	};
};
