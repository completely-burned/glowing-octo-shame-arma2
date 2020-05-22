private["_min_dist","_min_vehicles_count","_min_dist2"];
_min_dist = 2000;
_min_vehicles_count = 20;

private["_x_veh"];
private["_type"];

private["_noDeleteCount","_noDeleteCountTmp"];
_noDeleteCount = 0;

private["_assignedVehicle"];

Private["_deleteListManAlive","_deleteListVehAlive","_deleteListManDead","_deleteListVehDead"];

private["_timerDelete","_timerLocation","_timerPlayer","_timerAttack"];
_timerDelete	= ( 60 * 2.5 );
_timerLocation	= ( 60 * 5 );
_timerPlayer	= ( 60 * 5 );
_timerAttack	= ( 60 * 2.5 );

private["_time","_timeNew"];

private["_i"];

while {true} do {

	_deleteListManAlive = [];
	_deleteListVehAlive = [];
	_deleteListManDead = [];
	_deleteListVehDead = [];

	_noDeleteCountTmp = 0;

	{ // forEach allUnits;

		_x_veh = _x;

		// узнать время удаления
		_time = (_x_veh getVariable "draga_timeDeleteVehicle");
		if ( isNil "_time" ) then {
			_time = ( time + ( 60 * 30 ) );
			_x_veh setVariable ["draga_timeDeleteVehicle", _time];
		};

		if (!isPlayer _x_veh) then {

			_assignedVehicle = assignedVehicle _x_veh;

			// не патрульный бот, далеко от точки и без транспорта
			if (isNull _assignedVehicle) then {
				if (isNil {group _x_veh getVariable "patrol"}) then {
					if (vehicle _x_veh distance civilianBasePos > 2500 max sizeLocation) then {
						_timeNew = _time min (time + _timerDelete);
					};
				};
			};

			// пилоты и танкисты без техники
			_type = typeOf _x_veh;
			if(toLower _type in listCrewLower+listPilotLower)then{
				_assignedVehicle = assignedVehicle _x_veh;
				if(isNull _assignedVehicle && (vehicle _x_veh == _x_veh))then{
					if (currentCommand _x_veh in ["MOVE"]) then {
						_timeNew = _time min (time + _timerDelete);
					};
				};
			};

			// водитель ремонтного грузовика с без грузовика
			if(waypointType [group _x_veh, currentwaypoint group _x_veh] == "SUPPORT")then{
				if(!alive _assignedVehicle or !canMove _assignedVehicle)then{
					_timeNew = _time min (time + _timerDelete);
				};
			};


			// на точке !не удалять!
			if ((vehicle _x_veh distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation)) then {
				_timeNew = _time max (time + _timerLocation);
			};

			// атакует !не удалять!
			if({currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]} count units _x_veh > 0 )then{
				_timeNew = _time max (time + _timerAttack);
			};

			// отряд игрока !не удалять!
			if ({isPlayer _x} count units _x_veh > 0) then {
				_timeNew = _time max (time + _timerPlayer);
			};


			// обновить время удаления
			if (!isNil {_timeNew}) then {
				if (_time != _timeNew) then {
					_time = _timeNew;
					_x_veh setVariable ["draga_timeDeleteVehicle", _timeNew];
				};
			};

		};



		// добавить в список на удаление
		if (_time < time) then {
			_deleteListManAlive set [count _deleteListManAlive, _x_veh];
		};

		_timeNew = nil;

	} forEach allUnits;

	{
		if (getNumber(configFile >> "CfgVehicles" >> typeOf _x >> "isMan") == 1) then {
			_deleteListManDead set [count _deleteListManDead, _x];
		};
	} forEach allDead;

	{
		_x_veh = _x;

		_delete = false;

		_time = (_x_veh getVariable "time");
		if ( isNil "_time" ) then {
			_time = time;
			_x_veh setVariable ["time", _time];
		}else{
			if ( _time < time - 180 )then {
				_delete = true;
			};
		};

		if(alive _x_veh)then{
			if (({alive _x} count (crew _x_veh + [assignedDriver _x_veh, assignedGunner _x_veh, assignedCommander _x_veh] + assignedCargo _x_veh))>0) then{
				_delete = false;
			};
		};

		if (_delete) then{
			_deleteListVehDead set [count _deleteListVehDead, _x_veh];
		}else{
			_x_veh setVariable ["time", _time];
		};


	} forEach vehicles;

	if (draga_loglevel > 0) then {
		diag_log format ["while_gc2.sqf: count allDead %1, count ManDead %2, count VehDead %3, %4", count allDead, count _deleteListManDead, count _deleteListVehDead, time];
	};

	// vehicles - allDead;

	if ( !isMultiplayer ) then {
		private["_playerSP"];
		waitUntil {_playerSP = player; !alive _playerSP};
		_deleteListManAlive = _deleteListManAlive - [_playerSP];
		_deleteListManDead = _deleteListManDead - [_playerSP];
	};

	_min_dist2 = _min_dist-(_noDeleteCount*(_min_dist/_min_vehicles_count))+_min_vehicles_count;

	{
		_x_veh = _x;
		if !([_x_veh, _min_dist2] call m_fnc_CheckPlayersDistance) then {

			if (draga_loglevel > 0) then {
				diag_log format ["while_gc2.sqf deleteA %1", _x_veh];
			};

			_x_veh setDamage 1;
			deleteVehicle _x_veh;
		}else{
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};
	} forEach _deleteListManAlive;


	if (draga_loglevel > 0) then {
		diag_log format ["while_gc2.sqf perf 2 %1", time];
	};

	while { count _deleteListManDead > _min_vehicles_count } do {



		_i = random (count _deleteListManDead -1);

		_x_veh = _deleteListManDead select _i;

		_deleteListManDead set [_i, -1];

		_deleteListManDead = _deleteListManDead - [-1];

		if !([_x_veh, _min_dist2] call m_fnc_CheckPlayersDistance) then {
			if (draga_loglevel > 0) then {
				diag_log format ["while_gc2.sqf delete %1", _x_veh];
			};
			_x_veh setDamage 1;
			moveOut _x_veh;
			deleteVehicle _x_veh;
		}else{
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};


	};

	while { count _deleteListVehDead > _min_vehicles_count } do {

		_i = random (count _deleteListVehDead -1);

		_x_veh = _deleteListVehDead select _i;

		_deleteListVehDead set [_i, -1];

		_deleteListVehDead = _deleteListVehDead - [-1];


		if !([_x_veh, _min_dist2] call m_fnc_CheckPlayersDistance) then {
			if (draga_loglevel > 0) then {
				diag_log format ["while_gc2.sqf deleteVeh %1", _x_veh];
			};
			// _x_veh setDamage 1;
			deleteVehicle _x_veh;
		}else{
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};


	};

	_noDeleteCount = _noDeleteCountTmp;

	sleep 5;


};
