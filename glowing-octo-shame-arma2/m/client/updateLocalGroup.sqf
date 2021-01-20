private["_player","_grp","_grp_owner"];

[player] joinSilent grpNull;

while {true} do {
	_player = player;

	// локальную переменную видит только игрок, нужна для проверки локальности группы
	_grp_owner = group player getVariable "_owner";

	// если группа локальная игроку отдать юнитов группы игрока компьютеру игрока
	if (!isNil {_grp_owner}) then {
		{
			if (owner _x != owner player) then {
				_x setOwner (owner player);
			};
		} forEach units player;
	};

	// подконтрольные игроку юниты группы должны быть в локальной лидеру группе для лучшей связи
	if (leader player == player && isNil {_grp_owner}) then {
		_grp = createGroup side player;
		_grp_owner = owner player;
		_grp setVariable ["_owner", _grp_owner, false];
		units group player joinSilent _grp;
		_grp setVariable ["grp_created",true,true];
	};

	// группа игрока локальная игроку и поэтому игрок устанавливается лидером
	if (!isNil {_grp_owner} && leader player == player) then {
		// игрок не лидер
		if (leader player != player) then {
			// игрока сделать лидером локальной группе
			group player selectLeader player;
		};
	};

	sleep 0.1;
};
