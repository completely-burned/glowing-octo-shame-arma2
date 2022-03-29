/*
отряды ботов атакуют игрока

проблемы:
	игрок перерождается
		меняется группа игрока
		- если группа игрока поменялась, делать сброс атакующей группе
	игрок может отдалится от своей группы
	- сам дурак, группа уничтожена
	группа умирает
	- группа удалится
	два игрока в группе
	- ***************************
	другой игрок покинул группу
	- остальные справятся
	атакующая группа не может добраться
	- отвязать группу от группы игрока

*/

if (missionNamespace getVariable "gosa_survival" != 1) exitWith {
	diag_log format ["Log: [while_survival] gosa_survival != 1 exitWith", nil];
};

private ["_grp_attack","_grp_victim","_z","_g","_p"];
_grp_attack = grpNull;
_grp_victim = group player;

while {true} do {
	scopeName "while";

	_p = player;
	_g = group _p;

	//-- Поиск группы атаки.
	// TODO: Группа атаки должна быть живой.
	if (isNull _grp_attack) then {
		private ["_var"];
		{
			if (side _x getFriend side _g < 0.6) then {
				_var = _x getVariable "gosa_grp_attack_player";
				if (isNil "_var") then {
					if (leader _x distance _p < 1500) then {
						if ([units _x, units _g] call gosa_fnc_canAttackGroup) then {
							_grp_attack = _x;
							_grp_victim = _g;
							_grp_attack setVariable ["gosa_grp_attack_player", [gosa_owner, _g], true];
							diag_log format ["Log: [while_survival] %1 > %2", _grp_attack, _g];
							breakTo "while";
						};
					};
				};
			};
		// TODO: нужен случайный порядок
		} forEach allGroups;
	}else{
		// Tсли группа игрока поменялась, нужен сброс группе атаки.
		if (_g != _grp_victim) then {
			diag_log format ["Log: [while_survival] группа игрока поменялась, сброс %1", _grp_attack];
			// FIXME: Эта группа может быть опять выбранна.
			if !(isNil{_grp_attack getVariable "gosa_grp_attack_player"}) then {
				_grp_attack setVariable ["gosa_grp_attack_player", nil, true];
				_grp_attack = grpNull;
			};
		};
	};

	// FIXME: Не понимаю где именно нужен sleep.
	sleep 30;
};
