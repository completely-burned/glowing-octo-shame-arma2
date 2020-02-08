private["_Magazines","_Weapons","_Backpacks"];
_Magazines = ( _this call m_fnc_GetTransportMagazines );
_Weapons = ( _Magazines select 1 );
_Backpacks = ( _Magazines select 2 );
_Magazines = ( _Magazines select 0 );

if (_this in ["USBasicWeaponsBox","RUBasicWeaponsBox","USBasicWeapons_EP1","UNBasicWeapons_EP1","TKBasicWeapons_EP1","SpecialWeaponsBox","BAF_BasicWeapons"])then{
	_Weapons = (_Weapons + [["Laserdesignator",1],["NVGoggles",2],["Binocular",2],["ItemGPS",2]]);
	_Magazines = (_Magazines + [["Laserbatteries",1]]);
};
if (LIB_ahAvail) then {
	if (_this in ["USBasicWeaponsBox","RUBasicWeaponsBox","USBasicWeapons_EP1","UNBasicWeapons_EP1","TKBasicWeapons_EP1","SpecialWeaponsBox","BAF_BasicWeapons"])then{
		_Weapons = (_Weapons + [["Binocular_Vector",2]]);
	};
	if (_this in ["USBasicAmmunitionBox","USSpecialWeaponsBox"])then{
		_Magazines = (_Magazines + [["8Rnd_B_Beneli_Pellets",20]]);
	};
	if (_this in ["RUBasicAmmunitionBox","RUSpecialWeaponsBox","GuerillaCacheBox"])then{
		_Magazines = (_Magazines + [["8Rnd_B_Saiga12_Pellets",20]]);
	};
};

_Magazines = [_Magazines,_Weapons,_Backpacks];
_Magazines;
