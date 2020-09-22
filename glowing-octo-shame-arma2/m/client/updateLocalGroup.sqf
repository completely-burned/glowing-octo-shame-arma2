private["_player","_grp","_grp_owner"];

[player] joinSilent grpNull;

while {true} do {
	_player = player;

	// лидер группы игрок
	if (leader player == player) then {
		// юниты не в локальной группе
		if (isNil {group player getVariable "_owner"}) then {
			// переместить юнитов в локальную игроку группу
			_grp = createGroup side player;
			_grp setVariable ["_owner", owner player, false];
			units group player joinSilent _grp;
		};
		{
			if (owner _x != owner player) then {
				// юнитов сделать локальными
				_x setOwner (owner player);
			};
		} forEach units player;

	} else { // лидер группы не игрок

		// группа игрока локальная игроку
		_grp_owner = group player getVariable "_owner";
		if (!isNil {_grp_owner}) then {
			// игрок не лидер
			if (leader player != player) then {
				// игрока сделать лидером локальной группе
				group player selectLeader player;
			};
		};
	};
	sleep 0.1;
};
