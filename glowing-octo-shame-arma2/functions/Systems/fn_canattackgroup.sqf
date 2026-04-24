/*
[_attack] = _this select 0;
[_victim] = _this select 1;
*/

private ["_r","_victim"];
_r = true;

{
	_victim = _x;
	// Нужно чтобы всех юнитов можно было атаковать.
	if ({[_x, _victim] call gosa_fnc_canAttack} count (_this select 0) == 0) exitWith {
		_r = false;
	};
} forEach (_this select 1);

diag_log format ["Log: [fnc_canAttackGroup] %1, %2", _r, _this];

_r;
