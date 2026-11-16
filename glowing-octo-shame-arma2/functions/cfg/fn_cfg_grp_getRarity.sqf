private ["_g","_t","_r","_str","_class_cfg","_fnc_change","_all","_arr",
	"_rarity_param","_c_type"];

_g = (_this select 0);

_all = 0;
_c_type = 0;
for "_i" from 0 to (count _g -1) do {
    _str = _this select 1 select 0;

	_t = [_g, [_i, 0, 0, 0]] call BIS_fnc_returnNestedElement;
    _arr = (_t call gosa_fnc_getGroupType);

    if (_str in _arr) then {
        _c_type = _c_type + ([_g, [_i, 1]] call BIS_fnc_returnNestedElement);
    };
    _all = _all + ([_g, [_i, 1]] call BIS_fnc_returnNestedElement);
};
diag_log format ["Log: [fn_cfg_grp_getRarity] %1, %2", [_all, _c_type], _this select 1];

[_all, _c_type];
