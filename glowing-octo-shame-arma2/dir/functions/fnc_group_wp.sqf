// эта функция отвечает за создание маршрутных точек для ии

private["_grp","_leader","_leaderPos","_currentWP","_wp","_typeWP","_units","_vehicles","_types","_cargo","_assignedVehicles","_Submarine","_Helicopter","_Plane","_Ship","_StaticWeapon","_Air","_uav","_Car","_Tank","_Tracked_APC","_Wheeled_APC","_AA","_support","_grp_wp_completed"];

_grp=_this;

scopeName "main";

// переменная _grp_wp_completed устанавливается при достижении группой маршрутной точки
_grp_wp_completed = _grp getVariable "_grp_wp_completed";

_units = units _grp;
	// слишком часто diag_log format ["Log: [gosa_fnc_group_wp.sqf] units %1", _units];

// выполнять только есть в группе есть юниты
if({alive _x} count _units > 0)then{

	// удалить [0,0], маршрутная точка на неправильной позиции
	for "_i" from count waypoints _grp - 1 to 0 step -1 do {
		if([waypointPosition [_grp, _i], [0,0]] call BIS_fnc_distance2D < 1 )then{
				diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1  позиция wp [0,0] удаление", _grp ];
			deleteWaypoint [_grp, _i];
		};
	};


	_leader = leader _grp;

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

		if (isNull _assignedVehicle) then {
			_assignedVehicle = _x getVariable "assignedVehicle";
		};
		if (isNil {_assignedVehicle}) then {_assignedVehicle = objNull};

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

	// транспортный вертолет вызываемый игроками, отличается поведением и генерирует маршруты в другом скрипте, пропускаем его
	if( ({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_IN_pos"}} count [_grp] + _vehicles > 0 ) or ({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_OUT_pos"}} count [_grp] + _vehicles > 0 ))then{
		breakTo "main";
			diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 breakTo main, transport", _grp ];
	};

	// узнаем тип отряда для типа маршрута
	if({toLower getText(LIB_cfgVeh >> _x >> "vehicleClass") == "submarine"} count _types > 0)then{_Submarine = true}else{_Submarine = false};
	_Helicopter = ([_vehicles, ["Helicopter"]] call gosa_fnc_CheckIsKindOfArray);
	_Plane = ([_vehicles, ["Plane"]] call gosa_fnc_CheckIsKindOfArray);
	_Ship = ([_vehicles, ["Ship"]] call gosa_fnc_CheckIsKindOfArray);
	_StaticWeapon = ([_vehicles, ["StaticWeapon"]] call gosa_fnc_CheckIsKindOfArray);
	_Air = ([_vehicles, ["Air"]] call gosa_fnc_CheckIsKindOfArray);
	_Tank = ([_vehicles, ["Tank"]] call gosa_fnc_CheckIsKindOfArray);
	_Car = ([_vehicles, ["Car"]] call gosa_fnc_CheckIsKindOfArray);
	_Tracked_APC = ([_vehicles, ["Tracked_APC"]] call gosa_fnc_CheckIsKindOfArray);
	_Wheeled_APC = ([_vehicles, ["Wheeled_APC"]] call gosa_fnc_CheckIsKindOfArray);
	_uav = ([_types, ["UAV"]] call gosa_fnc_CheckIsKindOfArray);
	if({getNumber (LIB_cfgVeh >> _x >> "isUav") == 1} count _types > 0)then{
		_uav = true;
	};
	_AA = ([_vehicles, ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1"]] call gosa_fnc_CheckIsKindOfArray);
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
	}forEach _vehicles+_assignedVehicles;
	if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
		if({count assignedVehicleRole _x > 0} count _units > 0)then{
			_support = true;
		};
	};

	// удалить неподвижным ии маршруты, чтобы не убегали
	if (_StaticWeapon) then {
		if ( count waypoints _grp > 0 ) then{
			[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
			sleep 1;
			for "_i" from count waypoints _grp - 1 to 0 step -1 do {
				deleteWaypoint [_grp, _i];
			};
		};
	};

	// десант вертолетный
	if (_Helicopter) then {
		if (_typeWP in ["UNLOAD"]) then {
				diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 _Helicopter UNLOAD", _grp ];

			// начать выгрузку за 1000 метров до цели, мне было лень делать точную и безопасную модель поиска позиции для десанта
			if ((_leaderPos distance waypointPosition _wp < 1000) or !isNil{_grp_wp_completed}) then {
				// переменная UNLOAD утанавливается на процесс выгрузки, для предотвращения повторного запуска
				if (isNil {_grp getVariable "UNLOAD"}) then {
					_grp setVariable ["UNLOAD",true];
					_grp spawn {
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

						// отвязываем вертолет от десанта, чтобы он не лез в него обратно
						{
							private["_veh"];
							_veh = _x;
							{
								if(group _x != _this)then{
									// _x leaveVehicle _veh;
									unassignVehicle _x;
								};
							}forEach crew _veh;
						}forEach _vehicles;

						// удаляем маршруты для генерации новых
						for "_i" from count waypoints _this - 1 to 0 step -1 do {
							deleteWaypoint [_this, _i];
						};

						_this setVariable ["UNLOAD",nil];
					};
				};
			};
		};

		// тоже самое только для маршрута типа "GETOUT"
		if (_typeWP in ["GETOUT"]) then {
				diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 _Helicopter GETOUT", _grp ];

			// расстояние другое т.к. этот тип маршрута создает HQ игрок и ин должен быть более точным
			// начать выгрузку за 400 метров до цели, мне было лень делать точную и безопасную модель поиска позиции для десанта
			if ((_leaderPos distance waypointPosition _wp < 400) or !isNil{_grp_wp_completed}) then {
				if (isNil {_grp getVariable "GETOUT"}) then {
					_grp setVariable ["GETOUT",true];
					_grp spawn {
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

						// отвязываем вертолет от десанта, чтобы он не лез в него обратно
						{
							private["_veh"];
							_veh = _x;
							{
								// _x leaveVehicle _veh;
								unassignVehicle _x;
							}forEach crew _veh;
						}forEach _vehicles;

						// удаляем маршруты для генерации новых
						for "_i" from count waypoints _this - 1 to 0 step -1 do {
							deleteWaypoint [_this, _i];
						};

						_this setVariable ["GETOUT",nil];
					};
				};
			};
		};
	};

	// десант самолета
	if (_Plane) then {
		if (_typeWP in ["UNLOAD","GETOUT"]) then {
			if ((_leaderPos distance waypointPosition _wp < 1000) or !isNil{_grp_wp_completed}) then {
				if (isNil {_grp getVariable "UNLOAD"}) then {
					_grp setVariable ["UNLOAD",true];
					_grp spawn {

						// get _vehicles
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


						if(true)then{

							// группы для выпрыгивания
							private ["_grps"];
							_grps = [];
							{
								private["_veh"];
								_veh = _x;
								{
									if(group _x != group _veh)then{
										_grps set [count _grps, group _x];
									};
								} forEach assignedCargo _veh;
							} forEach _vehicles;

							{
								// юниты для выпрыгивания в нужном порядке
								private["_grp","_leader","_units"];
								_grp = _x;
								_leader = leader _grp;
								_units = units _grp -[_leader]; // сомнения в -[]
								_units = [_units, [_leader], count _units / 2] call BIS_fnc_arrayInsert; // командир в центр

								// выпрыгивание
								{
									// выполнять десантирование только из самолета и главное не десантироваться из парашюта, иначе смерть от удара об землю
									if(vehicle _x isKindOf "Plane" && !(vehicle _x isKindOf "ParachuteBase"))then{
										_x action ["Eject", vehicle _x];
										// _x leaveVehicle assignedVehicle _x;
										sleep 0.5; // нужно учитывать скорость
										unassignVehicle _x; // отвязка от самолета, чтобы не лезть в него обратно
									};
								} forEach _units;
							} forEach _grps;
						};

						// удаление маршрута, для новой генерации
						for "_i" from count waypoints _this - 1 to 0 step -1 do {
							deleteWaypoint [_this, _i];
						};

						// самолет должен продолжить полет, отключить автопилот приземления, он включается при достижении маршрутной точки определенного типа
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

	// лодки
	if (_Ship) then {
	  if (_typeWP in ["UNLOAD"]) then {
		// не помню почему 400 метров, возможно на такой или меньшей дистанции лодка уже ищет береговую линию для десантирования
		if ((_leaderPos distance waypointPosition _wp < 400) or !isNil{_grp_wp_completed}) then {
		  if (isNil {_grp getVariable "UNLOAD"}) then {
			_grp setVariable ["UNLOAD",true];
			_grp spawn {
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
							// _x leaveVehicle _veh;
							unassignVehicle _x;
						}forEach assignedCargo _veh;
					}forEach _vehicles;
			  {
				private["_veh"];
						_veh = _x;

				// выполняется десантирование и пока живы юниты генерация нового маршрута должна быть приостановлена
				while {({alive _x} count _units > 0) && !isNull _this && ({alive _x} count (crew _veh)-_units > 0)} do {
					sleep 1;
				};
			  }forEach _vehicles;
			  sleep 5;
			  for "_i" from count waypoints _this - 1 to 0 step -1 do {
				  deleteWaypoint [_this, _i];
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
			_grp spawn {
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
							// _x leaveVehicle _veh;
							unassignVehicle _x;
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
			  for "_i" from count waypoints _this - 1 to 0 step -1 do {
				  deleteWaypoint [_this, _i];
			  };
			  _this setVariable ["GETOUT",nil];
			};
		  };
		};
	  };
	};

	if (true) then {
		private["_grp","_leader""_currentWP","_waypoints","_createWP","_leaderPos"];
		_grp = _this;
		_leader = leader _grp;

		_currentWP = currentWaypoint _grp;
		_waypoints = waypoints _grp;
		_createWP = false;
		_leaderPos = getPos vehicle _leader;

		// если отряд у цели установить переменную _grp_wp_completed если она не установлена
		if (isNil{_grp_wp_completed}) then {
			if([waypointPosition [_grp,_currentWP], _leaderPos] call BIS_fnc_distance2D < 5 )then{
				_grp_wp_completed = time;
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 _grp_wp_completed = time", _grp ];
			};
		};

		// если лидер отряда игрок удалить маршруты, чтобы не мешали
		if(_leader call gosa_fnc_isPlayer)then{
			if ( count waypoints _grp > 0 ) then{
				diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 isPlayer _leader deleteWaypoints", _grp ];
				[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
				sleep 0.1;
				for "_i" from count waypoints _grp - 1 to 0 step -1 do {
					deleteWaypoint [_grp, _i];
				};
			};
		}else{

			// выполнять только если группа готова // эта проверка должна быть в другом месте выше в скрипте?
			if(!isNil {_grp getVariable "grp_created"})then{
					// слишком часто diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1  группа готова", _grp ];

				if(count waypoints _grp == 0)then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1  нет маршрута", _grp ];

					private["_timeNoWP"];
					_timeNoWP = (_grp getVariable "_timeNoWP");
					if(isNil "_timeNoWP")then{
						_timeNoWP = time;
						_grp setVariable ["_timeNoWP", _timeNoWP];
					}else{
						if ( time > (_timeNoWP + 5) ) then {
								diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 добавлена в очередь на создание маршрута", _grp, currentCommand _leader ];
							_createWP = true;
							_grp setVariable ["_timeNoWP", nil];
						};
					};

				}else{
					_grp setVariable ["_timeNoWP", nil];
				};
			};

			private["_NoCreateWP"];
			_NoCreateWP = false; // не создавать
			private["_DeleteWP"];
			_DeleteWP = true; // удалить
			private["_StopWP"];
			_StopWP = false; // остановиться

			// остановить группу, удалить и не создавать маршрут если боты атакуют
			if ((vehicle _leader distance civilianBasePos) <= sizeLocation or true) then {
				if( { currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] } count units _grp > 0 )then{
					// боты остаются на месте
					_NoCreateWP = true;
					_StopWP = true;
					_DeleteWP = true;
				};
			};

			// ПВО
			if (_AA) then {

					diag_log format ["Log: [gosa_fnc_group_wp.sqf] [AA] %1", _this];

				// не нужно создавать маршрут функцией для пво
				_StopWP = false;
				_NoCreateWP = true;
				_DeleteWP = false;

				private["_friendList","_friendCount","_nearVehList","_friendList2","_pos"];

				_friendList2 = [];

				// наземные юниты находящиеся в зоне передвижения пво используемые для поиска подходящего маршрута
				_friendList = _leaderPos nearEntities [["Land"], 2000];

				// поиск подходящих маршрутов
				{
					if (!isNil {_x} && !isNull _x) then {
						// учитывать нужно союзников
						if (side _grp getFriend side _x >= 0.6) then {
							// союзные наземные юниты находящиеся рядом с предполагаемой позицией маршрута
							_nearVehList = _x nearEntities [["Land"],400];
							for "_i" from 0 to (count _nearVehList - 1) do {
								// подсчитывать нужно союзников
								if (side _grp getFriend side (_nearVehList select _i) >= 0.6) then {
									// затрагиваем только технику, боты вне техники не нуждается в особом подсчёте
									if (getNumber(configFile >> "CfgVehicles" >> typeOf (_nearVehList select _i) >> "isMan") != 1) then {
										// если командир техники живой
										if (alive effectiveCommander (_nearVehList select _i)) then {
											// нужно подчитывать людей в технике, добавляем их в список
											_nearVehList = _nearVehList+crew(_nearVehList select _i);
										}else{
											// в защите пво не нуждается техника без экипажа, на удаление ее из списка
											_nearVehList set [_i, -1];
										};
									};
								}else{
									_nearVehList set [_i, -1]; // не являются союзниками
								};
							};
							// удаляем из списка лишнее
							_nearVehList = (_nearVehList - [-1]);

							_friendCount = 0;
							if (side _grp getFriend side _x >= 0.6) then {
								if ([_nearVehList, ["Tank","Wheeled_APC"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call gosa_fnc_CheckIsKindOfArray) then {
									_friendCount = _friendCount + 2;
								};
								if ([_nearVehList, ["LandVehicle"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call gosa_fnc_CheckIsKindOfArray) then {
									_friendCount = _friendCount + 1;
								};
								if ([_nearVehList, ["Land"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call gosa_fnc_CheckIsKindOfArray) then {
									_friendCount = _friendCount + 0.25;
								};
								if (_friendCount >= 3) then {
									_friendList2 set [count _friendList2, _x];
								};
							};
						};
					};
				} forEach _friendList;
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] [AA] %1 маршруты подходят %2", _grp, _friendList2];

				if(count _friendList2 > 0)then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] [AA] %1 выбор маршрута", _grp];
					// выбор подходящего маршрута
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

					// установка маршрута на позицию
					private["_wp"];
					_wp = [_grp, currentWaypoint _grp]; // TODO: если маршрут отсутствует невозможно установить ему позицию
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] [AA] установка маршрута %1 на позицию %2", _wp, _pos];
					_wp setWaypointPosition [_pos, 50];
				}else{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] [AA] %1 выбор обычного маршрута", _grp];
					_NoCreateWP = false;
					_createWP = true;
				};

			};

			// грузовики поддержки
			if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
				if({count assignedVehicleRole _x > 0} count _units > 0)then{
					_DeleteWP = false;
					if(waypointAttachedVehicle [_grp, currentWaypoint _grp] != vehicle _leader)then{
						[_grp, currentWaypoint _grp] waypointAttachVehicle vehicle _leader;
					};
				};
			};
			if(_support)then{
				if(waypointType [_grp, currentwaypoint _grp] != "SUPPORT")then{
					_DeleteWP = true;
					_NoCreateWP = false;
					_createWP = true;
				};
			};
			if(!_support)then{
				if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
					_DeleteWP = true;
					_NoCreateWP = false;
					_createWP = true;
				};
			};

			// остановиться
			if(_StopWP or (_NoCreateWP && _DeleteWP))then{
				if ( count waypoints _grp > 0 ) then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] остановка группы %1, currentCommand leader %2, count waypoints %3", _grp, currentCommand _leader, count waypoints _grp ];
					[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
					// [_grp, currentWaypoint _grp] setWaypointType "HOLD";
					sleep 0.1;
				};
			};

			// удалить маршруты
			if( _NoCreateWP && _DeleteWP)then{
				if ( count waypoints _grp > 0 ) then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] удаление waypoints группы %1, currentCommand leader %2, count waypoints %3", _grp, currentCommand _leader, count waypoints _grp ];
					for "_i" from count waypoints _grp - 1 to 0 step -1 do {
						deleteWaypoint [_grp, _i];
					};
				};
			};

			// UAV не создавать маршрут
			private["_gosa_UAV_WaypointPosCenter"];
			_gosa_UAV_WaypointPosCenter = _grp getVariable "_gosa_UAV_WaypointPosCenter";
			if(!isNil{_gosa_UAV_WaypointPosCenter})then{
				_NoCreateWP = true; // не создавать
			};

			// остановить ботов на точке 2 минут
			if(!isNil{_grp_wp_completed})then{
				if(!_Air && (_grp_wp_completed + 120 < time))then{
					if ((vehicle _leader distance civilianBasePos) < sizeLocation) then {
						_DeleteWP = true; // удалить
						_NoCreateWP = true; // не создавать
						_createWP = false; // не создавать
					};
				};
			};

			// создать новый маршрут, если не запрещено создание и удалены маршруты
			if( !_NoCreateWP && _DeleteWP)then{
				if(_createWP or !isNil{_grp_wp_completed})then{
					_grp setVariable ['_grp_wp_completed',nil];
					_grp setVariable ["gosa_grp_wp_sleep", nil];
					for "_i" from count waypoints _grp - 1 to 0 step -1 do {
						deleteWaypoint [_grp, _i];
					};
					// создать новый маршрут
					[_leader] spawn gosa_fnc_waypoints;

						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1  создание маршрута", _grp ];
				};
			};

			// wpStatements
			private["_wp"];
			_wp = [_grp,_currentWP];
			private["_wpStatements"];
			_wpStatements = "if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}";
			if!(waypointStatements _wp select 1 in [ // TODO: waypointStatements _wp select 1 возвращает пустоту
				_wpStatements,
				"vehicle this land 'GET IN'",
				"vehicle this land 'GET OUT'",
				"vehicle this land 'LAND'",
				"this land 'GET IN'",
				"this land 'GET OUT'",
				"this land 'LAND'"
			])then{
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 _wpStatements %2", _grp, _wpStatements ];
				_wp setWaypointStatements ["true", _wpStatements];
			};
		};
	};


};

	// слишком часто diag_log format ["Log: [gosa_fnc_group_wp.sqf] end %1", time];
