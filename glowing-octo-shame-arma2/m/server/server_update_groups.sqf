waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "sizeLocation"};
private["_draga_initGroup"];
while{true}do{
	{
		if (_x != group_system_units) then {
			_draga_initGroup = _x getVariable "_draga_initGroup";
			if (isNil {_draga_initGroup}) then {
				_draga_initGroup = _x spawn draga_fnc_initGroup;
				_x setVariable ["_draga_initGroup", _draga_initGroup];
			}else{
				if (scriptDone _draga_initGroup) then {
					if (draga_loglevel > 0) then {
						diag_log format ["while_groups.sqf %1 units %2", _x, units _x];
					};
					if (draga_loglevel > 0) then {
						diag_log format ["while_groups.sqf %1 join %2", _x, group_system_units];
					};
					units _x joinSilent group_system_units;
					if (draga_loglevel > 0) then {
						diag_log format ["while_groups.sqf count units group_system_units %1", count units group_system_units];
					};
					if (draga_loglevel > 0) then {
						diag_log format ["while_groups.sqf scriptDone %2, deleteGroup %1, units %3, count allGroups %4", _x, _draga_initGroup, units _x, count allGroups];
					};
					deleteGroup _x;
					if (draga_loglevel > 0) then {
						diag_log format ["while_groups.sqf deleted %1", _x];
					};
				};
			};
		};
	}forEach allGroups;
	sleep 1;
};
