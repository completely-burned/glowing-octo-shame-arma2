private ["_arr","_date","_rip","_n","_dates","_groups"];

_arr = _this select 0;

_date = [];
_dates = [];
_groups = [];

for "_i" from 0 to (count _arr -1) do {
	for "_i0" from 0 to (count (_arr select _i select 0) -1) do {
		for "_i1" from 0 to (count (_arr select _i select 0 select _i0 select 0) -1) do {
			_rip = [_arr select _i select 0 select _i0 select 0 select _i1] call gosa_fnc_getInfo;
			if (count (_rip select 0) >= 2) then {
				if (count _date < 2) then {
					_date set [0, _rip select 0 select 0];
					_date set [1, _rip select 0 select 1];
				}else{
					_date set [0, (_date select 0) max (_rip select 0 select 0)];
					_date set [1, (_date select 1) min (_rip select 0 select 1)];
				};
			};
		};
	};

	if (count _date >= 2) then {
		_n = _dates find _date;

		if (_n >= 0) then {
			#ifdef __ARMA3__
				_groups select _n pushBack (_arr select _i);
			#else
				_groups select _n set [
					count (_groups select _n), _arr select _i
				];
			#endif

			diag_log format ["Log: [fn_cfg_grp_getinfo] pushBack %1", [_date, _n, _dates, _arr select _i]];
		}else{
			// + иначе в _dates указатели на новые значеня _date
			#ifdef __ARMA3__
				_dates pushBack +_date;
				_groups pushBack [_arr select _i];
			#else
				_dates set [count _groups, +_date];
				_groups set [count _groups, [_arr select _i]];
			#endif

			diag_log format ["Log: [fn_cfg_grp_getinfo] new %1", [_date, _arr select _i]];
		};
	};
};

diag_log format ["Log: [fn_cfg_grp_getinfo] %1", [_date,_dates, count _groups]];

[_date,_dates,_groups];
