private["_grp"];
private["_leader"];
private["_leaderPos"];
private["_currentWP","_wp","_typeWP","_waypoints"];
private ["_units","_vehicles","_types","_cargo","_assignedVehicles"];
private ["_Helicopter"];

_grp=_this;


// время создания группы
private["_time"];
_time = (_grp getVariable "grp_created_time");
if ( isNil "_time" ) then {
	_time = time;
	_grp setVariable ["grp_created_time", _time];
	if (draga_loglevel > 0) then {
		diag_log format ["fnc_group_cleanup.sqf %1 grp_created_time %2", _grp, _time ];
	};
};

	scopeName "main";

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

	if (draga_loglevel > 0) then {
		diag_log format ["fnc_group_cleanup.sqf units %1", _units];
	};

	if({alive _x} count _units > 0)then{

		_leader = leader _grp;

		_leaderPos = getPos vehicle _leader;

		_currentWP = currentWaypoint _grp;
		_wp = [_grp,_currentWP];
		_typeWP = waypointType _wp;
		_waypoints = waypoints _grp;

		// транспортный вертолет игнор
		if( ({!isNil {_x getVariable "draga_transportwaypoint_created_GET_IN_pos"}} count [_grp] + _vehicles > 0 ) or ({!isNil {_x getVariable "draga_transportwaypoint_created_GET_OUT_pos"}} count [_grp] + _vehicles > 0 ))then{
			breakTo "main";
			if (draga_loglevel > 0) then {
				diag_log format ["fnc_group_cleanup.sqf %1 breakTo main, transport", _grp ];
			};
		};

		_Helicopter = ([_vehicles, ["Helicopter"]] call m_fnc_CheckIsKindOfArray);

		if (true) then {

			if(_leader call fnc_isPlayer)then{
			}else{

				// если группа создана
				if(!isNil {_grp getVariable "grp_created"})then{
					if (draga_loglevel > 0) then {
						diag_log format ["fnc_group_cleanup.sqf %1  группа готова", _grp ];
					};

					// таймеры _cleanup [позицияЛидера, таймер1, таймер2, позицияМаршрута]
					private["_cleanup"];
					_cleanup = _grp getVariable "_cleanup";
					// инициализация
					if(isNil "_cleanup")then{
						if(_Helicopter)then{
							_cleanup = [getPos vehicle _leader,time+10,time+120,waypointPosition [_grp,_currentWP]]; // инит
						}else{
							_cleanup = [getPos vehicle _leader,time+30,time+120,waypointPosition [_grp,_currentWP]]; // инит
						};
						_grp setVariable ["_cleanup",_cleanup];
						if (draga_loglevel > 0) then {
							diag_log format ["fnc_group_cleanup.sqf %1 _cleanup init %2", _grp, _cleanup ];
						};
					};

					if(!isNil "_cleanup")then{
						private["_oldPos","_oldTime","_oldTime2","_oldPosWP"];
						_oldPos = _cleanup select 0;
						_oldTime = _cleanup select 1;
						_oldTime2 = _cleanup select 2;
						_oldPosWP = _cleanup select 3;
						if([waypointPosition [_grp,_currentWP], _oldPosWP] call BIS_fnc_distance2D < 5 )then{ // если маршрут не менялся
							if (draga_loglevel > 0) then {
								diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся", _grp ];
							};
							if(waypointType [_grp, _currentWP] in ["SUPPORT"])then{ // поддержка
								_oldTime = _oldTime max time+30;
								_oldTime2 = _oldTime2 max time+120;
								_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								if (draga_loglevel > 0) then {
									diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, поддержка, местоположение перезаписано, таймер +30 +120", _grp ];
								};
							};
							if(currentCommand _leader == "FIRE AT POSITION")then{ // артиллерия
								_oldTime = _oldTime max time+30;
								_oldTime2 = _oldTime2 max time+120;
								_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								if (draga_loglevel > 0) then {
									diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, артиллерия, местоположение перезаписано, таймер +30 +120", _grp ];
								};
							};
							if({currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]} count _units > 0 )then{ // ATTACK
								_oldTime = _oldTime max time+30;
								_oldTime2 = _oldTime2 max time+60;
								_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								if (draga_loglevel > 0) then {
									diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, атакует, местоположение перезаписано, таймер +30 +60", _grp ];
								};
							};
							if({currentCommand _x in ["GET OUT","GET IN"]} count _cargo+_units > 0 )then{ // GET OUT
								_oldTime = _oldTime max time+20;
								_oldTime2 = _oldTime2 max time+40;
								_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								if (draga_loglevel > 0) then {
									diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, входвыход с транспортом, местоположение перезаписано, таймер +20 +40", _grp ];
								};
							};

							if(_oldTime < time)then{ // 1 таймер
								if (draga_loglevel > 0) then {
									diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, 1 таймер сработал", _grp ];
								};
								if(_oldPos distance _leaderPos >= 5)then{ // сдвинулись
									if (draga_loglevel > 0) then {
										diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, группа сдвинулась когда 1 таймер работал", _grp ];
									};
									if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{ // на точке
										_oldTime = _oldTime max time+120;
										_oldTime2 = _oldTime2 max time+240;
										_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];// 1 и 2 таймер обновление
										_grp setVariable ["_cleanup",_cleanup];
										if (draga_loglevel > 0) then {
											diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, группа на точке, сдвинулись, местоположение перезаписано, таймер +120 +240", _grp ];
										};
									}else{
										_oldTime = _oldTime max time+30;
										_oldTime2 = _oldTime2 max time+120;
										_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]];// 1 и 2 таймер обновление
										_grp setVariable ["_cleanup",_cleanup];
										if (draga_loglevel > 0) then {
											diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, группа не на точке, сдвинулись, местоположение перезаписано, таймер +30 +120", _grp ];
										};
									};
								}else{
									if (draga_loglevel > 0) then {
										diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, группа не сдвинулась когда 1 таймер работал, удаляю маршруты, пересоздадутся", _grp ];
									};
									for "_i" from count waypoints _grp - 1 to 0 step -1 do {
										deleteWaypoint [_grp, _i];
									};
									if(_Helicopter)then{
										_oldTime = _oldTime max time+10;
										_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]]; // 1 таймер обновление
										_grp setVariable ["_cleanup",_cleanup];
										if (draga_loglevel > 0) then {
											diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, _Helicopter, группа не сдвинулась когда 1 таймер работал, местоположение перезаписано, таймер +10 --", _grp ];
										};
									}else{
										if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{ // на точке
											_oldTime = _oldTime max time+120;
											_oldTime2 = _oldTime2 max time+240;
											_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]]; // 1 таймер обновление
											_grp setVariable ["_cleanup",_cleanup];
											if (draga_loglevel > 0) then {
												diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, группа на точке, группа не сдвинулась когда 1 таймер работал, местоположение перезаписано, таймер +120 +240", _grp ];
											};
										}else{
											_oldTime = _oldTime max time+30;
											_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]]; // 1 таймер обновление
											_grp setVariable ["_cleanup",_cleanup];
											if (draga_loglevel > 0) then {
												diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, группа не на точке, группа не сдвинулась когда 1 таймер работал, местоположение перезаписано, таймер +30 --", _grp ];
											};
										};
									};
								};
							};

							if(_oldTime2 < time)then{ // 2 таймер
								{_x setVariable ["draga_timeDeleteVehicle", 0]}forEach units _grp; // на удаление
								if (draga_loglevel > 0) then {
									diag_log format ["fnc_group_cleanup.sqf %1  маршрут не менялся, 2 таймер сработал, в очередь на удаление", _grp ];
								};
							};
						}else{ // если маршрут изменился
							_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]]; // обновление позиции
							_grp setVariable ["_cleanup",_cleanup];
							if (draga_loglevel > 0) then {
								diag_log format ["fnc_group_cleanup.sqf %1  маршрут изменился, местоположение перезаписано", _grp ];
							};
						};
					};

				}else{
					if (draga_loglevel > 0) then {
						diag_log format ["fnc_group_cleanup.sqf %1  группа не готова", _grp ];
					};
					if ( _time + 30 < time )then {
						_grp setVariable ["grp_created",true];
						if (draga_loglevel > 0) then {
							diag_log format ["fnc_group_cleanup.sqf %1  группа 30 сек grp_created true", _grp ];
						};
					};
				};

			};
		};


	};

if (draga_loglevel > 0) then {
	diag_log format ["fnc_group_cleanup end %1", time];
};
