waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "sizeLocation"};
while{true}do{
	{
		private["_draga_initGroup"];
		_draga_initGroup = _x getVariable "_draga_initGroup";
		if (isNil {_draga_initGroup}) then {
			_draga_initGroup = _x spawn draga_fnc_initGroup;
			_x setVariable ["_draga_initGroup", _draga_initGroup];
		};
	}forEach allGroups;
	sleep 1;
};
