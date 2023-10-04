/*
 * Проверка класса типа базы.
 * TODO: Виртуальные типы.
 */

private ["_status","_type","_r","_arr"];

_type = _this select 0;
// 0 mhq, 1 hq.
_status = _this select 1;

_arr = (gosa_types_mhq select (_status+1));
_r = if (toLower _type in _arr) then {true} else {false};

diag_log format ["Log: [fnc_isHQ]: _r %1", _r];
_r;
