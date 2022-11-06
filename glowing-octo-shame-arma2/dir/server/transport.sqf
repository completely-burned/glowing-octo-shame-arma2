diag_log format ["Log: [heliTransport] %1", gosa_heliTransport];

if (gosa_heliTransport == 0) exitWith {
	diag_log format ["Log: [heliTransport] exitWith", gosa_heliTransport];
};

private["_players","_z","_createVehicle_lastTime"];

_createVehicle_lastTime = -99999999;

while{true}do{

	scopeName "main";

	sleep 5;

	if(isMultiplayer)then{
		_players = ([] call BIS_fnc_listPlayers);
	}else{
		_players = [player];
	};

	{

		scopeName "player";

		private["_player"];
		_player = _x;

		//--- позиция загрузки, проверка на игроке
		private["_var_player_pos"];
		_var_player_pos = _player getVariable "gosa_transportPos";

		diag_log format ["Log: [heliTransport] player %1", _player, nil];

		// типы транспорта доступные для создания
		private["_heli_types"];
		switch (side _player) do {
			case west: {_heli_types = airTransportsWest};
			case east: {_heli_types = airTransportsEast};
			case resistance: {_heli_types = airTransportsGuer};
			default {_heli_types = []};
		};

		private["_veh","_grp"];

		//--- игрок уже в транспорте
		_veh = vehicle _player;
		if (_veh isKindOf "Man") then {
			_veh = objNull;
		}else{
			_grp = group effectiveCommander _veh;
		};

		//--- поиск уже закрепленного транспорта,
		// транспорт должен быть найден  так-же для отпуска после завершения
		if(isNull _veh)then{

			//--- кэширование
			_z = _player getVariable "gosa_playerTransport";
			if (isNil {_z}) then {
				_z = [];
			}else{
				_z = [_z];
			};

		{
			private["_transportPlayer"];
			_transportPlayer = _x getVariable "transportPlayer";
			if(!isNil {_transportPlayer} && {_transportPlayer == _player})then{
				diag_log format ["Log: [heliTransport] %1 уже закреплен за игроком %2", _x, _transportPlayer];
				if(canMove _x)then{
					diag_log format ["Log: [heliTransport] %1 может двигаться", _x, _transportPlayer];
					if(alive effectiveCommander _x)then{
						diag_log format ["Log: [heliTransport] %1 жив экипаж", _x, _transportPlayer];
						if!(effectiveCommander _x call gosa_fnc_isPlayer)then{
							diag_log format ["Log: [heliTransport] %1 ии", _x, _transportPlayer];
							if(getDammage _x < 0.75)then{
								_veh = _x;
								_grp = group effectiveCommander _veh;
								diag_log format ["Log: [heliTransport] %1 не поврежден, выбран для дальнейшего использования", _x, _transportPlayer];
								_player setVariable ["gosa_playerTransport", _veh];
								breakTo "player";
							}else{
								diag_log format ["Log: [heliTransport] %1 поврежден", _x, _transportPlayer];
								_x setVariable ["transportPlayer", nil];
							};
						}else{
							diag_log format ["Log: [heliTransport] %1 не ии", _x, _transportPlayer];
							_x setVariable ["transportPlayer", nil];
						};
					}else{
						diag_log format ["Log: [heliTransport] %1 мертв экипаж", _x, _transportPlayer];
						_x setVariable ["transportPlayer", nil];
					};
				}else{
					diag_log format ["Log: [heliTransport] %1 не может двигаться", _x, _transportPlayer];
					_x setVariable ["transportPlayer", nil];
				};
			};
		} forEach _z+vehicles;
		};

		//--- поиск транспорта для использования среди уже созданного другими скриптами миссии
		if(isNull _veh && !isNil {_var_player_pos})then{
			diag_log format ["Log: [heliTransport] поиск среди готового транспорта", nil];
			private["_x_veh","_x_veh_best","_dist","_Commander"];
			{
				_x_veh = _x;
				_Commander = effectiveCommander _x_veh;
				if(side _x_veh getFriend side _player >= 0.6)then{
					if(_x_veh isKindOf "Helicopter" or _x_veh isKindOf "MV22")then{
						if(alive _Commander)then{
							if({group _x != group _Commander && group _x != group _player}count crew _x_veh == 0)then{
								if({_x call gosa_fnc_isPlayer}count units _Commander == 0)then{
									if(canMove _x_veh)then{
										if(isNil {_x_veh getVariable "transportPlayer"})then{
											if(getDammage _x_veh < 0.75)then{
												if({_x call gosa_fnc_isPlayer}count (crew _x_veh - units _player) == 0)then{
													if(_x_veh emptyPositions "cargo" >= count units _player)then{
														if (isNil {_dist}) then {
															_dist = _x_veh distance vehicle player;
															_z = true;
														}else{
															_z = false;
														};
														if (_z or (_dist < _x_veh distance vehicle player)) then {
															_x_veh_best = _x_veh;
														};
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
			} forEach vehicles;

			// закрепление транспорта за игроком
			if(!isNil {_x_veh_best})then{
				if(isNil {_x_veh_best getVariable "transportPlayer"})then{
					/*
					если 2 верта
						private["_grp"];
						_grp = createGroup side group _Commander;
						{
							if (group _x == group _Commander) then {
								[_x] joinSilent _grp;
							};
						} forEach crew _x_veh_best;
						_grp selectLeader _Commander;
					*/
					_x_veh_best setVariable ["transportPlayer", _player];
					_player setVariable ["gosa_playerTransport", _x_veh_best];
					_veh = _x_veh_best;
					_grp = group effectiveCommander _veh;
					diag_log format ["Log: [heliTransport] %1 найден готовый транспорт, закрепление за игроком %2", _x_veh_best, _player];
				};
			};

		};


		private["_var_veh_pos"];
		_var_veh_pos = _veh getVariable "gosa_transportPosVeh";

		//--- есть запрос на игроке, используется для загрузки
		if(!isNil {_var_player_pos})then{
			_var_veh_pos = nil;
			diag_log format ["Log: [heliTransport] %1 есть запрос на игроке %2", _veh, _var_player_pos];
			if(_var_player_pos distance vehicle _player < 200)then{
				// есть запрос и игрок рядом с позицией сбора
				diag_log format ["Log: [heliTransport] %1 игрок рядом с позицией маршрута загрузки", _player];
				if(isNull _veh && count _heli_types > 0 && _createVehicle_lastTime+60 < time)then{
					// создание транспорта
					private["_pos_resp"];
					_pos_resp = ([getPos _player]+[3500,7000, -1, -1, (100 * (pi / 180)), 0, [], getPos _player, [false, 0]]+[side _player] call gosa_fnc_findSafePos) select 0;
					_grp = createGroup side _player;
					_veh = ([_pos_resp, random 360, _heli_types call BIS_fnc_selectRandom, _grp] call gosa_fnc_spawnVehicle) select 0;
					_veh setVariable ["transportPlayer", _player];
					_createVehicle_lastTime = time;
					diag_log format ["Log: [heliTransport] %1 создан новый транспорт, закрепление за игроком %2, time %3", _veh, _player, _createVehicle_lastTime];
				}else{
					//diag_log format ["Log: [heliTransport] новый транспорт %1 не создан %2, time %3", _veh, _player, time];
				};
				if(!isNull _veh)then{
					//создание маршрута сбора
					private["_pos2_destination"];
					_pos2_destination = _grp getVariable "gosa_transportwaypoint_created_GET_IN_pos";
					if(isNil {_pos2_destination} && _veh != vehicle _player)then{
						_grp setVariable ["grp_created_time", time];
						private["_gosa_fnc_waypoints"];
						_gosa_fnc_waypoints = _grp getVariable "_gosa_fnc_waypoints";
						if (!isNil {_gosa_fnc_waypoints}) then {
							if (scriptDone _gosa_fnc_waypoints) then {
								_grp setVariable ["_gosa_fnc_waypoints", nil];
							};
						};
						while {(count (waypoints _grp)) > 0} do {
							deleteWaypoint ((waypoints _grp) select 0);
						};
						_veh land "NONE";
						_veh setVariable ['gosa_transportPosVeh',nil];
						_wp = _grp addWaypoint [_var_player_pos, 0];
						_wp setWaypointType "LOAD";
						_wp setWaypointCombatMode "GREEN";
						_wp setWaypointStatements ["true", "vehicle this land 'GET IN'"];
						_grp setVariable ["gosa_transportwaypoint_created_GET_IN_pos", _var_player_pos];
						_veh setVariable ["gosa_transportwaypoint_created_GET_OUT_pos", nil];
						_veh land "NONE";
						diag_log format ["Log: [heliTransport] %1 новый маршрут загрузки создан, gosa_transportwaypoint_created_GET_IN_pos, %2, GREEN, LOAD, (vehicle this land 'GET IN')", _veh, _var_player_pos];
					}else{
						if(!isNil {_pos2_destination} && {_var_player_pos distance _pos2_destination > 10})then{
							_grp setVariable ["gosa_transportwaypoint_created_GET_IN_pos", nil];
							_veh setVariable ["gosa_transportwaypoint_created_GET_OUT_pos", nil];
							diag_log format ["Log: [heliTransport] %1 переназначение маршрута загрузки, gosa_transportwaypoint_created_GET_IN_pos nil, gosa_transportwaypoint_created_GET_OUT_pos nil", _veh];
						}else{
							diag_log format ["Log: [heliTransport] %1 маршрут загрузки уже создан %2", _veh, _pos2_destination];
						};
					};
				}else{
					diag_log format ["Log: [heliTransport] транспорт %1", _veh];
				};
			}else{
				diag_log format ["Log: [heliTransport] %1 игрок ушел с места сбора %2", _veh,_var_player_pos];
				if({group _x != group effectiveCommander _veh && alive effectiveCommander _veh}count crew _veh <= 0)then{
					// отсутствуют посторонние группы в транспорте
					// освобождение транспорта
					while {(count (waypoints _grp)) > 0} do {
						deleteWaypoint ((waypoints _grp) select 0);
					};
					_player setVariable ['gosa_transportPos',nil];
					_veh setVariable ['gosa_transportPosVeh',nil];
					_veh setVariable ["gosa_transportwaypoint_created_GET_OUT_pos", nil];
					_grp setVariable ["gosa_transportwaypoint_created_GET_IN_pos", nil];
					_veh setVariable ["transportPlayer", nil];
					_veh land "NONE";
					diag_log format ["Log: [heliTransport] %1, сброс-отмена", _veh];
				};
			};
		};

		//--- на технике есть запрошенная позиция, используется для выгрузки
		private["_var_veh_pos_wp_created"];
		if (!isNil {_var_veh_pos}) then {
			diag_log format ["Log: [heliTransport] %1 на технике есть запрошенная позиция выгрузки %2", _veh, _var_veh_pos];

			_var_veh_pos_wp_created = _veh getVariable "gosa_transportwaypoint_created_GET_OUT_pos";
			if(isNil {_var_veh_pos_wp_created})then{
				//создание маршрута высадки
				_grp setVariable ["grp_created_time", time];
				private["_gosa_fnc_waypoints"];
				_gosa_fnc_waypoints = _grp getVariable "_gosa_fnc_waypoints";
				if (!isNil {_gosa_fnc_waypoints}) then {
					if (scriptDone _gosa_fnc_waypoints) then {
						_grp setVariable ["_gosa_fnc_waypoints", nil];
					};
				};
				while {(count (waypoints _grp)) > 0} do {
					deleteWaypoint ((waypoints _grp) select 0);
				};
				_veh land "NONE";
				_player setVariable ["gosa_transportPos", nil];
				_grp setVariable ["gosa_transportwaypoint_created_GET_IN_pos", nil];
				_wp = _grp addWaypoint [_var_veh_pos, 0];
				_wp setWaypointType "UNLOAD";
				_wp setWaypointCombatMode "GREEN";
				_wp setWaypointStatements ["true", "vehicle this land 'GET OUT'"];
				_veh setVariable ["gosa_transportwaypoint_created_GET_OUT_pos", _var_veh_pos];
				_veh land "NONE";
				diag_log format ["Log: [heliTransport] %1 новый маршрут выгрузки создан, gosa_transportwaypoint_created_GET_OUT_pos, %2, GREEN, UNLOAD, (vehicle this land 'GET OUT')", _veh, _var_veh_pos];
			}else{
				if(_var_veh_pos distance _var_veh_pos_wp_created > 10)then{
					//новая позиция высадки
					//удаление маршрута высадки
					_veh setVariable ["gosa_transportwaypoint_created_GET_OUT_pos", nil];
					_grp setVariable ["gosa_transportwaypoint_created_GET_IN_pos", nil];
					diag_log format ["Log: [heliTransport] %1 переназначение позиции маршрута выгрузки", _veh];
				}else{
					diag_log format ["Log: [heliTransport] %1 маршрут выгрузки уже создан %2", _veh, _var_veh_pos_wp_created];
				};
			};
		};

		//--- отпуск транспорта, при завершении маршрута, _veh необходим
		if(!isNil {_var_veh_pos_wp_created})then{
			// есть позиция высадки
			if((_veh distance _var_veh_pos_wp_created) < 200)then{ // && ((_player distance _var_veh_pos_wp_created) > 100)
				// транспорт близко к пункту высадки
				if({group _x != group effectiveCommander _veh && alive effectiveCommander _veh}count crew _veh <= 0)then{
					diag_log format ["Log: [heliTransport] %1 пуст у места выгрузки %2", _veh, _var_veh_pos_wp_created];
					// отсутствуют посторонние группы в транспорте
					// освобождение транспорта
					while {(count (waypoints _grp)) > 0} do {
						deleteWaypoint ((waypoints _grp) select 0);
					};
					_veh land "NONE";
					_player setVariable ['gosa_transportPos',nil];
					_veh setVariable ['gosa_transportPosVeh',nil];
					_veh setVariable ["gosa_transportwaypoint_created_GET_OUT_pos", nil];
					_grp setVariable ["gosa_transportwaypoint_created_GET_IN_pos", nil];
					_veh setVariable ["transportPlayer", nil];
					diag_log format ["Log: [heliTransport] %1 сброс-отмена", _veh];
				};
			};
		};
	} forEach _players;
};
