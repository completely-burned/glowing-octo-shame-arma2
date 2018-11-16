waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "sizeLocation"};
while{true}do{
	{
		private["_grp","_leader"];
		_grp = _x;
		_leader = leader _grp;

		private["_time"];
		_time = (_grp getVariable "grp_created_time");
		if ( isNil "_time" ) then {
			_time = time;
			_grp setVariable ["grp_created_time", _time];
		};

		private["_currentWP","_waypoints","_createWP","_leaderPos"];
		_currentWP = currentWaypoint _grp;
		_waypoints = waypoints _grp;
		_createWP = false;
		_leaderPos = getPos vehicle _leader;

		if(isPlayer _leader)then{
			while {(count (waypoints _grp)) > 0} do
			{
				deleteWaypoint ((waypoints _grp) select 0);
			};
		}else{
			if(!isNil {_grp getVariable "grp_created"})then{
				// _grp call draga_fnc_arty;
				private["_cleanup"];
				_cleanup = _grp getVariable "_cleanup";
				if(isNil "_cleanup")then{
					_cleanup = [getPos vehicle _leader,time+40,time+120,waypointPosition [_grp,_currentWP]];
					_grp setVariable ["_cleanup",_cleanup];
				}else{
					private["_oldPos","_oldTime","_oldTime2","_oldPosWP"];
					_oldPos = _cleanup select 0;
					_oldTime = _cleanup select 1;
					_oldTime2 = _cleanup select 2;
					_oldPosWP = _cleanup select 3;
					private["_pos"];
					_pos = getPos vehicle _leader;
					private["_true"];
					_true = false;
					if([waypointPosition [_grp,_currentWP], _oldPosWP] call BIS_fnc_distance2D < 5 )then{
						if!(_true)then{
							if(waypointType [_grp, _currentWP] in ["SUPPORT"])then{
								_cleanup = [getPos vehicle _leader,time+40,time+120,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							};
						};
						if!(_true)then{
							if(currentCommand _leader == "FIRE AT POSITION")then{
								_cleanup = [getPos vehicle _leader,time+40,time+120,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							};
						};
						if!(_true)then{
							if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{
								_cleanup = [getPos vehicle _leader,time+40,time+120,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							};
						};
						if!(_true)then{
							if(_oldTime < time)then{
								if(_oldPos distance _pos >= 1)then{
									_cleanup = [getPos vehicle _leader,time+40,time+120,waypointPosition [_grp,_currentWP]];
									_grp setVariable ["_cleanup",_cleanup];
									_true = true;
								}else{
									while {(count (waypoints _grp)) > 0} do
									{
										deleteWaypoint ((waypoints _grp) select 0);
									};
									_cleanup = [getPos vehicle _leader,time+40,_oldTime2,waypointPosition [_grp,_currentWP]];
									_grp setVariable ["_cleanup",_cleanup];
									_true = true;
								};
							};
						};
						if(_oldTime2 < time)then{
								{_x setVariable ["time", 0]}forEach units _grp;
								_true = true;
						};
					}else{
						_cleanup = [getPos vehicle _leader,time+40,time+120,waypointPosition [_grp,_currentWP]];
						_grp setVariable ["_cleanup",_cleanup];
					};
				};

				if(count waypoints _grp == 0)then{
					private["_timeNoWP"];
					_timeNoWP = _grp getVariable "_timeNoWP";
					if(isNil "_timeNoWP")then{
						_timeNoWP = time;
						_grp setVariable ["_timeNoWP", _timeNoWP];
					}else{
						if(time > _timeNoWP + 10)then {
							_createWP = true;
							_grp setVariable ["_timeNoWP", nil];
						};
					};
				};
			}else{
				if ( _time + 30 < time )then {
					_grp setVariable ["grp_created",true];
				};
			};

			private["_wp"];
			if(_createWP)then{
				private["_m_fnc_waypoints"];
				_m_fnc_waypoints = _grp getVariable "_m_fnc_waypoints";
				if (isNil {_m_fnc_waypoints}) then {
					_m_fnc_waypoints = [_leader] spawn m_fnc_waypoints;
					_grp setVariable ["_m_fnc_waypoints", _m_fnc_waypoints];
				}else{
					if (scriptDone _m_fnc_waypoints) then {
						_grp setVariable ["_m_fnc_waypoints", nil];
					};
				};
			};

			_wp = [_grp,_currentWP];
			private["_wpStatements"];
			_wpStatements = "if(!isNil {this})then{group this setVariable ['_grp_wp_completed',true]; [this,true] call m_fnc_waypoints}";
			if!(waypointStatements _wp select 1 in [_wpStatements,"vehicle this land 'GET IN'","vehicle this land 'GET OUT'"])then{
				_wp setWaypointStatements ["true", _wpStatements];
			};
		};
	}forEach allGroups;
	sleep 1;
};
