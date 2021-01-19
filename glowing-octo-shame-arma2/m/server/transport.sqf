private["_players"];


while{true}do{

	// scopeName "main";

	sleep 2.5;

	if(isMultiplayer)then{
		_players = ([] call BIS_fnc_listPlayers);
	}else{
		_players = [player];
	};

	{
		private["_player"];
		_player = _x;

		// типы транспорта доступные для создания
		private["_heli_types"];
		switch (side _player) do {
			case west: {_heli_types = airTransportsWest};
			case east: {_heli_types = airTransportsEast};
			case resistance: {_heli_types = airTransportsGuer};
			default {_heli_types = []};
		};

		private["_veh","_grp"];
		_veh = objNull;

		// поиск закрепленного транспорта
		{
			private["_transportPlayer"];
			_transportPlayer = _x getVariable "transportPlayer";
			if(!isNil {_transportPlayer})then{
				// diag_log format ["transport.sqf поиск транспорт %1 закреплен за игроком %2", _x, _transportPlayer];
				if(canMove _x)then{
					// diag_log format ["transport.sqf поиск транспорт %1 закреплен за игроком %2, может двигаться", _x, _transportPlayer];
					if(alive effectiveCommander _x)then{
						// diag_log format ["transport.sqf транспорт %1 закреплен за игроком %2, жив effectiveCommander", _x, _transportPlayer];
						if!(effectiveCommander _x call fnc_isPlayer)then{
							// diag_log format ["transport.sqf поиск транспорт %1 закреплен за игроком %2, жив effectiveCommander", _x, _transportPlayer];
							if(_transportPlayer == _player && getDammage _x < 0.75)then{
								_veh = _x;
								_grp = group effectiveCommander _veh;
								// diag_log format ["transport.sqf поиск транспорт %1 закреплен за игроком %2, не поврежден", _x, _transportPlayer];
							};
						};
					};
				};
			};
		} forEach vehicles;

		// поиск готового транспорта
		if(isNull _veh)then{
			private["_x_veh","_x_veh_best","_dist","_Commander"];
			{
				_x_veh = _x;
				_Commander = effectiveCommander _x_veh;
				if(side _x_veh getFriend side _player >= 0.6)then{
					if(_x_veh isKindOf "Helicopter" or _x_veh isKindOf "MV22")then{
						if(alive _Commander)then{
							if({group _x != group _Commander}count crew _x_veh == 0)then{
								if({_x call fnc_isPlayer}count units _Commander == 0)then{
									if(canMove _x_veh)then{
										if(isNil {_x_veh getVariable "transportPlayer"})then{
											if(getDammage _x_veh < 0.75)then{
												if({_x call fnc_isPlayer}count crew _x_veh == 0)then{
													if(_x_veh emptyPositions "cargo" >= count units _player)then{
														private["_ok"];
														if (isNil {_dist}) then {
															_dist = _x_veh distance vehicle player;
															_ok = true;
														}else{
															_ok = false;
														};
														if (_ok or (_dist < _x_veh distance vehicle player)) then {
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
					private["_grp"];
					_grp = createGroup side group _Commander;
					{
						if (group _x == group _Commander) then {
							[_x] joinSilent _grp;
						};
					} forEach crew _x_veh_best;
					_grp selectLeader _Commander;
					_x_veh_best setVariable ["transportPlayer", _player];
					_veh = _x_veh_best;
					if (draga_loglevel > 0) then {
						diag_log format ["transport.sqf поиск транспорт %1 готовый, закрепление за игроком %2", _x_veh_best, _player];
					};
				};
			};

		};

		// позиция высадки, запись на техники
		private["_var_veh_pos"];
		_var_veh_pos = _veh getVariable "transportPos";
		// позиция сбора, запись на игроке
		private["_var_player_pos"];
		_var_player_pos = _player getVariable "transportPos";

		if(!isNil {_var_player_pos})then{
			// есть запрос на игроке
			if(_var_player_pos distance vehicle _player < 200)then{
				// есть запрос и игрок рядом с позицией сбора
				if(isNull _veh && count _heli_types > 0)then{
					// создание транспорта
					private["_pos_resp"];
					_pos_resp = ([getPos _player]+[3500,7000, -1, -1, (100 * (pi / 180)), 0, [], getPos _player, [false, 0]]+[side _player] call m_fnc_findSafePos) select 0;
					_grp = createGroup side _player;
					_veh = ([_pos_resp, random 360, _heli_types call BIS_fnc_selectRandom, _grp] call m_fnc_spawnVehicle) select 0;
					_veh setVariable ["transportPlayer", _player];
					if (draga_loglevel > 0) then {
						diag_log format ["transport.sqf транспорт %1 создан, закрепление за игроком %2", _veh, _player];
					};
				};
				if(!isNull _veh)then{
					//создание маршрута сбора
					private["_pos2_destination"];
					_pos2_destination = _grp getVariable "draga_transportwaypoint_created_GET_IN_pos";
					if(isNil {_pos2_destination})then{
						//создание маршрута сбора
						if (draga_loglevel > 0) then {
							diag_log format ["transport.sqf транспорт %1 движение к месту сбора", _veh];
						};
						_grp setVariable ["grp_created_time", time];
						private["_m_fnc_waypoints"];
						_m_fnc_waypoints = _grp getVariable "_m_fnc_waypoints";
						if (!isNil {_m_fnc_waypoints}) then {
							if (scriptDone _m_fnc_waypoints) then {
								_grp setVariable ["_m_fnc_waypoints", nil];
							};
						};
						while {(count (waypoints _grp)) > 0} do {
							deleteWaypoint ((waypoints _grp) select 0);
						};
						_veh land "NONE";
						_wp = _grp addWaypoint [_var_player_pos, 0];
						_wp setWaypointType "LOAD";
						_wp setWaypointCombatMode "GREEN";
						_wp setWaypointStatements ["true", "vehicle this land 'GET IN'"];
						_grp setVariable ["draga_transportwaypoint_created_GET_IN_pos", _var_player_pos];
						_veh setVariable ["draga_transportwaypoint_created_GET_OUT_pos", nil];
						_veh setVariable ["transportPos", nil];
						if (draga_loglevel > 0) then {
							diag_log format ["transport.sqf транспорт %1 движение к draga_transportwaypoint_created_GET_IN_pos, %2, GREEN, LOAD, (vehicle this land 'GET IN')", _veh, _var_player_pos];
						};
					}else{
						if(_var_player_pos distance _pos2_destination > 10)then{
							//новая позиция сбора
							//удаление маршрута сбора
							_grp setVariable ["draga_transportwaypoint_created_GET_IN_pos", nil];
							_veh setVariable ["draga_transportwaypoint_created_GET_OUT_pos", nil];
							if (draga_loglevel > 0) then {
								diag_log format ["transport.sqf транспорт %1, новое назначение, draga_transportwaypoint_created_GET_IN_pos nil, draga_transportwaypoint_created_GET_OUT_pos nil", _veh];
							};
						};
					};
				};
			};
		};


		private["_var_veh_pos_wp_created"];
		if (!isNil {_var_veh_pos}) then {
			// есть позиция высадки на технике
			_var_veh_pos_wp_created = _veh getVariable "draga_transportwaypoint_created_GET_OUT_pos";
			if(isNil {_var_veh_pos_wp_created})then{
				//создание маршрута высадки
				if (draga_loglevel > 0) then {
					diag_log format ["transport.sqf транспорт %1 движение к месту высадки", _veh];
				};
				_grp setVariable ["grp_created_time", time];
				private["_m_fnc_waypoints"];
				_m_fnc_waypoints = _grp getVariable "_m_fnc_waypoints";
				if (!isNil {_m_fnc_waypoints}) then {
					if (scriptDone _m_fnc_waypoints) then {
						_grp setVariable ["_m_fnc_waypoints", nil];
					};
				};
				while {(count (waypoints _grp)) > 0} do {
					deleteWaypoint ((waypoints _grp) select 0);
				};
				_veh land "NONE";
				_wp = _grp addWaypoint [_var_veh_pos, 0];
				_wp setWaypointType "UNLOAD";
				_wp setWaypointCombatMode "GREEN";
				_wp setWaypointStatements ["true", "vehicle this land 'GET OUT'"];
				_veh setVariable ["draga_transportwaypoint_created_GET_OUT_pos", _var_veh_pos];
				_grp setVariable ["draga_transportwaypoint_created_GET_IN_pos", nil];
				_player setVariable ["transportPos", nil];
				if (draga_loglevel > 0) then {
					diag_log format ["transport.sqf транспорт %1 движение к draga_transportwaypoint_created_GET_OUT_pos, %2, GREEN, UNLOAD, (vehicle this land 'GET OUT')", _veh, _var_veh_pos];
				};
			}else{
				if(_var_veh_pos distance _var_veh_pos_wp_created > 10)then{
					//новая позиция высадки
					//удаление маршрута высадки
					_veh setVariable ["draga_transportwaypoint_created_GET_OUT_pos", nil];
					_grp setVariable ["draga_transportwaypoint_created_GET_IN_pos", nil];
					if (draga_loglevel > 0) then {
						diag_log format ["transport.sqf транспорт %1, новое назначение на технике, draga_transportwaypoint_created_GET_OUT_pos nil, draga_transportwaypoint_created_GET_IN_pos nil", _veh];
					};
				};
			};
		};

		// освобождение транспорта
		if(!isNil {_var_veh_pos_wp_created})then{
			// есть позиция высадки
			if((_veh distance _var_veh_pos_wp_created) < 200)then{ // && ((_player distance _var_veh_pos_wp_created) > 100)
				// транспорт близко к пункту высадки
				if({group _x != group effectiveCommander _veh && alive effectiveCommander _veh}count crew _veh <= 0)then{
					// отсутствуют посторонние группы в транспорте
					// освобождение транспорта
					while {(count (waypoints _grp)) > 0} do {
						deleteWaypoint ((waypoints _grp) select 0);
					};
					_veh land "NONE";
					_player setVariable ['transportPos',nil];
					_veh setVariable ['transportPos',nil];
					_veh setVariable ["draga_transportwaypoint_created_GET_OUT_pos", nil];
					_grp setVariable ["draga_transportwaypoint_created_GET_IN_pos", nil];
					if (draga_loglevel > 0) then {
						diag_log format ["transport.sqf транспорт %1, сброс, отмена", _veh];
					};
				};
			};
		};
	} forEach _players;
};
