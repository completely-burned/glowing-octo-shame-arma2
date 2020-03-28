private["_grp"];
private["_leader"];
private["_leaderPos"];
private["_currentWP","_wp","_typeWP"];
private ["_units","_vehicles","_types","_cargo","_assignedVehicles"];
private["_Submarine"];
private ["_Helicopter"];
private ["_Plane"];
private ["_Ship"];
private ["_StaticWeapon"];
private ["_Air","_uav","_Car","_Tank"];
private["_AA"];
private["_support"];
// private ["_Stealth"];
private["_grp_wp_completed"];

_grp=_this;

private ["_waitUntilTimeCreate"];
_waitUntilTimeCreate = time + 15;

waitUntil{(isNull _this) or (time > _waitUntilTimeCreate) or ({alive _x} count units _this > 0)};

while{!isNull _this && {alive _x} count units _this > 0}do{

	scopeName "main";

	sleep 10 + random 10;

	_grp_wp_completed = nil;
	_grp_wp_completed = _grp getVariable "_grp_wp_completed";

	if (true) then {

		_leader = leader _grp;

		_leaderPos = getPos vehicle _leader;

		_currentWP = currentWaypoint _grp;
		_wp = [_grp,_currentWP];
		_typeWP = waypointType _wp;

		_units = units _grp;
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

		_AA = ([_vehicles, ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1"]] call m_fnc_CheckIsKindOfArray);

		_support = false;
		ScopeName "_true1";
		{
			if(getNumber(LIB_cfgVeh >> typeOf _x >> "attendant")> 0 && _x isKindOf "LandVehicle")then{
				_support = true;
				BreakTo "_true1";
			};
			if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportfuel")> 0)then{
				_support = true;
				BreakTo "_true1";
			};
			if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportammo")> 0)then{
				_support = true;
				BreakTo "_true1";
			};
			if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportrepair")> 0)then{
				_support = true;
				BreakTo "_true1";
			};

		}forEach _assignedVehicles;
		if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
			if({count assignedVehicleRole _x > 0} count _units > 0)then{
				_support = true;
			};
		};

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
			if ((_leaderPos distance waypointPosition _wp < 400) or !isNil{_grp_wp_completed}) then {
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
				if ((_leaderPos distance waypointPosition _wp < 1000) or !isNil{_grp_wp_completed}) then {
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
				if ((_leaderPos distance waypointPosition _wp < 400) or !isNil{_grp_wp_completed}) then {
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
				if ((_leaderPos distance waypointPosition _wp < 1000) or !isNil{_grp_wp_completed}) then {
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
			if ((_leaderPos distance waypointPosition _wp < 400) or !isNil{_grp_wp_completed}) then {
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
			if ((_leaderPos distance waypointPosition _wp < 400) or !isNil{_grp_wp_completed}) then {
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

			if (isNil{_grp_wp_completed}) then {
				if([waypointPosition [_grp,_currentWP], _leaderPos] call BIS_fnc_distance2D < 15 )then{
					_grp_wp_completed = time;
					if (draga_loglevel > 0) then {
						diag_log format ["draga_fnc_initGroup.sqf %1 _grp_wp_completed = time", _grp ];
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
				private["_DeleteWP"];
				_DeleteWP = true;

				if ((vehicle _leader distance civilianBasePos) <= sizeLocation or true) then {
					// боты остаются на месте
					if( { currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] } count units _grp > 0 )then{
						_NoCreateWP = true;
					};
				};

				if (_AA) then {

					private["_friendCount","_nearVehList"];

					_friendCount = 0;

					_nearVehList = _leaderPos nearEntities [["Land"],400];

					{
							if (side _grp getFriend side _x >= 0.6) then {
								if ([_vehicles, ["Tank","Wheeled_APC"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call m_fnc_CheckIsKindOfArray) then {
									_friendCount = _friendCount + 3;
								};
								if ([_vehicles, ["LandVehicle"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call m_fnc_CheckIsKindOfArray) then {
									_friendCount = _friendCount + 1;
								};
								if ([_vehicles, ["Land"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call m_fnc_CheckIsKindOfArray) then {
									_friendCount = _friendCount + 0.1;
								};
							};
					} forEach _nearVehList;

					if (_friendCount >= 3) then {
						_NoCreateWP = true;
					};

				};

				if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
					if({count assignedVehicleRole _x > 0} count _units > 0)then{
						_DeleteWP = false;
					};
				};

				if(_support)then{
					if(waypointType [_grp, currentwaypoint _grp] != "SUPPORT")then{
						_DeleteWP = true;
						_NoCreateWP = false;
						_createWP = true;
					};
				};

				// остановить без маршрута
				if( _NoCreateWP && _DeleteWP)then{
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
				if( !_NoCreateWP && _DeleteWP)then{
					if(_createWP or !isNil{_grp_wp_completed})then{
						_grp setVariable ['_grp_wp_completed',nil];
						_grp setVariable ["draga_grp_wp_sleep", nil];
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
				_wpStatements = "if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}";
				if!(waypointStatements _wp select 1 in [_wpStatements,"vehicle this land 'GET IN'","vehicle this land 'GET OUT'","vehicle this land 'LAND'","this land 'GET IN'","this land 'GET OUT'","this land 'LAND'"])then{
					if (draga_loglevel > 0) then {
						diag_log format ["draga_fnc_initGroup.sqf %1 _wpStatements %2", _grp, _wpStatements ];
					};
					_wp setWaypointStatements ["true", _wpStatements];
				};
			};
		};

		// лидер двигается ближе к атакующим юнитам
		if (_leader == Vehicle _leader) then {

			private["_follow"];

			scopeName "_follow";

			if (true) then {

				// лидер двигаться в сторону атакующего юнита отряда
				{
					if (currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] && vehicle _x == _x ) then {
						_follow = _x;
						breakTo "_follow";
					};
				} forEach _units-[_leader];

				// лидер двигаться в сторону атакующей техники отряда
				{
					if (currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]) then {
						_follow = _x;
						breakTo "_follow";
					};
				} forEach _vehicles;

				// лидер двигаться в сторону техники отряда
				if (count _vehicles > 0 && !(behaviour _leader in ["SAFE", "CARELESS", "AWARE"])) then {
					_follow = _vehicles select 0;
				};
			};

			// движение лидера
			if (!isNil{_follow}) then {
				if (_leader Distance _follow > 25) then {
					Private["_position","_position1"];
					_position = GetPos _leader;
					_position1 = GetPos _follow;
					_position = [((_position Select 0) + (_position1 Select 0)) / 2,((_position Select 1) + (_position1 Select 1)) / 2];
					// _grp Move _position;
					_leader doMove _position;
				};
			};
		};

		private["_getOut","_allowGetin","_assignedVehicle"];
		_getOut=[];
		if (true) then {
		// if (count _assignedVehicles > 0) then {
			{
				_assignedVehicle = assignedVehicle _x;
				_allowGetin=true;
				if(!isNull _x)then{
					if(!isNull _assignedVehicle)then{
						private ["_VehicleRole"];
						_VehicleRole = assignedVehicleRole _x;

						// в бою
						if(_allowGetin)then{
							if((behaviour _x == "COMBAT" ) or ( currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]))then{
								if(count _VehicleRole > 0)then{
									if(_VehicleRole select 0 == "Cargo")then{
										_allowGetin=false;
									};
									if(_VehicleRole select 0 == "Turret")then{
										if(_assignedVehicle isKindOf "BMP3")then{
											if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1,2])then{
												_allowGetin=false;
											};
										};
									};
								};
							};
						};

						// на месте
						if(_allowGetin && true)then{
							if(((civilianBasePos distance vehicle _x)<(1000 max sizeLocation))or ((civilianBasePos distance _assignedVehicle)<(1000 max sizeLocation)))then{
								private ["_enableAttack"];
								_enableAttack = true;

								// транспорт без вооружения
								if(_enableAttack)then{
									if(getNumber(LIB_cfgWea >> currentWeapon _assignedVehicle >> "enableAttack")==0)then{
										_enableAttack = false;
									};
								};

								// транспорт без вооружения 2
								if!(_enableAttack)then{
									if([[_assignedVehicle], ["M1128_MGS_EP1", "Pandur2_ACR"]] call m_fnc_CheckIsKindOfArray)then{
										_enableAttack = true;
									};
								};

								// не авиация
								if!(_enableAttack)then{
									if!(_assignedVehicle isKindOf "Air")then{
										_allowGetin=false;
									};
								};

								// техника с вооружением
								if(_enableAttack)then{
									if(count _VehicleRole > 0)then{
										if(_VehicleRole select 0 == "Cargo")then{
											_allowGetin=false;
										};
										if(_VehicleRole select 0 == "Turret")then{
											if(_assignedVehicle isKindOf "BMP3")then{
												if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1,2])then{
													_allowGetin=false;
												};
											};
										};
									};
								};
							};
						};

						// расстояние до транспорта
						if(_allowGetin)then{
							if(_assignedVehicle != vehicle _x)then{
								if((_assignedVehicle distance vehicle _x)>1000)then{
									_allowGetin=false;
								};
							};
						};

						// без стрелка
						if(_allowGetin)then{
							if(_assignedVehicle isKindOf "LandVehicle")then{
								if!([_assignedVehicle, false] call draga_fnc_CheckTurretAlive)then{
									_allowGetin=false;
								};
							}
						};

						// авиация
						if!(_allowGetin)then{
							if(_assignedVehicle isKindOf "Air")then{
								_allowGetin=true;
							};
						};
						if(_allowGetin)then{
							if(_assignedVehicle isKindOf "Helicopter")then{
								if(_x == vehicle _x)then{
									if((_assignedVehicle distance vehicle _x)>50)then{
										_allowGetin=false;
									};
								};
							};
						};
						// самолеты
						if(toLower getText(configFile >> "CfgVehicles" >> typeOf _assignedVehicle >> "simulation") == "airplane")then{
							// юнит вне самолета
							if(_x == vehicle _x)then{
								_allowGetin=false;
							};
							// юнит в самолете
							if(_assignedVehicle == vehicle _x)then{
								_allowGetin=true;
							};
						};

						// корабль
						if!(_allowGetin)then{
							if(_assignedVehicle isKindOf "Ship")then{
								_allowGetin=true;
							};
						};

						// грузовик поддержки
						if!(_allowGetin)then{
							if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
								_allowGetin=true;
							};
						};

						// неподвижное
						if!(_allowGetin)then{
							if(_assignedVehicle isKindOf "StaticWeapon")then{
								_allowGetin=true;
							};
						};

						// игрок
						if (isPlayer _x) then {
							if (vehicle _x == _x) then {
								// _allowGetin=false;
							}else{
								_allowGetin=true;
							};
						};

					}; // isNull _assignedVehicle

					if!(_allowGetin)then{
						_getOut set [count _getOut, _x];
					};

				}; // isNull _x

			} forEach _units;

			_getOut allowGetin false;

			_units - _getOut allowGetin true;

		}; // count _vehicles

		if (!isPlayer _leader) then {
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

			if(_Car && vehicle _leader != _leader)then{
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

			if(_currentWaypointType in ["SUPPORT"])then{
				_CombatMode = "GREEN";
				_Behaviour = "SAFE";
				_SpeedMode = "FULL";
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
