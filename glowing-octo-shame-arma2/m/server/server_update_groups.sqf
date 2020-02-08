waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "sizeLocation"};
private["_draga_initGroup"];
while{true}do{
	{
		_draga_initGroup = _x getVariable "_draga_initGroup";
		if (isNil {_draga_initGroup}) then {
			_draga_initGroup = _x spawn draga_fnc_initGroup;
			_x setVariable ["_draga_initGroup", _draga_initGroup];
		}else{
			if (scriptDone _draga_initGroup) then {
				if (draga_loglevel > 0) then {
					diag_log format ["while_groups.sqf scriptDone %2 deleteGroup %1", _x, _draga_initGroup];
				};
				deleteGroup _x;
			};
		};
	}forEach allGroups;
	sleep 1;
};
