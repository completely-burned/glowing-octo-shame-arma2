while{true}do{
	{
		if(!alive _x or local _x)then{
			deleteVehicle _x;
		};
	} forEach units group_system_units;
	sleep 1;
};
