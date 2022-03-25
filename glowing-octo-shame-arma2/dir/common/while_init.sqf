while{true}do{
	{
		[_x, nil] call gosa_fnc_vehInit2;
		sleep 0.05;
	}forEach allUnits+vehicles;
	sleep 300;
};
