private ["_arr","_str"];
// Зоны опасные для кораблей.
_arr = [];
_str = "gosa_lighthouse";
if !(isNil _str) then {
	_arr set [count _arr, call compile _str];
};
for "_i" from 0 to 999 do {
	_str = format["gosa_lighthouse_%1", _i];
	if !(isNil _str) then {
		_arr set [count _arr, call compile _str];
	};
};
gosa_zone_lighthouse = _arr;
publicVariable "gosa_zone_lighthouse";

