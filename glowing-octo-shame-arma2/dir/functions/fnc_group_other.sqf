#define __A2OA__

/*
	TODO: нужно оптимизировать код.
	функция изменяет поведение ии,
	например: вычисляет такое
	когда нужен вход или выход для ботов с транспортом,
	переключает тип боеприпасов,
	изменяет скорость, режим боя
*/

private["_grp","_leader","_leaderPos","_currentWP","_wp","_typeWP",
"_units","_vehicles","_types","_cargo","_assignedVehicles",
"_grp_wp_completed","_driver","_slu","_z","_n","_grp_type"
];

// private ["_Stealth"];

_grp=_this;

scopeName "main";


_grp_wp_completed = _grp getVariable "_grp_wp_completed";

_units = units _grp;

if (gosa_loglevel > 0) then { // diag_log
	diag_log format ["Log: [gosa_fnc_group_other.sqf] units %1", _units];
}; // diag_log

_slu = objNull;

if({alive _x} count _units > 0 && {_x call gosa_fnc_isPlayer} count _units == 0)then{

	_leader = leader _grp;

	// нужно проверять локальных
	if(
		// если не локальные
		!local _leader or
		(isServer && (owner _leader > 2)) or
		(!isServer && (owner _leader == 2))
	)then{
		// то пропуск
		if (gosa_loglevel > 0) then { // diag_log
			diag_log format ["Log: [gosa_fnc_group_other.sqf] breakTo main, owner: %1  %2,  isServer = %3, isLocal = %4", _leader, owner _leader, isServer, local _leader];
		}; // diag_log
		breakTo "main";
	};

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
		private ["_veh","_assignedVehicle"];
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

	// лидер двигается ближе к атакующим юнитам
	if (_leader == Vehicle _leader) then {

		private["_follow"];

		scopeName "_follow";

		if !(_leader call gosa_fnc_isPlayer) then {

			// лидер двигаться в сторону атакующей техники отряда
			{
				if (currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _vehicles;

			// лидер двигаться в сторону техники отряда
			/*
			{
				if (alive effectiveCommander _x && !(behaviour _leader in ["SAFE", "CARELESS", "AWARE"])) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _vehicles;
			*/

			// лидер двигаться в сторону атакующего юнита отряда
			{
				if (currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] && vehicle _x == _x ) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _units-[_leader];

		};

		// движение лидера
		if (!isNil{_follow}) then {
			if (_leader Distance _follow > 75) then {
				Private["_position","_position1"];
				_position = GetPos _leader;
				_position1 = GetPos _follow;
				_position = [((_position Select 0) + (_position1 Select 0)) / 2,((_position Select 1) + (_position1 Select 1)) / 2];
				// _grp Move _position;
				_leader doMove _position;
			};
		};
	};


	//--- ограничение скорости транспорта
	// https://github.com/completely-burned/glowing-octo-shame-arma2/issues/76
#ifdef __A2OA__
	//--- снимает ограничение юнитам вне транспорта
	{
		if(_x == vehicle _x)then{
			if(!isNil{_x getVariable "gosa_forceSpeed"})then{
				if (gosa_loglevel > 0) then { // diag_log
					diag_log format ["Log: [gosa_fnc_group_other.sqf] %1 forceSpeed -1 %2", _x, typeOf _x ];
				}; // diag_log
				_x forceSpeed -1;
				_x setVariable ["gosa_forceSpeed",nil];
			};
			// один юнит группы вне транспорта, obj потому что хотел проверять дистанцию
			if(isNull _slu)then{_slu = _x};
		};
	}forEach _units;

	//--- устанавливает ограничение скорости транспорта
		// TODO: тс застревает из-за маленькой скорости
		_n = if (behaviour _leader == "COMBAT") then {1}else{5};
		{
			if (_x isKindOf "Land") then {
				_driver = driver _x;
				// _driver = _x;
				_z = _driver getVariable "gosa_forceSpeed";
				// есть юнит отряда вне транспорта
				if(		!isNull _slu
					// техника атакует
					or	{currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]}
					// рядом с техникой прочая пехота
					or	{count (_x nearEntities ["Man", 150]) > 0}
				)then{
					if(isNil {_z} or {_z != _n})then{
						if (gosa_loglevel > 0) then { // diag_log
							diag_log format ["Log: [gosa_fnc_group_other.sqf] %1 forceSpeed %2 %3", _driver, _n, typeOf _driver ];
						}; // diag_log
						_driver setVariable ["gosa_forceSpeed",_n];
						_driver forceSpeed _n;
					};
				//--- снятие ограничения
				}else{
					if(!isNil {_z})then{
						if (gosa_loglevel > 0) then { // diag_log
							diag_log format ["Log: [gosa_fnc_group_other.sqf] forceSpeed -1 %1 %2", _driver, typeOf _driver ];
						}; // diag_log
						_driver setVariable ["gosa_forceSpeed",nil];
						_driver forceSpeed -1;
					};
				};
			};
		}forEach _vehicles;

	// _slu = objNull;
#endif

	//--- точность ии
	{
		[_x] call gosa_fnc_dynSkill;
	} forEach _units+_vehicles;

	// ии не нужно следовать маршруту в бою, исключение десант будет следовать маршруту
	/* дублируется в fnc_group_wp.sqf if( { currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] } count units _grp > 0 && !_Air && !_Ship )then{
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
	};*/

	if !(_leader call gosa_fnc_isPlayer) then {
		private["_SpeedMode","_CombatMode","_Behaviour"];
		_SpeedMode = "NORMAL";
		_CombatMode = "YELLOW";
		_Behaviour = "AWARE";

		private["_currentWaypoint","_currentWaypointType"];
		_currentWaypoint = [_grp, currentWaypoint _grp];
		_currentWaypointType = waypointType _currentWaypoint;

		if ((vehicle _leader distance civilianBasePos) > sizeLocation + sizeLocation/2) then {
			_SpeedMode = "FULL";
		};

		// для машин, пехотинцы при SAFE_Behaviour идут медленно, поэтому делать SAFE_Behaviour только если все находятся в транспорте.
		if("Car" in _grp_type && ({vehicle _x == _x} count _units == 0))then{
			_Behaviour = "SAFE";
		};

		if ((vehicle _leader distance civilianBasePos) <= sizeLocation) then {
			_Behaviour = "COMBAT";
		};

		if ("Tank" in _grp_type) then {
			_Behaviour = "COMBAT";
		};

		if("Air" in _grp_type)then{
			_Behaviour = "COMBAT";
		};

		private ["_Stealth"];
		_Stealth = false;
		private ["_countStealth"];
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
		/* недоработано
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

		// танки
		if("Tank" in _grp_type && !("Tracked_APC" in _grp_type))then{
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
