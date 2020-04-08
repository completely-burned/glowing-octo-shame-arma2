waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "sizeLocation"};
// private["_draga_initGroup"];
while{true}do{

	{
		if (_x != group_system_units) then {
			_x call draga_fnc_initGroup;
		};
	}forEach allGroups;

	sleep 0.01;
};
