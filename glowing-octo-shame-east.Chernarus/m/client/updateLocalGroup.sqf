private["_player"];
while {true} do {
	_player = player;
	if(leader _player == _player) then {
		{
			if (isPlayer _x) then{
				if(assignedTeam _x != "RED")then{_x assignTeam "RED"};
			};
		}forEach units _player;
	};
	sleep 2;
};
