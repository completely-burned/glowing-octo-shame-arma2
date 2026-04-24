#define __A2OA__
/*
 * В этом файле обрабатываются
 * командир группы, группа игрока, юниты игрока, игрок.
 * 
 * TODO: В файле бадак, нужны тесты.
 * TODO: Иногда может зависнуть приказ [не стрелять] на игроке
 * в итоге не стреляет вся группа или экипаж если игрок командир.
 * TODO: У бота лидера с подчиненным игроком 
 * приказ стоять не позволяет продолжить игру.
 */

private["_p","_g2","_gov","_g","_v",
	"_z","_l"
];

while {true} do {
	_p = player;
	_g = group _p;
	_v = vehicle _p;
	_l = leader _g;

	_gov = _g getVariable "_owner";

	/*
	зависший приказ на командире мешает игроку командиру
	не позволяет легко отдавать приказы
	*/
	/*
	_z = currentCommand _p;
	if (_l == _p && _z != "" && vehicle _p == _p) then {
		diag_log format ["Log: [localGroup] cc %2, %1 doFollow %1", _p, _z];
		// FIXME: не работает должным образом
		_p doFollow _p;
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
