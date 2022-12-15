/*
 * Инициализация статичных локаций типа база,
 * например аэропортов.
 */

private ["_type_Airport","_list_Airport","_arr","_type","_logic",
	"_type_Base","_list_Base"];
_type_Airport = [1];
_list_Airport = [];
_type_Base = [0];
_list_Base = [];

_arr = allMissionObjects "LocationBase_F";
for "_i" from 0 to (count _arr - 1) do {
	_logic = _arr select _i;

	_type = _logic getVariable ["gosa_Location_type", 0];

	if (_type in _type_Airport) then {
		_list_Airport set [count _list_Airport, _logic];
	};
	if (_type in _type_Base) then {
		_list_Base set [count _list_Base, _logic];
	};
};

gosa_list_LocationAirport = _list_Airport;
publicVariable "gosa_list_LocationAirport";
gosa_list_LocationBase = _list_Base;
publicVariable "gosa_list_LocationBase";
