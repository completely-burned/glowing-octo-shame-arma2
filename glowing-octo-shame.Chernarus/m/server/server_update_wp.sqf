while{true}do{
  {
    private["_grp"];
    _grp=_x;
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
            _grp spawn {
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
            _grp spawn {
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
            _grp spawn {
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
              _this setVariable ["UNLOAD",nil];
            };
          };
        };
      };
      if (_typeWP in ["GETOUT"]) then {
        if ((_leaderPos distance waypointPosition _wp < 400) or _grp_wp_completed) then {
          if (isNil {_grp getVariable "GETOUT"}) then {
            _grp setVariable ["GETOUT",true];
            _grp spawn {
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
              _this setVariable ["GETOUT",nil];
            };
          };
        };
      };
    };

    _grp setVariable ["_grp_wp_completed",nil];

  } forEach allGroups;
  sleep 0.01;
};
