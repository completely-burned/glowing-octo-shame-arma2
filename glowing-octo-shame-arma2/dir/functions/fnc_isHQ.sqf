/*
Проверка класса типа базы.
*/

private ["_status","_type","_r","_str","_arr"];

_type = _this select 0;
// 0 mhq, 1 hq.
_status = _this select 1;

_r = false;

{
	_str = format["gosa_typesHQ_%1", _x];
	_arr = (([] call compile _str) select _status);
	diag_log format ["Log: [fnc_isHQ]: _str %1, _arr %2", _str, _arr];
	if (_type in _arr) exitWith {
		_r = true;
	};
} forEach [east, west, resistance];

diag_log format ["Log: [fnc_isHQ]: _r %1", _r];
_r;
