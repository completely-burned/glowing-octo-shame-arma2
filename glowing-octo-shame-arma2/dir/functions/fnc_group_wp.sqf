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
			diag_log format ["Log: [gosa_fnc_group_wp.sqf] удалить StaticWeapon %1 маршруты", _grp];
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
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] выгрузка десанта %1", _this ];
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
									diag_log format ["Log: [gosa_fnc_group_wp.sqf] выгрузка %1 %2", _veh , _x];
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
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] выгрузка десанта %1", _this ];
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
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] выгрузка десанта %1", _this ];

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
				diag_log format ["Log: [gosa_fnc_group_wp.sqf] выгрузка корабля %1", _this ];
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
				diag_log format ["Log: [gosa_fnc_group_wp.sqf] выгрузка корабля %1", _this ];
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

			// выполнять только если группа готова
			if(!isNil {_grp getVariable "grp_created"})then{ // FIXME: эта проверка должна быть в другом месте выше в скрипте?
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

			// остановить группу, удалить и не создавать маршрут если боты атакуют рядом с точкой или игроками
			if (!_Air && !_Ship) then {
				if ((vehicle _leader distance civilianBasePos) <= sizeLocation*1.20 or [_leader, 400] call gosa_fnc_CheckPlayersDistance) then {
					if( { currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] } count units _grp > 0 )then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] группа %1 атакует рядом с точкой или игроками %2", _grp, _leaderPos];
						// боты остаются на месте
						_NoCreateWP = true;
						_StopWP = true;
						_DeleteWP = true;
					};
				};
			};

			// ПВО
			if (_AA) then {

				diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #AA", _this];

				private["_list","_cost","_prio","_item","_wp_AA"];


				_cost = ([side _grp, _leaderPos, 600] call gosa_fnc_find_AA_pos);

				if (_cost > 2) then {
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #AA остановка на оптимальной позиции %2", _grp, _leaderPos];
					_StopWP = true;
					_NoCreateWP = true;
					_DeleteWP = true;
				}else{

					private["_wp"];

					if (count waypoints _grp > 0) then {
						_wp = [_grp, currentWaypoint _grp];
						_cost = ([side _grp, getWPPos _wp, 500] call gosa_fnc_find_AA_pos);
						if (_cost > 2) then {
							diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #AA оптимальный варшрут уже выбран ранее %2", _grp, _wp];
							_StopWP = false;
							_NoCreateWP = true;
							_DeleteWP = false;
						//}else{
						};
					};

					if (!_NoCreateWP) then {

						// наземные юниты находящиеся в зоне передвижения пво используемые для поиска подходящего маршрута
						_list = _leaderPos nearEntities [["Land"], 1500];

						// поиск подходящего маршрута
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #AA выбор маршрута", _grp];
						for "_i" from 0 to count _list -1 do {
							_item = vehicle (_list select _i);
							_cost = ([side _grp, _item, 400] call gosa_fnc_find_AA_pos);
							if (_cost > 2.5) then {
								if(isNil {_prio})then{
									_prio = (_item distance _leaderPos) / _cost;
									_wp_AA = getPosASL _item;
								}else{
									if ((_item distance _leaderPos) / _cost < _prio)then{
										_wp_AA = getPosASL _item;
									};
								};
							};
						};

						if(!isNil {_wp_AA})then{
							// установка маршрута на позицию
							if (count waypoints _grp == 0) then { // если маршрут отсутствует невозможно установить ему позицию
								_wp =  _grp addWaypoint [_wp_AA, 50];
								_wp setWaypointDescription "glowing-octo-shame Waypoint created dynamically"; // TODO: для этого нужна функция
								_wp setWaypointStatements ["true", "if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}"]; // TODO: не работает должным образом
							}else{
								_wp setWaypointPosition [_wp_AA, 50];
							};

							_StopWP = false;
							_NoCreateWP = true;
							_DeleteWP = false;

							diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #AA установлен маршрут на позицию %2", _wp, _wp_AA];
						}else{
							if (count waypoints _grp == 0) then {
								_NoCreateWP = false;
								_createWP = true;
								diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #AA выбор обычного маршрута", _grp];
							}else{
								diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #AA маршрут уже есть", _grp];
							};

						};
					};
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
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] остановить ии %1 на точке, time %2", _grp, [_grp_wp_completed, time]];
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
			if (count waypoints _grp > 0) then {
			private["_wp"];
			_wp = [_grp,_currentWP];
			private["_wpStatements"];
			_wpStatements = "if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}";
			if!(waypointStatements _wp select 1 in [
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


};

	// слишком часто diag_log format ["Log: [gosa_fnc_group_wp.sqf] end %1", time];
