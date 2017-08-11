waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "sizeLocation"};
while{true}do{
	{
		private["_grp","_leader"];
		_grp = _x;
		_leader = leader _grp;
		if({isPlayer _x} count units _grp == 0)then{
			// _grp call draga_fnc_arty;
			private["_cleanup"];
			_cleanup = _grp getVariable "_cleanup";
			if(isNil "_cleanup")then{
				[_grp] call m_fnc_waypoints;
				_cleanup = [getPos vehicle _leader,time+20,time+120];
				_grp setVariable ["_cleanup",_cleanup];
			}else{
				if(behaviour _leader in ["CARELESS", "SAFE", "AWARE"])then{
					private["_oldPos","_oldTime","_oldTime2"];
					_oldPos = _cleanup select 0;
					_oldTime = _cleanup select 1;
					_oldTime2 = _cleanup select 2;
					private["_pos"];
					_pos = getPos vehicle _leader;
					private["_true"];
					_true = false;
					if!(_true)then{
						if(waypointType [_grp, currentwaypoint _grp] in ["SUPPORT"])then{
							_cleanup = [getPos vehicle _leader,time+20,time+120];
							_grp setVariable ["_cleanup",_cleanup];
							_true = true;
						};
					};
					if!(_true)then{
						if(currentCommand _leader == "FIRE AT POSITION")then{
							_cleanup = [getPos vehicle _leader,time+20,time+120];
							_grp setVariable ["_cleanup",_cleanup];
							_true = true;
						};
					};
					if!(_true)then{
						if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{
							_cleanup = [getPos vehicle _leader,time+20,time+120];
							_grp setVariable ["_cleanup",_cleanup];
							_true = true;
						};
					};
					if!(_true)then{
						if(_oldTime < time)then{
							if(_oldPos distance _pos >= 20)then{
								_cleanup = [getPos vehicle _leader,time+20,time+120];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							}else{
								[_grp] call m_fnc_waypoints;
								_cleanup = [getPos vehicle _leader,time+20,_oldTime2];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							};
						};
					};
						if(_oldTime2 < time)then{
								{_x setVariable ["time", time]}forEach units _grp;
								_true = true;
						};
				}else{
					_cleanup = [getPos vehicle _leader,time+20,time+120];
					_grp setVariable ["_cleanup",_cleanup];
				};
			};
		};
	}forEach allGroups;
	sleep 1;
};
