#define __A2OA__

private ["_Magazines"];
if(isnil {_this getVariable "gosa_megaAmmoBox"})then{
	_Magazines = (typeOf _this call gosa_fnc_ReammoBox);
}else{
	_Magazines = ([] call gosa_fnc_megaAmmoBox);
};

private "_getMagazineCargo";


#ifdef __A2OA__
// Magazine
_getMagazineCargo = getMagazineCargo _this;

private "_namesToLower";
_namesToLower = [];
for "_i" from 0 to (count (_getMagazineCargo select 0) - 1) do {
	_namesToLower set [_i, toLower (_getMagazineCargo select 0 select _i)];
};
_getMagazineCargo set [0, _namesToLower];

{
	private["_Magazine","_count"];
	_Magazine = toLower (_x select 0);
	_count = ((_x select 1));
		private "_num";
		_num = ((_getMagazineCargo select 0) find _Magazine);
		if ( _num != -1) then {
			_count = ((_count ) - ((_getMagazineCargo select 1) select _num));
		};
	if (count (getMagazineCargo _this select 0) < getNumber (configfile >> "cfgVehicles">> typeOf _this >>"transportMaxMagazines")) then {
		_this addMagazineCargo [_Magazine,_count];
	};

} foreach (_Magazines select 0);


// Weapon
_getMagazineCargo = getWeaponCargo _this;

_namesToLower = [];
for "_i" from 0 to (count (_getMagazineCargo select 0) - 1) do {
	_namesToLower set [_i, toLower (_getMagazineCargo select 0 select _i)];
};
_getMagazineCargo set [0, _namesToLower];

{
	private["_Magazine","_count"];
	_Magazine = toLower (_x select 0);
	_count = ((_x select 1));
		private "_num";
		_num = ((_getMagazineCargo select 0) find _Magazine);
		if ( _num != -1) then {
			_count = ((_count ) - ((_getMagazineCargo select 1) select _num));
		};
	if (count (getWeaponCargo _this select 0) < getNumber (configfile >> "cfgVehicles">> typeOf _this >>"transportMaxWeapons")) then {
		_this addWeaponCargo [_Magazine,_count];
	};
} foreach (_Magazines select 1);


// Backpack
_getMagazineCargo = getBackpackCargo _this;

_namesToLower = [];
for "_i" from 0 to (count (_getMagazineCargo select 0) - 1) do {
	_namesToLower set [_i, toLower (_getMagazineCargo select 0 select _i)];
};
_getMagazineCargo set [0, _namesToLower];

{
	private["_Magazine","_count"];
	_Magazine = toLower (_x select 0);
	_count = ((_x select 1));
		private "_num";
		_num = ((_getMagazineCargo select 0) find _Magazine);
		if ( _num != -1) then {
			_count = ((_count ) - ((_getMagazineCargo select 1) select _num));
		};
	if (count (getBackpackCargo _this select 0) < getNumber (configfile >> "cfgVehicles">> typeOf _this >>"transportMaxBackpacks")) then {
		_this addBackpackCargo [_Magazine,_count];
	};
} foreach (_Magazines select 2);
#endif

_this setammocargo 1;
