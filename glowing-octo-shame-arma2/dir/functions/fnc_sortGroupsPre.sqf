/*
 * Функция возвращает приоритет группы, и юнитов отсортированных по приоритету.
 */
private ["_units","_grp","_arr"];
_units = _this select 0;
_grp = _this select 1;

_arr = ([_units] call gosa_fnc_sortUnits_onWeapon);

[_grp,
	count (_arr select 0) - count (_arr select 2),
	_arr select 0, _arr select 1, _arr select 2];
