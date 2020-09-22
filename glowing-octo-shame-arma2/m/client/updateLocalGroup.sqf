private["_player","_grp"];
while {true} do {
	_player = player;
	if(leader player == player) then {
		if (isNil {group player getVariable "_owner"}) then {
			_grp = createGroup side player;
			_grp setVariable ["_owner", player, false];
			units group player joinSilent _grp;
		};
		{
			if (owner _x != owner player) then {
				if(assignedTeam _x != "RED")then{_x assignTeam "RED"};
				_x setOwner (owner player);
			};
		}forEach units _player;
	};
	sleep 0.1;
};
