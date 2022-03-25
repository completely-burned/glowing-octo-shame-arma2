private["_units"];
while{true}do{
	// TODO: нужно оптимизировать, слишком сильная нагрузка
	{
		_x call gosa_fnc_vehInit2;
	}forEach allUnits+vehicles;
	sleep 0.05;
};
