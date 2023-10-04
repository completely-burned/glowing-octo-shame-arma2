/*
 * Функция приводит [[_groups,0.5],[_groups,0.5]] к виду [[_groups,_groups],[0.5,0.5]]
 */
diag_log format ["Log: [fnc_arr_sorting0]: _this %1", _this];

private["_c","_arr","_a0"];

_a0 = (_this);
_c = count (_a0 select 0);
_arr = [];
#ifdef __ARMA3__
	_arr resize [_c, []];
#else
	for "_i" from 0 to (_c -1) do {
		_arr set [_i, []];
	};
#endif

for "_i" from 0 to (count _a0 -1) do {
	for "_i0" from 0 to (_c -1) do {
		_arr select _i0 set [_i, _a0 select _i select _i0];
	};
};

diag_log format ["Log: [fnc_arr_sorting0]: %1", _arr];

_arr;
