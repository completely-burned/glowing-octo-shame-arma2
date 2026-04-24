/*
 * Проверка наличия задания в радиусе.
 */

diag_log format ["Log: [fnc_CheckDistance_mission] %1", _this];
private ["_pos","_distMin","_dist","_return"];

_pos = _this select 0;
_distMin = _this select 1;

// Совместимость.
if !(isNil "civilianBasePos") then {
	_dist = civilianBasePos distance _pos;
	diag_log format ["Log: [fnc_CheckDistance_mission] _dist %1 civilianBasePos", _dist];
};
if (isNil "_dist") exitWith {
	false;
};

if (typeName _pos == typeName objNull) then {
	// Отказоустойчивость.
	if (isNull _pos) then {
		diag_log format ["Log: [fnc_CheckDistance_mission] _pos %1", _pos];
		_return = false;
	};
};

if !(isNil "_return") exitWith {
	_return;
};

if (_dist < _distMin) exitWith {
	diag_log format ["Log: [fnc_CheckDistance_mission] _dist < _distMin, %1", [_dist, _distMin]];
	true;
};

diag_log format ["Log: [fnc_CheckDistance_mission] %1", false];
false;