private "_Magazines";
_Magazines = ( _this getVariable "_Magazines" );
if(isnil "_Magazines")then{
	_Magazines = (typeOf _this call m_fnc_ReammoBox);
	_this setVariable ["_Magazines", _Magazines];
};

private "_getMagazineCargo";
_getMagazineCargo = getMagazineCargo _this;
{
	private["_Magazine","_count"];
	_Magazine = (_x select 0);
	_count = ((_x select 1));
		private "_num";
		_num = ((_getMagazineCargo select 0) find _Magazine);
		if ( _num != -1) then {
			_count = ((_count ) - ((_getMagazineCargo select 1) select _num));
		};
		if (local _this) then {
			_this addMagazineCargo [_Magazine,_count];
		}else{
			_this addMagazineCargoGlobal [_Magazine,_count];
		};

} foreach (_Magazines select 0);

_getMagazineCargo = getWeaponCargo _this;
{
	private["_Magazine","_count"];
	_Magazine = (_x select 0);
	_count = ((_x select 1));
		private "_num";
		_num = ((_getMagazineCargo select 0) find _Magazine);
		if ( _num != -1) then {
			_count = ((_count ) - ((_getMagazineCargo select 1) select _num));
		};
		if (local _this) then {
			_this addWeaponCargo [_Magazine,_count];
		}else{
			_this addWeaponCargoGlobal [_Magazine,_count];
		};
} foreach (_Magazines select 1);

_getMagazineCargo = getBackpackCargo _this;
{
	private["_Magazine","_count"];
	_Magazine = (_x select 0);
	_count = ((_x select 1));
		private "_num";
		_num = ((_getMagazineCargo select 0) find _Magazine);
		if ( _num != -1) then {
			_count = ((_count ) - ((_getMagazineCargo select 1) select _num));
		};
		if (local _this) then {
			_this addBackpackCargo [_Magazine,_count];
		}else{
			_this addBackpackCargoGlobal [_Magazine,_count];
		};
} foreach (_Magazines select 2);

_this setammocargo 1;
