private ["_g","_t","_n","_arr","_n0","_str"];
_g = (_this select 0);
_t = (_this select 1);
_n = (_this select 2);

for "_i" from 0 to (count _g -1) do {
    _str = _this select 1 select 0;

	_t = [_g, [_i, 0, 0, 0]] call BIS_fnc_returnNestedElement;
    _arr = _t call gosa_fnc_getGroupType;

    if (_str in _arr) then {
        _n0 = [_g, [_i, 1]] call BIS_fnc_returnNestedElement;
		diag_log format ["Log: [fn_cfg_grp_setRarity] %2 > %3, %1", _t, _n0, _n0 * _n];
        [_g, [_i, 1], _n0 * _n] call BIS_fnc_setNestedElement;
    };
};
