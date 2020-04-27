while{true}do{

	if (isNil "group_system_units") then {
		group_system_units = createGroup civilian;
		publicVariable "group_system_units";
		if (true) then {
			diag_log format ["group_system_units = createGroup civilian; %1", time];
		};
	};

	{
		if(!alive _x or local _x)then{
			deleteVehicle _x;
		};
	} forEach units group_system_units;
	sleep 1;
};
