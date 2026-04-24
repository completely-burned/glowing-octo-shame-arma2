private ["_grp","_params","_vr","_str","_str0","_obj","_arr","_arr0","_side"];
_grp = _this select 0;
_params = _this select 1;
diag_log format ["Log: [fnc_createUnit] %1", _this];

#ifdef __ARMA3__
_vr = _this select 2;

if (_vr) then {
	_arr = _this select 3;
	_side = _arr select 0;
	_str = _arr select 1;

	_params set [0, _side call gosa_fnc_vr_type];
	_obj = _grp createUnit _params;
	_obj setVariable ["type", _str];
	[_obj, _str] call gosa_fnc_unit_loadout;
}else{
#endif
	_obj = _grp createUnit _params;
#ifdef __ARMA3__
};
#endif

_obj;
