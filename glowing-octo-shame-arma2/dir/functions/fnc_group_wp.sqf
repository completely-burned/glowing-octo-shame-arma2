// эта функция отвечает за создание маршрутных точек для ии

private["_grp","_leader","_leaderPos","_currentWP","_wp","_typeWP","_units","_vehicles","_types","_cargo","_assignedVehicles","_grp_type","_grp_wp_completed","_g2","_z","_v"];

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
		_z = waypointAttachedVehicle [_grp, _i];
		if (isNull _z) then {
			_z = waypointPosition [_grp, _i];
			if( _z select 0 == 0 && _z select 1 == 0 )then{
				diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 позиция wp [0,0] удаление", [_grp, _i]];
				deleteWaypoint [_grp, _i];
			};
		};
	};


	_leader = leader _grp;

	_leaderPos = getPos vehicle _leader;

	_currentWP = currentWaypoint _grp;

	// FIXME: не правильный текущий номер маршрута
	_z = count waypoints _grp;
	if (_z > 0 && _z <= _currentWP) then {
		diag_log format ["Log: [fnc_group_wp] %1 currentWaypoint fix", _grp];
		_grp setCurrentWaypoint [_grp, _z -1];
		_currentWP = currentWaypoint _grp;
	};

	_wp = [_grp,_currentWP];
	_typeWP = waypointType _wp;

	// слишком часто diag_log format ["Log: [fnc_group_wp] %1", [_leader, _wp, _typeWP]];

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

	diag_log format ["Log: [gosa_fnc_group_wp.sqf] _types %1", _types];

	// транспортный вертолет вызываемый игроками, отличается поведением и генерирует маршруты в другом скрипте, пропускаем его
	if( ({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_IN_pos"}} count [_grp] + _vehicles > 0 ) or ({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_OUT_pos"}} count [_grp] + _vehicles > 0 ))then{
		breakTo "main";
			diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 breakTo main, transport", _grp ];
	};

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

	// удалить неподвижным ии маршруты, чтобы не убегали
	if ("StaticWeapon" in _grp_type) then {
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
	if ("Helicopter" in _grp_type) then {

		//--- десант
			// TODO: нужна функция

			//--- десант, все юниты отряда в грузовом отсеке вертолета
			if ({_z = assignedVehicleRole _x; if(count _z == 0)then{false}else{_z select 0 == "cargo"}} count _units == count _units) then { // TODO: не работает если часть юнитов отвязались от транспорта
				diag_log format ["Log: [fnc_group_wp] #landing %1 все юниты группы в грузовом отсеке вертолета %2", _grp, _units];

				_g2 = group vehicle _leader;
				diag_log format ["Log: [fnc_group_wp] #landing %1 группа вертолета", _g2];

				_z = [_g2, currentWaypoint _g2];
				diag_log format ["Log: [fnc_group_wp] #landing %1 маршрут группы вертолета", [_g2, waypointType _z, waypointPosition _z]];


				if (waypointPosition _z select 0 != 0 && waypointType _z != "TR UNLOAD") then {
					for "_i" from count waypoints _g2 - 1 to 0 step -1 do {
						deleteWaypoint [_g2, _i];
					};
					diag_log format ["Log: [fnc_group_wp] #landing %1 deleteWaypoint !='TR UNLOAD'", _z, _z];
				};

				if (count waypoints _grp == 0) then {
					diag_log format ["Log: [fnc_group_wp] #landing %1 нет маршрута", _grp];
				}else{

					if (waypointPosition _wp select 0 != 0 && _typeWP != "GETOUT") then {
						_wp setWaypointType "GETOUT";
						diag_log format ["Log: [fnc_group_wp] #landing %1 setWaypointType 'GETOUT'", _grp];
					};

					//--- синхронизируем маршруты
						// TODO: нужны проверка на grpNull и count waypoints и позицию [0,0] и прочее


						if (waypointPosition _z select 0 != 0 && waypointPosition _wp select 0 != 0) then {

							if (isNull waypointAttachedVehicle _wp && [waypointPosition _z, waypointPosition _wp] call BIS_fnc_distance2D > 100) then {
								_wp setWaypointPosition [waypointPosition _z, -1];
								_wp synchronizeWaypoint [_z]; // FIXME: не понимаю нужное направление
								_z synchronizeWaypoint [_wp];
								diag_log format ["Log: [fnc_group_wp] #landing %1 маршрут изменен и синхронизирован %2", _grp, _z];
							}else{

								//--- выгрузка
									if ((_leaderPos distance waypointPosition _z < 10) or !isNil{_grp_wp_completed}) then {


										diag_log format ["Log: [fnc_group_wp] #landing %1 выгрузка, дист. %2", _grp, _leaderPos distance waypointPosition _wp];

										//--- маршрут прикрепляю к тс для выгрузки немедленно
											private["_veh"];
											_veh = vehicle _leader;
											if(waypointAttachedVehicle _z != _veh)then{
												_z waypointAttachVehicle _veh;
												diag_log format ["Log: [fnc_group_wp] #landing %1 маршрут прикреплен к %2", _z, _veh];
											};
											_z = vehicle _leader;
											if(waypointAttachedVehicle _wp != _veh)then{
												_wp waypointAttachVehicle _veh;
												diag_log format ["Log: [fnc_group_wp] #landing %1 маршрут прикреплен к %2", _wp, _veh];
											};
									};
							};
						}else{
							diag_log format ["Log: [fnc_group_wp] #landing маршруты на позиции %1", [_wp, waypointPosition _wp, _z, waypointPosition _z]];
						};

				};


			};

	};

	if ("Plane" in _grp_type) then {

		//--- десант самолета
			// TODO: нужна функция, десантруются над водой

			//--- десант, все юниты отряда в грузовом отсеке самолета
			if ({_z = assignedVehicleRole _x; if(count _z == 0)then{false}else{_z select 0 == "cargo"}} count _units == count _units) then { // TODO: не работает если часть юнитов отвязались от транспорта
				diag_log format ["Log: [fnc_group_wp] #landing %1 все юниты группы в грузовом отсеке самолета %2 %3", _grp, [vehicle _leader, typeOf vehicle _leader], _units];

				//--- группа пилота самолета
				_g2 = group vehicle _leader;
				diag_log format ["Log: [fnc_group_wp] #landing самолет %1 группа %2", vehicle _leader, _g2];

				if (count waypoints _g2 > 0) then {

					//--- маршрут пилота самолета
					_z = [_g2, currentWaypoint _g2];
					diag_log format ["Log: [fnc_group_wp] #landing самолет %1 маршрут %2 тип %3 позиция %4", waypoints _g2, currentWaypoint _g2, waypointType _z, waypointPosition _z];

					if (waypointPosition _z select 0 != 0 && waypointType _z != "TR UNLOAD") then {
						for "_i" from count waypoints _g2 - 1 to 0 step -1 do {
							deleteWaypoint [_g2, _i];
						};

						diag_log format ["Log: [fnc_group_wp] #landing самолет %1 %2 != 'TR UNLOAD', удаление маршрутов группы самолета и отмена", waypoints _g2, waypointType _z];
						// перед типом, нужно установить маршрут на позицию чтобы небыло ложных срабатываний
						// _z setWaypointType "TR UNLOAD"; // тип маршрута "TR UNLOAD" или "GETOUT" сажает самолет
					 }else{

						if (count waypoints _grp == 0) then {
							diag_log format ["Log: [fnc_group_wp] #landing %1 у десанта нет маршрута, отмена", _grp];
						 }else{

							if (waypointPosition _wp select 0 != 0 && _typeWP != "UNLOAD") then {
								diag_log format ["Log: [fnc_group_wp] #landing %1 тип %2 маршрута десанта исправлен на UNLOAD", _wp, waypointType _wp];
								_wp setWaypointType "UNLOAD"; // тип маршрута "UNLOAD" или "GETOUT" сажает! самолет
							};

							//--- синхронизируем маршруты
								if (waypointPosition _z select 0 != 0 && waypointPosition _wp select 0 != 0) then {

									if (isNull waypointAttachedVehicle _wp && [waypointPosition _z, waypointPosition _wp] call BIS_fnc_distance2D > 100) then {
										_wp setWaypointPosition [waypointPosition _z, -1]; // TODO: устанавливается не на той-же позиции
										_wp synchronizeWaypoint [_z]; // FIXME: не понимаю нужное направление
										_z synchronizeWaypoint [_wp];
										diag_log format ["Log: [fnc_group_wp] #landing %1 маршрут десанта синхронизирован с маршрутом транспорта %2", _grp, _z];
									}else{

										//--- выгрузка
											if ((_leaderPos distance waypointPosition _wp < 1000) or (_leaderPos distance waypointPosition _z < 1000) or !isNil{_grp_wp_completed}) then {

												diag_log format ["Log: [fnc_group_wp] #landing %1 выгрузка самолета, дист. до мрш. %2, дист. до центра %3", _grp, [_leaderPos distance waypointPosition _wp, _leaderPos distance waypointPosition _z], _leaderPos distance civilianBasePos];

												_units spawn gosa_fnc_paraJump; // TODO: десантирование нескольких отрядов одновременно возможно конфликтует

											};
									};
								}else{
									diag_log format ["Log: [fnc_group_wp] #landing маршруты на позиции %1, отмена", [_wp, waypointPosition _wp, _z, waypointPosition _z]];
								};

						};
					};

				 }else{
					diag_log format ["Log: [fnc_group_wp] #landing самолет %1 нет маршрутов, отмена", _g2];
				};


			};
	};

	// лодки
	if ("Ship" in _grp_type) then {
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
							_x leaveVehicle _veh;
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
							_x leaveVehicle _veh;
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
		private["_grp","_leader""_currentWP","_waypoints","_createWP","_leaderPos","_NoCreateWP","_DeleteWP","_StopWP"];
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

			_NoCreateWP = false; // не создавать
			_DeleteWP = false; // удалить
			_StopWP = false; // остановиться

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
							_DeleteWP = true; // используется в некоторых проверках
							_grp setVariable ["_timeNoWP", nil];
						};
					};

				}else{
					_grp setVariable ["_timeNoWP", nil];
				};
			};

			// остановить группу, удалить и не создавать маршрут если боты атакуют рядом с точкой или игроками
			if (!("Air" in _grp_type) && !("Ship" in _grp_type)) then {
				if ((vehicle _leader distance civilianBasePos) <= sizeLocation*1.20 or [_leader, 400] call gosa_fnc_CheckPlayersDistance) then {
					if( { currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] } count units _grp > 0 )then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] группа %1 атакует рядом с точкой или игроками %2", _grp, _leaderPos];
						// боты остаются на месте
						_NoCreateWP = true;
						_StopWP = true;
						_DeleteWP = true;
					};
				};

				// TODO: временное решение, для возобновления маршрута остановленных групп вне боя
				if(count waypoints _grp > 0)then{
					if (!_StopWP) then {
						if (_NoCreateWP or !_CreateWP or !_DeleteWP) then {
							if (isNil {_grp getVariable "patrol"}) then {
								if (waypointPosition [_grp, currentWaypoint _grp] distance civilianBasePos > sizeLocation) then {
									diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 маршрут не на точке", _grp];
									_NoCreateWP = false;
									_CreateWP = true;
									_DeleteWP = true;
								};
							};
						};
					};
				};
			};

			// группе ии с подчиненным игроком нужен маршрут к основной локации
			if (!isNil{_grp getVariable "patrol"}) then {
				if({_x call gosa_fnc_isPlayer} count _units > 0)then{
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 установлен маршрут патрулирования, сброс группы на атакующий тип", _grp];
					_grp setVariable ["patrol", nil];
					_NoCreateWP = false;
					_CreateWP = true;
					_DeleteWP = true;
				};
			};

			if(count waypoints _grp == 0)then{
				// авиация не должна зависать на месте
				if ("Air" in _grp_type) then {
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 авиация не должна зависать на месте", _grp];
					_NoCreateWP = false;
					_CreateWP = true;
					_StopWP = false;
					_DeleteWP = true;
				};
			};

			// ПВО
			if ("AA" in _grp_type) then {

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
			if (count waypoints _grp > 0) then {
				_z = "SUPPORT";
				_wp = [_grp, currentWaypoint _grp];
				if(waypointType _wp == _z)then{
					if({count assignedVehicleRole _x > 0} count _units > 0)then{
						_DeleteWP = false;
						_v = vehicle _leader;
						if( _v != _leader && waypointAttachedVehicle _wp != _v )then{
							_wp waypointAttachVehicle _v; // FIXME: при перемещении маршрута ии инициализируется под маршрут "SUPPORT" заново
							diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 waypointAttachVehicle %2 %3", _wp, _v, typeOf _v];
						};
					};
				};
				if(_z in _grp_type)then{
					if(waypointType _wp != _z)then{
						_DeleteWP = true;
						_NoCreateWP = false;
						_createWP = true;
					};
				};
				if!(_z in _grp_type)then{
					if(waypointType _wp == _z)then{
						_DeleteWP = true;
						_NoCreateWP = false;
						_createWP = true;
					};
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

			//--- пост выгрузка, транспорт
				if (_typeWP in ["TR UNLOAD"]) then {
					private["_landing"];
					_landing = false;
					{
						private["_veh"];
						_veh = _x;
						if({_z = group _x; _z != _grp && !isNull _z && alive _x}count crew _veh > 0)then{
							_landing = true;
						};
					} forEach _vehicles;

					if (_landing) then {
						_DeleteWP = false;
						_NoCreateWP = true;
						_createWP = false;
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #landing пересоздание маршрута отменено", _wp, _typeWP];
					}else{
						_DeleteWP = true;
						_NoCreateWP = true;
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #landing пост выгрузка, транспорт, удаление маршрутов", _wp, _typeWP];
					};
				};

			//--- пост выгрузка, пехота
				if (_typeWP in ["UNLOAD","GETOUT"]) then {
					if ({vehicle _x == _x} count _units == count _units) then {
						_DeleteWP = true;
						_NoCreateWP = true;
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #landing пост выгрузка, пехота, удаление маршрутов", _wp, _typeWP];
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

				// самолет должен продолжить полет, отключить автопилот приземления, он включается из-за маршрута определенного типа
				{
					_x land "NONE";
					_x action ["cancelLand", _x];
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] удаление waypoints, %1 action 'cancelLand'", _x];
				} forEach _vehicles;
			};

			// UAV не создавать маршрут
			_z = _grp getVariable "_gosa_UAV_WaypointPosCenter";
			if(!isNil{_z})then{
				_NoCreateWP = true; // не создавать
			};

			// остановить ботов на точке 2 минут
			if(!isNil{_grp_wp_completed})then{
				if(!("Air" in _grp_type) && (_grp_wp_completed + 120 < time))then{
					if ((vehicle _leader distance civilianBasePos) < sizeLocation) then {
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] остановить ии %1 на точке, time %2", _grp, [_grp_wp_completed, time]];
						_DeleteWP = true; // удалить
						_NoCreateWP = true; // не создавать
						_createWP = false; // не создавать
					};
				};
			};

			// перемещение ботов нагружает цп, некоторые отряды можно остановить
				if !("Air" in _grp_type) then {
					_z = (missionNamespace getVariable "gosa_ai_create_fps");
					if (_z == 0) then {
						_z = 25;
					};
					if (diag_fps < _z*0.95) then {
						if ((vehicle _leader distance civilianBasePos) < sizeLocation) then {
							diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 на точке, fps %2, маршрут не будет создан", _grp, diag_fps];
							_NoCreateWP = true;
							_createWP = false;
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
					[_leader, _units, [_grp_type, _vehicles, _assignedVehicles, _cargo, _types, _grp]] spawn gosa_fnc_waypoints;

						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1  создание маршрута", _grp ];
				};
			};

			// wpStatements
			if (count waypoints _grp > 0) then {
				_z = [_grp,_currentWP];
				private["_wpStatements"];
				_wpStatements = "if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}";
				if!(waypointStatements _z select 1 in [
					_wpStatements,
					"vehicle this land 'GET IN'",
					"vehicle this land 'GET OUT'",
					"vehicle this land 'LAND'",
					"this land 'GET IN'",
					"this land 'GET OUT'",
					"this land 'LAND'"
				])then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 _wpStatements %2", _grp, _wpStatements ];
					_z setWaypointStatements ["true", _wpStatements];
				};
			};

			diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 _createWP %2, _DeleteWP %3, _NoCreateWP %4, _StopWP %5", _grp, _createWP, _DeleteWP, _NoCreateWP, _StopWP];
		};
	};


};

	// слишком часто diag_log format ["Log: [gosa_fnc_group_wp.sqf] end %1", time];
