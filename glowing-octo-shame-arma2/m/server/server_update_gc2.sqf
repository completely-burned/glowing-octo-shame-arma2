private["_min_dist","_min_vehicles_count","_min_dist2"];
_min_dist = 7000;
_min_vehicles_count = 100;

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
					if (_x_veh distance civilianBasePos > 2500 max sizeLocation) then {
						_timeNew = _time min (time + _timerDelete);
					};
				};
			};

			// пилоты и танкисты без техники
			_type = typeOf _x_veh;
			if(toLower _type in listCrewLower)then{
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
		}else{
			_deleteListVehDead set [count _deleteListVehDead, _x];
		};
	} forEach allDead;

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
			_x_veh setDamage 1;
			deleteVehicle _x_veh;
		}else{
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};
	} forEach _deleteListManAlive;


	while { count _deleteListManDead > _min_vehicles_count } do {

		_x_veh = _deleteListManDead call BIS_fnc_selectRandom;

		_deleteListManDead = _deleteListManDead - [_x_veh];

		if !([_x_veh, _min_dist2] call m_fnc_CheckPlayersDistance) then {
			_x_veh setDamage 1;
			moveOut _x_veh;
			deleteVehicle _x_veh;
		}else{
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};


	};

	_noDeleteCount = _noDeleteCountTmp;

	sleep 5;


};
