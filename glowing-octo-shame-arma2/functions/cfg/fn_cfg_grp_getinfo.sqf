private ["_arr","_date","_rip"];

_arr = _this select 0;

_date = [];

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
					// FIXME: Второе число тоже сдвигать к большему?
					_date set [1, (_date select 1) max (_rip select 0 select 1)];
				};
			};
		};
	};
};

[_date];