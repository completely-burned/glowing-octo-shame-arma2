private["_leader"];
_leader = (_this select 0);
if(!isNil "_leader")then{
	private ["_grp"];
	_grp = group _leader;

	private["_currentWP","_waypoints","_leaderPos"];
	_currentWP = currentWaypoint _grp;
	_waypoints = waypoints _grp;
	_leaderPos = getPos vehicle _leader;

	private ["_units","_vehicles","_landing","_types"];
	_units = units _grp;
	_vehicles = [];
	_types = [];
	_landing = false;
	{	
		_types set [count _types, typeOf _x];
		private ["_veh"];
		_veh = vehicle _x;
		if(_veh != _x)then{
			if!(_veh in _vehicles)then{
				_vehicles set [count _vehicles, _veh];
				_types set [count _types, typeOf _veh];
				if(count assignedCargo _veh > 0)then{
					_landing = true;
				};
			};
		};
	}forEach _units;

	private["_wp","_typeWP"];
	_wp = [_grp,currentWaypoint _grp];
	_typeWP = waypointType _wp;


	private["_Submarine"];
	if({toLower getText(LIB_cfgVeh >> _x >> "vehicleClass") == "submarine"} count _types > 0)then{
		_Submarine = true;
	}else{
		_Submarine = false;
	};

	if(_Submarine && count _this > 1)then{
		if(_typeWP == "UNLOAD")then{
			{
				private["_veh"];
				_veh = _x;
				_veh stop true;
				// private ["_driver"];
				// _driver = driver _veh;
				// doStop _driver;
				while{(!isNull _veh) && (alive _veh) && (speed _veh >= 1)}do{};
				{
					private["_unit"];
					_unit = _x;
					_unit action ["Eject", _veh];
					while{(_unit in _veh) && (alive _veh) && (alive _unit)}do{};
					_unit leaveVehicle _veh;
				}forEach assignedCargo _veh;
				// _driver doFollow leader _driver;
				_veh stop false;
			}forEach _vehicles;
		};

		if(_typeWP == "GETOUT")then{
			{
				private["_veh"];
				_veh = _x;
				_veh stop true;
				// private ["_driver"];
				// _driver = driver _veh;
				// doStop _driver;
				while{(!isNull _veh) && (alive _veh) && (speed _veh >= 1)}do{};
				{
					private["_unit"];
					_unit = _x;
					_unit action ["Eject", _veh];
					while{(_unit in _veh) && (alive _veh) && (alive _unit)}do{};
					_unit leaveVehicle _veh;
				}forEach crew _veh;
				// _driver doFollow leader _driver;
				_veh stop false;
			}forEach _vehicles;
			_vehicles = [];
			_Submarine = false;
		};
	};

	if(!_Submarine && count _this > 1)then{
		if(_typeWP == "UNLOAD")then{
			private ["_crew"];
			_crew = [];
			private ["_Plane"];
			_Plane = ([_vehicles, ["Plane"]] call m_fnc_CheckIsKindOfArray);
			if(_Plane)then{
				{
					_crew set [count _crew,[_x,assignedCargo _x]];
					if(isNil {_x getVariable "_landing"})then{
						_x setVariable ["_landing",true];
						_x spawn {
							{
								sleep 0.5;
								_x action ["Eject", _this];
								_x leaveVehicle _this;
							}forEach assignedCargo _this;
							_this setVariable ["_landing",nil];
						};
					};
				}forEach _vehicles;
			}else{
				{
					_crew set [count _crew,[_x,assignedCargo _x]];
					private["_veh"];
					_veh = _x;
					{
						_x leaveVehicle _veh;
					}forEach assignedCargo _veh;
				}forEach _vehicles;
			};
			{
				private["_veh","_crew2"];
				_veh = _x select 0;
				_crew2 = _x select 1;
				while{({_x in _veh}count _crew2 > 0) && (alive _veh)}do{};
			}forEach _crew;
		};

		if(_typeWP == "GETOUT")then{
			private ["_crew"];
			_crew = [];
			private ["_Plane"];
			_Plane = ([_vehicles, ["Plane"]] call m_fnc_CheckIsKindOfArray);
			if(_Plane)then{
				{
					_crew set [count _crew,[_x,crew _x]];
					if(isNil {_x getVariable "_landing"})then{
						_x setVariable ["_landing",true];
						_x spawn {
							{
								sleep 0.5;
								_x action ["Eject", _this];
								_x leaveVehicle _this;
							}forEach crew _this;
							_this setVariable ["_landing",nil];
						};
					};
				}forEach _vehicles;
			}else{
				{
					_crew set [count _crew,[_x,crew _x]];
					private["_veh"];
					_veh = _x;
					{
						_x leaveVehicle _veh;
					}forEach crew _veh;
				}forEach _vehicles;
			};
			{
				private["_veh","_crew2"];
				_veh = _x select 0;
				_crew2 = _x select 1;
				while{({_x in _veh}count _crew2 > 0) && (alive _veh)}do{};
			}forEach _crew;
		};
	};


	if(count _waypoints <= _currentWP + 1)then{
		private["_WaypointCombatMode"];
		_WaypointCombatMode = "RED";

		private ["_patrol"];
		_patrol = _grp getVariable "patrol";
		if (!IsNil "_patrol") then {_patrol = true}else{_patrol = false};

		private ["_pos"];
		_pos=civilianBasePos;

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
			if(getNumber(LIB_cfgVeh >> _x >> "attendant")> 0 && _x isKindOf "LandVehicle")then{
				_support = true;
				BreakTo "_support";
			};
			if(getNumber(LIB_cfgVeh >> _x >> "transportfuel")> 0)then{
				_support = true;
				BreakTo "_support";
			};
			if(getNumber(LIB_cfgVeh >> _x >> "transportammo")> 0)then{
				_support = true;
				BreakTo "_support";
			};
			if(getNumber(LIB_cfgVeh >> _x >> "transportrepair")> 0)then{
				_support = true;
				BreakTo "_support";
			};
			
		}forEach _types;

		if(_uav)then{
			_WaypointCombatMode = "BLUE";
		};
		private ["_maxDist","_WaypointCompletionRadius","_SpeedMode"];
		if(_air)then{
			_maxDist = 4000;
			_WaypointCompletionRadius = 500;
			_SpeedMode = "FULL";
		}else{
			_maxDist = sizeLocation ;
			_WaypointCompletionRadius = 50;
			_SpeedMode = "NORMAL";
		};
		if(_AA)then{
			_maxDist = 200;
			_WaypointCompletionRadius = 1000;
		};
		if(_patrol)then{
			_pos = _leaderPos;
			_maxDist = ((_maxDist * 10) max 1500);
		};
		if(_arty)then{
			_pos = _leaderPos;
			_maxDist = ((_maxDist * 10) max 1500);
		};

		if(_landing && _air)then{
			_pos = civilianBasePos;
			_maxDist = sizeLocation*2;
			_WaypointCompletionRadius = _maxDist;
			_SpeedMode = "NORMAL";
		};

		if(_landing && _Ship)then{
			_pos = civilianBasePos;
			_maxDist = sizeLocation*2;
			_WaypointCompletionRadius = 400;
			_SpeedMode = "NORMAL";
		};

		private["_WaypointType"];
		_WaypointType = "MOVE";
		if(_support)then{
			_WaypointType = "SUPPORT";
			_pos = _leaderPos;
		};

		if(_Submarine)then{
				_WaypointType = "GETOUT";
				private["_true"];
				_true = true;
				private ["_dir","_dist2","_testPos"];
				private ["_attempts"];
				_attempts = 0;
				while {_true && ({alive _x} count _units > 0)} do {
					_dir = random 360;
					_dist2 = random _maxDist;
					_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
					_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 2, false]);
					_attempts = _attempts + 1;
					if(count _testPos > 0 or _attempts > 1000)then {_true = false};
				};
				if(count _testPos > 0)then {_pos = _testPos; _maxDist = 0};
		};

		if(_Ship && !_Submarine)then{

			if!(_patrol)then{
				if({getNumber(LIB_cfgWea >> currentWeapon _x >> "enableAttack")==0} count _vehicles > 0)then{
					_landing = true;
				};
			};

			if(_landing)then{
				private["_true"];
				_true = true;
				private ["_dir","_dist2","_testPos"];
				private ["_attempts"];
				_attempts = 0;
				while {_true && ({alive _x} count _units > 0)} do {
					_dir = random 360;
					_dist2 = random _maxDist;
					_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
					_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 0, true]);
					_attempts = _attempts + 1;
					if(count _testPos > 0 or _attempts > 1000)then {_true = false};
				};
				if(count _testPos > 0)then {_pos = _testPos; _maxDist = 0};
			}else{
				private["_true"];
				_true = true;
				private ["_dir","_dist2","_testPos"];
				private ["_attempts"];
				_attempts = 0;
				while {_true && ({alive _x} count _units > 0)} do {
					_dir = random 360;
					_dist2 = random _maxDist;
					_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
					_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 2, false]);
					_attempts = _attempts + 1;
					if(count _testPos > 0 or _attempts > 1000)then {_true = false};
				};
				if(count _testPos > 0)then {_pos = _testPos; _maxDist = 0};
			};
		};

		if(_landing && _air)then{
			_WaypointType = "UNLOAD";
		};
		if(_landing && _Ship && count _vehicles > 0)then{
			if(getNumber(LIB_cfgWea >> currentWeapon (_vehicles select 0) >> "enableAttack")==0)then{
				_WaypointType = "GETOUT";
			}else{
				_WaypointType = "UNLOAD";
			};
		};

		if(_Submarine)then{
			_WaypointType = "GETOUT";
		};

		if(_WaypointType in ["UNLOAD","GETOUT"] && _air)then{
			_pos = [_pos, _WaypointCompletionRadius max 1000, [_pos, _leaderPos] call BIS_fnc_dirTo] call bis_fnc_relPos;
		};

		if(_WaypointType in ["UNLOAD","GETOUT"])then{
			_WaypointCombatMode = "GREEN";
		};

		if(count _vehicles == 0)then{
			private["_true"];
			_true = true;
			private ["_dir","_dist2","_testPos"];
			private ["_attempts"];
			_attempts = 0;
			while {_true && ({alive _x} count _units > 0)} do {
				_dir = random 360;
				_dist2 = random _maxDist;
				_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
				_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 0, false]);
				_attempts = _attempts + 1;
				if(count _testPos > 0 or _attempts > 1000)then {_true = false};
			};
			if(count _testPos > 0)then {_pos = _testPos; _maxDist = 0};
		};

		_wp = _grp addWaypoint [_pos, _maxDist];
		_wp setWaypointType _WaypointType;
		_wp setWaypointSpeed _SpeedMode;
		_wp setWaypointCombatMode _WaypointCombatMode;
		_wp setWaypointCompletionRadius _WaypointCompletionRadius;
		_wp setWaypointStatements ["true", "if(!isNil {this})then{[this,true] call m_fnc_waypoints}"];
	};
};
