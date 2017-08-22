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

		if({isPlayer _x or _x in playableUnits} count units _grp == 0)then{

			if(!isNil {_grp getVariable "grp_created"})then{
				// _grp call draga_fnc_arty;
				private["_cleanup"];
				_cleanup = _grp getVariable "_cleanup";
				if(isNil "_cleanup")then{
					_cleanup = [getPos vehicle _leader,time+40,time+120];
					_grp setVariable ["_cleanup",_cleanup];
					_createWP = true;
				}else{
					private["_oldPos","_oldTime","_oldTime2"];
					_oldPos = _cleanup select 0;
					_oldTime = _cleanup select 1;
					_oldTime2 = _cleanup select 2;
					private["_pos"];
					_pos = getPos vehicle _leader;
					private["_true"];
					_true = false;
					if!(_true)then{
						if(waypointType [_grp, _currentWP] in ["SUPPORT"])then{
							_cleanup = [getPos vehicle _leader,time+40,time+120];
							_grp setVariable ["_cleanup",_cleanup];
							_true = true;
						};
					};
					if!(_true)then{
						if(currentCommand _leader == "FIRE AT POSITION")then{
							_cleanup = [getPos vehicle _leader,time+40,time+120];
							_grp setVariable ["_cleanup",_cleanup];
							_true = true;
						};
					};
					if!(_true)then{
						if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{
							_cleanup = [getPos vehicle _leader,time+40,time+120];
							_grp setVariable ["_cleanup",_cleanup];
							_true = true;
						};
					};
					if!(_true)then{
						if(_oldTime < time)then{
							if(_oldPos distance _pos >= 1)then{
								_cleanup = [getPos vehicle _leader,time+40,time+120];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							}else{
								_createWP = true;
								deleteWaypoint [_grp,_currentWP];
								_cleanup = [getPos vehicle _leader,time+40,_oldTime2];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							};
						};
					};
					if(_oldTime2 < time)then{
							{_x setVariable ["time", 0]}forEach units _grp;
							_true = true;
					};
				};
			}else{
				if ( _time + 30 < time )then {
					_grp setVariable ["grp_created",true];
				};
			};

			private["_wp"];
			if(_createWP)then{
				[_leader] call m_fnc_waypoints;
			};

			_wp = [_grp,_currentWP];
			private["_wpStatements"];
			_wpStatements = "if(!isNil {this})then{[this,true] call m_fnc_waypoints}";
			if(waypointStatements _wp select 1 != _wpStatements)then{
				_wp setWaypointStatements ["true", _wpStatements];
			};
		};
	}forEach allGroups;
	sleep 1;
};
