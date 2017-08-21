waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "sizeLocation"};
while{true}do{
	{
		private["_grp","_leader"];
		_grp = _x;
		_leader = leader _grp;

		private["_time"];
		_time = (_grp getVariable "grp_created_time");
		if ( isNil "_time" ) then {
			_time = time;
			_grp setVariable ["grp_created_time", _time];
		};
		
		private["_currentWP","_waypoints","_createWP","_leaderPos"];
		_currentWP = currentWaypoint _grp;
		_waypoints = waypoints _grp;
		_createWP = false;
		_leaderPos = getPos vehicle _leader;

		if({isPlayer _x or _x in playableUnits} count units _grp == 0)then{
			if(!isNil {_grp getVariable "_newWP"})then{
				_createWP = true;
				_grp setVariable ["_newWP",nil];
			};

			if(!isNil {_grp getVariable "grp_created"})then{
				// _grp call draga_fnc_arty;
				private["_cleanup"];
				_cleanup = _grp getVariable "_cleanup";
				if(isNil "_cleanup")then{
					_cleanup = [getPos vehicle _leader,time+40,time+120];
					_grp setVariable ["_cleanup",_cleanup];
					_createWP = true;
				}else{
					private["_oldPos","_oldTime","_oldTime2"];
					_oldPos = _cleanup select 0;
					_oldTime = _cleanup select 1;
					_oldTime2 = _cleanup select 2;
					private["_pos"];
					_pos = getPos vehicle _leader;
					private["_true"];
					_true = false;
					if!(_true)then{
						if(waypointType [_grp, _currentWP] in ["SUPPORT"])then{
							_cleanup = [getPos vehicle _leader,time+40,time+120];
							_grp setVariable ["_cleanup",_cleanup];
							_true = true;
						};
					};
					if!(_true)then{
						if(currentCommand _leader == "FIRE AT POSITION")then{
							_cleanup = [getPos vehicle _leader,time+40,time+120];
							_grp setVariable ["_cleanup",_cleanup];
							_true = true;
						};
					};
					if!(_true)then{
						if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{
							_cleanup = [getPos vehicle _leader,time+40,time+120];
							_grp setVariable ["_cleanup",_cleanup];
							_true = true;
						};
					};
					if!(_true)then{
						if(_oldTime < time)then{
							if(_oldPos distance _pos >= 1)then{
								_cleanup = [getPos vehicle _leader,time+40,time+120];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							}else{
								_createWP = true;
								deleteWaypoint [_grp,_currentWP];
								_cleanup = [getPos vehicle _leader,time+40,_oldTime2];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							};
						};
					};
					if(_oldTime2 < time)then{
							{_x setVariable ["time", 0]}forEach units _grp;
							_true = true;
					};
				};
			}else{
				if ( _time + 30 < time )then {
					_grp setVariable ["grp_created",true];
				};
			};

			private["_wp"];
			if(_createWP)then{
				private ["_units","_vehicles","_landing","_types"];
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
							if(count assignedCargo _veh > 0)then{
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

				private ["_air","_AA","_Ship","_arty"];
				_air = ([_vehicles, ["Air"]] call m_fnc_CheckIsKindOfArray);
				_AA = ([_vehicles, ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1"]] call m_fnc_CheckIsKindOfArray);
				_Ship = ([_vehicles, ["Ship"]] call m_fnc_CheckIsKindOfArray);
				if({getNumber(LIB_cfgVeh >> _x >> "artilleryScanner") == 1}count _types > 0)then{
					_arty = true;
				}else{
					_arty = false;
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

				private["_WaypointType"];
				_WaypointType = "MOVE";
				if(_support)then{
					_WaypointType = "SUPPORT";
				};

				if(_Ship)then{

					if!(_patrol)then{
						if({getNumber(LIB_cfgWea >> currentWeapon _x >> "enableAttack")==0} count _vehicles > 0)then{
							_landing = true;
						};

						if({getText(LIB_cfgVeh >> _x >> "vehicleClass") == "Submarine"} count _types > 0)then{
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
						if(count _testPos > 0)then {_pos = _testPos};
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
						if(count _testPos > 0)then {_pos = _testPos};
					};
				};

				if(_landing && _air)then{
					_WaypointType = "UNLOAD";
				};
				if(_landing && _Ship && count _vehicles > 0)then{
					if(getNumber(LIB_cfgWea >> currentWeapon (_vehicles select 0) >> "enableAttack")==0)then{
						_WaypointType = "UNLOAD";
					}else{
						_WaypointType = "GETOUT";
					};
				};

				if(_WaypointType in ["UNLOAD","GETOUT"])then{
					_pos = [_pos, _WaypointCompletionRadius, [_pos, _leaderPos] call BIS_fnc_dirTo] call bis_fnc_relPos;
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
						_testPos = (_testPos isFlatEmpty [0.25, -1, -1, -1, 0, false]);
						_attempts = _attempts + 1;
						if(count _testPos > 0 or _attempts > 1000)then {_true = false};
					};
					if(count _testPos > 0)then {_pos = _testPos; _maxDist = 0};
				};

				_wp = _grp addWaypoint [_pos, _maxDist];
				_wp setWaypointType _WaypointType;
				_wp setWaypointSpeed _SpeedMode;
			}else{
				_wp = [_grp,currentWaypoint _grp];
			};
			_wp setWaypointStatements ["true", "if(!isNil {this})then{[group this] call m_fnc_waypoints}"];
		};
	}forEach allGroups;
	sleep 1;
};
