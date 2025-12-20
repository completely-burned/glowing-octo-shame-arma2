#ifdef __ARMA3__
private ["_type", "_obj","_str","_arr"];
diag_log format ['Log: [fnc_unit_loadout] %1', _this];

_obj = _this select 0;
_type = _this select 1;

_str = typeOf _obj;
if (getNumber(LIB_cfgVeh >> _str >> "isMan") <= 0) exitWith {
	diag_log format ['Log: [fnc_unit_loadout] Not man, exitWith %1', _str];
};

//- UnitLoadout
if (toLower _type != toLower _str) then {
	_arr = getUnitLoadout _type;
	if (!isNil {_arr select 4} && !isNil {_arr select 3}) then {
		if (count (_arr select 4) >= 2 && count (_arr select 3) >= 2) then {
			(_arr select 4 select 1) append (_arr select 3 select 1);
		};
	};
	_arr set [3, nil];
	_obj setUnitLoadout _arr;
};
#endif
