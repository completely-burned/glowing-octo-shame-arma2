private ["_units","_grp","_arr","_n","_cfgVeh"];
_units = _this;

if (count _units < 2) then {
	_units join grpNull;
}else{
	_arr = [];
	_cfgVeh = LIB_cfgVeh;
	for "_i" from 0 to (count _units -1) do {
		_item = _units select _i;
		_n = getNumber(_cfgVeh >> typeOf _item >> "side");
		for "_i0" from count _arr to _n do {
			_arr set [_i0, []];
		};
		_arr select _n set [count (_arr select _n), _item];
	};
	for "_i" from 0 to (count _arr -1) do {
		if (count (_arr select _i) > 0) then {
			_grp = createGroup (_i call gosa_fnc_getSide);
			_arr select _i join _grp;
		};
	};
};
