for "_i" from 0 to (count (MHQ_list select 0) - 1) do {
	if(toLower _this == toLower (MHQ_list select 0 select _i))exitWith{
		MHQ_list select 1 select _i;
	};
	if(toLower _this == toLower (MHQ_list select 1 select _i))exitWith{
		MHQ_list select 0 select _i;
	};
};
