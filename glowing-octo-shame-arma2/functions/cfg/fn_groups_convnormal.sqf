/*
 * Преобразует отряды в совместимый формат.
 */
private ["_cfg","_arr0","_arr1","_arr","_n","_item"];

_arr = _this select 0;

for "_i" from 0 to (count _arr -1) do {
	_item = _arr select _i;
	diag_log format ["Log: [fnc_groups_convNormal] _item %1", _item];

	// Отряды
	_arr0 = _item select 0;
	diag_log format ["Log: [fnc_groups_convNormal] _arr0 %1", _arr0];
	_n = 0;
	for "_i0" from 0 to (count _arr0 -1) do {
		_arr1 = [_arr0 select _i0 select 0] call gosa_fnc_group_cfg_to_array;
		diag_log format ["Log: [fnc_groups_convNormal] _arr1 %1", _arr1];
		_arr0 set [_i0, [_arr1 select 0, _arr1 select 1, _arr1 select 2]];
		diag_log format ["Log: [fnc_groups_convNormal] _arr0 %1", _arr0];
		_n = _n + (_arr1 select 3);
	};

	if (_item select 1 == -1) then {
		_n = (_n / count _arr0);
		if (count _item > 2) then {
			_n = _n max (_item select 2);
		};
		if (count _item > 3) then {
			_n = _n min (_item select 3);
		};
		if (count _item > 4) then {
			_n = _n * (_item select 4);
		};
		_item set [1, _n];
	};
	_item resize 2;
};

_arr;
