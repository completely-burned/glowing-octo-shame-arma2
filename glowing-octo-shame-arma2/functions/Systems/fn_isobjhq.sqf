/*
 * Функция проверяет объект штаба.
 * т.е. Есть ли он в списке штабов.
 * Аргументы: [obj]
 */
diag_log format ["Log: [fnc_isObjHQ]: _this %1", _this];

private ["_obj","_arr","_str","_hq","_r"];

_obj = _this select 0;

_r = false;

scopeName "scope0";
{
	//- Массив со штабами.
	_str = format["gosa_listHQ_%1", _x];
	_arr = ([] call compile _str);

	for "_i" from 0 to (count _arr -1) do {
		//- Обекты штаба.
		_hq = (_arr select _i select 3);

		if (_obj in _hq) then {
			_r = true;
			breakTo "scope0";
		};
	};
} forEach [east, west, resistance];

diag_log format ["Log: [fnc_isObjHQ]: _r %1", _r];
_r;
