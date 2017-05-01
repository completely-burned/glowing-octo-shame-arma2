private ["_Magazines"];
if(isnil {_this getVariable "draga_megaAmmoBox"})then{
	_Magazines = (typeOf _this call m_fnc_ReammoBox);
}else{
	_Magazines = ([] call m_fnc_megaAmmoBox);
};

private "_getMagazineCargo";
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
		_this addMagazineCargo [_Magazine,_count];

} foreach (_Magazines select 0);

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
		_this addWeaponCargo [_Magazine,_count];
} foreach (_Magazines select 1);

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
		_this addBackpackCargo [_Magazine,_count];
} foreach (_Magazines select 2);

_this setammocargo 1;
