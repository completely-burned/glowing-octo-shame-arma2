/*
 * Считываем предустановленные картой города.
 */

Private["_constructFunction","_count","_marker","_markedPosition","_markedRegions",
	"_length","_width","_x1","_x2","_y1","_y2","_location",
	"_className","_direction","_name","_names","_nodeName","_nodeName1",
	"_neighbors","_position","_townName","_type","_TownCenters","_TownNames",
	"_MINBASEFROMTOWNRANGE","_objects","_side","_sidePlacementRules","_total",
	"_CampAreas","_StartingLocations","_StartingDirections","_useDefaultStarts"];

// Сам город.
_TownCenters = [];
// Имена.
_TownNames = [];
// Лагеря, исключая центральный бункер.
_CampAreas = [];
// Стартовые позиции.
_StartingLocations = [];
_StartingDirections = [];

_names = configfile >> "cfgWorlds" >> WorldName >> "Names";
_useDefaultStarts = true;

for "_count" from 0 to (count _names -1) do {
	_name = _names select _count;

	if (IsClass _name) then {
		_type = GetText (_name >> "type");

		if (_type == "CityCenter") then {
			_position = GetArray (_name >> "position");
			_townName = GetText (_name >> "name");
			_className = ConfigName _name;
			_neighbors = GetArray (_name >> "neighbors");

			_TownCenters set [count _TownCenters,
				[_position, _townName, _neighbors, _className]];
		};

		if (_type In ["NameCityCapital","NameCity","NameVillage"]) then {
			_position = GetArray (_name >> "position");
			_position Resize 2;
			_townName = GetText (_name >> "name");
			_speech = GetArray (_name >> "speech");

			if (count _speech <= 0) then {
			  if (_type in ["NameCityCapital","NameCity"]) then {_speech = "City"} else {_speech = "Village"};
			}else{
			  _speech = _speech select 0;
			};

			_TownNames set [count _TownNames, [_position, _townName, _speech, _type]];
		};

		if (_type == "StrongpointArea") then {
			_position = GetArray (_name >> "position");
			_position Resize 2;
			_direction = GetNumber (_name >> "angle");

			_CampAreas set [count _CampAreas, [_position, _direction]];
		};
	};
};

BIS_WF_TownCenters = _TownCenters;
BIS_WF_TownNames = _TownNames;
BIS_WF_CampAreas = _CampAreas;
BIS_WF_StartingLocations = _StartingLocations;
BIS_WF_StartingDirections = _StartingDirections;
