#define __A2OA__
/*
 * Ищет и возвращает объекты баз.
 */
private ["_type","_logic","_n","_str","_arr","_arr0","_arr1","_arr2",
	"_return"];

_return = [[],[]];

#ifdef __A2OA__
	_arr = allMissionObjects "LocationBase_F";
	diag_log format ["Log: [fnc_base_get_locations] LocationBase_F %1", _arr];
	_arr0 = allMissionObjects "LocationLogicAirport";
	diag_log format ["Log: [fnc_base_get_locations] LocationLogicAirport %1", _arr0];
	_arr = _arr + _arr0;
#else
	_arr = [];
#endif

// Для совместимости.
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
#ifdef __A2OA__
	if (count _arr <= 0) then {
		{
			_arr = _arr + allMissionObjects _x;
		} forEach HQ;
	};
#endif

for "_i" from 0 to (count _arr -1) do {
	_logic = _arr select _i;
	_type = [_logic] call gosa_fnc_base_get_type;
	if (_type >= 0) then {
		_return select 0 set [count (_return select 0), _logic];
		_return select 1 set [count (_return select 1), _type];
	};
};

diag_log format ["Log: [fnc_base_get_locations] %1", _return];
_return;
