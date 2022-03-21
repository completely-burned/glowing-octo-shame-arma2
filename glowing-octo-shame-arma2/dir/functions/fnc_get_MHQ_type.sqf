for "_i" from 0 to (count (MHQ_list select 0) - 1) do {
	if(toLower _this == toLower (MHQ_list select 0 select _i))exitWith{
		diag_log format ["Log: [fnc_get_MHQ_type] %1 -> %2", _this, MHQ_list select 1 select _i];
		MHQ_list select 1 select _i;
	};
	if(toLower _this == toLower (MHQ_list select 1 select _i))exitWith{
		diag_log format ["Log: [fnc_get_MHQ_type] %1 -> %2", _this, MHQ_list select 0 select _i];
		MHQ_list select 0 select _i;
	};
};
