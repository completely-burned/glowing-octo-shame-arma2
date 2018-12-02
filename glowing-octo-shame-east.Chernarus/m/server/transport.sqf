private["_players"];
 while{true}do{
 	if(isMultiplayer)then{_players = playableUnits}else{_players = [player]};
 	{
		private["_player"];
	  _player = _x;
 		private["_heli_types"];
		switch (side _player) do {
	    case west: {_heli_types = airTransportsWest};
			case east: {_heli_types = airTransportsEast};
			case resistance: {_heli_types = airTransportsGuer};
	    default {_heli_types = []};
	};
 	private["_veh","_grp"];
	_veh = objNull; // поиск закрепленного транспорта
	{
		private["_transportPlayer"];
		_transportPlayer = _x getVariable "transportPlayer";
		if(!isNil {_transportPlayer})then{
			if(canMove _x)then{
				if(alive effectiveCommander _x)then{
          if(!isPlayer effectiveCommander _x)then{
  					if(_transportPlayer == _player && getDammage _x < 0.75)then{
    						_veh = _x;
    						_grp = group effectiveCommander _veh;
  					}else{
              private["_grpwpdel"];
              _grpwpdel = group effectiveCommander _x;
              _grpwpdel setVariable ["_m_fnc_waypoints", nil];
              private["_m_fnc_waypoints"];
        			_m_fnc_waypoints = _grpwpdel getVariable "_m_fnc_waypoints";
        			if (!isNil {_m_fnc_waypoints}) then {
        				if (scriptDone _m_fnc_waypoints) then {
        					_grpwpdel setVariable ["_m_fnc_waypoints", nil];
        				};
        			};
        			while {(count (waypoints _grpwpdel)) > 0} do {
        				deleteWaypoint ((waypoints _grpwpdel) select 0);
        			};
              _x land "NONE";
            };
          };
				};
			};
		};
	} forEach vehicles; // поиск закрепленного транспорта
 	if(isNull _veh)then{ // поиск готового транспорта
		{
			private["_x_veh"];
			_x_veh = _x;
			if(side _x_veh getFriend side _player >= 0.6)then{
				if(_x_veh isKindOf "Helicopter" or _x_veh isKindOf "MV22")then{
          if({group _x != group effectiveCommander _veh && alive effectiveCommander _veh}count crew _veh <= 0)then{
            if({isPlayer _x}count units effectiveCommander _veh <= 0)then{
  						if(canMove _x_veh)then{
  							if(isNil {_x_veh getVariable "transportPlayer"})then{
  								if(getDammage _x_veh < 0.75)then{
  									if({isPlayer _x}count crew _x_veh == 0)then{
  										_veh = _x_veh;
  										_grp = createGroup side group effectiveCommander _veh;
  										crew _veh join _grp;
  										_veh setVariable ["transportPlayer", _player];
  									};
  								};
  							};
  						};
            };
          };
				};
			};
		} forEach vehicles;
	};
 	private["_pos_veh"];
	_pos_veh = _veh getVariable "transportPos";
	private["_pos"];
	_pos = _player getVariable "transportPos";
 	// есть запрос и игрок рядом
	if(!isNil {_pos})then{
		if(_pos distance vehicle _player < 200)then{
 			// создание транспорта
			if(isNull _veh && count _heli_types > 0)then{
				private["_pos_resp"];
				_pos_resp = ([getPos _player]+[3500,7000, -1, -1, (100 * (pi / 180)), 0, [], getPos _player, false]+[side _player] call m_fnc_findSafePos);
				_grp = createGroup side _player;
				_veh = ([_pos_resp, random 360, _heli_types call BIS_fnc_selectRandom, _grp] call m_fnc_spawnVehicle) select 0;
				_veh setVariable ["transportPlayer", _player];
			};
 			if(!isNull _veh)then{
				//создание маршрута сбора
				private["_pos2"];
				_pos2 = _grp getVariable "draga_GET_IN_pos";
				if(isNil {_pos2})then{ // маршрут создан?
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
					_wp = _grp addWaypoint [_pos, 0];
					_wp setWaypointType "LOAD";
					_wp setWaypointCombatMode "GREEN";
					_wp setWaypointStatements ["true", "vehicle this land 'GET IN'; "];
					_grp setVariable ["draga_GET_IN_pos", _pos];
					_veh setVariable ["draga_GET_OUT_pos", nil];
					_veh setVariable ["transportPos", nil];
				}else{ //проверка маршрута
					if(_pos distance _pos2 > 10)then{
						_grp setVariable ["draga_GET_IN_pos", nil];
						_veh setVariable ["draga_GET_OUT_pos", nil];
					};
				};
			};
		};
	};
 	// есть маршрут высадки
	if (!isNil {_pos_veh}) then {
		private["_pos2"];
		_pos2 = _veh getVariable "draga_GET_OUT_pos";
		if(isNil {_pos2})then{ //создание маршрута высадки
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
			_wp = _grp addWaypoint [_pos_veh, 0];
			_wp setWaypointType "UNLOAD";
			_wp setWaypointCombatMode "GREEN";
			_wp setWaypointStatements ["true", "vehicle this land 'GET OUT'"];
			_veh setVariable ["draga_GET_OUT_pos", _pos_veh];
			_grp setVariable ["draga_GET_IN_pos", nil];
			_player setVariable ["transportPos", nil];
		}else{ // проверка маршрута высадки и завершение
			if(_pos_veh distance _pos2 > 10)then{
				_veh setVariable ["draga_GET_OUT_pos", nil];
				_grp setVariable ["draga_GET_IN_pos", nil];
			};
			if({group _x != group effectiveCommander _veh && alive effectiveCommander _veh}count crew _veh <= 0)then{
 				while {(count (waypoints _grp)) > 0} do {
					deleteWaypoint ((waypoints _grp) select 0);
				};
				_veh land "NONE";
				_player setVariable ['transportPos',nil];
				_veh setVariable ['transportPos',nil];
				_veh setVariable ["draga_GET_OUT_pos", nil];
				_grp setVariable ["draga_GET_IN_pos", nil];
			};
		};
	};
} forEach _players;
 	sleep 2.5;
};
