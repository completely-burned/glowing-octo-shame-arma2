/*
Проверка позиции [0,0]

_bool = [0,0] call fnc
*/

diag_log format ["Log: [fnc_isZeroPos] %1", _this];

if (isNil "_this") exitWith
{
	diag_log format ["Log: [fnc_isZeroPos] true, isNil", nil];
	true;
};

if ((_this select 0 == 0) && (_this select 1 == 0)) exitWith
{
	diag_log format ["Log: [fnc_isZeroPos] true, [0,0]", nil];
	true;
};

if ([_this, [0,0]] call BIS_fnc_distance2D < 1) exitWith
{
	diag_log format ["Log: [fnc_isZeroPos] true, distance", nil];
	true;
};

diag_log format ["Log: [fnc_isZeroPos] false, %1", _this];
false;
