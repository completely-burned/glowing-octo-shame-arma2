if (_this isKindOf "StaticWeapon") exitWith {
	false;
};
if !(alive _this) exitWith {
	false;
};
if (damage _this >= 0.9) exitWith {
	false;
};
if !(canMove _this) exitWith {
	false;
};
if !(canMove vehicle _this) exitWith {
	false;
};
if (_this call gosa_fnc_isPlayer && _this != player) exitWith
{
	false;
};
true;
