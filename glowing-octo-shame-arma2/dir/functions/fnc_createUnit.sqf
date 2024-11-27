private ["_grp","_params","_vr","_str","_str0","_obj","_arr","_arr0","_side"];
_grp = _this select 0;
_params = _this select 1;
_vr = _this select 2;

diag_log format ["Log: [fnc_createUnit] %1", _this];

if (_vr) then {
	_arr = _this select 3;
	_side = _arr select 0;
	_str = _arr select 1;

	_params set [0, _side call gosa_fnc_vr_type];
	_obj = _grp createUnit _params;
	_obj setVariable ["type", _str];

	_arr = getUnitLoadout _str;
	(_arr select 4 select 1) append (_arr select 3 select 1);
	_arr set [3, nil];
	_obj setUnitLoadout _arr;
	diag_log format ["Log: [fnc_createUnit] %1 setUnitLoadout %2", _obj, _arr];
}else{
	_obj = _grp createUnit _params;
};

_obj;
