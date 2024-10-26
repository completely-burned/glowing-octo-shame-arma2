/*
 * Функция взвращает точки возрождения базы.
 */

private ["_logic","_types","_def","_return","_arr","_n","_arr0",
	"_var_synchronizedObjects"];
diag_log format ["Log: [fnc_base_getRespawn] _this %1", _this];

_var_synchronizedObjects = "gosa_synchronizedObjects";
_types_respawn_blacklist = gosa_types_location;

_logic = _this select 0;
_types = _this select 1;
_def = _this select 2;

_return = [];
for "_t" from 0 to (count _types -1) do {
	_return set [_t, []];
};
_arr0 = [];

_arr = synchronizedObjects _logic;
#ifndef __ARMA3__
	// Синхронизации в редакторе A2 имеют локальный для сервера эффект.
	if (count _arr <= 0) then {
		_arr = _logic getVariable _var_synchronizedObjects;
		if (isNil "_arr") then {_arr = []};
	};
#endif
// TODO: getVariable
for "_i" from 0 to (count _arr -1) do {
	// Синхронизирован с самим собой.
	if (_arr select _i != _logic) then {
		_arr0 set [count _arr0, _arr select _i];
	};
};

// Для совместимости.
if (count _arr0 <= 0) then {
	_arr0 = [_logic];
};

for "_i" from 0 to (count _arr0 -1) do {
	_logic = _arr0 select _i;
	if !(_logic in _types_respawn_blacklist) then {
	_n = [_logic, _def] call gosa_fnc_respawn_get_type;
	for "_t" from 0 to (count _types -1) do {
		if (_types select _t == _n) then {
			_return select _t set [count (_return select _t), _logic];
		};
	};
	};
};

diag_log format ["Log: [fnc_base_getRespawn] _return %1", _return];
_return;
