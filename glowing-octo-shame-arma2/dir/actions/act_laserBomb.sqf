/*
{
	params ["_target", "_caller", "_actionId", "_arguments"];
}
*/

[laserTarget (_this select 1), _this select 1] call gosa_fnc_laserBomb;
