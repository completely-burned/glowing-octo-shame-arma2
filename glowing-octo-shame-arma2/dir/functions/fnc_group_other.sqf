#define __A2OA__

/*
	TODO: нужно оптимизировать код.
	функция изменяет поведение ии,
	например: вычисляет такое
	когда нужен вход или выход для ботов с транспортом,
	переключает тип боеприпасов,
	изменяет скорость, режим боя
*/

#ifdef __A2OA__
	#define speedLimit
#endif

private["_leader"];
_leader = leader _this;

// reveal player
if !(isDedicated) then {
	if (gosa_reveal == 1) then {
		[_this, player, _leader] call gosa_fnc_reveal;
	};
};

// запускается у всех
if (local _leader)then{
	private["_grp","_leaderPos","_currentWP","_wp","_typeWP",
		"_diag_log",
		"_units","_vehicles","_types","_cargo","_assignedVehicles",
		"_arr","_deep","_limit","_limit_old","_speed","_minDeep",
		"_veh","_assignedVehicle","_follow",
		"_dist_leader","_blacklist","_target","_dist_x","_dist",
		"_grp_wp_completed","_driver","_slu","_z","_n","_grp_type"
		];

// private ["_Stealth"];

_grp=_this;
_minDeep = gosa_minDeepFrigate;

scopeName "main";


_grp_wp_completed = _grp getVariable "_grp_wp_completed";

_units = units _grp;

if (gosa_loglevel > 0) then { // diag_log
	diag_log format ["Log: [gosa_fnc_group_other.sqf] units %1", _units];
}; // diag_log

_slu = objNull;

if({alive _x} count _units > 0 && {_x call gosa_fnc_isPlayer} count _units == 0)then{

	_leaderPos = getPos vehicle _leader;

	_currentWP = currentWaypoint _grp;
	_wp = [_grp,_currentWP];
	_typeWP = waypointType _wp;

	_vehicles = [];
	_types = [];
	_cargo = [];
	_assignedVehicles = [];
	{
		_types set [count _types, typeOf _x];
		_veh = vehicle _x;
		_assignedVehicle = assignedVehicle _x;
		if (!isNull _assignedVehicle) then {
			_assignedVehicles set [count _assignedVehicles, _veh];
		};
		if(_veh != _x)then{
			if!(_veh in _vehicles)then{
				_vehicles set [count _vehicles, _veh];
				_types set [count _types, typeOf _veh];
				_cargo = _cargo + assignedCargo _veh;
			};
		};
	}forEach _units;

	if( ({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_IN_pos"}} count [_grp] + _vehicles > 0 ) or ({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_OUT_pos"}} count [_grp] + _vehicles > 0 ))then{
		breakTo "main";
		if (gosa_loglevel > 0) then { // diag_log
			diag_log format ["Log: [gosa_fnc_group_other.sqf] %1 breakTo main, transport", _grp ];
		}; // diag_log
	};

	_grp_type = _units+_vehicles+_assignedVehicles call gosa_fnc_getGroupType;

	_z = "SUPPORT";
	if !(_z in _grp_type) then {
		if(waypointType [_grp, currentwaypoint _grp] == _z)then{
			if({count assignedVehicleRole _x > 0} count _units > 0)then{
				_grp_type set [count _grp_type, _z];
			};
		};
	};

	// выгрузка ии
	[_units, _leader] call gosa_fnc_allowGetIn;

	// HE Tank
	#ifdef __A2OA__
	if ("Tank" in _grp_type or "Wheeled_APC" in _grp_type) then {
		[_vehicles] call gosa_fnc_he;
	};
	#endif

	// Движение лидера ближе к атакующим юнитам отряда.
	if (_leader == Vehicle _leader) then {
		_diag_log = "";
		scopeName "_follow";

		if !(_leader call gosa_fnc_isPlayer) then {
			// Движение лидера в сторону игрока.
			{
				if (_x call gosa_fnc_isPlayer) then {
					_diag_log = "player";
					_follow = vehicle _x;
					breakTo "_follow";
				};
			} forEach _units-[_leader];

			_arr = waypointPosition _wp;
			if !(_arr call gosa_fnc_isZeroPos) then {
				// Движение лидера в сторону атакующей техники отряда.
				_n = _leaderPos distance _arr;
				for "_i" from 0 to (count _vehicles -1) do {
					// ТС может застрять.
					if (_n > (_vehicles select _i distance _arr)) then {
						if (canMove (_vehicles select _i) && [_vehicles select _i] call gosa_fnc_unit_isAttacker) then {
							_diag_log = ["veh attack", _arr];
							_follow = _vehicles select _i;
							breakTo "_follow";
						};
					};
				};

			// лидер двигаться в сторону техники отряда
			/*
			{
				if (alive effectiveCommander _x && !(behaviour _leader in ["SAFE", "CARELESS", "AWARE"])) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _vehicles;
			*/
			};

			// Движение лидера в сторону атакующего юнита отряда.
			if (combatMode _grp == "RED") then {
				_arr = _units-[_leader];
				for "_i" from 0 to (count _arr -1) do {
					if (vehicle (_arr select _i) == _arr select _i) then {
						if ([_arr select _i] call gosa_fnc_unit_isAttacker) then {
							_follow = _arr select _i;
							_diag_log = "unit attack";
							breakTo "_follow";
						};
					};
				};
			};
		};

		// движение лидера
		if !(isNil "_follow") then {
			if (_leader Distance _follow > 75) then {
				Private["_position","_position1"];
				_position = GetPos _leader;
				_position1 = GetPos _follow;
				_position = [((_position Select 0) + (_position1 Select 0)) / 2,((_position Select 1) + (_position1 Select 1)) / 2];
				// _grp Move _position;
				diag_log format ["Log: [fnc_group_other] %1 движение к %2, %3", _leader, _follow, _diag_log];
				_leader doMove _position;
			};
		};
	};


	//--- ограничение скорости транспорта
	// https://github.com/completely-burned/glowing-octo-shame-arma2/issues/76
	_blacklist = [];

	//--- Снимает ограничение юнитам при условии.
	for "_i" from 0 to ((count _units) - 1) do {
		_obj = _units select _i;
		if (alive _obj) then {
			if (_obj == vehicle _obj) then
			{
				if (_obj call gosa_fnc_getForcedSpeed select 0 >= 0) then {
					[_obj, -1, time] call gosa_fnc_forceSpeed;
					_blacklist set [count _blacklist, _obj];
				};
				// один юнит группы вне транспорта, obj потому что хотел проверять дистанцию
				if (isNull _slu) then {_slu = _obj};
			};
		};
	};

	//--- устанавливает ограничение скорости транспорта
		// FIXME: Значения установлены от балды и не сбалансировны, десятичная нужна просто для упрощения отладки.
		// TODO: тс застревает из-за маленькой скорости
		// Подопечные ИИ покидают строй с назначенной целью в CombatMode RED,
		// а командир убегает от отряда с режимом скорости FULL.

		//if (combatMode _grp == "RED") then {
		{
			// FIXME: Эта проверка исключала безоружные лодки.
			if (_x isKindOf "Land") then {
				_driver = driver _x;
				if !(_driver in _blacklist) then {
					_arr = _driver call gosa_fnc_getForcedSpeed;
					_n = -1;

					if (isNil "_arr") exitWith {
						diag_log format ["Log: [fnc_group_other] %1, %2", _driver, nil];
					};

					// TODO: Нужно учитывать что модель поведения лидера и подопечного различаются.
					_b = false;
					//if (_x == vehicle _leader) then {
					//} else {
						// FIXME: Думаю нужно проверять что-то одно.
						if (combatMode effectiveCommander _driver == "RED"
							&& combatMode _driver == "RED") then
						{
							_b = true;
						};
					//};

					if (_b) then {
						// Ограничение скорости ТС, потому что пехота ползёт и не успевает.
						_n = if (behaviour _leader == "COMBAT" && formation _grp != "DIAMOND" && !isNull _slu) then {15}else{-1};

						// Ограничение скорости передвижения атакующего юнита, чтобы он не уехал без прикрытия своего отряда.
						_target = assignedTarget _x;
						_dist_x = _x distance _target;
						if !(isNull _x) then {
							_dist_leader = _leader distance _target;
							if (!isNull _leader && !isNull _target) then {
								if ([_x] call gosa_fnc_unit_isAttacker) then {
									_dist = _dist_x - _dist_leader;
									if (_dist > 0) then {
										_n = _n max 10.1;
									}else{
										_n = _n max 7.1;
									};
								};
							};
						};
					};

					// Рядом союзная пехота.
					//if (side _x countSide (_x nearEntities ["Man", 75]) > 0) then {
						//_n = _n min 5;
					//};

					// TODO: По тревоге нужна модель поведения ТС уменьшающая вероятность попадания по нему.

					// Если рядом с ТС есть любая пехота, ТС передвигается медленнее, и действовали более скрытно.
					// TODO: И чтобы игроки с малым fps могли подготовиться к бою.
					//if (count (_x nearEntities ["Man", 150]) > 0) then {
						//_n = _n min 7;
					//};

					// TODO: Если балансировка орудия отсутствует и размер мишени невелик, нужно ограничивать скорость.

					#ifdef __ARMA3__
						if (_arr select 0 isNotEqualTo _n) then {
							[_driver, _n] call gosa_fnc_forceSpeed;
						};
					#else
						_b = false;
						if (_arr select 0 != _n) then {
							_b = true;
						}else{
								if (count _arr > 1) then {
									// FIXME: Перезапись для надёжности.
									if (_arr select 1 +15 > time) then {
										_b = true
									};
								};
						};
						if (_b) then {
							[_driver, _n, time] call gosa_fnc_forceSpeed;
						};
					#endif
				};
			};
		}forEach _vehicles;
		//};
	// _slu = objNull;


	#ifdef __A2OA__
	if ("Frigate" in _grp_type && count _vehicles > 0) then {
		_veh = _vehicles select 0;
		if (isEngineOn _veh) then {
			_n = getDir _veh;

			// Ограничение скорости, чтобы лучше избегать столкновений.
			// FIXME: Не работает.
			_arr = getPos _veh;
			_arr = ASLToATL [(_arr select 0) + 5*sin _n, (_arr select 1) + 5*cos _n, 0];
			_deep = ((_arr select 2) max 0);
			_limit = (((_deep - _minDeep) * 0.5) max 0.05);
			_limit_old = _veh getVariable ["gosa_forceSpeed", -1];
			if (abs (_limit_old - _limit) > 0.05) then {
				diag_log format ["Log: [fnc_group_other] %1, if Frigate, %2 forceSpeed %3, _deep %4, %5", _grp, _veh, _limit, _deep, _arr];
				_veh forceSpeed _limit;
				//_limit_old = _limit;
				_veh setVariable ["gosa_forceSpeed", _limit];
			};

			// "CUP_B_Frigate_ANZAC" не может сдвинуться с места самостоятельно.
			if (count waypoints _grp > 0) then {
				_speed = speed _veh;
				if (_speed < 0.5 && _deep > _minDeep) then {
					_veh setVelocity [1 * (sin _n), 1 * (cos _n), 0];
				};
			};
		};
	};
	#endif


	//--- точность ии
	{
		[_x] call gosa_fnc_dynSkill;
	} forEach _units+_vehicles;

	// ии не нужно следовать маршруту в бою, исключение десант будет следовать маршруту
	/*
	дублируется в fnc_group_wp.sqf if( { currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] } count units _grp > 0 && !_Air && !_Ship )then{
		// транспортный вертолет вызываемый игроками, отличается поведением и его маршруты в этом скрипте не нужно трогать, пропускаем его
		if( ({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_IN_pos"}} count [_grp] + _vehicles > 0 ) or ({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_OUT_pos"}} count [_grp] + _vehicles > 0 ))exitWith{
			if (gosa_loglevel > 0) then { // diag_log
				diag_log format ["Log: [gosa_fnc_group_other.sqf] %1 танспортный вертолет, пропуск", _grp ];
			}; // diag_log
		};
		if ( count waypoints _grp > 0 ) then{
			// установить маршрут группы на себя
			if (gosa_loglevel > 0) then { // diag_log
				diag_log format ["Log: [gosa_fnc_group_other.sqf] установить маршрут группы на себя %1, currentCommand leader %2, count waypoints %3", _grp, currentCommand _leader, count waypoints _grp ];
			}; // diag_log
			[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
			sleep 1;
			// удалить маршруты
			if ( count waypoints _grp > 0 ) then{
				if (gosa_loglevel > 0) then { // diag_log
					diag_log format ["Log: [gosa_fnc_group_other.sqf] удаление waypoints группы %1, currentCommand leader %2, count waypoints %3", _grp, currentCommand _leader, count waypoints _grp ];
				}; // diag_log
				for "_i" from count waypoints _grp - 1 to 0 step -1 do {
					deleteWaypoint [_grp, _i];
				};
			};
		};
	};
	*/

	if !(_leader call gosa_fnc_isPlayer) then {
		private["_SpeedMode","_CombatMode","_Behaviour",
			"_countStealth","_Stealth"];
		_SpeedMode = "NORMAL";
		_CombatMode = "YELLOW";
		_Behaviour = "AWARE";

		private["_currentWaypoint","_currentWaypointType"];
		_currentWaypoint = [_grp, currentWaypoint _grp];
		_currentWaypointType = waypointType _currentWaypoint;

		if ((vehicle _leader distance civilianBasePos) > gosa_locationSize + gosa_locationSize/2) then {
			if ({_x call gosa_fnc_isPlayer} count _units <= 0) then {
				_SpeedMode = "FULL";
			};
		};

		// SAFE нужен чтобы ТС ехали по дороге.
		// для машин, пехотинцы при SAFE_Behaviour идут медленно, поэтому делать SAFE_Behaviour только если все находятся в транспорте.
		if ("Car" in _grp_type) then {
			if ({vehicle _x == _x} count _units <= 0) then {
				_Behaviour = "SAFE";
			};
		};

		if ((vehicle _leader distance civilianBasePos) <= gosa_locationSize) then {
			_Behaviour = "COMBAT";
		};

		if ("Tank" in _grp_type) then {
			_Behaviour = "COMBAT";
		};

		if("Air" in _grp_type)then{
			_Behaviour = "COMBAT";
		};

		_Stealth = false;
		_countStealth = 0;
		{
			if (_x in gosa_StealthL) then {
				_countStealth = _countStealth +1;
			};
		} forEach _types;
		if (_countStealth > (count _types / 2)) then {
			_Behaviour = "STEALTH";
			_CombatMode = "WHITE";
		};

		//--- малые отряды объединяются
		/*
		недоработано
		if (count _units < 2 && {_countStealth == 0 &&
			!("Air" in _grp_type) && !("StaticWeapon" in _grp_type) && !("SUPPORT" in _grp_type)}) then {
			diag_log format ["Log: [gosa_fnc_group_other] count units %1 < min", _grp];
			_z = ((_leaderPos nearEntities ["CAManBase", 150]) - _units);
			{
				// TODO: нужны доп. проверки чтобы не присоединяться к танкам или авиации
				if (_units select 0 call gosa_fnc_getFaction == _x call gosa_fnc_getFaction && !(vehicle _x isKindOf "StaticWeapon")) then {
					diag_log format ["Log: [gosa_fnc_group_other] %1 join %2", _units, _x];
					_units join _x;
					[_leader, leader _x] call gosa_fnc_autoLeader;
					breakTo "main";
				};
			} forEach _z;
		};
		*/

		if("UAV" in _grp_type)then{
			_SpeedMode = "LIMITED";
			_CombatMode = "BLUE";
			_Behaviour = "CARELESS";
		};

		if("Air" in _grp_type)then{
			if(_currentWaypointType in ["UNLOAD","GETOUT","GETIN"] or count _cargo > 0)then{
				_CombatMode = "GREEN";
				_Behaviour = "AWARE";
				_SpeedMode = "FULL";
			};
		};

		if!("Air" in _grp_type)then{
			if(_Behaviour in ["COMBAT","STEALTH"])then{
				if !([_leader, 800] call gosa_fnc_CheckPlayersDistance) then {
					_Behaviour = "AWARE";
				};
			};
		};

		if(_currentWaypointType in ["SUPPORT"])then{
			_CombatMode = "GREEN";
			_Behaviour = "SAFE";
			_SpeedMode = "FULL";
		};

		// Техника теперь не покидает строй, поэтому можно RED.
		if ("LandLehicle" in _grp_type) then {
			_CombatMode = "RED";
		};

		if(speedMode _grp != _SpeedMode)then{
			_grp setSpeedMode _SpeedMode;
		};
		if(combatMode _grp != _CombatMode)then{
			_grp setCombatMode _CombatMode;
		};
		if(behaviour _leader != _Behaviour)then{
			_grp setBehaviour _Behaviour;
		};




	};

};

if (gosa_loglevel > 0) then { // diag_log
	diag_log format ["Log: [gosa_fnc_group_other] end %1", time];
}; // diag_log

}else{ // diag_log
	if (gosa_loglevel > 0) then { // diag_log
		diag_log format ["Log: [gosa_fnc_group_other.sqf] breakTo main, owner: %1  %2,  isServer = %3, isLocal = %4", _leader, owner _leader, isServer, local _leader];
	}; // diag_log
};
