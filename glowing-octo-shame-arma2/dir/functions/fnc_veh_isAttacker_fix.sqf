_return = _this select 0;
_veh = _this select 1;
//_type = _this select 2;

if (getNumber (LIB_cfgWea >> currentWeapon _veh >> "enableAttack") <= 0) exitWith {
	false;
};

if([[_veh], ["M1128_MGS_EP1", "Pandur2_ACR"]] call gosa_fnc_CheckIsKindOfArray) exitWith {
	true;
};

_return;
