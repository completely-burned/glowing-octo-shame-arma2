// _this = юнит которому нужна поддержка освещения

private["_l"];
_l = _this nearEntities [["Man"], 300];
_l = _l - [_this];

diag_log format["Log: [fnc_aiFlareSupport] %1", _this];

if (call gosa_fnc_isNight && _this call gosa_fnc_canSee == 0) then {
	[_l] call gosa_fnc_unitFlareFire;
};
