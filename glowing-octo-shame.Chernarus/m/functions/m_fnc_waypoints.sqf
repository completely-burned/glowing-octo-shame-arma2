private ["_grp"];
_grp = (_this select 0);
if(!isNil "_grp")then{

	_grp setVariable ["_newWP",true];

	private ["_leader","_units","_vehicles"];
	_leader = leader _grp;
	_units = units _grp;
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

	private["_wp","_typeWP"];
	_wp = [_grp,currentWaypoint _grp];
	_typeWP = waypointType _wp;

	if(_typeWP == "UNLOAD")then{
		private ["_Plane"];
		_Plane = ([_vehicles, ["Plane"]] call m_fnc_CheckIsKindOfArray);
		if(_Plane or true)then{
			{
				if(isNil {_x getVariable "_landing"})then{
					_x setVariable ["_landing",true];
					_x spawn {
						{
							sleep 0.5;
							_x action ["Eject", _this];
							_x leaveVehicle _this;
						}forEach assignedCargo _this;
						_this setVariable ["_landing",nil];
					};
				};
			}forEach _vehicles
		}else{
			{
				private["_veh"];
				_veh = _x;
				{
					_x leaveVehicle _veh;
				}forEach assignedCargo _veh;
			}forEach _vehicles
		};
	};

	if(_typeWP == "GETOUT")then{
		private ["_Plane"];
		_Plane = ([_vehicles, ["Plane"]] call m_fnc_CheckIsKindOfArray);
		if(_Plane or true)then{
			{
				if(isNil {_x getVariable "_landing"})then{
					_x setVariable ["_landing",true];
					_x spawn {
						{
							sleep 0.5;
							_x action ["Eject", _this];
							_x leaveVehicle _this;
						}forEach crew _this;
						_this setVariable ["_landing",nil];
					};
				};
			}forEach _vehicles
		}else{
			{
				private["_veh"];
				_veh = _x;
				{
					_x leaveVehicle _veh;
				}forEach crew _veh;
			}forEach _vehicles
		};
	};
};