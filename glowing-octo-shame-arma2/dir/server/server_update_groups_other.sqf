waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "gosa_locationSize"};
waitUntil {!isNil "group_system_units"};
waitUntil {!isNil "group_off_units"};
private["_gosa_initGroup"];
while{true}do{
	{
		if (_x != group_system_units) then {
			_gosa_initGroup = _x call gosa_fnc_group_other;
		};
	}forEach allGroups;
	sleep 1;
};
