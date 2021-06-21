private["_time","_grp"];

waitUntil {!isNil "group_system_units"};

while{true}do{

	sleep 5;

	{
		_grp = _x;

		_time = (_grp getVariable "grp_created_time");
		if ( isNil "_time" ) then {
			_time = time;
			_grp setVariable ["grp_created_time", _time];
				diag_log format ["Group_gc.sqf %1 grp_created_time %2", _grp, _time ];
		};

		if((_time < (time - 10)) && ({alive _x} count units _grp == 0))then{

				diag_log format ["Group_gc.sqf deleteGroup %1, count alive %2", _grp, {alive _x} count units _grp];

			deleteGroup _grp;

				diag_log format ["Group_gc.sqf deletedGroup %1", _grp];

		};
	} forEach allGroups-[group_system_units];

};
