private["_grp"];
private["_leader"];
private["_leaderPos"];
private["_currentWP","_wp","_typeWP"];
private ["_units","_vehicles","_types","_cargo"];
private["_Submarine"];
private ["_Helicopter"];
private ["_Plane"];
private ["_Ship"];
private ["_StaticWeapon"];
private ["_Air","_uav","_Car","_Tank"];
private["_support"];
// private ["_Stealth"];


while{!isNull _this}do{

	scopeName "main";

	sleep 1;

	if (true) then {

		_grp=_this;

		_leader = leader _grp;

		_leaderPos = getPos vehicle _leader;

		_currentWP = currentWaypoint _grp;
		_wp = [_grp,_currentWP];
		_typeWP = waypointType _wp;

		_units = units _grp;
		_vehicles = [];
		_types = [];
		_cargo = [];
		{
			_types set [count _types, typeOf _x];
			private ["_veh"];
			_veh = vehicle _x;
			if(_veh != _x)then{
				if!(_veh in _vehicles)then{
					_vehicles set [count _vehicles, _veh];
					_types set [count _types, typeOf _veh];
					_cargo = _cargo + assignedCargo _veh;
				};
			};
		}forEach _units;

		if( ({!isNil {_x getVariable "draga_transportwaypoint_created_GET_IN_pos"}} count [_grp] + _vehicles > 0 ) or ({!isNil {_x getVariable "draga_transportwaypoint_created_GET_OUT_pos"}} count [_grp] + _vehicles > 0 ))then{
			breakTo "main";
			if (draga_loglevel > 0) then {
				diag_log format ["draga_fnc_initGroup.sqf %1 breakTo main, transport", _grp ];
			};
		};

		if({toLower getText(LIB_cfgVeh >> _x >> "vehicleClass") == "submarine"} count _types > 0)then{_Submarine = true}else{_Submarine = false};

		_Helicopter = ([_vehicles, ["Helicopter"]] call m_fnc_CheckIsKindOfArray);

		_Plane = ([_vehicles, ["Plane"]] call m_fnc_CheckIsKindOfArray);

		_Ship = ([_vehicles, ["Ship"]] call m_fnc_CheckIsKindOfArray);

		_StaticWeapon = ([_vehicles, ["StaticWeapon"]] call m_fnc_CheckIsKindOfArray);

		_Air = ([_vehicles, ["Air"]] call m_fnc_CheckIsKindOfArray);

		_Tank = ([_vehicles, ["Tank"]] call m_fnc_CheckIsKindOfArray);

		_Car = ([_vehicles, ["Car"]] call m_fnc_CheckIsKindOfArray);

		_uav = ([_types, ["UAV"]] call m_fnc_CheckIsKindOfArray);
		if({getNumber (LIB_cfgVeh >> _x >> "isUav") == 1} count _types > 0)then{
			_uav = true;
		};

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

		_grp_wp_completed = !isNil {_grp getVariable "_grp_wp_completed"};

		if (_StaticWeapon) then {
			if ( count waypoints _grp > 0 ) then{
				[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
				sleep 1;
				for "_i" from count waypoints _grp - 1 to 0 step -1 do {
					deleteWaypoint [_grp, _i];
				};
			};
		};

		if (_Submarine) then {
		  if (_typeWP in ["UNLOAD","GETOUT"]) then {
			if ((_leaderPos distance waypointPosition _wp < 400) or _grp_wp_completed) then {
			  if (isNil {_grp getVariable "GETOUT"}) then {
				_grp setVariable ["GETOUT",true];
				_grp call {
				  private ["_units","_vehicles"];
					_units = units _this;
					_vehicles = [];
					{
						private ["_veh"];
						_veh = vehicle _x;
						if(_veh != _x)then{
							if!(_veh in _vehicles)then{
								_vehicles set [count _vehicles, _veh];
							};
						};
					}forEach _units;

				  {
							private["_veh"];
							_veh = _x;
							_veh stop true;
							while{(!isNull _veh) && (alive _veh) && (speed _veh >= 1)}do{};
							{
								private["_unit"];
								_unit = _x;
								_unit action ["Eject", _veh];
								while{(_unit in _veh) && (alive _veh) && (alive _unit)}do{};
								_unit leaveVehicle _veh;
							}forEach crew _veh;
							_veh stop false;
						}forEach _vehicles;
				  while {(count (waypoints _this)) > 0} do {
							deleteWaypoint ((waypoints _this) select 0);
						};
				  _this setVariable ["GETOUT",nil];
				};
			  };
			};
		  };
		};

		if (_Helicopter) then {
			if (_typeWP in ["UNLOAD"]) then {
				if (draga_loglevel > 0) then {
					diag_log format ["draga_fnc_initGroup.sqf %1 _Helicopter UNLOAD", _grp ];
				};
				if ((_leaderPos distance waypointPosition _wp < 1000) or _grp_wp_completed) then {
					if (isNil {_grp getVariable "UNLOAD"}) then {
						_grp setVariable ["UNLOAD",true];
						_grp call {
							private ["_units","_vehicles"];
							_units = units _this;
							_vehicles = [];
							{
								private ["_veh"];
								_veh = vehicle _x;
								if(_veh != _x)then{
									if!(_veh in _vehicles)then{
										_vehicles set [count _vehicles, _veh];
									};
								};
							}forEach _units;

							{
								private["_veh"];
								_veh = _x;
								{
									if(group _x != _this)then{
										_x leaveVehicle _veh;
									};
								}forEach crew _veh;
							}forEach _vehicles;
							while {(count (waypoints _this)) > 0} do {
								deleteWaypoint ((waypoints _this) select 0);
							};
							_this setVariable ["UNLOAD",nil];
						};
					};
				};
			};
			if (_typeWP in ["GETOUT"]) then {
				if (draga_loglevel > 0) then {
					diag_log format ["draga_fnc_initGroup.sqf %1 _Helicopter GETOUT", _grp ];
				};
				if ((_leaderPos distance waypointPosition _wp < 400) or _grp_wp_completed) then {
					if (isNil {_grp getVariable "GETOUT"}) then {
						_grp setVariable ["GETOUT",true];
						_grp call {
							private ["_units","_vehicles"];
							_units = units _this;
							_vehicles = [];
							{
								private ["_veh"];
								_veh = vehicle _x;
								if(_veh != _x)then{
									if!(_veh in _vehicles)then{
										_vehicles set [count _vehicles, _veh];
									};
								};
							}forEach _units;

							{
								private["_veh"];
								_veh = _x;
								{
									_x leaveVehicle _veh;
								}forEach crew _veh;
							}forEach _vehicles;
							while {(count (waypoints _this)) > 0} do {
								deleteWaypoint ((waypoints _this) select 0);
							};
							_this setVariable ["GETOUT",nil];
						};
					};
				};
			};
		};

		if (_Plane) then {
			if (_typeWP in ["UNLOAD","GETOUT"]) then {
				if ((_leaderPos distance waypointPosition _wp < 1000) or _grp_wp_completed) then {
					if (isNil {_grp getVariable "UNLOAD"}) then {
						_grp setVariable ["UNLOAD",true];
						_grp call {
							private ["_units","_vehicles"];
							_units = units _this;
							_vehicles = [];
							{
								private ["_veh"];
								_veh = vehicle _x;
								if(_veh != _x)then{
									if!(_veh in _vehicles)then{
										_vehicles set [count _vehicles, _veh];
									};
								};
							}forEach _units;

							{
								private["_veh"];
								_veh = _x;
								{
									_x action ["Eject", _veh];
									_x leaveVehicle _veh;
									sleep 0.5;
								}forEach assignedCargo _veh;
							}forEach _vehicles;

							while {(count (waypoints _this)) > 0} do {
								deleteWaypoint ((waypoints _this) select 0);
							};

							{
								_x land "NONE";
								_x action ["cancelLand", _x];
							}forEach _vehicles;

							_this setVariable ["UNLOAD",nil];
						};
					};
				};
			};
		};

		if (_Ship) then {
		  if (_typeWP in ["UNLOAD"]) then {
			if ((_leaderPos distance waypointPosition _wp < 400) or _grp_wp_completed) then {
			  if (isNil {_grp getVariable "UNLOAD"}) then {
				_grp setVariable ["UNLOAD",true];
				_grp call {
				  private ["_units","_vehicles"];
					_units = units _this;
					_vehicles = [];
					{
						private ["_veh"];
						_veh = vehicle _x;
						if(_veh != _x)then{
							if!(_veh in _vehicles)then{
								_vehicles set [count _vehicles, _veh];
							};
						};
					}forEach _units;

				  {
							private["_veh"];
							_veh = _x;
							{
								_x leaveVehicle _veh;
							}forEach assignedCargo _veh;
						}forEach _vehicles;
				  {
					private["_veh"];
							_veh = _x;
					while {({alive _x} count _units > 0) && !isNull _this && ({alive _x} count (crew _veh)-_units > 0)} do {
						sleep 1;
					};
				  }forEach _vehicles;
				  sleep 5;
				  while {(count (waypoints _this)) > 0} do {
							deleteWaypoint ((waypoints _this) select 0);
						};
				  _this setVariable ["UNLOAD",nil];
				};
			  };
			};
		  };
		  if (_typeWP in ["GETOUT"]) then {
			if ((_leaderPos distance waypointPosition _wp < 400) or _grp_wp_completed) then {
			  if (isNil {_grp getVariable "GETOUT"}) then {
				_grp setVariable ["GETOUT",true];
				_grp call {
				  private ["_units","_vehicles"];
					_units = units _this;
					_vehicles = [];
					{
						private ["_veh"];
						_veh = vehicle _x;
						if(_veh != _x)then{
							if!(_veh in _vehicles)then{
								_vehicles set [count _vehicles, _veh];
							};
						};
					}forEach _units;

				  {
							private["_veh"];
							_veh = _x;
							{
								_x leaveVehicle _veh;
							}forEach crew _veh;
						}forEach _vehicles;
				  {
					private["_veh"];
							_veh = _x;
					while {({alive _x} count _units > 0) && !isNull _this && ({alive _x} count crew _veh > 0)} do {
						sleep 1;
					};
				  }forEach _vehicles;
				  sleep 5;
				  while {(count (waypoints _this)) > 0} do {
							deleteWaypoint ((waypoints _this) select 0);
						};
				  _this setVariable ["GETOUT",nil];
				};
			  };
			};
		  };
		};

		if (true) then {
			private["_grp","_leader"];
			_grp = _this;
			_leader = leader _grp;

			private["_grp_wp_completed"];
			_grp_wp_completed = !isNil {_grp getVariable "_grp_wp_completed"};

			// время создания группы
			private["_time"];
			_time = (_grp getVariable "grp_created_time");
			if ( isNil "_time" ) then {
				_time = time;
				_grp setVariable ["grp_created_time", _time];
				if (draga_loglevel > 0) then {
					diag_log format ["draga_fnc_initGroup.sqf %1 grp_created_time %2", _grp, _time ];
				};
			};

			private["_currentWP","_waypoints","_createWP","_leaderPos"];
			_currentWP = currentWaypoint _grp;
			_waypoints = waypoints _grp;
			_createWP = false;
			_leaderPos = getPos vehicle _leader;

			if (!_grp_wp_completed) then {
				if([waypointPosition [_grp,_currentWP], _leaderPos] call BIS_fnc_distance2D < 15 )then{
					_grp_wp_completed = true;
					if (draga_loglevel > 0) then {
						diag_log format ["draga_fnc_initGroup.sqf %1 _grp_wp_completed = true", _grp ];
					};
				};
			};

			if(isPlayer _leader)then{
				if ( count waypoints _grp > 0 ) then{
					[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
					sleep 1;
					for "_i" from count waypoints _grp - 1 to 0 step -1 do {
						deleteWaypoint [_grp, _i];
					};
				};
				if (draga_loglevel > 0) then {
					diag_log format ["draga_fnc_initGroup.sqf %1 isPlayer _leader deleteWaypoints", _grp ];
				};
			}else{
				// private ["_units","_vehicles","_types"]; // повторяется?
				// _units = units _grp; // повторяется?
				// _vehicles = []; // повторяется?
				// _types = []; // повторяется?

				// _cargo нужен для ["GET OUT","GET IN"]
				// private ["_cargo"];
				// _cargo = [];
				// {
					// _types set [count _types, typeOf _x];
					// private ["_veh"];
					// _veh = vehicle _x;
					// if(_veh != _x)then{
						// if!(_veh in _vehicles)then{
							// _vehicles set [count _vehicles, _veh];
							// _types set [count _types, typeOf _veh];
							// _cargo = _cargo + assignedCargo _veh;
						// };
					// };
				// }forEach _units;
				// private ["_heli"];
				// _heli = ([_types, ["Helicopter"]] call m_fnc_CheckIsKindOfArray);

				if(!isNil {_grp getVariable "grp_created"})then{
					if (draga_loglevel > 0) then {
						diag_log format ["draga_fnc_initGroup.sqf %1  группа готова", _grp ];
					};
					// _grp call draga_fnc_arty;
					private["_cleanup"];
					_cleanup = _grp getVariable "_cleanup";
					if(isNil "_cleanup")then{
						if(_Helicopter)then{
							_cleanup = [getPos vehicle _leader,time+10,time+120,waypointPosition [_grp,_currentWP]]; // инит
						}else{
							_cleanup = [getPos vehicle _leader,time+30,time+120,waypointPosition [_grp,_currentWP]]; // инит
						};
						_grp setVariable ["_cleanup",_cleanup];
						if (draga_loglevel > 0) then {
							diag_log format ["draga_fnc_initGroup.sqf %1 _cleanup init %2", _grp, _cleanup ];
						};
					}else{
						private["_oldPos","_oldTime","_oldTime2","_oldPosWP"];
						_oldPos = _cleanup select 0;
						_oldTime = _cleanup select 1;
						_oldTime2 = _cleanup select 2;
						_oldPosWP = _cleanup select 3;
						private["_pos"];
						_pos = getPos vehicle _leader;
						if([waypointPosition [_grp,_currentWP], _oldPosWP] call BIS_fnc_distance2D < 5 )then{ // если маршрут не менялся
							if (draga_loglevel > 0) then {
								diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся", _grp ];
							};
							if(waypointType [_grp, _currentWP] in ["SUPPORT"])then{ // поддержка
								_oldTime = _oldTime max time+30;
								_oldTime2 = _oldTime2 max time+120;
								_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								if (draga_loglevel > 0) then {
									diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, поддержка, местоположение перезаписано, таймер 30 120", _grp ];
								};
							};
							if(currentCommand _leader == "FIRE AT POSITION")then{ // артиллерия
								_oldTime = _oldTime max time+30;
								_oldTime2 = _oldTime2 max time+120;
								_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								if (draga_loglevel > 0) then {
									diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, артиллерия, местоположение перезаписано, таймер 30 120", _grp ];
								};
							};
							if({currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]} count _units > 0 )then{ // ATTACK
								_oldTime = _oldTime max time+30;
								_oldTime2 = _oldTime2 max time+60;
								_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								if (draga_loglevel > 0) then {
									diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, атакует, местоположение перезаписано, таймер 30 60", _grp ];
								};
							};
							if({currentCommand _x in ["GET OUT","GET IN"]} count _cargo+_units > 0 )then{ // GET OUT
								_oldTime = _oldTime max time+20;
								_oldTime2 = _oldTime2 max time+40;
								_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								if (draga_loglevel > 0) then {
									diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, входвыход с транспортом, местоположение перезаписано, таймер 20 40", _grp ];
								};
							};

							if(_oldTime < time)then{ // 1 таймер
								if (draga_loglevel > 0) then {
									diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, 1 таймер сработал", _grp ];
								};
								if(_oldPos distance _pos >= 5)then{ // сдвинулись
									if (draga_loglevel > 0) then {
										diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, группа сдвинулась когда 1 таймер работал", _grp ];
									};
									if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{ // на точке
										_oldTime = _oldTime max time+120;
										_oldTime2 = _oldTime2 max time+240;
										_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];// 1 и 2 таймер обновление
										_grp setVariable ["_cleanup",_cleanup];
										if (draga_loglevel > 0) then {
											diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, группа на точке, местоположение перезаписано, таймер 120 240", _grp ];
										};
									}else{
										_oldTime = _oldTime max time+30;
										_oldTime2 = _oldTime2 max time+120;
										_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];// 1 и 2 таймер обновление
										_grp setVariable ["_cleanup",_cleanup];
										if (draga_loglevel > 0) then {
											diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, группа не на точке, местоположение перезаписано, таймер 30 120", _grp ];
										};
									};
								}else{
									if (draga_loglevel > 0) then {
										diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, группа не сдвинулась когда 1 таймер работал, удаляю маршруты, пересоздадутся", _grp ];
									};
									while {(count (waypoints _grp)) > 0} do // не сдвинулись
									{
										deleteWaypoint ((waypoints _grp) select 0); // для создание другого маршрута
									};
									if(_Helicopter)then{
										_oldTime = _oldTime max time+10;
										_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]]; // 1 таймер обновление
										_grp setVariable ["_cleanup",_cleanup];
										if (draga_loglevel > 0) then {
											diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, _Helicopter, группа не сдвинулась когда 1 таймер работал, местоположение перезаписано, таймер 10 --", _grp ];
										};
									}else{
										if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{ // на точке
											_oldTime = _oldTime max time+120;
											_oldTime2 = _oldTime2 max time+240;
											_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]]; // 1 таймер обновление
											_grp setVariable ["_cleanup",_cleanup];
											if (draga_loglevel > 0) then {
												diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, группа на точке, группа не сдвинулась когда 1 таймер работал, местоположение перезаписано, таймер 120 240", _grp ];
											};
										}else{
											_oldTime = _oldTime max time+30;
											_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]]; // 1 таймер обновление
											_grp setVariable ["_cleanup",_cleanup];
											if (draga_loglevel > 0) then {
												diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, группа не на точке, группа не сдвинулась когда 1 таймер работал, местоположение перезаписано, таймер +30 --", _grp ];
											};
										};
									};
								};
							};

							if(_oldTime2 < time)then{ // 2 таймер
								{_x setVariable ["time", 0]}forEach units _grp; // на удаление
								if (draga_loglevel > 0) then {
									diag_log format ["draga_fnc_initGroup.sqf %1  маршрут не менялся, 2 таймер сработал, в очередь на удаление", _grp ];
								};
							};
						}else{ // если маршрут изменился
							_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]]; // обновление позиции
							_grp setVariable ["_cleanup",_cleanup];
							if (draga_loglevel > 0) then {
								diag_log format ["draga_fnc_initGroup.sqf %1  маршрут изменился, местоположение перезаписано", _grp ];
							};
						};
					};

					if(count waypoints _grp == 0)then{
						if (draga_loglevel > 0) then {
							diag_log format ["draga_fnc_initGroup.sqf %1  нет маршрута", _grp ];
						};

						private["_timeNoWP"];
						_timeNoWP = (_grp getVariable "_timeNoWP");
						if(isNil "_timeNoWP")then{
							_timeNoWP = time;
							_grp setVariable ["_timeNoWP", _timeNoWP];
						}else{
							if ( time > (_timeNoWP + 5) ) then {
								if (draga_loglevel > 0) then {
									diag_log format ["draga_fnc_initGroup.sqf %1 добавлена в очередь на создание маршрута", _grp, currentCommand _leader ];
								};
								_createWP = true;
								_grp setVariable ["_timeNoWP", nil];
							};
						};

					}else{
						_grp setVariable ["_timeNoWP", nil];
					};
				}else{
					if (draga_loglevel > 0) then {
						diag_log format ["draga_fnc_initGroup.sqf %1  группа не готова", _grp ];
					};
					if ( _time + 30 < time )then {
						_grp setVariable ["grp_created",true];
					};
				};

				private["_NoCreateWP"];
				_NoCreateWP = false;

				if ((vehicle _leader distance civilianBasePos) <= sizeLocation or true) then {
					// боты остаются на месте
					if( { currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] } count units _grp > 0 )then{
						_NoCreateWP = true;
					};
				};


				// остановить без маршрута
				if( _NoCreateWP )then{
					if ( count waypoints _grp > 0 ) then{
						if (draga_loglevel > 0) then {
							diag_log format ["draga_fnc_initGroup.sqf %1 currentCommand leader %2, count waypoints %3, stopping", _grp, currentCommand _leader, count waypoints _grp ];
						};
						[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
						// [_grp, currentWaypoint _grp] setWaypointType "HOLD";
						sleep 1;
						// sleep 0.1;
						for "_i" from count waypoints _grp - 1 to 0 step -1 do {
							deleteWaypoint [_grp, _i];
						};
					};
				};

				private["_draga_UAV_WaypointPosCenter"];
				_draga_UAV_WaypointPosCenter = _grp getVariable "_draga_UAV_WaypointPosCenter";

				if(!isNil{_draga_UAV_WaypointPosCenter})then{
					_NoCreateWP = true;
				};


				// создать маршрут
				if( !_NoCreateWP )then{
					if(_createWP or _grp_wp_completed)then{
						_grp setVariable ['_grp_wp_completed',nil];
						while {(count (waypoints _grp)) > 0} do {
							deleteWaypoint ((waypoints _grp) select 0);
						};
						[_leader] call m_fnc_waypoints;
						if (draga_loglevel > 0) then {
							diag_log format ["draga_fnc_initGroup.sqf %1  создание маршрута", _grp ];
						};
					};
				};

				private["_wp"];
				_wp = [_grp,_currentWP];
				private["_wpStatements"];
				_wpStatements = "if(!isNil {this})then{group this setVariable ['_grp_wp_completed',true]}";
				if!(waypointStatements _wp select 1 in [_wpStatements,"vehicle this land 'GET IN'","vehicle this land 'GET OUT'","vehicle this land 'LAND'","this land 'GET IN'","this land 'GET OUT'","this land 'LAND'"])then{
					if (draga_loglevel > 0) then {
						diag_log format ["draga_fnc_initGroup.sqf %1 _wpStatements %2", _grp, _wpStatements ];
					};
					_wp setWaypointStatements ["true", _wpStatements];
				};
			};
		};

		if (true) then {
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

			if(_Car)then{
				_Behaviour = "SAFE";
			};

			if ((vehicle _leader distance civilianBasePos) <= sizeLocation) then {
				_Behaviour = "COMBAT";
			};

			if (_Tank) then {
				_Behaviour = "COMBAT";
			};

			if(_Air)then{
				_Behaviour = "COMBAT";
			};

			private ["_Stealth","_StealthTypes"];
			_Stealth = false;
			_StealthTypes = [
				"GUE_Soldier_Sniper","GUE_Soldier_Scout",
				"INS_Soldier_Sniper","Ins_Soldier_Sab",
				"CDF_Soldier_Sniper","CDF_Soldier_Spotter",
				"USMC_SoldierS_Sniper","USMC_SoldierS_Spotter","USMC_SoldierS_SniperH",
				"RU_Soldier_Sniper","RU_Soldier_Spotter","RU_Soldier_SniperH",
				"BAF_Soldier_Sniper_MTP","BAF_Soldier_SniperH_MTP","BAF_Soldier_spotter_MTP","BAF_Soldier_SniperN_MTP",
				"BAF_Soldier_Sniper_W","BAF_Soldier_SniperH_W","BAF_Soldier_spotter_W","BAF_Soldier_spotterN_W",
				"US_Soldier_Sniper_EP1","US_Soldier_Spotter_EP1",
				"TK_INS_Soldier_Sniper_EP1",
				"TK_Soldier_SniperH_EP1","TK_Soldier_Spotter_EP1",
				"TK_GUE_Soldier_Sniper_EP1"
			];
			private ["_countStealth"];
			_countStealth = 0;
			{
				if (_x in _StealthTypes) then {
					_countStealth = _countStealth +1;
				};
			} forEach _types;
			if (_countStealth > (count _types / 2)) then {
				_Behaviour = "STEALTH";
			};

			if(_uav)then{
				_SpeedMode = "LIMITED";
				_CombatMode = "BLUE";
				_Behaviour = "CARELESS";
			};

			if(_Air)then{
				if(_currentWaypointType in ["UNLOAD","GETOUT","GETIN"] or count _cargo > 0)then{
					_CombatMode = "GREEN";
					_Behaviour = "AWARE";
					_SpeedMode = "FULL";
				};
			};

			if(!_Air)then{
				if(_Behaviour in ["COMBAT","STEALTH"])then{
					if !([_leader, 800] call m_fnc_CheckPlayersDistance) then {
						_Behaviour = "AWARE";
					};
				};
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

};
