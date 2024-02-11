private ["_arr","_cfg"];

_arr = _this select 0;
_cfg = _this select 1;

for "_i" from 0 to (count _arr -1) do {
	_arr set [_i, configName (_cfg >> (_arr select _i))];
};

_arr = _arr - [""];
_arr;
