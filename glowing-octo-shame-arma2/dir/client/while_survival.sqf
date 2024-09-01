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
	-
	другой игрок покинул группу
	- остальные справятся
	атакующая группа не может добраться
	- отвязать группу от группы игрока
	игрок может за короткое время значительно отдалится
	-
	атакующая группа может потерять юнитов способных атаковать
	- сброс
	атакующая группа может застрять в другом бою
	-
	баланс
	-

*/

if (missionNamespace getVariable "gosa_survival" != 1) exitWith {
	diag_log format ["Log: [while_survival] gosa_survival != 1 exitWith", nil];
};
if ([player] call gosa_fnc_role_isCrew) exitWith {
	diag_log format ["Log: [while_survival] player isCrew", nil];
};
if (gosa_playerStartingClass in [1]) exitWith {
	diag_log format ["Log: [while_survival] gosa_playerStartingClass == %1 exitWith", gosa_playerStartingClass];
};


private ["_grp_attack","_grp_victim","_z","_g","_p","_reset","_var"];
_reset={
	diag_log format ["Log: [while_survival] %1 сброс", _this];
	if !(isNil{_this getVariable "gosa_grp_attack_player"}) then {
		_this setVariable ["gosa_grp_attack_player", nil, true];
	};
};
_grp_attack = grpNull;
_grp_victim = group player;

while {true} do {
	scopeName "while";

	_p = player;
	_g = group _p;

	//-- Поиск группы атаки.
	// TODO: Группа атаки должна быть живой.
	if (isNull _grp_attack) then {
		{
			if (side _x getFriend side _g < 0.6) then {
				_var = _x getVariable "gosa_grp_attack_player";
				if (isNil "_var") then {
					if (leader _x distance _p < 1500) then {
						if ([units _x, units _g] call gosa_fnc_canAttackGroup
							&& [units _g, units _x] call gosa_fnc_canAttackGroup) then
						{
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
		// TODO: Нужен десант с тыла, если нет подходящих групп рядом.
		} forEach allGroups;
	}else{
		// Если группа игрока поменялась, нужен сброс группе атаки.
		if (_g != _grp_victim) exitWith {
			diag_log format ["Log: [while_survival] %1 группа игрока поменялась", _grp_victim];
			// FIXME: Эта группа может быть опять выбранна.
			_grp_attack call _reset;
			_grp_attack = grpNull;
		};
		if !([units _grp_attack, units _g] call gosa_fnc_canAttackGroup) exitWith {
			diag_log format ["Log: [while_survival] %1 атакующая потеряла юнитов способных атаковать", _grp_attack];
			_grp_attack call _reset;
			_grp_attack = grpNull;
		};
	};

	// FIXME: Не понимаю где именно нужен sleep.
	sleep (120 call gosa_fnc_dynSleep);
};
