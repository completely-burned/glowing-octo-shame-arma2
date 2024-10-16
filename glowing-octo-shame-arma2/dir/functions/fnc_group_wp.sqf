/*
 * TODO: Рефакторинг.
эта функция отвечает за создание маршрутных точек для ии
TODO: коду нужна ревизия
TODO: Нужна карта файла.
Карта предварительная, что сейчас.
	№ 1
	-	Истправление неправильных маршрутов.
		-	Например позиция [0,0]
	№ 2
	-	Специальные маршрутны.
		-	Обрабатываются в другой функции.
	№ 3
	-	Классы отрядов.
		-	TODO: Нужна функция.
	№ 4
	-	Исправление классовых маршрутов.
		-	Статичные установки.
	№ 5
	-	Десант.
	№ 6
	-	Исправления статуса маршрутов.
		-	Например: Маршрут завершен.
		-	TODO: Рефакторинг в №1.
	№ 7
	-	Удаление маршрута командиру игроку.
		-	TODO: Рефакторинг.
	№ 8
	- Пауза перед созданием маррута.
		-	Из-за конфликтов динамичной миссии маршруты не должны создоваться сразу.
		-	TODO: Рефакторинг.
	№ 9
	-	Остановка отрядов для боя.
		-	Срыв задания противника.
	№ 10
	-	Отряд ии с подиченным игроком нуждается в другом маршруте.
	№ 11
	-	У авиации для движения всегда должен быть маршрут.
	№ 12
	-	ПВО.
	№ 13
	-	Поддержка.
	№ 14
	-	Выполнение: Остановка без удаления.
		-	FIXME: Вероятно конфликт с десантом.
		- FIXME: После перемещения маршрута он инициализируется заного.
	№ 15
	-	Исправления маршрутов десанта после высадки.
	№ 16
	-	Выполнение: Удаление маршрутов.
	№ 17
	-	Дрон, беспилотник.
	-	TODO: Рефакторинг в №2.
	№ 18
	-	Остановка временная для меньшей активности.
	-	TODO: Проверить конфликт с автоудалением отрядов.
	№ 19
	-	Остановка постаянная для некоторых классов после прибытия.
	№ 20
	-	Выполнение: Создание маршрута.
	№ 21
	- Прочие особенности.
*/

private["_grp","_leader","_leaderPos","_currentWP","_wp","_typeWP","_units",
	"_vehicles","_types","_cargo","_assignedVehicles","_grp_type","_survival",
	"_wpType_TrUNLOAD","_wpType_UNLOAD","_n","_str","_arr","_wpType_GETOUT",
	"_waypoints","_createWP","_NoCreateWP","_DeleteWP","_StopWP","_pvp",
	"_wpType_TrUNLOAD_Plane","_veh","_obj","_pos","_wpType_VehInVehUNLOAD",
	"_isUAVConnected","_side","_sides_friendly",
	"_grp_wp_completed","_g2","_z","_v","_b"];
_grp=_this;


_wpType_TrUNLOAD = "TR UNLOAD";
_wpType_VehInVehUNLOAD = "VEHICLEINVEHICLEUNLOAD";
#ifdef __ARMA3__
	// Тип маршрута "сброс груза" не сажает самолёт.
	_wpType_TrUNLOAD_Plane = "UNHOOK";
#else
	_wpType_TrUNLOAD_Plane = _wpType_TrUNLOAD;
#endif
_wpType_UNLOAD = "UNLOAD";
_wpType_GETOUT = "GETOUT";

scopeName "main";

// переменная _grp_wp_completed устанавливается при достижении группой маршрутной точки
_grp_wp_completed = _grp getVariable "_grp_wp_completed";

_units = units _grp;
	// слишком часто diag_log format ["Log: [gosa_fnc_group_wp.sqf] units %1", _units];

// выполнять только есть в группе есть юниты
if({alive _x} count _units > 0)then{
	scopeName "scope1";
	_side = side _grp;
	_pvp = gosa_pvp;
	if (!_pvp) then {
	_sides_friendly = gosa_friendlyside;
	};

	// удалить [0,0], маршрутная точка на неправильной позиции
	for "_i" from count waypoints _grp - 1 to 0 step -1 do {
		_z = waypointAttachedVehicle [_grp, _i];
		if (isNull _z) then {
			_z = waypointPosition [_grp, _i];
			if(_z call gosa_fnc_isZeroPos)then{
				diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 позиция wp [0,0] удаление", [_grp, _i]];
				deleteWaypoint [_grp, _i];
			};
		};
	};


	_leader = leader _grp;
	_leaderPos = getPos vehicle _leader;
	_wp = [_grp] call gosa_fnc_wp_currentWaypoint;
	_currentWP = _wp select 1;
	_typeWP = waypointType _wp;

	//--- специальные маршрутны
		_survival = _grp getVariable "gosa_grp_attack_player";
			if !(isNil "_survival") then {
				_z = (units (_survival select 1)) call gosa_fnc_centerOfImpact;
				if (count _z > 0) then {
					if ([_z, waypointPosition _wp] call BIS_fnc_distance2D > 50) then {
							for "_i" from count waypoints _grp - 1 to 0 step -1 do {
								deleteWaypoint [_grp, _i];
							};
							[_grp,_z,25,"MOVE"] call gosa_fnc_addWaypoint;
					};
					diag_log format ["Log: [fnc_group_wp] %1 survival %2, %3, exit", _grp, _survival, _z];
					breakTo "main";
				};
			};

	// слишком часто diag_log format ["Log: [fnc_group_wp] %1", [_leader, _wp, _typeWP]];

	_vehicles = [];
	_types = [];
	_cargo = [];
	_assignedVehicles = [];
	{
		_types set [count _types, typeOf _x];
		private ["_veh","_assignedVehicle"];
		_veh = vehicle _x;
		_assignedVehicle = _x call gosa_fnc_assignedVeh;
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
	if( ({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_IN_pos"}} count [_grp] + _vehicles > 0 ) or
		({!isNil {_x getVariable "gosa_transportwaypoint_created_GET_OUT_pos"}} count [_grp] + _vehicles > 0 ) or
		({!isNil {_x getVariable "gosa_SSM_SupportCaller"}} count [_grp] + _vehicles > 0 )
	)then{
		breakTo "main";
			diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 breakTo main, transport", _grp ];
	};

	// узнаем тип отряда для типа маршрута
	_grp_type = _units+_vehicles+_assignedVehicles call gosa_fnc_getGroupType;
		_z = "SUPPORT";
		if !(_z in _grp_type) then {
			if(waypointType _wp == _z)then{
				if({count assignedVehicleRole _x > 0} count _units > 0)then{
					_grp_type set [count _grp_type, _z];
				};
			};
		};

	//-- Беспилотники
	if ("UAV" in _grp_type && !_pvp) then {
		if (_side in _sides_friendly) then {breakTo "main"};

		#ifdef __ARMA3__
			if ({isUAVConnected _x} count _vehicles > 0
				or {{isUAVConnected _x} count _units > 0}) then
			{
				//_isUAVConnected = true;
				breakTo "main";
			//}else{
				//_isUAVConnected = false;
			};
		#endif
	};

	_arr = waypoints _grp;
	if (count _arr > 0) then {
		if (count _assignedVehicles <= 0) then {
			if (_typeWP in [_wpType_UNLOAD, _wpType_GETOUT]) then {
				diag_log format ["Log: [fnc_group_wp] %1 #landing, Тип маршрута %2, список ТС %3, удаление маршрутов %4", _grp, _typeWP, _assignedVehicles, _arr];
				for "_i" from (count _arr -1) to 0 step -1 do {
					deleteWaypoint [_grp, _i];
				};
				_typeWP = "";
			};
		};
	};

	// удалить неподвижным ии маршруты, чтобы не убегали
	if ("StaticWeapon" in _grp_type) then {
		if ( count waypoints _grp > 0 ) then{
			diag_log format ["Log: [gosa_fnc_group_wp.sqf] удалить StaticWeapon %1 маршруты", _grp];
			_wp setWaypointPosition [getPosASL _leader, -1];
			sleep 1;
			for "_i" from count waypoints _grp - 1 to 0 step -1 do {
				deleteWaypoint [_grp, _i];
			};
			_typeWP = "";
		};
	};


	// Артиллерия.
	if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
		if ("Artillery" in _grp_type) then {
			if (isNil {_grp getVariable "gosa_taskArtilleryRegistered"}) then {
				_grp setVariable ["gosa_taskArtilleryRegistered", _grp call lambs_wp_fnc_taskArtilleryRegister];
			};
		};
	};


	// десант вертолетный
	if ("Helicopter" in _grp_type) then {

		//--- десант
			// TODO: нужна функция

			//--- десант, все юниты отряда в грузовом отсеке вертолета
			// TODO: не работает если часть юнитов отвязались от транспорта
			if ({_z = assignedVehicleRole _x; if(count _z == 0)then{false}else{_z select 0 == "cargo"}} count _units == count _units) then {
				diag_log format ["Log: [fnc_group_wp] #landing %1 все юниты группы в грузовом отсеке вертолета %2", _grp, _units];

				_g2 = group vehicle _leader;
				diag_log format ["Log: [fnc_group_wp] #landing %1 группа вертолета", _g2];

				_arr = waypoints _g2;
				if (count _arr > 0) then {
					//- исправление маршрута.
					if (count _arr <= 1) then {
						_n = 0;
					}else{
						_n = currentWaypoint _g2;
					};

					//--- маршрут пилота вертолета
					_z = [_g2, _n];
					
					_str = toUpper waypointType _z;
					diag_log format ["Log: [fnc_group_wp] #landing %1 маршрут группы вертолета", [_g2, _str, waypointPosition _z]];

					if (waypointPosition _z select 0 != 0 && _str != _wpType_TrUNLOAD) then {
						for "_i" from count waypoints _g2 - 1 to 0 step -1 do {
							deleteWaypoint [_g2, _i];
						};
						diag_log format ["Log: [fnc_group_wp] #landing %1 deleteWaypoint != _wpType_TrUNLOAD", _z, _z];
					}else{
						if (waypointPosition _wp select 0 != 0 && _str != _wpType_GETOUT) then {
							_wp setWaypointType _wpType_GETOUT;
							diag_log format ["Log: [fnc_group_wp] #landing %1 setWaypointType _wpType_GETOUT", _grp];
						};

						//--- синхронизируем маршруты
						// TODO: нужны проверка на grpNull и count waypoints и позицию [0,0] и прочее


						if (waypointPosition _z select 0 != 0 && waypointPosition _wp select 0 != 0) then {

							if (isNull waypointAttachedVehicle _wp && [waypointPosition _z, waypointPosition _wp] call BIS_fnc_distance2D > 100) then {
								_wp setWaypointPosition [waypointPosition _z, -1];
								// FIXME: не понимаю нужное направление
								_wp synchronizeWaypoint [_z];
								_z synchronizeWaypoint [_wp];
								diag_log format ["Log: [fnc_group_wp] #landing %1 маршрут изменен и синхронизирован %2", _grp, _z];
							}else{

								//--- выгрузка
									if ((_leaderPos distance waypointPosition _z < 10) or !isNil{_grp_wp_completed}) then {
										diag_log format ["Log: [fnc_group_wp] #landing %1 выгрузка, дист. %2", _grp, _leaderPos distance waypointPosition _wp];

										//--- маршрут прикрепляю к тс для выгрузки немедленно
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
					}else{//diag_log
						diag_log format ["Log: [fnc_group_wp] #landing маршруты на позиции %1", [_wp, waypointPosition _wp, _z, waypointPosition _z]];
					};
				};
			}else{//diag_log
				diag_log format ["Log: [fnc_group_wp] #landing %1 нет маршрута", _grp];
			};
		};
	};

	// десант самолетный
	// TODO: Улучшить позицию десантирования.
	if ("Plane" in _grp_type) then {

		//--- десант самолета
			// TODO: нужна функция, десантруются над водой

			//--- десант, все юниты отряда в грузовом отсеке самолета
			// TODO: не работает если часть юнитов отвязались от транспорта
			if ({_z = assignedVehicleRole _x; if(count _z == 0)then{false}else{_z select 0 == "cargo"}} count _units == count _units) then {
				diag_log format ["Log: [fnc_group_wp] #landing %1 все юниты группы в грузовом отсеке самолета %2 %3", _grp, [vehicle _leader, typeOf vehicle _leader], _units];

				//--- группа пилота самолета
				_g2 = group vehicle _leader;
				diag_log format ["Log: [fnc_group_wp] #landing самолет %1 группа %2", vehicle _leader, _g2];

				_arr = waypoints _g2;
				if (count _arr > 0) then {
					//- исправление маршрута.
					if (count _arr <= 1) then {
						_n = 0;
					}else{
						_n = currentWaypoint _g2;
					};

					//--- маршрут пилота самолета
					_z = [_g2, _n];
					
					_str = toUpper waypointType _z;
					diag_log format ["Log: [fnc_group_wp] #landing самолет %1 маршрут %2 тип %3 позиция %4", _arr, _n, _str, waypointPosition _z];

					if (!(_z call gosa_fnc_waypointPosition call gosa_fnc_isZeroPos) && _str != _wpType_TrUNLOAD_Plane) then {
						diag_log format ["Log: [fnc_group_wp] #landing самолет %1 %2 != %3, удаление маршрутов группы самолета и отмена", _arr, _str, _wpType_TrUNLOAD_Plane];
						for "_i" from (count _arr -1) to 0 step -1 do {
							deleteWaypoint [_g2, _i];
						};

						// перед типом, нужно установить маршрут на позицию чтобы небыло ложных срабатываний
						// тип маршрута "TR UNLOAD" или _wpType_GETOUT сажает самолет
						// _z setWaypointType _wpType_TrUNLOAD_Plane;
					}else{

						if (count _arr <= 0) then {
							diag_log format ["Log: [fnc_group_wp] #landing %1 у десанта нет маршрута, отмена", _grp];
						}else{
							if (_typeWP != _wpType_UNLOAD) then {
								if !(_wp call gosa_fnc_waypointPosition call gosa_fnc_isZeroPos) then {
									diag_log format ["Log: [fnc_group_wp] #landing %1 тип %2 маршрута десанта исправлен на %3", _wp, waypointType _wp, _wpType_UNLOAD];
									// тип маршрута _wpType_UNLOAD или _wpType_GETOUT сажает! самолет
									_wp setWaypointType _wpType_UNLOAD;
								};
							};

							if !(_z call gosa_fnc_waypointPosition call gosa_fnc_isZeroPos) then {
								//- Синхронизируем маршруты десанта и пилота.
									if (isNull waypointAttachedVehicle _wp &&
										[_z call gosa_fnc_waypointPosition, _wp call gosa_fnc_waypointPosition] call BIS_fnc_distance2D > 100) then
									{
										// setWaypointPosition PositionASL if radius is negative
										_arr = _z call gosa_fnc_waypointPosition;
										#ifdef __ARMA3__
											_arr = AGLToASL _arr;
											_wp setWaypointPosition [_arr, -1];
										#else
											_arr resize 2;
											_wp setWaypointPosition [_arr, 0];
										#endif
										// FIXME: не понимаю нужное направление
										_wp synchronizeWaypoint [_z];
										_z synchronizeWaypoint [_wp];
										diag_log format ["Log: [fnc_group_wp] #landing %1 маршрут десанта синхронизирован с маршрутом транспорта %2", _grp, _z];
									};
								//- выгрузка
									if ((_leaderPos distance (_z call gosa_fnc_waypointPosition) < 1000) or
										!isNil "_grp_wp_completed") then
									{
										diag_log format ["Log: [fnc_group_wp] #landing %1 выгрузка самолета, дист. до мрш. %2, дист. до центра %3", _grp, [_leaderPos distance waypointPosition _wp, _leaderPos distance waypointPosition _z], _leaderPos distance civilianBasePos];
										// TODO: десантирование нескольких отрядов одновременно возможно конфликтует
										_units spawn gosa_fnc_paraJump;
									};
							}else{//diag_log
								diag_log format ["Log: [fnc_group_wp] #landing маршруты на позиции %1, отмена", [_wp, waypointPosition _wp, _z, waypointPosition _z]];
							};
						};
					};
				 }else{//diag_log
					diag_log format ["Log: [fnc_group_wp] #landing самолет %1 нет маршрутов, отмена", _g2];
				};


			};
	};

	// Лодки.
	if ("Ship" in _grp_type && !("Frigate" in _grp_type)) then {
		diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1, %2, %3", _grp, [_leaderPos, waypointPosition _wp], _typeWP];
		_arr = [];
		// Vehicle_in_Vehicle_Transport
		#ifdef __ARMA3__
			for "_i" from 0 to (count _vehicles -1) do {
				_arr append getVehicleCargo (_vehicles select _i);
			};
			if (count _arr > 0) then {
				_pos = waypointPosition _wp;
				// TODO: Сразу переходить к дисантированию пехоты.
				// Необходимо учитывать габариты корабля и его виляющий характер.
				if ((_leaderPos distance _pos < 150) or !isNil "_grp_wp_completed") then {
					if (_typeWP in [_wpType_VehInVehUNLOAD]) then {
							_obj = vehicle _leader;
							diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1, VehInVehUNLOAD %2 Attach %3", _grp, _wp, _obj];
							_wp waypointAttachVehicle _obj;
							breakTo "scope1";
					}else{
						if (_typeWP in [_wpType_TrUNLOAD, _wpType_GETOUT, _wpType_UNLOAD]) then {
							_obj = vehicle _leader;
							diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1, VehInVehUNLOAD %2 Attach %3", _grp, _wp, _obj];
							_wp setWaypointType _wpType_VehInVehUNLOAD;
							_wp waypointAttachVehicle _obj;
							breakTo "scope1";
						};
					};
				};
			};
		#endif

		if (_typeWP == _wpType_GETOUT) then {_b = true} else {_b = false};

		if (_b or _typeWP in [_wpType_UNLOAD]) then {
			_arr = waypointPosition _wp;
			if (_arr call gosa_fnc_isZeroPos) exitWith {
				for "_i" from (count _arr -1) to 0 step -1 do {
					deleteWaypoint [_grp, _i];
				};
				_typeWP = "";
			};

			//_crew = [];
			for "_i" from 0 to (count _vehicles -1) do {
				_veh = _vehicles select _i;
				// На дистанции <=400 лодка уже ищет береговую линию для десантирования.
				if ((_veh distance _arr < 100) or !isNil "_grp_wp_completed") then {
					{
						if (_b or group _x != _grp) then {
							//_crew set [count _crew, _x];
							if (currentCommand _x != "GET OUT") then {							
								diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 #landing, Выгрузка корабля %2, %3, wp %4", _grp, _veh, _x, _typeWP];
								[_x] allowGetIn false;
								_x leaveVehicle _veh;
								unassignVehicle _x;
							};
						};
					} forEach crew _veh;
				};
			};
			//_crew allowGetIn false;
		};
	};


	if (true) then {
		_waypoints = waypoints _grp;
		_createWP = false;

		// если отряд у цели установить переменную _grp_wp_completed если она не установлена
		if (isNil "_grp_wp_completed") then {
			if ("Plane" in _grp_type) then {
				// FIXME: Авиация IFA3 еле-еле подлетпет на 5000м к маршруту.
				_n = 1500;
			}else{
				if ("Helicopter" in _grp_type) then {
					_n = 500;
				}else{
					_n = 5;
				};
			};
			if ([waypointPosition _wp, _leaderPos] call BIS_fnc_distance2D < _n)then {
				_grp_wp_completed = time;
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 _grp_wp_completed = %2", _grp, _grp_wp_completed];
			};
		};

		// если лидер отряда игрок удалить маршруты, чтобы не мешали
		if(_leader call gosa_fnc_isPlayer)then{
			if ( count waypoints _grp > 0 ) then{
				diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 isPlayer _leader deleteWaypoints", _grp ];
				_wp setWaypointPosition [getPosASL _leader, -1];
				sleep 0.1;
				for "_i" from count waypoints _grp - 1 to 0 step -1 do {
					deleteWaypoint [_grp, _i];
				};
			};
		}else{

			// не создавать
			_NoCreateWP = false;
			// удалить
			_DeleteWP = false;
			// остановиться
			_StopWP = false;

			// выполнять только если группа готова
			// FIXME: эта проверка должна быть в другом месте выше в скрипте?
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
							// используется в некоторых проверках
							_DeleteWP = true;
							_grp setVariable ["_timeNoWP", nil];
						};
					};

				}else{
					_grp setVariable ["_timeNoWP", nil];
				};
			};

			// остановить группу, удалить и не создавать маршрут если боты атакуют рядом с точкой или игроками
			if (!("Air" in _grp_type) && !("Ship" in _grp_type) && !("Frigate" in _grp_type)) then {
				if ((vehicle _leader distance civilianBasePos) <= gosa_locationSize*1.20 or [_leader, 400] call gosa_fnc_CheckPlayersDistance) then {
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
								if (waypointPosition _wp distance civilianBasePos > gosa_locationSize) then {
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

			if !(isNil {_grp getVariable "patrol"}) then {
				// Отряду ии с подчиненным игроком нужен маршрут к миссии.
				if({_x call gosa_fnc_isPlayer} count _units > 0)then{
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 установлен маршрут патрулирования, сброс группы на атакующий тип", _grp];
					_grp setVariable ["patrol", nil];
					_NoCreateWP = false;
					_CreateWP = true;
					_DeleteWP = true;
				};
				// Патрульные отряды можно отдать другим скриптам.
				if (isNil {_grp getVariable "lambs_danger_enableGroupReinforce"}) then {
					if !("Artillery" in _grp_type) then {
						_grp setVariable ["lambs_danger_enableGroupReinforce", true, true];
					};
				};
			};


			// Frigate
			if ("Frigate" in _grp_type) then {
				diag_log format ["Log: [gosa_fnc_group_wp] %1, if Frigate", _grp];
				_arr = waypointPosition _wp;
				if (_leaderPos distance _arr < 1000) then {
					_NoCreateWP = false;
					_CreateWP = true;
					_StopWP = false;
					_DeleteWP = true;
				};
				// Опасная зона.
				if (count waypoints _grp > 0) then {
					_arr = gosa_zone_lighthouse;
					for "_i" from 0 to (count _arr -1) do {
						_obj = _arr select _i;
						if ([_obj, _leaderPos] call BIS_fnc_inTrigger) then {
							//_arr0 set [count _arr0, getPos _obj];
							_n = [ _obj, _leaderPos] call BIS_fnc_dirTo;
							_pos = [_leaderPos, 100, _n] call BIS_fnc_relPos;
							diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1, Frigate lighthouse, %2", _grp, [_leaderPos, _obj, _pos]];
							_wp setWaypointPosition [_pos, 0];
							_NoCreateWP = true;
							_CreateWP = false;
							_StopWP = false;
							_DeleteWP = false;
						};
					};
				};
			};

			// авиация не должна зависать на месте
			if ("Air" in _grp_type) then {
				if(count waypoints _grp == 0 or !isNil "_grp_wp_completed" )then{
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 авиация не должна зависать на месте", _grp];
					_NoCreateWP = false;
					_CreateWP = true;
					_StopWP = false;
					_DeleteWP = true;
				};
				if ({[_x] call gosa_fnc_unit_isAttacker} count _units > 0) then {
					diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1, авиация атакует", _grp];
					_NoCreateWP = true;
					_CreateWP = false;
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
					private ["_cleanup"];
					// Защита от удаления остановленных отрядов ПВО.
					_cleanup = _grp getVariable "_cleanup";
					if !(isNil "_cleanup") then {
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 gosa_fnc_group_cleanup AA %2 old", _grp, _cleanup];
						_cleanup set [1, (_cleanup select 1) max (time+120)];
						_cleanup set [2, (_cleanup select 2) max (time+240)];
						_grp setVariable ["_cleanup",_cleanup];
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 gosa_fnc_group_cleanup AA %2 new", _grp, _cleanup];
					};
				}else{
					if (count waypoints _grp > 0) then {
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
							// если маршрут отсутствует невозможно установить ему позицию
							if (count waypoints _grp == 0) then {
								_wp =  _grp addWaypoint [_wp_AA, 50];
								// TODO: для этого нужна функция
								_wp setWaypointDescription "glowing-octo-shame Waypoint created dynamically";
								// TODO: не работает должным образом
								_wp setWaypointStatements ["true", "if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}"];
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
				if(waypointType _wp == _z)then{
					if({count assignedVehicleRole _x > 0} count _units > 0)then{
						_DeleteWP = false;
						_v = vehicle _leader;
						if( _v != _leader && waypointAttachedVehicle _wp != _v )then{
							// FIXME: при перемещении маршрута ии инициализируется под маршрут "SUPPORT" заново
							_wp waypointAttachVehicle _v;
							diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 waypointAttachVehicle %2 %3", _wp, _v, typeOf _v];
						};
					};
				};
				if(_z in _grp_type)then{
					if(waypointType _wp != _z)then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 support, !supportWP", _wp];
						_DeleteWP = true;
						_NoCreateWP = false;
						_createWP = true;
					};
				};
				if!(_z in _grp_type)then{
					if(waypointType _wp == _z)then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 !support, supportWP", _wp];
						_DeleteWP = true;
						_NoCreateWP = false;
						_createWP = true;
					};
				};
			};

			// Артиллерия.
			// TODO: Менять позицию после выстрела или при обнаружении противником.
			// TODO: Выполнять задание при отсутствии союзных отрядов.
			if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
				if ("Artillery" in _grp_type) then {
					_arr = [_types] call gosa_fnc_returnVehicleRange;
					if (_arr select 0 > 500) then {
						_NoCreateWP = true;
						_CreateWP = false;
					};
				};
			};

			// остановиться
			if(_StopWP or (_NoCreateWP && _DeleteWP))then{
				if ( count waypoints _grp > 0 ) then{
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] остановка группы %1, currentCommand leader %2, count waypoints %3", _grp, currentCommand _leader, count waypoints _grp ];
					_wp setWaypointPosition [getPosASL _leader, -1];
					// [_grp, currentWaypoint _grp] setWaypointType "HOLD";
					sleep 0.1;
				};
			};

			//--- пост выгрузка, транспорт
				if (_typeWP in [_wpType_TrUNLOAD_Plane,_wpType_TrUNLOAD]) then {
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
				if (_typeWP in [_wpType_UNLOAD,_wpType_GETOUT]) then {
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
				// не создавать
				_NoCreateWP = true;
			};

			// остановить ботов на точке 2 минут
			if(!isNil{_grp_wp_completed})then{
				if(!("Air" in _grp_type) && !("Frigate" in _grp_type) && (_grp_wp_completed + 120 < time))then{
					if ((vehicle _leader distance civilianBasePos) < gosa_locationSize) then {
						diag_log format ["Log: [gosa_fnc_group_wp.sqf] остановить ии %1 на точке, time %2", _grp, [_grp_wp_completed, time]];
						// удалить
						_DeleteWP = true;
						// не создавать
						_NoCreateWP = true;
						// не создавать
						_createWP = false;
					};
				};
			};

			// перемещение ботов нагружает цп, некоторые отряды можно остановить
				if (!("Air" in _grp_type) && !("Frigate" in _grp_type)) then {
					_z = (missionNamespace getVariable "gosa_ai_create_fps");
					if (_z == 0) then {
						_z = 25;
					};
					if (diag_fps < _z*0.95) then {
						if ((vehicle _leader distance civilianBasePos) < gosa_locationSize) then {
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

			diag_log format ["Log: [gosa_fnc_group_wp.sqf] %1 _createWP %2, _DeleteWP %3, _NoCreateWP %4, _StopWP %5", _grp, _createWP, _DeleteWP, _NoCreateWP, _StopWP];
		};
	};


};

	// слишком часто diag_log format ["Log: [gosa_fnc_group_wp.sqf] end %1", time];
