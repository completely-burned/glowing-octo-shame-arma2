private["_grp"];
private["_leader"];
private["_leaderPos"];
private["_currentWP","_wp","_typeWP"];
private ["_units","_vehicles","_types","_cargo","_assignedVehicles"];
private["_Submarine"];
private ["_Helicopter"];
private ["_Plane"];
private ["_Ship"];
private ["_StaticWeapon"];
private ["_Air","_uav","_Car","_Tank"];
private ["_Tracked_APC","_Wheeled_APC"];
private["_AA"];
private["_support"];
// private ["_Stealth"];
private["_grp_wp_completed"];

_grp=_this;

scopeName "main";


_grp_wp_completed = _grp getVariable "_grp_wp_completed";

_units = units _grp;
if (draga_loglevel > 0) then {
	diag_log format ["fnc_group_wp.sqf units %1", _units];
};

if({alive _x} count _units > 0)then{

	_leader = leader _grp;

	_leaderPos = getPos vehicle _leader;

	_currentWP = currentWaypoint _grp;
	_wp = [_grp,_currentWP];
	_typeWP = waypointType _wp;

	_vehicles = [];
	_types = [];
	_cargo = [];
	_assignedVehicles = [];
	{
		_types set [count _types, typeOf _x];
		private ["_veh","_assignedVehicle"];
		_veh = vehicle _x;
		_assignedVehicle = assignedVehicle _x;
		if (!isNull _assignedVehicle) then {
			_assignedVehicles set [count _assignedVehicles, _veh];
		};
		if(_veh != _x)then{
			if!(_veh in _vehicles)then{
				_vehicles set [count _vehicles, _veh];
				_types set [count _types, typeOf _veh];
				_cargo = _cargo + assignedCargo _veh;
			};
		};
	}forEach _units;

	// транспортный вертолет
	if( ({!isNil {_x getVariable "draga_transportwaypoint_created_GET_IN_pos"}} count [_grp] + _vehicles > 0 ) or ({!isNil {_x getVariable "draga_transportwaypoint_created_GET_OUT_pos"}} count [_grp] + _vehicles > 0 ))then{
		breakTo "main";
		if (draga_loglevel > 0) then {
			diag_log format ["fnc_group_wp.sqf %1 breakTo main, transport", _grp ];
		};
	};

	if({toLower getText(LIB_cfgVeh >> _x >> "vehicleClass") == "submarine"} count _types > 0)then{_Submarine = true}else{_Submarine = false};

	_Helicopter = ([_vehicles, ["Helicopter"]] call m_fnc_CheckIsKindOfArray);

	_Plane = ([_vehicles, ["Plane"]] call m_fnc_CheckIsKindOfArray);

	_Ship = ([_vehicles, ["Ship"]] call m_fnc_CheckIsKindOfArray);

	_StaticWeapon = ([_vehicles, ["StaticWeapon"]] call m_fnc_CheckIsKindOfArray);

	_Air = ([_vehicles, ["Air"]] call m_fnc_CheckIsKindOfArray);

	_Tank = ([_vehicles, ["Tank"]] call m_fnc_CheckIsKindOfArray);

	_Car = ([_vehicles, ["Car"]] call m_fnc_CheckIsKindOfArray);

	_Tracked_APC = ([_vehicles, ["Tracked_APC"]] call m_fnc_CheckIsKindOfArray);
	_Wheeled_APC = ([_vehicles, ["Wheeled_APC"]] call m_fnc_CheckIsKindOfArray);

	_uav = ([_types, ["UAV"]] call m_fnc_CheckIsKindOfArray);
	if({getNumber (LIB_cfgVeh >> _x >> "isUav") == 1} count _types > 0)then{
		_uav = true;
	};

	_AA = ([_vehicles, ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1"]] call m_fnc_CheckIsKindOfArray);

	_support = false;
	ScopeName "_true1";
	{
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "attendant")> 0 && _x isKindOf "LandVehicle")then{
			_support = true;
			BreakTo "_true1";
		};
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportfuel")> 0)then{
			_support = true;
			BreakTo "_true1";
		};
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportammo")> 0)then{
			_support = true;
			BreakTo "_true1";
		};
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportrepair")> 0)then{
			_support = true;
			BreakTo "_true1";
		};

	}forEach _assignedVehicles;
	if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
		if({count assignedVehicleRole _x > 0} count _units > 0)then{
			_support = true;
		};
	};

	// удалить статичным
	if (_StaticWeapon) then {
		if ( count waypoints _grp > 0 ) then{
			[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
			sleep 1;
			for "_i" from count waypoints _grp - 1 to 0 step -1 do {
				deleteWaypoint [_grp, _i];
			};
		};
	};

	if (_Helicopter) then {
		if (_typeWP in ["UNLOAD"]) then {
			if (draga_loglevel > 0) then {
				diag_log format ["fnc_group_wp.sqf %1 _Helicopter UNLOAD", _grp ];
			};
			if ((_leaderPos distance waypointPosition _wp < 1000) or !isNil{_grp_wp_completed}) then {
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
								if(group _x != _this)then{
									// _x leaveVehicle _veh;
									unassignVehicle _x;
								};
							}forEach crew _veh;
						}forEach _vehicles;
						for "_i" from count waypoints _this - 1 to 0 step -1 do {
							deleteWaypoint [_this, _i];
						};
						_this setVariable ["UNLOAD",nil];
					};
				};
			};
		};
		if (_typeWP in ["GETOUT"]) then {
			if (draga_loglevel > 0) then {
				diag_log format ["fnc_group_wp.sqf %1 _Helicopter GETOUT", _grp ];
			};
			if ((_leaderPos distance waypointPosition _wp < 400) or !isNil{_grp_wp_completed}) then {
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
								// _x leaveVehicle _veh;
								unassignVehicle _x;
							}forEach crew _veh;
						}forEach _vehicles;
						for "_i" from count waypoints _this - 1 to 0 step -1 do {
							deleteWaypoint [_this, _i];
						};
						_this setVariable ["GETOUT",nil];
					};
				};
			};
		};
	};

	if (_Plane) then {
		if (_typeWP in ["UNLOAD","GETOUT"]) then {
			if ((_leaderPos distance waypointPosition _wp < 1000) or !isNil{_grp_wp_completed}) then {
				if (isNil {_grp getVariable "UNLOAD"}) then {
					_grp setVariable ["UNLOAD",true];
					_grp spawn {

						// get _vehicles
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


						if(true)then{

							// группы для выпрыгивания
							private ["_grps"];
							_grps = [];
							{
								private["_veh"];
								_veh = _x;
								{
									if(group _x != group _veh)then{
										_grps set [count _grps, group _x];
									};
								} forEach assignedCargo _veh;
							} forEach _vehicles;

							{
								// юниты для выпрыгивания в нужном порядке
								private["_grp","_leader","_units"];
								_grp = _x;
								_leader = leader _grp;
								_units = units _grp -[_leader]; // сомнения в -[]
								_units = [_units, [_leader], count _units / 2] call BIS_fnc_arrayInsert; // командир в центр

								// выпрыгивание
								{
									if(vehicle _x isKindOf "Plane" && !(vehicle _x isKindOf "ParachuteBase"))then{
										_x action ["Eject", vehicle _x];
										// _x leaveVehicle assignedVehicle _x;
										sleep 0.5; // нужно учитывать скорость
										unassignVehicle _x;
									};
								} forEach _units;
							} forEach _grps;
						};


						for "_i" from count waypoints _this - 1 to 0 step -1 do {
							deleteWaypoint [_this, _i];
						};

						{
							_x land "NONE";
							_x action ["cancelLand", _x];
						}forEach _vehicles;

						_this setVariable ["UNLOAD",nil];
					};
				};
			};
		};
	};

	if (_Ship) then {
	  if (_typeWP in ["UNLOAD"]) then {
		if ((_leaderPos distance waypointPosition _wp < 400) or !isNil{_grp_wp_completed}) then {
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
							// _x leaveVehicle _veh;
							unassignVehicle _x;
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
			  for "_i" from count waypoints _this - 1 to 0 step -1 do {
				  deleteWaypoint [_this, _i];
			  };
			  _this setVariable ["UNLOAD",nil];
			};
		  };
		};
	  };
	  if (_typeWP in ["GETOUT"]) then {
		if ((_leaderPos distance waypointPosition _wp < 400) or !isNil{_grp_wp_completed}) then {
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
							// _x leaveVehicle _veh;
							unassignVehicle _x;
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
			  for "_i" from count waypoints _this - 1 to 0 step -1 do {
				  deleteWaypoint [_this, _i];
			  };
			  _this setVariable ["GETOUT",nil];
			};
		  };
		};
	  };
	};

	if (true) then {
		private["_grp","_leader"];
		_grp = _this;
		_leader = leader _grp;

		private["_currentWP","_waypoints","_createWP","_leaderPos"];
		_currentWP = currentWaypoint _grp;
		_waypoints = waypoints _grp;
		_createWP = false;
		_leaderPos = getPos vehicle _leader;

		if (isNil{_grp_wp_completed}) then {
			if([waypointPosition [_grp,_currentWP], _leaderPos] call BIS_fnc_distance2D < 5 )then{
				_grp_wp_completed = time;
				if (draga_loglevel > 0) then {
					diag_log format ["fnc_group_wp.sqf %1 _grp_wp_completed = time", _grp ];
				};
			};
		};

		if(isPlayer _leader)then{
			if ( count waypoints _grp > 0 ) then{
				[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
				sleep 1;
				for "_i" from count waypoints _grp - 1 to 0 step -1 do {
					deleteWaypoint [_grp, _i];
				};
			};
			if (draga_loglevel > 0) then {
				diag_log format ["fnc_group_wp.sqf %1 isPlayer _leader deleteWaypoints", _grp ];
			};
		}else{

			if(!isNil {_grp getVariable "grp_created"})then{
				if (draga_loglevel > 0) then {
					diag_log format ["fnc_group_wp.sqf %1  группа готова", _grp ];
				};

				if(count waypoints _grp == 0)then{
					if (draga_loglevel > 0) then {
						diag_log format ["fnc_group_wp.sqf %1  нет маршрута", _grp ];
					};

					private["_timeNoWP"];
					_timeNoWP = (_grp getVariable "_timeNoWP");
					if(isNil "_timeNoWP")then{
						_timeNoWP = time;
						_grp setVariable ["_timeNoWP", _timeNoWP];
					}else{
						if ( time > (_timeNoWP + 5) ) then {
							if (draga_loglevel > 0) then {
								diag_log format ["fnc_group_wp.sqf %1 добавлена в очередь на создание маршрута", _grp, currentCommand _leader ];
							};
							_createWP = true;
							_grp setVariable ["_timeNoWP", nil];
						};
					};

				}else{
					_grp setVariable ["_timeNoWP", nil];
				};
			};

			private["_NoCreateWP"];
			_NoCreateWP = false; // не создавать
			private["_DeleteWP"];
			_DeleteWP = true; // удалить

			// не создавать маршрут если боты атакуют
			if ((vehicle _leader distance civilianBasePos) <= sizeLocation or true) then {
				if( { currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] } count units _grp > 0 )then{
					// боты остаются на месте
					_NoCreateWP = true;
				};
			};

			// ПВО
			if (_AA) then {

				private["_friendCount","_nearVehList"];

				_friendCount = 0;

				_nearVehList = _leaderPos nearEntities [["Land"],400];

				{
						if (side _grp getFriend side _x >= 0.6) then {
							if ([_vehicles, ["Tank","Wheeled_APC"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call m_fnc_CheckIsKindOfArray) then {
								_friendCount = _friendCount + 3;
							};
							if ([_vehicles, ["LandVehicle"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call m_fnc_CheckIsKindOfArray) then {
								_friendCount = _friendCount + 1;
							};
							if ([_vehicles, ["Land"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call m_fnc_CheckIsKindOfArray) then {
								_friendCount = _friendCount + 0.1;
							};
						};
				} forEach _nearVehList;

				if (_friendCount >= 3) then {
					_NoCreateWP = true;
				};

			};

			// грузовики поддержки
			if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
				if({count assignedVehicleRole _x > 0} count _units > 0)then{
					_DeleteWP = false;
					if(waypointAttachedVehicle [_grp, currentWaypoint _grp] != vehicle _leader)then{
						[_grp, currentWaypoint _grp] waypointAttachVehicle vehicle _leader;
					};
				};
			};
			if(_support)then{
				if(waypointType [_grp, currentwaypoint _grp] != "SUPPORT")then{
					_DeleteWP = true;
					_NoCreateWP = false;
					_createWP = true;
				};
			};
			if(!_support)then{
				if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
					_DeleteWP = true;
					_NoCreateWP = false;
					_createWP = true;
				};
			};

			// остановить без маршрута
			if( _NoCreateWP && _DeleteWP)then{
				if ( count waypoints _grp > 0 ) then{
					if (draga_loglevel > 0) then {
						diag_log format ["fnc_group_wp.sqf %1 currentCommand leader %2, count waypoints %3, stopping", _grp, currentCommand _leader, count waypoints _grp ];
					};
					[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL _leader, -1];
					// [_grp, currentWaypoint _grp] setWaypointType "HOLD";
					sleep 1;
					// sleep 0.1;
					for "_i" from count waypoints _grp - 1 to 0 step -1 do {
						deleteWaypoint [_grp, _i];
					};
				};
			};

			// UAV не создавать маршрут
			private["_draga_UAV_WaypointPosCenter"];
			_draga_UAV_WaypointPosCenter = _grp getVariable "_draga_UAV_WaypointPosCenter";
			if(!isNil{_draga_UAV_WaypointPosCenter})then{
				_NoCreateWP = true; // не создавать
			};

			// остановить ботов на точке 2 минут
			if(!isNil{_grp_wp_completed})then{
				if(!_Air && (_grp_wp_completed + 120 < time))then{
					if ((vehicle _leader distance civilianBasePos) < sizeLocation) then {
						_DeleteWP = true; // удалить
						_NoCreateWP = true; // не создавать
						_createWP = false; // не создавать
					};
				};
			};

			// создать новый маршрут
			if( !_NoCreateWP && _DeleteWP)then{
				if(_createWP or !isNil{_grp_wp_completed})then{
					_grp setVariable ['_grp_wp_completed',nil];
					_grp setVariable ["draga_grp_wp_sleep", nil];
					for "_i" from count waypoints _grp - 1 to 0 step -1 do {
						deleteWaypoint [_grp, _i];
					};
					// создать новый маршрут
					[_leader] spawn m_fnc_waypoints;

					if (draga_loglevel > 0) then {
						diag_log format ["fnc_group_wp.sqf %1  создание маршрута", _grp ];
					};
				};
			};

			// wpStatements
			private["_wp"];
			_wp = [_grp,_currentWP];
			private["_wpStatements"];
			_wpStatements = "if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}";
			if!(waypointStatements _wp select 1 in [_wpStatements,"vehicle this land 'GET IN'","vehicle this land 'GET OUT'","vehicle this land 'LAND'","this land 'GET IN'","this land 'GET OUT'","this land 'LAND'"])then{
				if (draga_loglevel > 0) then {
					diag_log format ["fnc_group_wp.sqf %1 _wpStatements %2", _grp, _wpStatements ];
				};
				_wp setWaypointStatements ["true", _wpStatements];
			};
		};
	};

	// лидер двигается ближе к атакующим юнитам
	if (_leader == Vehicle _leader) then {

		private["_follow"];

		scopeName "_follow";

		if (!isPlayer _leader) then {

			// лидер двигаться в сторону атакующей техники отряда
			{
				if (currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _vehicles;

			// лидер двигаться в сторону техники отряда
			/*
			{
				if (alive effectiveCommander _x && !(behaviour _leader in ["SAFE", "CARELESS", "AWARE"])) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _vehicles;
			*/

			// лидер двигаться в сторону атакующего юнита отряда
			{
				if (currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] && vehicle _x == _x ) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _units-[_leader];

		};

		// движение лидера
		if (!isNil{_follow}) then {
			if (_leader Distance _follow > 75) then {
				Private["_position","_position1"];
				_position = GetPos _leader;
				_position1 = GetPos _follow;
				_position = [((_position Select 0) + (_position1 Select 0)) / 2,((_position Select 1) + (_position1 Select 1)) / 2];
				// _grp Move _position;
				_leader doMove _position;
			};
		};
	};


};

if (draga_loglevel > 0) then {
	diag_log format ["fnc_group_wp end %1", time];
};
