/*
	TODO: Оптимизация.
*/
private["_g","_s"];
waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "gosa_locationSize"};
waitUntil {!isNil "group_system_units"};
waitUntil {!isNil "group_off_units"};
while{true}do{
	_g = allGroups-[group_system_units];
	_s = (20/count _g);
	{
			sleep (_s call gosa_fnc_dynSleep);
			_x call gosa_fnc_group_other;
	}forEach _g;
};
