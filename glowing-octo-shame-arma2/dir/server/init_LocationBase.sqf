#define __A2OA__
/*
 * Инициализация статичных локаций типа база,
 * например аэропортов.
 * TODO: Совместимость с A2, allMissionObjects.
 */

private ["_type_Airport","_list_Airport","_arr","_type","_logic",
	"_arr0","_arr1","_blacklist","_n","_type_Airport_compat",
	"_type_Base","_list_Base","_str"];

_type_Airport = [1];
_list_Airport = [];
_type_Base = [0];
_list_Base = [];
_type_Airport_compat = [1];


_blacklist = [];

#ifdef __A2OA__
	_arr = allMissionObjects "LocationBase_F";
	diag_log format ["Log: [init_LocationBase] LocationBase_F %1", _arr];
#else
	_arr = [];
#endif

for "_i" from -1 to 99 do {
	if (_i < 0) then {
		_str = "gosa_LogicLocationBase";
	}else{
		_str = format["gosa_LogicLocationBase_%1", _i];
	};
	if !(isNil _str) then {
		_arr set [count _arr, call compile _str];
	};
};

// Для совместимости.
for "_i" from -1 to 99 do {
	if (_i < 0) then {
		_str = "gosa_airportHangar";
	}else{
		_str = format["gosa_airportHangar%1", _i];
	};
	if !(isNil _str) then {
		_logic = call compile _str;
		_arr set [count _arr, _logic];
		{
			_n = _logic getVariable _x;
			if (isNil "_n") then {
				_logic setVariable [_x, _type_Airport_compat select 0, true];
			};
		} forEach ["gosa_Location_type", "gosa_respawn_type"];
	};
};
#ifdef __A2OA__
if (count _arr < 1) then {
	{
		_arr = _arr + allMissionObjects _x;
	} forEach HQ;
};
#endif


for "_i" from 0 to (count _arr - 1) do {
	_logic = _arr select _i;

	_type = _logic getVariable "gosa_Location_type";
	if (isNil "_type") then {_type = -1};

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

// Здание на точке возрождения неуязвимое.
// TODO: Оставить разрушение, но сделать восстановление базы при отсутствии на ней игроков.
_arr = _list_Base+_list_Airport;
for "_i" from 0 to (count _arr -1) do {
	_arr0 = [_arr select _i, _type_Airport+_type_Base, -1] call gosa_fnc_base_getRespawn;
	for "_i0" from 0 to (count _arr0 -1) do {
		for "_i1" from 0 to (count (_arr0 select _i0) -1) do {
			_logic = nearestObjects [(_arr0 select _i0 select _i1), ["House", "Building"], 50];
			if (count _logic > 0) then {
				_logic = _logic select 0;
				_logic allowDamage false;
				diag_log format ["Log: [init_LocationBase] %1 теперь неуязвим", _logic];
			};
		};
	};
};

gosa_list_LocationAirport = _list_Airport;
publicVariable "gosa_list_LocationAirport";
gosa_list_LocationBase = _list_Base;
publicVariable "gosa_list_LocationBase";
