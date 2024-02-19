private["_arr","_types","_b","_r","_cfgVeh","_item"];

_arr = _this;

_cfgVeh = LIB_cfgVeh;
_r = [];

for "_i" from 0 to (count _arr -1) do {
	_item = (_arr select _i select 0);

	ScopeName "_arr_item";

	_b = true;
	for "_i0" from 0 to (count _item -1) do {
		_types = (_item select _i0 select 0);
		{
			if (configName(_cfgVeh >> _x) == "")  then {
				_b = false;
				diag_log format ["Log: [fnc_filtering_squads_byAvail] not available %1, deleting %2", _x, _types];
				BreakTo "_arr_item";
			};
		} forEach _types;
	};


	if (_b) then {
		_r set [count _r, _arr select _i];
	};
};

diag_log format ["Log: [fnc_filtering_squads_byAvail] count _this %1, count _r %2", count _this, count _r];
_r;
