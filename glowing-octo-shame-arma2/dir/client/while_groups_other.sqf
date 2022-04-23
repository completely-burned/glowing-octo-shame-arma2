/*
	TODO: Оптимизация.
*/
waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "gosa_locationSize"};
waitUntil {!isNil "group_system_units"};
waitUntil {!isNil "group_off_units"};
private["_g"];
while{true}do{
	_g = allGroups;
	// FIXME: Speculative execution?
	sleep (20 call gosa_fnc_dynSleep);
	{
		if (_x != group_system_units) then {
			_x call gosa_fnc_group_other;
		};
	}forEach _g;
};
