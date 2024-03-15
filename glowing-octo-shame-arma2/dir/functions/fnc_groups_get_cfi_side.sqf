/*
 * Соотношние количества отрядов стороны.
 * Если отрядов [15, 5], то вернёт [0.75, 0.25].
 */
diag_log format ["Log: [fnc_groups_get_cfi_side] %1", _this];
private ["_arr","_sides","_return","_total","_n"];

_sides = _this select 0;
_arr = _this select 1;

_return = [];
_total = 0;

for "_i" from 0 to (count _sides -1) do {
	_n = count ((_arr select (_sides select _i)) select 0);
	_return set [_i, _n];
	_total = _total + _n;
};
for "_i" from 0 to (count _sides -1) do {
	_return set [_i, (_return select _i) / _total];
};

diag_log format ["Log: [fnc_groups_get_cfi_side] _return %1", _return];
_return;
