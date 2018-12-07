while{!isNull _this}do{
  if (true) then {
    private["_grp"];
    _grp=_this;
    private["_leader"];
    _leader = leader _grp;

    private["_leaderPos"];
    _leaderPos = getPos vehicle _leader;

    private["_currentWP","_wp","_typeWP"];
  	_currentWP = currentWaypoint _grp;
  	_wp = [_grp,_currentWP];
  	_typeWP = waypointType _wp;

    private ["_units","_vehicles","_types"];
  	_units = units _grp;
  	_vehicles = [];
  	_types = [];
  	{
  		_types set [count _types, typeOf _x];
  		private ["_veh"];
  		_veh = vehicle _x;
  		if(_veh != _x)then{
  			if!(_veh in _vehicles)then{
  				_vehicles set [count _vehicles, _veh];
  				_types set [count _types, typeOf _veh];
  			};
  		};
  	}forEach _units;

    private["_Submarine"];
  	if({toLower getText(LIB_cfgVeh >> _x >> "vehicleClass") == "submarine"} count _types > 0)then{_Submarine = true}else{_Submarine = false};

    private ["_Helicopter"];
    _Helicopter = ([_vehicles, ["Helicopter"]] call m_fnc_CheckIsKindOfArray);

    private ["_Plane"];
    _Plane = ([_vehicles, ["Plane"]] call m_fnc_CheckIsKindOfArray);

    private ["_Ship"];
    _Ship = ([_vehicles, ["Ship"]] call m_fnc_CheckIsKindOfArray);

    _grp_wp_completed = !isNil {_grp getVariable "_grp_wp_completed"};

    if (_Submarine) then {
      if (_typeWP in ["UNLOAD","GETOUT"]) then {
        if ((_leaderPos distance waypointPosition _wp < 400) or _grp_wp_completed) then {
          if (isNil {_grp getVariable "GETOUT"}) then {
            _grp setVariable ["GETOUT",true];
            _grp call {
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
        				_veh stop true;
        				while{(!isNull _veh) && (alive _veh) && (speed _veh >= 1)}do{};
        				{
        					private["_unit"];
        					_unit = _x;
        					_unit action ["Eject", _veh];
        					while{(_unit in _veh) && (alive _veh) && (alive _unit)}do{};
        					_unit leaveVehicle _veh;
        				}forEach crew _veh;
        				_veh stop false;
        			}forEach _vehicles;
              while {(count (waypoints _this)) > 0} do {
        				deleteWaypoint ((waypoints _this) select 0);
        			};
              _this setVariable ["GETOUT",nil];
            };
          };
        };
      };
    };

    if (_Helicopter) then {
      if (_typeWP in ["UNLOAD"]) then {
        if ((_leaderPos distance waypointPosition _wp < 1000) or _grp_wp_completed) then {
          if (isNil {_grp getVariable "UNLOAD"}) then {
            _grp setVariable ["UNLOAD",true];
            _grp call {
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
                  if(group _x != _this)then{
    								_x leaveVehicle _veh;
                  };
  							}forEach crew _veh;
        			}forEach _vehicles;
              while {(count (waypoints _this)) > 0} do {
        				deleteWaypoint ((waypoints _this) select 0);
        			};
              _this setVariable ["UNLOAD",nil];
            };
          };
        };
      };
      if (_typeWP in ["GETOUT"]) then {
        if ((_leaderPos distance waypointPosition _wp < 400) or _grp_wp_completed) then {
          if (isNil {_grp getVariable "GETOUT"}) then {
            _grp setVariable ["GETOUT",true];
            _grp call {
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
  							}forEach crew _veh;
        			}forEach _vehicles;
              while {(count (waypoints _this)) > 0} do {
        				deleteWaypoint ((waypoints _this) select 0);
        			};
              _this setVariable ["GETOUT",nil];
            };
          };
        };
      };
    };

    if (_Plane) then {
      if (_typeWP in ["UNLOAD","GETOUT"]) then {
        if ((_leaderPos distance waypointPosition _wp < 1000) or _grp_wp_completed) then {
          if (isNil {_grp getVariable "UNLOAD"}) then {
            _grp setVariable ["UNLOAD",true];
            _grp call {
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
  								_x action ["Eject", _veh];
  								_x leaveVehicle _veh;
                  sleep 0.5;
  							}forEach assignedCargo _veh;
        			}forEach _vehicles;
              while {(count (waypoints _this)) > 0} do {
        				deleteWaypoint ((waypoints _this) select 0);
        			};
              _this setVariable ["UNLOAD",nil];
            };
          };
        };
      };
    };

    if (_Ship) then {
      if (_typeWP in ["UNLOAD"]) then {
        if ((_leaderPos distance waypointPosition _wp < 400) or _grp_wp_completed) then {
          if (isNil {_grp getVariable "UNLOAD"}) then {
            _grp setVariable ["UNLOAD",true];
            _grp call {
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
      					}forEach assignedCargo _veh;
      				}forEach _vehicles;
              {
                private["_veh"];
      					_veh = _x;
                while {({alive _x} count _units > 0) && !isNull _this && ({alive _x} count (crew _veh)-_units > 0)} do {
                    sleep 1;
                };
              }forEach _vehicles;
              sleep 5;
              while {(count (waypoints _this)) > 0} do {
        				deleteWaypoint ((waypoints _this) select 0);
        			};
              _this setVariable ["UNLOAD",nil];
            };
          };
        };
      };
      if (_typeWP in ["GETOUT"]) then {
        if ((_leaderPos distance waypointPosition _wp < 400) or _grp_wp_completed) then {
          if (isNil {_grp getVariable "GETOUT"}) then {
            _grp setVariable ["GETOUT",true];
            _grp call {
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
              while {(count (waypoints _this)) > 0} do {
        				deleteWaypoint ((waypoints _this) select 0);
        			};
              _this setVariable ["GETOUT",nil];
            };
          };
        };
      };
    };
  };
  if (true) then {
		private["_grp","_leader"];
		_grp = _this;
		_leader = leader _grp;

    private["_grp_wp_completed"];
    _grp_wp_completed = !isNil {_grp getVariable "_grp_wp_completed"};

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

    if (!_grp_wp_completed) then {
      if([waypointPosition [_grp,_currentWP], _leaderPos] call BIS_fnc_distance2D < 15 )then{
        _grp_wp_completed = true;
      };
    };

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
					_cleanup = [getPos vehicle _leader,time+30,time+120,waypointPosition [_grp,_currentWP]]; // инит
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
					if([waypointPosition [_grp,_currentWP], _oldPosWP] call BIS_fnc_distance2D < 5 )then{ // если маршрут не менялся
						if!(_true)then{
							if(waypointType [_grp, _currentWP] in ["SUPPORT"])then{ // поддержка
								_cleanup = [getPos vehicle _leader,time+30,time+120,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							};
						};
						if!(_true)then{
							if(currentCommand _leader == "FIRE AT POSITION")then{ // артиллерия
								_cleanup = [getPos vehicle _leader,time+30,time+120,waypointPosition [_grp,_currentWP]];
								_grp setVariable ["_cleanup",_cleanup];
								_true = true;
							};
						};
						if!(_true)then{
							if(_oldTime < time)then{ // 1 таймер
								if(_oldPos distance _pos >= 5)then{ // сдвинулись
                  if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{ // на точке
  									_cleanup = [getPos vehicle _leader,time+120,time+240,waypointPosition [_grp,_currentWP]];// 1 и 2 таймер обновление
  									_grp setVariable ["_cleanup",_cleanup];
  									_true = true;
                  }else{
                    _cleanup = [getPos vehicle _leader,time+30,time+120,waypointPosition [_grp,_currentWP]];// 1 и 2 таймер обновление
  									_grp setVariable ["_cleanup",_cleanup];
  									_true = true;
                  };
								}else{
									while {(count (waypoints _grp)) > 0} do // не сдвинулись
									{
										deleteWaypoint ((waypoints _grp) select 0); // для создание другого маршрута
									};
                  if((vehicle _leader distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation))then{ // на точке
  									_cleanup = [getPos vehicle _leader,time+120,time+240,waypointPosition [_grp,_currentWP]]; // 1 таймер обновление
  									_grp setVariable ["_cleanup",_cleanup];
  									_true = true;
                  }else{
                    _cleanup = [getPos vehicle _leader,time+30,_oldTime2,waypointPosition [_grp,_currentWP]]; // 1 таймер обновление
  									_grp setVariable ["_cleanup",_cleanup];
  									_true = true;
                  };
                };
							};
						};
						if(_oldTime2 < time)then{ // 2 таймер
								{_x setVariable ["time", 0]}forEach units _grp; // на удаление
								_true = true;
						};
					}else{ // если маршрут изменился
						_cleanup = [getPos vehicle _leader,_oldTime,_oldTime2,waypointPosition [_grp,_currentWP]]; // обновление позиции
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
						if(time > _timeNoWP + 5)then {
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

			if(_createWP or _grp_wp_completed)then{
        _grp setVariable ['_grp_wp_completed',nil];
        while {(count (waypoints _grp)) > 0} do {
          deleteWaypoint ((waypoints _grp) select 0);
        };
				 [_leader] call m_fnc_waypoints;
			};

      private["_wp"];
			_wp = [_grp,_currentWP];
			private["_wpStatements"];
			_wpStatements = "if(!isNil {this})then{group this setVariable ['_grp_wp_completed',true]}";
			if!(waypointStatements _wp select 1 in [_wpStatements,"vehicle this land 'GET IN'","vehicle this land 'GET OUT'"])then{
				_wp setWaypointStatements ["true", _wpStatements];
			};
		};
  };


  sleep 1;
};
