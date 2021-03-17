if(draga_loglevel>0)then{
	diag_log format ["fnc_waypoints.sqf start %1", _this];
};
private["_leader"];
_leader = (_this select 0);
if(!isNil "_leader")then{
	private ["_grp"];
	_grp = group _leader;

	private["_currentWP","_waypoints","_leaderPos"];
	_currentWP = currentWaypoint _grp;
	_waypoints = waypoints _grp;
	_leaderPos = getPos vehicle _leader;

	private ["_units","_vehicles","_landing","_types","_assignedVehicles"];
	_units = units _grp;
	_vehicles = [];
	_types = [];
	_assignedVehicles = [];
	_landing = false;
	{
		_types set [count _types, typeOf _x];
		private ["_veh"];
		_veh = vehicle _x;
		private ["_assignedVehicle"];
		_assignedVehicle = assignedVehicle _x;

		if (isNull _assignedVehicle) then {
			_assignedVehicle = _x getVariable "assignedVehicle";
		};
		if (isNil {_assignedVehicle}) then {_assignedVehicle = objNull};

		if (!isNull _assignedVehicle) then {
			_assignedVehicles set [count _assignedVehicles, _veh];
		};
		if(_veh != _x)then{
			if!(_veh in _vehicles)then{
				if (group effectiveCommander _veh == _grp) then {
					_vehicles set [count _vehicles, _veh];
					_types set [count _types, typeOf _veh];
					if({group _x != _grp}count crew _veh > 0)then{
						_landing = true;
					};
				};
			};
		};
	}forEach _units;

	private["_wp","_typeWP"];
	_wp = [_grp,currentWaypoint _grp];
	_typeWP = waypointType _wp;

	if(true)then{

		for "_i" from count waypoints _grp - 1 to 0 step -1 do {
			if (draga_loglevel > 0) then {
				diag_log format ["m_fnc_waypoints.sqf %1 удаление wp #%2", _grp, _i ];
			};
			deleteWaypoint [_grp, _i];
		};

		// private["_WaypointCombatMode"];
		// _WaypointCombatMode = "YELLOW";

		// private["_WaypointBehaviour"];
		// _WaypointBehaviour = "AWARE";

		private ["_patrol"];
		_patrol = _grp getVariable "patrol";
		if (!IsNil "_patrol") then {_patrol = true}else{_patrol = false};

		private ["_pos"];
		_pos=civilianBasePos;

		private["_Submarine"];
			_Submarine = false;

		private ["_air","_AA","_Ship","_arty","_uav"];
		_air = ([_vehicles, ["Air"]] call m_fnc_CheckIsKindOfArray);
		_AA = ([_vehicles, ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1"]] call m_fnc_CheckIsKindOfArray);
		_Ship = ([_vehicles, ["Ship"]] call m_fnc_CheckIsKindOfArray);
		if({getNumber(LIB_cfgVeh >> _x >> "artilleryScanner") == 1}count _types > 0)then{
			_arty = true;
		}else{
			_arty = false;
		};
		_uav = ([_types, ["UAV"]] call m_fnc_CheckIsKindOfArray);
		if({getNumber (LIB_cfgVeh >> _x >> "isUav") == 1} count _types > 0)then{
			_uav = true;
		};
		private["_support"];
		_support = false;
		ScopeName "_support";
		{
			if(getNumber(LIB_cfgVeh >> typeOf _x >> "attendant")> 0 && _x isKindOf "LandVehicle")then{
				_support = true;
				BreakTo "_support";
			};
			if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportfuel")> 0)then{
				_support = true;
				BreakTo "_support";
			};
			if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportammo")> 0)then{
				_support = true;
				BreakTo "_support";
			};
			if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportrepair")> 0)then{
				_support = true;
				BreakTo "_support";
			};

		}forEach _vehicles+_assignedVehicles;

		if(_typeWP == "SUPPORT")then{
			if({count assignedVehicleRole _x > 0} count _units > 0)then{
				_support = true;
			};
		};

		if(_uav)then{
			// _WaypointCombatMode = "BLUE";
			// _WaypointBehaviour = "CARELESS";
		};
		private ["_maxDist","_WaypointCompletionRadius","_SpeedMode"];
		if(_air)then{
			_maxDist = 4000;
			_WaypointCompletionRadius = 500;
			// _SpeedMode = "FULL";
			// _WaypointCombatMode = "RED";
		}else{
			_maxDist = sizeLocation ;
			_WaypointCompletionRadius = 50;
			// _SpeedMode = "NORMAL";
		};

		// ПВО
		if(_AA)then{
			_maxDist = 200;
			_WaypointCompletionRadius = 1000;
		};

		// патруль
		if(_patrol)then{

			_pos = getPos ([] call BIS_fnc_listPlayers call BIS_fnc_selectRandom);

			if([_pos, [0,0]] call BIS_fnc_distance2D < 1 )then{
				if (draga_loglevel > 0) then {
					diag_log format ["m_fnc_waypoints.sqf %1  позиция wp [0,0] удаление, _pos = _leaderPos", _grp ];
				};
				_pos = _leaderPos;
			};

			_maxDist = ((_maxDist * 10) max 1500);
		};

		// артиллерия
		if(_arty)then{
			_pos = _leaderPos;
			_maxDist = ((_maxDist * 10) max 1500);
		};

		// десант
		if(_landing && _air)then{
			_pos = civilianBasePos;
			_maxDist = sizeLocation*2;
			_WaypointCompletionRadius = _maxDist;
			// _SpeedMode = "NORMAL";
		};

		// ПВО
		if(_AA)then{

			if(draga_loglevel>0)then{
				diag_log format ["fnc_waypoints.sqf AA %1", _this];
			};

			private["_friendList","_friendCount","_nearVehList","_friendList2"];

			_friendList = [];
			_friendList2 = [];

			_nearVehList = _leaderPos nearEntities [["Land"], 2000];

			{
				if (side _grp getFriend side _x >= 0.6) then {
					_friendList set [count _friendList, _x];
				};
			} forEach _nearVehList;

			{
					if (!isNil {_x} && !isNull _x) then {
						_nearVehList = _x nearEntities [["Land"],200];
						_friendCount = 0;
						if (side _grp getFriend side _x >= 0.6) then {
							if ([_nearVehList, ["Tank","Wheeled_APC"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call m_fnc_CheckIsKindOfArray) then {
								_friendCount = _friendCount + 2;
							};
							if ([_nearVehList, ["LandVehicle"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call m_fnc_CheckIsKindOfArray) then {
								_friendCount = _friendCount + 1;
							};
							if ([_nearVehList, ["Land"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call m_fnc_CheckIsKindOfArray) then {
								_friendCount = _friendCount + 0.25;
							};
							if (_friendCount >= 3) then {
								_friendList2 set [count _friendList2, _x];
							};
						};
					};
			} forEach _friendList;

			_pos = _leaderPos;
			private["_distance"];
			{
				if(_leaderPos distance _x > 250)then{
					if(isNil {_distance})then{
						_distance = _x distance _leaderPos;
						_pos = getPosASL _x;
					}else{
						if (_x distance _leaderPos < _distance)then{
							_pos = getPosASL _x;
						};
					};
				};
			} foreach _friendList2;

		};

		// лодки та точке
		if(_landing && _Ship)then{
			_pos = civilianBasePos;
			_maxDist = sizeLocation*2;
			_WaypointCompletionRadius = 400;
			// _SpeedMode = "NORMAL";
		};

		// грузовики поддержки
		private["_WaypointType"];
		_WaypointType = "MOVE";
		if(_support)then{
			_WaypointType = "SUPPORT";
			_pos = _leaderPos;
			_maxDist = -1;
		};

		// лодки позиция маршрута
		if(_Ship && !_Submarine)then{

			if(draga_loglevel>0)then{
				diag_log format ["fnc_waypoints.sqf Ship %1", _this];
			};

			if!(_patrol)then{
				if({getNumber(LIB_cfgWea >> currentWeapon _x >> "enableAttack")==0} count _vehicles > 0)then{
					_landing = true;
				};
			};

			if(_landing)then{
				private["_true"];
				_true = true;
				private ["_dir","_dist2","_testPos"];
				_testPos = [];
				private ["_limit"];
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
				private["_true"];
				_true = true;
				private ["_dir","_dist2","_testPos"];
				_testPos = [];
				private ["_limit"];
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

		// авиация десант тип маршрута
		if(_landing && _air)then{
			_WaypointType = "UNLOAD";
		};

		// лодки тип маршрута
		if(_landing && _Ship && count _vehicles > 0)then{
			if((
				(
					getNumber(LIB_cfgWea >> currentWeapon (_vehicles select 0) >> "enableAttack")==0)
					&&
					!([_vehicles, ["RHIB"]] call m_fnc_CheckIsKindOfArray)
				)
				or
				([_vehicles, ["RubberBoat"]] call m_fnc_CheckIsKindOfArray)
			)then{
				_WaypointType = "GETOUT";
			}else{
				_WaypointType = "UNLOAD";
			};
		};

		// подлодки тип маршрута
		if(_Submarine)then{
			_WaypointType = "GETOUT";
		};

		if(_WaypointType in ["UNLOAD","GETOUT"])then{
			// _WaypointCombatMode = "GREEN";
		};

		// пехота
		if(count _vehicles == 0)then{
			if(draga_loglevel>0)then{
				diag_log format ["fnc_waypoints.sqf Inf %1", _this];
			};

			private["_true"];
			_true = true;
			private ["_dir","_dist2","_testPos"];
			_testPos = [];
			private ["_limit"];
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

		if(draga_loglevel>0)then{
			diag_log format ["fnc_waypoints.sqf addWaypoint %1", _this];
		};

		// создать маршрут
		_wp = _grp addWaypoint [_pos, _maxDist];
		_wp setWaypointType _WaypointType;
		//_wp setWaypointSpeed _SpeedMode;
		// _wp setWaypointCombatMode _WaypointCombatMode;
		// _wp setWaypointBehaviour _WaypointBehaviour;
		// _wp setWaypointCompletionRadius _WaypointCompletionRadius;
		_wp setWaypointDescription "glowing-octo-shame Waypoint created dynamically";
		_wp setWaypointStatements ["true", "if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}"];

		if(draga_loglevel>0)then{
			diag_log format ["fnc_waypoints.sqf added %1", _wp];
		};
	};
};

if(draga_loglevel>0)then{
	diag_log format ["fnc_waypoints.sqf end %1", _this];
};
