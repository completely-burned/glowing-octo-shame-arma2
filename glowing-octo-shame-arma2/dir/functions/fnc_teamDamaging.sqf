#define __A2OA__

private ["_unit", "_selectionName", "_damage", "_source", "_projectile"];
_unit = _this select 0;
_selectionName = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

if (_source != _unit) then {
	if ( side _source getFriend side _unit >= 0.6 or !(side _source in [civilian,east,west,resistance]) ) then {
		{
#ifdef __A2OA__
			systemChat format [localize "STR_RADIO_Friendlyfire"+" %2 %3", _x, getPlayerUID _x, _projectile];
#endif
			/* FIXME: не рабоает должным образом
			if ((getNumber (configFile >> "CfgVehicles" >> typeOf vehicle _unit >> "side") call gosa_fnc_getSide) getFriend side _unit >= 0.6) then {
				serverCommand format ["#vote kick %1", getPlayerUID _x];
				diag_log format ["Log: [fnc_teamDamaging.sqf] #vote kick %1 %2", getPlayerUID _x, _x];
			};
			*/
		} forEach crew _source;
	};
};


_damage;
