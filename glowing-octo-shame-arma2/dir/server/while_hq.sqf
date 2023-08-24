/*
 * ЗАГОТОВКА!
 * Обновление штабов.
 * TODO: Совместимость с PvP.
 */
private ["_side","_arr","_type_Lower","_str","_status","_dir"];
// Стартовые позиции.

_side = playerSide;
waitUntil {!isNil format["gosa_typesHQ_%1", _side]};
_arr = (call compile format["gosa_typesHQ_%1", _side]);
_type_Lower = toLower (_arr select 0 call BIS_fnc_selectRandom);
_dir = random 360;
_status = 2;
_str = _type_Lower call gosa_fnc_fixType;

_arr = ([gosa_worldSize] call gosa_fnc_findStartingPos);
if (count _arr < 1) exitWith {
	diag_log format ["Log: [while_hq]: _pos == %1, exitWith", _arr];
};

_arr = [_arr, _type_Lower, _status, _side, objNull, _dir, _str];
diag_log format ["Log: [while_hq]: _arr == %1", _arr];

#ifdef __ARMA3__
	_arr remoteExec ["gosa_fnc_createHQ", 2];
#else
	[nil, _arr, rgosa_fnc_createHQ] call RE;
#endif
