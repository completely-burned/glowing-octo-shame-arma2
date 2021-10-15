	diag_log format ["fnc_waypoints.sqf start %1", _this];
private["_leader"];
_leader = (_this select 0);
if(!isNil "_leader")then{
	_grp = group _leader;

	private["_grp","_leaderPos",
		"_units","_vehicles","_landing","_types","_assignedVehicles",
		"_veh","_assignedVehicle","_wp","_patrol","_pos",
		"_maxDist","_WaypointCompletionRadius","_SpeedMode",
		"_WaypointType","_z","_grp_type"
	];

	_landing = false;

	_leaderPos = getPos vehicle _leader;

	if (count _this > 2) then {
		_units = _this select 1;
		_grp_type = _this select 2 select 0;
		_vehicles = _this select 2 select 1;
		_assignedVehicles = _this select 2 select 2;
		_cargo = _this select 2 select 3;
		_types = _this select 2 select 4;
		_grp = _this select 2 select 5;
	}else{

	_units = units _grp;
	_vehicles = [];
	_types = [];
	_assignedVehicles = [];
	{
		_types set [count _types, typeOf _x];
		_veh = vehicle _x;
		_assignedVehicle = assignedVehicle _x;

		if (isNull _assignedVehicle) then {
			_assignedVehicle = _x getVariable "assignedVehicle";
		};
		if (isNil {_assignedVehicle}) then {_assignedVehicle = objNull};

		if (!isNull _assignedVehicle) then {
			_assignedVehicles set [count _assignedVehicles, _veh];
		};
		if(_veh != _x)then{
			if!(_veh in _vehicles)then{
				if (group effectiveCommander _veh == _grp) then {
					_vehicles set [count _vehicles, _veh];
					_types set [count _types, typeOf _veh];
				};
			};
		};
	}forEach _units;

		if(waypointType [_grp, currentWaypoint _grp] == "SUPPORT")then{
			if({count assignedVehicleRole _x > 0} count _units > 0)then{
				_grp_type set [count _grp_type, _z];
			};
		};
	};

	{
		_veh = _x;
		if({_z = group _x; _z != _grp && !isNull _z}count crew _veh > 0)then{ // FIXME: возможно из-за grpNull был true
			_landing = true;
		};
	} forEach _vehicles;

	if (_landing) then { // diag_log
		diag_log format ["gosa_fnc_waypoints.sqf %1 landing %2", _grp, _vehicles];
	}; // diag_log

	if(true)then{

		for "_i" from count waypoints _grp - 1 to 0 step -1 do {
				diag_log format ["gosa_fnc_waypoints.sqf %1 удаление wp #%2", _grp, _i ];
			deleteWaypoint [_grp, _i];
		};

		// private["_WaypointCombatMode"];
		// _WaypointCombatMode = "YELLOW";

		// private["_WaypointBehaviour"];
		// _WaypointBehaviour = "AWARE";

		_patrol = _grp getVariable "patrol";
		if (!IsNil "_patrol") then {_patrol = true}else{_patrol = false};

		_pos=civilianBasePos;

		if("UAV" in _grp_type)then{
			// _WaypointCombatMode = "BLUE";
			// _WaypointBehaviour = "CARELESS";
		};
		if("Air" in _grp_type)then{
			_maxDist = 4000;
			_WaypointCompletionRadius = 500;
			// _SpeedMode = "FULL";
			// _WaypointCombatMode = "RED";
		}else{
			_maxDist = sizeLocation ;
			_WaypointCompletionRadius = 50;
			// _SpeedMode = "NORMAL";
		};

		// ПВО
		if("AA" in _grp_type)then{
			_maxDist = 200;
			_WaypointCompletionRadius = 1000;
		};

		// патруль
		if(_patrol)then{

			_pos = getPos ([] call BIS_fnc_listPlayers call BIS_fnc_selectRandom);

			if([_pos, [0,0]] call BIS_fnc_distance2D < 1 )then{
					diag_log format ["gosa_fnc_waypoints.sqf %1  позиция wp [0,0] удаление, _pos = _leaderPos", _grp ];
				_pos = _leaderPos;
			};

			_maxDist = ((_maxDist * 10) max 1500);
		};

		// артиллерия
		if("Artillery" in _grp_type)then{
			_pos = _leaderPos;
			_maxDist = ((_maxDist * 10) max 1500);
		};

		// десант
		if(_landing && "Air" in _grp_type)then{
			_pos = civilianBasePos;
			_maxDist = sizeLocation*2;
			_WaypointCompletionRadius = _maxDist;
			// _SpeedMode = "NORMAL";
		};

		// лодки та точке
		if(_landing && "Ship" in _grp_type)then{
			_pos = civilianBasePos;
			_maxDist = sizeLocation*2;
			_WaypointCompletionRadius = 400;
			// _SpeedMode = "NORMAL";
		};

		// грузовики поддержки
		_WaypointType = "MOVE";
		if("SUPPORT" in _grp_type)then{
			_WaypointType = "SUPPORT";
			_pos = _leaderPos;
			_maxDist = -1;
		};

		// лодки позиция маршрута
		if("Ship" in _grp_type)then{

				diag_log format ["fnc_waypoints.sqf Ship %1", _this];

			if!(_patrol)then{
				if({getNumber(LIB_cfgWea >> currentWeapon _x >> "enableAttack")==0} count _vehicles > 0)then{
					_landing = true;
				};
			};

			private["_true","_dir","_dist2","_testPos","_limit"];
			if(_landing)then{
				_true = true;
				_testPos = [];
				_limit = 1000;
				while {_limit > 0 && _true && ({alive _x} count _units > 0)} do {
					_dir = random 360;
					_dist2 = random _maxDist;
					_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
					_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 0, true]);
					if(count _testPos > 0 or (({alive _x} count _units) == 0))then {_true = false};
				};
				if(count _testPos > 0)then {_pos = _testPos; _maxDist = 0};
				_limit = _limit -1;
			}else{
				_true = true;
				_testPos = [];
				_limit = 1000;
				while {_limit > 0 && _true && ({alive _x} count _units > 0)} do {
					_dir = random 360;
					_dist2 = random _maxDist;
					_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
					_testPos = (_testPos isFlatEmpty [-1, -1, -1, -1, 2, false]);
					if(count _testPos > 0 or (({alive _x} count _units) == 0))then {_true = false};
				};
				if(count _testPos > 0)then {_pos = _testPos; _maxDist = 0};
				_limit = _limit -1;
			};
		};

		// авиация десант тип маршрута
		if(_landing && "Air" in _grp_type)then{
			_WaypointType = "TR UNLOAD";
		};

		// лодки тип маршрута
		if(_landing && "Ship" in _grp_type && count _vehicles > 0)then{
			if((
				(
					getNumber(LIB_cfgWea >> currentWeapon (_vehicles select 0) >> "enableAttack")==0)
					&&
					!([_vehicles, ["RHIB"]] call gosa_fnc_CheckIsKindOfArray)
				)
				or
				([_vehicles, ["RubberBoat"]] call gosa_fnc_CheckIsKindOfArray)
			)then{
				_WaypointType = "GETOUT";
			}else{
				_WaypointType = "UNLOAD";
			};
		};

		if(_WaypointType in ["UNLOAD","GETOUT"])then{
			// _WaypointCombatMode = "GREEN";
		};

		// пехота
		if(count _vehicles == 0)then{
				diag_log format ["fnc_waypoints.sqf Inf %1", _this];

			private["_true","_dir","_dist2","_testPos","_limit"];
			_true = true;
			_testPos = [];
			_limit = 1000;
			while {_limit > 0 && _true && ({alive _x} count _units > 0)} do {
				_dir = random 360;
				_dist2 = random _maxDist;
				_testPos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
				if(!surfaceIsWater _testPos)then {
					_true = false;
					_pos = _testPos;
				};
				_limit = _limit -1;
			};
		};

			diag_log format ["fnc_waypoints.sqf addWaypoint %1", _this];

		// создать маршрут
		_wp = _grp addWaypoint [_pos, _maxDist];
		_wp setWaypointType _WaypointType;
		//_wp setWaypointSpeed _SpeedMode;
		// _wp setWaypointCombatMode _WaypointCombatMode;
		// _wp setWaypointBehaviour _WaypointBehaviour;
		// _wp setWaypointCompletionRadius _WaypointCompletionRadius;
		_wp setWaypointDescription "glowing-octo-shame Waypoint created dynamically";
		_wp setWaypointStatements ["true", "if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}"];

		diag_log format ["fnc_waypoints.sqf %1 added %2", _grp, [_wp, _WaypointType, waypointPosition _wp], _grp_type];
	};
};

	diag_log format ["fnc_waypoints.sqf end %1", _this];
