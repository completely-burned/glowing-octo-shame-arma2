#define __A2OA__
/* командир, группа, юниты, игрок
 * TODO: иногда может зависнуть приказ [не стрелять] на игроке
 * в итоге не стреляет вся группа или экипаж если игрок командир :TODO
 */

private["_p","_g2","_gov","_g","_o","_v",
	"_z" // временное 
];

[player] joinSilent grpNull;

// не изменяемое
_o = owner player;

while {true} do {
	_p = player;
	_g = group _p;
	_v = vehicle _p;

	/*локальную переменную видит только игрок, нужна для проверки локальности группы
	устанавливается при создании группы, нужна т.к. не знаю других способов проверки*/
	_gov = _g getVariable "_owner";

	/*зависший приказ на командире мешает игроку командиру
	не позволяет легко отдавать приказы*/
	_z = currentCommand _p;
	if (leader _p == _p && _z != "" && vehicle _p == _p) then {
		diag_log format ["Log: [localGroup] cc %2, %1 doFollow %1", _p, _z];
		_p doFollow _p;
	};

	// если группа локальная игроку отдать юнитов группы игрока компьютеру игрока
#ifdef __A2OA__
		_z = units _g;
		{
			if (owner _x != _o) then {
				diag_log format ["Log: [localGroup] %1 setOwner %2", _x, _o];
				_x setOwner _o;
			};
		} forEach _z;
#endif

	/* не доработано, отряд разделяется в итоге
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
		_g selectLeader _p; // FIXME: с этой строкой все-равно баг иногда, когда далее в скрипте проверка на командира выдает true, но игрок не командир
	};
	*/

	// группа игрока локальная игроку и поэтому игрок устанавливается лидером
	if (!isNil {_gov} && leader _p != _p) then {
		// игрок не лидер
		if (leader _p != _p) then {
			// игрока сделать лидером локальной группе
			diag_log format ["Log: [localGroup] %1 selectLeader %2", _g, _p];
			_g selectLeader _p;
		};
	};


#ifdef __A2OA__
	// не покидать поврежденное тс
	if (leader _p == _p) then {
		if (_v != _p) then {
			if (isNil {_v getVariable "gosa_allowCrewInImmobile"} && {_v isKindOf "LandVehicle"}) then {
				_v allowCrewInImmobile true;
				_v setVariable ["gosa_allowCrewInImmobile", true, true];
				diag_log format ["Log: [localGroup] %1 allowCrewInImmobile true", _v];
			};
		};

		{
			// юнитам игрока ограничение скорости не нужно
			if(!isNil{_x getVariable "gosa_forceSpeed"})then{ // TODO: локальная переменная
				_x forceSpeed -1;
				_x setVariable ["gosa_forceSpeed",nil];
				diag_log format ["Log: [localGroup] %1 forceSpeed -1 %2", _x, typeOf _x ];
			};

			_v = assignedVehicle _x;
			if (!isNull _v && {isNil {_v getVariable "gosa_allowCrewInImmobile"}} && {_v isKindOf "LandVehicle"}) then {
				_v allowCrewInImmobile true;
				_v setVariable ["gosa_allowCrewInImmobile", true, true];
				diag_log format ["Log: [localGroup] %1 allowCrewInImmobile true", [_x,_v]];
			};
		} forEach units _g;
	};
#endif

	sleep 0.1;
};
