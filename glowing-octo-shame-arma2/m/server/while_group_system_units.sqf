while{true}do{

	if (isNil "group_system_units") then {
		group_system_units = createGroup civilian;
		publicVariable "group_system_units";
		if (draga_loglevel > 0) then {
			diag_log format ["group_system_units = createGroup civilian; %1", time];
		};
	};

	if (isNil "group_off_units") then {
		group_off_units = createGroup sideLogic;
		publicVariable "group_off_units";
		if (draga_loglevel > 0) then {
			diag_log format ["group_off_units = createGroup sideLogic; %1", time];
		};
	};

	{
		if(!alive _x or local _x)then{
			deleteVehicle _x;
		};
	} forEach units group_system_units;
	sleep 1;
};
