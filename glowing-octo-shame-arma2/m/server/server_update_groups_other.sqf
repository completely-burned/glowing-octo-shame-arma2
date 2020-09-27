waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "sizeLocation"};
waitUntil {!isNil "group_system_units"};
waitUntil {!isNil "group_off_units"};
private["_draga_initGroup"];
while{true}do{
	{
		if (_x != group_system_units) then {
			_draga_initGroup = _x call fnc_group_other;
		};
	}forEach allGroups;
	sleep 1;
};
