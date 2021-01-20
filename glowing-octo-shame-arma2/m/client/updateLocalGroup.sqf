private["_player","_grp","_grp_owner"];

[player] joinSilent grpNull;

while {true} do {
	_player = player;

	// лидер группы игрок
	if (leader player == player) then {

		// юнитов группы нужно переместить в локальную лидеру группу для лучшей связи
		// локальную переменную видит только игрок, нужна для проверки локальности группы
		if (isNil {group player getVariable "_owner"}) then {
			// создать локальную игроку группу и переместить в нее юнитов
			_grp = createGroup side player;
			_grp setVariable ["_owner", owner player, false];
			units group player joinSilent _grp;
			_grp setVariable ["grp_created",true,true];
		};

		// отдать юнитов группы игрока компьютеру игрока
		{
			if (owner _x != owner player) then {
				// юнитов сделать локальными
				_x setOwner (owner player);
			};
		} forEach units player;

	} else { // лидер группы не игрок

		// группа игрока локальная игроку и поэтому игрок устанавливается лидером
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
