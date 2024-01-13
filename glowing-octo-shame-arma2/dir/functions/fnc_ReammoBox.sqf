/*
 * Скрипт изменяет содержимое ящиков по умолчанию.
 */

private["_Magazines","_Weapons","_Backpacks","_Items","_arr"];
_arr = ( _this call gosa_fnc_GetTransportMagazines );
_Magazines = ( _arr select 0 );
_Weapons = ( _arr select 1 );
_Backpacks = ( _arr select 2 );
_Items = ( _arr select 3 );

if (_this in ["USBasicWeaponsBox","RUBasicWeaponsBox","USBasicWeapons_EP1","UNBasicWeapons_EP1","TKBasicWeapons_EP1","SpecialWeaponsBox","BAF_BasicWeapons"])then{
	_Weapons set [count _Weapons, ["Laserdesignator", 1]];
	_Weapons set [count _Weapons, ["NVGoggles", 2]];
	_Weapons set [count _Weapons, ["Binocular", 2]];
	_Weapons set [count _Weapons, ["ItemGPS", 2]];
	_Magazines set [count _Magazines, ["Laserbatteries", 1]];
};
if (LIB_ahAvail) then {
	if (_this in ["USBasicWeaponsBox","RUBasicWeaponsBox","USBasicWeapons_EP1","UNBasicWeapons_EP1","TKBasicWeapons_EP1","SpecialWeaponsBox","BAF_BasicWeapons"])then{
		_Weapons set [count _Weapons, ["Binocular_Vector", 2]];
	};
	if (_this in ["USBasicAmmunitionBox","USSpecialWeaponsBox"])then{
		_Magazines set [count _Magazines, ["8Rnd_B_Beneli_Pellets", 20]];
	};
	if (_this in ["RUBasicAmmunitionBox","RUSpecialWeaponsBox","GuerillaCacheBox"])then{
		_Magazines set [count _Magazines, ["8Rnd_B_Saiga12_Pellets", 20]];
	};
};

_arr;
