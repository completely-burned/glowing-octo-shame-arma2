/*
 * Функция взвращает точки возрождения базы.
 */

private ["_logic","_types","_def","_return","_arr","_n"];
diag_log format ["Log: [fnc_base_getRespawn] _this %1", _this];

_logic = _this select 0;
_types = _this select 1;
_def = _this select 2;

_return = [];
for "_t" from 0 to (count _types -1) do {
	_return set [_t, []];
};

_arr = synchronizedObjects _logic;
// TODO: getVariable
// Для совместимости.
if (count _arr < 1) then {
	_arr = [_logic];
};

for "_i" from 0 to (count _arr -1) do {
	_logic = _arr select _i;
	_n = _logic getVariable ["gosa_respawn_type", _def];
	for "_t" from 0 to (count _types -1) do {
		if (_types select _t == _n) then {
			_return select _t set [count (_return select _t), _logic];
		};
	};
};

diag_log format ["Log: [fnc_base_getRespawn] _return %1", _return];
_return;
