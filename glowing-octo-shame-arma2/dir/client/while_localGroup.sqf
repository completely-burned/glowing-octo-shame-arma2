#define __A2OA__
/*
в этом файле обрабатываются:
командир группы, группа игрока, юниты игрока, игрок


TODO: иногда может зависнуть приказ [не стрелять] на игроке
TODO: в итоге не стреляет вся группа или экипаж если игрок командир
TODO: группа иногда разделяется или становится неуправляемой
*/

private["_p","_g2","_gov","_g","_v",
	"_z","_l"
];

[player] joinSilent grpNull;

while {true} do {
	_p = player;
	_g = group _p;
	_v = vehicle _p;
	_l = leader _g;

	/*локальную переменную видит только игрок, нужна для проверки локальности группы
	устанавливается при создании группы, нужна т.к. не знаю других способов проверки*/
	_gov = _g getVariable "_owner";

	/*зависший приказ на командире мешает игроку командиру
	не позволяет легко отдавать приказы*/
	/*
	_z = currentCommand _p;
	if (_l == _p && _z != "" && vehicle _p == _p) then {
		diag_log format ["Log: [localGroup] cc %2, %1 doFollow %1", _p, _z];
		// FIXME: не работает должным образом
		_p doFollow _p;
	};
	*/

	/* если группа локальна игроку нужно отдать юнитов группы игрока компьютеру игрока для лучшего управления
	*/
#ifdef __A2OA__
	/* setOwner не возвращает контроль над юнитами, но ломает управление игрокам
	if (_l == _p) then {
		_z = units _g;
		{
			if (owner _x != 0) then {
				// FIXME: возможно отряд разделяется только из-за находящихся в транспорте юнитов, нужна проверка
				if (vehicle _x == _x) then {
					diag_log format ["Log: [localGroup] %1 setOwner %2", _x, player];
					// FIXME: возможно есть проблемы, отряд разделяется
					[nil, _x, rsetOwner, player] call RE;
				};
			};
		} forEach _z;
	};*/

	/* FIXME: возможно командиру тс нужен локальный экипаж
	*/
	/* setOwner не возвращает контроль над юнитами, но ломает управление игрокам
	if (effectiveCommander _v == _p) then {
		_z = crew _v;
		{
			if (owner _x != 0) then {
				diag_log format ["Log: [localGroup] %3 crew %1 setOwner %2", _x, player, _v];
				[nil, _x, rsetOwner, player] call RE;
			};
		} forEach _z;
	};*/
#endif

	/* не доработано
	// подконтрольные игроку юниты группы должны быть в локальной лидеру группе для лучшей связи
	if (leader _p == _p && isNil {_gov}) then {
		_g2 = createGroup playerSide;
		_gov = _o;
		_g2 setVariable ["_owner", _gov, false];
		_z = units _g;
		diag_log format ["Log: [localGroup] %1 join %2", _z, _g2];
		_z joinSilent _g2;
		_g = _g2;
		_g2 setVariable ["grp_created",true,true];
		// FIXME: с этой строкой все-равно баг иногда, когда далее в скрипте проверка на командира выдает true, но игрок не командир
		_g selectLeader _p;
	};
	*/

	// группа игрока локальная игроку и поэтому игрок устанавливается лидером
	/* не доработано
	if (_l != _p) then {
		if ((!isNil {_gov} or local _l) && !(_l call gosa_fnc_isPlayer)) then {
			// игрока сделать лидером локальной группе
			diag_log format ["Log: [localGroup] %1 selectLeader %2", _g, _p];
			// FIXME: из-за selectLeader юниты отряда внутри тс становятся неуправляемыми
			_g selectLeader _p;
		};
	};
	*/


	#ifdef __A2OA__
		if (leader _p == _p) then {
			//--- не покидать поврежденное тс
			if (_v != _p) then {
				if (isNil {_v getVariable "gosa_allowCrewInImmobile"} && {_v isKindOf "LandVehicle"}) then {
					_v allowCrewInImmobile true;
					// FIXME: почему глобальная переменная?
					_v setVariable ["gosa_allowCrewInImmobile", true, true];
					diag_log format ["Log: [localGroup] %1 allowCrewInImmobile true", _v];
				};
			};

			{
				// юнитам игрока ограничение скорости не нужно
				// FIXME: локальная переменная?
				if(!isNil{_x getVariable "gosa_forceSpeed"})then{
					_x forceSpeed -1;
					_x setVariable ["gosa_forceSpeed",nil];
					diag_log format ["Log: [localGroup] %1 forceSpeed -1 %2", _x, typeOf _x ];
				};

				//--- не покидать поврежденное тс, остальные юниты
				_v = assignedVehicle _x;
				if (!isNull _v && {isNil {_v getVariable "gosa_allowCrewInImmobile"}} && {_v isKindOf "LandVehicle"}) then {
					_v allowCrewInImmobile true;
					// FIXME: почему глобальная переменная?
					_v setVariable ["gosa_allowCrewInImmobile", true, true];
					diag_log format ["Log: [localGroup] %1 allowCrewInImmobile true", [_x,_v]];
				};
			} forEach units _g;
		};
	#endif

	sleep 0.1;
};
