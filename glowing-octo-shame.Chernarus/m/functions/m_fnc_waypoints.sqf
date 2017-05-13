private ["_grp"];
_grp = (_this select 0);
if(!isNull _grp)then{
	private ["_leader","_units","_vehicles","_landing","_types"];
	_leader = leader _grp;
	_units = units _grp;
	_vehicles = [];
	_types = [];
	_landing = false;
	{	
		private ["_veh"];
		_veh = vehicle _x;
		if(_veh != _x)then{
			if!(_veh in _vehicles)then{
				_vehicles set [count _vehicles, _veh];
				_types set [count _types, typeOf _veh];
				if({_grp != group _x} count crew _veh > 0)then{
					_landing = true;
				};
			};
		};
	}forEach _units;

	private ["_patrol"];
	_patrol = _grp getVariable "patrol";
	if (!IsNil "_patrol") then {_patrol = true}else{_patrol = false};

	private ["_pos"];
	_pos=civilianBasePos;

	private ["_air","_AA","_Ship"];
	_air = ([_vehicles, ["Air"]] call m_fnc_CheckIsKindOfArray);
	_AA = ([_vehicles, ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1"]] call m_fnc_CheckIsKindOfArray);
	_Ship = ([_vehicles, ["Ship"]] call m_fnc_CheckIsKindOfArray);

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
		_pos = (_grp getVariable "patrol_pos");
		_maxDist = ((_maxDist * 10) max 1500);
	};

	if(_landing && _air)then{
		_pos = civilianBasePos;
		_maxDist = sizeLocation/2;
		_WaypointCompletionRadius = (sizeLocation max 750);
		_SpeedMode = "NORMAL";
	};

	if(_landing && _Ship)then{
		_pos = civilianBasePos;
		_maxDist = sizeLocation*2;
		_WaypointCompletionRadius = 100;
		_SpeedMode = "NORMAL";
	};

	if(SpeedMode _grp != _SpeedMode)then{_grp setSpeedMode _SpeedMode};

	private ["_wp"];
	if((count waypoints _grp) < 2)then{
		_wp = _grp addWaypoint [_pos, _maxDist];
		_wp setWaypointStatements ["true", "[group this] call m_fnc_waypoints"];
	}else{
		_wp = [_grp, currentwaypoint _grp];
	};

	if(_patrol or _air or _Ship)then{
		_wp setWaypointType "MOVE";
		_wp setWaypointTimeout [0, 0, 0];
	}else{
		_wp setWaypointType "SAD";
		_wp setWaypointTimeout [20, 60, 180];
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
	if(_support)then{
		_wp setWaypointType "SUPPORT";
		_wp setWaypointTimeout [0, 0, 0];
	};

	if(_Ship)then{

		if({getNumber(LIB_cfgWea >> currentWeapon _x >> "enableAttack")==0} count _vehicles > 0)then{
			_landing = true;
		};

		if(_landing)then{
			private["_true"];
			_true = true;
			private ["_dir","_dist2","_testPos"];
			while {_true && ({alive _x} count _units > 0)} do {
				_dir = random 360;
				_dist2 = random _maxDist;
				_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
				_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 0, true]);
				if(count _testPos > 0)then {_true = false};
			};
			_wp setWaypointPosition [_testPos, 0];
		}else{
			private["_true"];
			_true = true;
			private ["_dir","_dist2","_testPos"];
			while {_true && ({alive _x} count _units > 0)} do {
				_dir = random 360;
				_dist2 = random _maxDist;
				_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
				_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 2, false]);
				if(count _testPos > 0)then {_true = false};
			};
			_wp setWaypointPosition [_testPos, 0];
		};
	}else{
		_wp setWaypointPosition [_pos, _maxDist];
	};
	_wp setWaypointCompletionRadius _WaypointCompletionRadius;

	if(_landing && _air)then{
		{
			if(isNil {_x getVariable "_landing"})then{
				_x setVariable ["_landing",true];
				_x spawn {
					private ["_grp"];
					_grp = group _this;
					waitUntil{sleep 0.5;(isNull _this) or (!alive _this) or (!canMove _this) or ((_this distance (waypointPosition [_grp, currentwaypoint _grp])) <= 100 max waypointCompletionRadius [_grp, currentwaypoint _grp])};
					{
						if(group _x != _grp)then{
							// if(_this isKindOf "Plane")then{
								sleep 0.5;
								_x action ["Eject", _this];
							// };
							_x leaveVehicle _this;
						};
					}forEach crew _this;
					_this setVariable ["_landing",nil];
					// [_grp] call m_fnc_waypoints;
				};
			};
		}forEach _vehicles
	};

	if(_landing && _Ship)then{
		{
			if(isNil {_x getVariable "_landing"})then{
				_x setVariable ["_landing",true];
				_x spawn {
					private ["_grp"];
					_grp = group _this;
					waitUntil{sleep 0.5;(isNull _this) or (!alive _this) or (!canMove _this) or ((_this distance (waypointPosition [_grp, currentwaypoint _grp])) <= 100 max waypointCompletionRadius [_grp, currentwaypoint _grp])};
					{
						if(group _x != _grp or getNumber(LIB_cfgWea >> currentWeapon _this >> "enableAttack")==0)then{
							_x leaveVehicle _this;
						};
					}forEach crew _this;
					_this setVariable ["_landing",nil];
				};
			};
		}forEach _vehicles
	};
};
