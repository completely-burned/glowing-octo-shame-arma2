private["_units"];
while{true}do{
	{
		_x call draga_fnc_vehInit2;
	}forEach allUnits+vehicles;
	sleep 0.05;
};
