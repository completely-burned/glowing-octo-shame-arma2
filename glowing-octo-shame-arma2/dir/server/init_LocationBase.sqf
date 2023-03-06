#define __A2OA__
/*
 * Инициализация статичных локаций типа база,
 * например аэропортов.
 * TODO: Совместимость с A2, allMissionObjects.
 */

private ["_type_Airport","_list_Airport","_arr","_type","_logic",
	"_type_Base","_list_Base","_str"];
_type_Airport = [1];
_list_Airport = [];
_type_Base = [0];
_list_Base = [];

#ifdef __A2OA__
	_arr = allMissionObjects "LocationBase_F";
	diag_log format ["Log: [init_LocationBase] LocationBase_F %1", _arr];
#else
	_arr = [];
#endif

for "_i" from 0 to 99 do {
	if (_i < 1) then {
		_str = "gosa_LogicLocationBase";
	}else{
		_str = format["gosa_LogicLocationBase_%1", _i];
	};
	if !(isNil _str) then {
		_arr set [count _arr, call compile _str];
	};
};

// Для совместимости.
#ifdef __A2OA__
if (count _arr < 1) then {
	{
		_arr = _arr + allMissionObjects _x;
	} forEach HQ;
};
#endif


for "_i" from 0 to (count _arr - 1) do {
	_logic = _arr select _i;

	_type = _logic getVariable ["gosa_Location_type", 0];

	if (_type in _type_Airport) then {
		if !(_logic in _list_Airport
			or _logic in _type_Base) then
		{			
			_list_Airport set [count _list_Airport, _logic];
		};
	};

	if (_type in _type_Base) then {
		if !(_logic in _list_Airport
			or _logic in _type_Base) then
		{
			_list_Base set [count _list_Base, _logic];
		};
	};
};


diag_log format ["Log: [init_LocationBase] _list_Airport %1", _list_Airport];
diag_log format ["Log: [init_LocationBase] _list_Base %1", _list_Base];

gosa_list_LocationAirport = _list_Airport;
publicVariable "gosa_list_LocationAirport";
gosa_list_LocationBase = _list_Base;
publicVariable "gosa_list_LocationBase";
