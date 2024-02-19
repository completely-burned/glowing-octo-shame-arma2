/*
 * TODO: Рефакторинг.
 */

	diag_log format ["Log: [fnc_waypoints] start %1", _this];
private ["_wpType_TrUNLOAD","_leader","_cfgWea","_b",
	"_minDist","_minDeep","_arr","_worldSize","_n",
	"_wpType_TrUNLOAD_Plane",
	"_true","_dir","_dist2","_testPos","_limit"];

_leader = (_this select 0);
_cfgWea = LIB_cfgWea;
_worldSize = gosa_worldSize;
_minDeep = gosa_minDeepFrigate;

_wpType_TrUNLOAD = "TR UNLOAD";
#ifdef __ARMA3__
	// Тип маршрута "сброс груза" не сажает самолёт.
	_wpType_TrUNLOAD_Plane = "UNHOOK";
#else
	_wpType_TrUNLOAD_Plane = _wpType_TrUNLOAD;
#endif

if(!isNil "_leader")then{
	private["_grp","_leaderPos",
		"_units","_vehicles","_landing","_types","_assignedVehicles",
		"_veh","_assignedVehicle","_wp","_patrol","_pos",
		"_maxDist","_WaypointCompletionRadius","_SpeedMode",
		"_WaypointType","_z","_grp_type","_tmp_arr"
	];

	_grp = group _leader;


	_leaderPos = getPos vehicle _leader;

	_landing = false;
	if (count _this > 2) then {
		_units = _this select 1;
		_grp_type = _this select 2 select 0;
		_vehicles = _this select 2 select 1;
		_assignedVehicles = _this select 2 select 2;
		_cargo = _this select 2 select 3;
		_types = _this select 2 select 4;
		_grp = _this select 2 select 5;
	}else{

		_units = units _grp;
		_vehicles = [];
		_types = [];
		_assignedVehicles = [];
		{
			_types set [count _types, typeOf _x];
			_veh = vehicle _x;
			_assignedVehicle = _x call gosa_fnc_assignedVeh;
			if (!isNull _assignedVehicle) then {
				_assignedVehicles set [count _assignedVehicles, _veh];
			};
			if(_veh != _x)then{
				if!(_veh in _vehicles)then{
					if (group effectiveCommander _veh == _grp) then {
						_vehicles set [count _vehicles, _veh];
						_types set [count _types, typeOf _veh];
					};
				};
			};
		}forEach _units;

			// узнаем тип отряда для типа маршрута
			_grp_type = _units+_vehicles+_assignedVehicles call gosa_fnc_getGroupType;
			_z = "SUPPORT";
			if !(_z in _grp_type) then {
				if(waypointType [_grp, currentwaypoint _grp] == _z)then{
					if({count assignedVehicleRole _x > 0} count _units > 0)then{
						_grp_type set [count _grp_type, _z];
					};
				};
			};
		};

	{
		_veh = _x;
		// FIXME: возможно из-за grpNull был true
		if({_z = group _x; _z != _grp && !isNull _z}count crew _veh > 0)then{
			_landing = true;
		};
	} forEach _vehicles;

	if ("Frigate" in _grp_type) then {
		_landing = false;
	};

	if (_landing) then { // diag_log
		diag_log format ["Log: [fnc_waypoints] %1 landing %2", _grp, _vehicles];
	}; // diag_log

	if(true)then{

		for "_i" from count waypoints _grp - 1 to 0 step -1 do {
				diag_log format ["Log: [fnc_waypoints] %1 удаление wp #%2", _grp, _i ];
			deleteWaypoint [_grp, _i];
		};

		// private["_WaypointCombatMode"];
		// _WaypointCombatMode = "YELLOW";

		// private["_WaypointBehaviour"];
		// _WaypointBehaviour = "AWARE";


		_patrol = _grp getVariable "patrol";
		if (!IsNil "_patrol") then {_patrol = true}else{_patrol = false};

		if ("Frigate" in _grp_type) then {
			_patrol = true;
		};


		_pos=civilianBasePos;

		if("UAV" in _grp_type)then{
			// _WaypointCombatMode = "BLUE";
			// _WaypointBehaviour = "CARELESS";
		};
		if("Air" in _grp_type)then{
			_maxDist = 4000;
			_WaypointCompletionRadius = 500;
			// _SpeedMode = "FULL";
			// _WaypointCombatMode = "RED";
		}else{
			_maxDist = gosa_locationSize ;
			_WaypointCompletionRadius = 50;
			// _SpeedMode = "NORMAL";
		};

		// ПВО
		if("AA" in _grp_type)then{
			_maxDist = 200;
			_WaypointCompletionRadius = 1000;
		};

		// патруль
		if(_patrol)then{
			_pos = _leaderPos;

			//- Позиция случайного игрока.
			_tmp_arr = (([] call gosa_fnc_listPlayers)-[objNull]);
			if (count _tmp_arr > 0) then {
				_tmp_arr = getPos (_tmp_arr call BIS_fnc_selectRandom);
				if (_tmp_arr call gosa_fnc_isZeroPos) then {
					diag_log format ["Log: [fnc_waypoints] %1  позиция wp [0,0] удаление, _pos = _leaderPos", _grp ];
				}else{
					_pos = _tmp_arr;
				};
			};


			_maxDist = ((_maxDist * 10) max 1500);
		};

		if("Air" in _grp_type)then{
			// FIXME: _g addWaypoint [_p, не работает должным образом];
			private["_dir","_dist2"];
			_dir = random 360;
			_dist2 = random _maxDist;
			_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
		};

		// артиллерия
		if("Artillery" in _grp_type)then{
			_pos = _leaderPos;
			_maxDist = ((_maxDist * 10) max 1500);
		};

		// десант
		if(_landing && "Plane" in _grp_type)then{
			_pos = civilianBasePos;
			_maxDist = gosa_locationSize*2;
			_WaypointCompletionRadius = _maxDist;
			// _SpeedMode = "NORMAL";
		};
		if(_landing && "Helicopter" in _grp_type)then{
			_pos = [civilianBasePos, 1500, 500, side _grp] call gosa_fnc_find_heliUnload_pos;
			_maxDist = 0;
			// TODO: в случае не найденной позиции высадки нужно сделать выгрузку с парашютом
			if (count _pos == 0) then {
				_pos = civilianBasePos;
				_maxDist = gosa_locationSize*2;
			};
		};

		// лодки та точке
		if(_landing && "Ship" in _grp_type)then{
			_pos = civilianBasePos;
			_maxDist = gosa_locationSize*2;
			_WaypointCompletionRadius = 400;
			// _SpeedMode = "NORMAL";
		};

		// грузовики поддержки
		_WaypointType = "MOVE";
		if("SUPPORT" in _grp_type)then{
			_WaypointType = "SUPPORT";
			_pos = _leaderPos;
			_maxDist = -1;
		};

		// лодки позиция маршрута
		if("Ship" in _grp_type)then{
			diag_log format ["Log: [fnc_waypoints] %1, if Ship", _grp];
			if ("Frigate" in _grp_type && count _vehicles > 0) then {
				diag_log format ["Log: [fnc_waypoints] %1, if Frigate", _grp];
				_minDist = 2500;
				_maxDist = 5000;
				_b = true;
				_testPos = [];
				_limit = 1000;
				while {_limit > 0 && _b && ({alive _x} count _units > 0)} do {
					/*
					// Просто прямо движется.
					_dir = (getDir (_vehicles select 0) - 90 + random 180);
					_dist2 = (_minDist + random _maxDist); // -_minDist?
					_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir, 0];
					*/
					//_testPos = ([] call gosa_fnc_getRandomWorldPos);
					//_testPos set [2, 0];
					// Площадь локации в 2 раза больше из-за воды.
					_testPos = [
						((_worldSize select 0) * -2) + random ((_worldSize select 0)*4),
						((_worldSize select 1) * -2) + random ((_worldSize select 1)*4),
						0
					];

					if (surfaceIsWater _testPos) then {
						_arr = ASLToATL _testPos;
						diag_log format ["Log: [fnc_waypoints] %1, %2 ASLToATL %3", _grp, _testPos, _arr];
						if (_arr select 2 > _minDeep) then {
							_b = false;
							_pos = _testPos;
							_maxDist = -1;
						};
					};
					_limit = _limit -1;
				};
			}else{

				diag_log format ["Log: [fnc_waypoints] Ship %1", _this];

			if!(_patrol)then{
				if ({getNumber (_cfgWea >> currentWeapon _x >> "enableAttack") <= 0} count _vehicles > 0) then {
					_landing = true;
				};
			};

			if(_landing)then{
				_true = true;
				_testPos = [];
				_limit = 1000;
				while {_limit > 0 && _true && ({alive _x} count _units > 0)} do {
					_dir = random 360;
					_dist2 = random _maxDist;
					_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
					_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 0, true]);
					if(count _testPos > 0 or (({alive _x} count _units) == 0))then {_true = false};
				};
				if(count _testPos > 0)then {_pos = _testPos; _maxDist = 0};
				_limit = _limit -1;
			}else{
				_true = true;
				_testPos = [];
				_limit = 1000;
				while {_limit > 0 && _true && ({alive _x} count _units > 0)} do {
					_dir = random 360;
					_dist2 = random _maxDist;
					_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
					_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 2, false]);
					if(count _testPos > 0 or (({alive _x} count _units) == 0))then {_true = false};
				};
				if(count _testPos > 0)then {_pos = _testPos; _maxDist = 0};
				_limit = _limit -1;
			};
			};
		};

		// авиация десант тип маршрута
		if(_landing && "Air" in _grp_type)then{
			if ("Plane" in _grp_type) then {
				_WaypointType = _wpType_TrUNLOAD_Plane;
			} else {
				_WaypointType = _wpType_TrUNLOAD;
			};
		};

		// лодки тип маршрута
		if(_landing && "Ship" in _grp_type && count _vehicles > 0)then{
			if((
					#ifdef __ARMA3__
						!canFire (_vehicles select 0)
					#else
						(getNumber (_cfgWea >> currentWeapon (_vehicles select 0) >> "enableAttack") <= 0)
					#endif
					&&
					!([_vehicles, ["RHIB"]] call gosa_fnc_CheckIsKindOfArray)
				)
				or
				([_vehicles, ["RubberBoat"]] call gosa_fnc_CheckIsKindOfArray)
			)then{
				_WaypointType = "GETOUT";
			}else{
				_WaypointType = "UNLOAD";
			};
		};

		if(_WaypointType in ["UNLOAD","GETOUT"])then{
			// _WaypointCombatMode = "GREEN";
		};

		// пехота
		if(count _vehicles == 0)then{
				diag_log format ["Log: [fnc_waypoints] Inf %1", _this];
			_true = true;
			_testPos = [];
			_limit = 1000;
			while {_limit > 0 && _true && ({alive _x} count _units > 0)} do {
				_dir = random 360;
				_dist2 = random _maxDist;
				_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
				if(!surfaceIsWater _testPos)then {
					_true = false;
					_pos = _testPos;
				};
				_limit = _limit -1;
			};
		};

		// создать маршрут
		_wp = [_grp,_pos,_maxDist,_WaypointType] call gosa_fnc_addWaypoint;

		diag_log format ["Log: [fnc_waypoints] %1 %2", _wp, [_pos, _maxDist, _pos distance civilianBasePos]];
		diag_log format ["Log: [fnc_waypoints] %1 added %2", _grp, [_wp, _WaypointType, waypointPosition _wp], _grp_type];
	};
};

	diag_log format ["Log: [fnc_waypoints] end %1", _this];
