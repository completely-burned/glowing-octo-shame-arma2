private["_allgroups"];
while {true} do {
	_allgroups = allgroups;
	{
		private["_group"];
		_group = _x;
		if(gosa_playerSide == side _group)then{
			if (({alive _x && !(vehicle _x call gosa_fnc_isUAV)} count units _group > 0)) then {
				player hcSetGroup [_group,""];
				_group setVariable ["BIS_HC_THREAT",count units _group];
			};
		};

		if ({alive _x} count units _group == 0) then {
			player hcRemoveGroup _group;
		};
	} foreach _allgroups;
	sleep 1;
};
