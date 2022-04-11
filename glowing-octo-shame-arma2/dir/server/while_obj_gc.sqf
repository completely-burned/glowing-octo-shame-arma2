#define __A2OA__

/*
	Скрипт удаляет накопившуюся бесхозную технику и мертвых юнитов,
	и минирует некоторых.
	TODO: Нужна проверка и ревизия, код древний и вероятно с ошибками.
*/


//--- gc
private["_min_dist","_min_vehicles_count","_min_dist2"];
_min_dist			= missionNamespace getVariable "gc_dist";
_min_vehicles_count = missionNamespace getVariable "gc_count";

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

#ifndef __A2OA__
waitUntil{!isNil "allDead"};
#endif

//--- mining
private["_mining","_mining_factor","_mining_list"];
_mining_factor = (missionNamespace getVariable "mining")/100;
_mining = if(_mining_factor > 0)then{
	_mining_list = [];
	true;
}else{
	_mining_factor = nil;
	false;
};
diag_log format ["Log: [GC2] #mining %1", _mining];

waitUntil {!isNil "civilianbasepos"};

while {true} do {

	_deleteListManAlive = [];
	_deleteListVehAlive = [];
	_deleteListManDead = [];
	_deleteListVehDead = [];

	_noDeleteCountTmp = 0;

	{ // forEach allUnits;

		_x_veh = _x;

		// узнать время удаления
		_time = (_x_veh getVariable "gosa_timeDeleteVehicle");
		if ( isNil "_time" ) then {
			_time = ( time + ( 60 * 30 ) );
			_x_veh setVariable ["gosa_timeDeleteVehicle", _time];
		};

		//--- allUnits отображает убитых юнитов на других комьютерах, но не отображает убитых созданных на сервере
#ifndef __A2OA__
		if (!alive _x_veh) then {
			_deleteListManDead set [count _deleteListManDead, _x_veh];
		};
#endif

		if !(_x_veh call gosa_fnc_isPlayer) then {

			_assignedVehicle = _x_veh call gosa_fnc_assignedVeh;

			// не патрульный бот, далеко от точки и без транспорта
			if (isNull _assignedVehicle) then {
				if (isNil {group _x_veh getVariable "patrol"}) then {
					if (vehicle _x_veh distance civilianBasePos > 2500 max gosa_locationSize) then {
						_timeNew = _time min (time + _timerDelete);
					};
				};
			};

			// пилоты и танкисты без техники
			_type = typeOf _x_veh;
			if(_type in gosa_crewL+gosa_pilotL)then{
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
			if ((vehicle _x_veh distance civilianBasePos) <= (gosa_locationSize / 2 + gosa_locationSize)) then {
				_timeNew = _time max (time + _timerLocation);
			};

			// атакует !не удалять!
			if({currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]} count units _x_veh > 0 )then{
				_timeNew = _time max (time + _timerAttack);
			};

			// отряд игрока !не удалять!
			if ({_x call gosa_fnc_isPlayer} count units _x_veh > 0) then {
				_timeNew = _time max (time + _timerPlayer);
			};


			// обновить время удаления
			if (!isNil {_timeNew}) then {
				if (_time != _timeNew) then {
					_time = _timeNew;
					_x_veh setVariable ["gosa_timeDeleteVehicle", _timeNew];
				};
			};

		};



		// добавить в список на удаление
		if (_time < time) then {
			_deleteListManAlive set [count _deleteListManAlive, _x_veh];
		};

		_timeNew = nil;

	} forEach allUnits;

#ifndef __A2OA__
	allDead = allDead - [objNull];
#endif
	{
		if (getNumber(configFile >> "CfgVehicles" >> typeOf _x >> "isMan") == 1) then {
			_deleteListManDead set [count _deleteListManDead, _x];
		};
	} forEach allDead;

	{
		_x_veh = _x;

		_delete = false;

		_time = (_x_veh getVariable "gosa_timeDeleteVehicle");
		if ( isNil "_time" ) then {
			_time = time + _timerDelete;
			_x_veh setVariable ["gosa_timeDeleteVehicle", _time];
			diag_log format ["Log: [GC2] %1 setTime %2", _x_veh, _time];
		}else{
			if ( _time < time )then {
				_delete = true;
			};
		};

		if(alive _x_veh)then{
			if (({alive _x} count (crew _x_veh + [assignedDriver _x_veh, assignedGunner _x_veh, assignedCommander _x_veh] + assignedCargo _x_veh))>0) then{
				_delete = false;
				_timeNew = _time max (time + _timerDelete);
			};
		};

		if (_delete) then{
			_deleteListVehDead set [count _deleteListVehDead, _x_veh];
		};

		if (!isNil {_timeNew}) then {
			if (_time != _timeNew) then {
				_x_veh setVariable ["gosa_timeDeleteVehicle", _timeNew];
				diag_log format ["Log: [GC2] %1 time %2, new %3", _x_veh, _time, _timeNew];
			};
		};

		_timeNew = nil;

	} forEach vehicles;

		diag_log format ["Log: [GC2] count allDead %1, count ManDead %2, count VehDead %3, %4", count allDead, count _deleteListManDead, count _deleteListVehDead, time];

	// vehicles - allDead;

	if ( !isMultiplayer ) then {
		private["_playerSP"];
		waitUntil {_playerSP = player; !alive _playerSP};
		_deleteListManAlive = _deleteListManAlive - [_playerSP];
		_deleteListManDead = _deleteListManDead - [_playerSP];
	};

	if (_min_vehicles_count > 0) then {
		_min_dist2 = _min_dist-(_noDeleteCount*(_min_dist/_min_vehicles_count))+_min_vehicles_count;
		// чтобы объект не удалялся под носом
		_min_dist2 = _min_dist2 max 10;
	}else{
		_min_dist2 = 10;
	};


	{
		_x_veh = _x;
		if !([_x_veh, _min_dist2] call gosa_fnc_CheckPlayersDistance) then {

				diag_log format ["Log: [GC2] deleteA %1", _x_veh];

			if !(_x_veh call gosa_fnc_isPlayer) then {
				_x_veh setDamage 1;
				deleteVehicle _x_veh;
			};
		}else{
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};
	} forEach _deleteListManAlive;


		diag_log format ["Log: [GC2] perf 2 %1", time];


	for "_i" from 0 to (count gosa_GC_array -1) do {
		_x_veh = gosa_GC_array select _i;
		if !([_x_veh, _min_dist2] call gosa_fnc_CheckPlayersDistance) then {
			diag_log format ["Log: [GC2] delete %1", _x_veh];
			deleteVehicle _x_veh;
			// FIXME: это лишнее тк объект после удаления станет objNull
			gosa_GC_array set [_i, objNull];
		}else{
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};
	};

	gosa_GC_array = gosa_GC_array - [objNull];


	while { count _deleteListManDead > _min_vehicles_count } do {



		_i = random (count _deleteListManDead -1);

		_x_veh = _deleteListManDead select _i;

		_deleteListManDead set [_i, -1];

		_deleteListManDead = _deleteListManDead - [-1];

		if !([_x_veh, _min_dist2] call gosa_fnc_CheckPlayersDistance) then {
				diag_log format ["Log: [GC2] delete %1", _x_veh];

			if !(_x_veh call gosa_fnc_isPlayer) then {
				_x_veh setDamage 1;
				moveOut _x_veh;
				deleteVehicle _x_veh;
			};
		}else{
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};


	};

	while { count _deleteListVehDead > _min_vehicles_count } do {

		_i = random (count _deleteListVehDead -1);

		_x_veh = _deleteListVehDead select _i;

		_deleteListVehDead set [_i, -1];

		_deleteListVehDead = _deleteListVehDead - [-1];


		if !([_x_veh, _min_dist2] call gosa_fnc_CheckPlayersDistance) then {
				diag_log format ["Log: [GC2] deleteVeh %1", _x_veh];
			// _x_veh setDamage 1;
			deleteVehicle _x_veh;
		}else{
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};


	};

	_noDeleteCount = _noDeleteCountTmp;

	//--- mining
	if (_mining) then {

		for "_i" from 0 to (count _mining_list -1) do {
			if (!alive (_mining_list select _i)) then {
				diag_log format ["Log: [GC2] #mining %1 not alive", _mining_list select _i];
				_mining_list set [_i,-1];
			};
		};
		_mining_list = _mining_list - [-1];


		while { count _mining_list < _mining_factor*count _deleteListVehDead && count _deleteListVehDead > 0 } do {

			_i = random (count _deleteListVehDead -1);

			_x_veh = _deleteListVehDead select _i;

			_deleteListVehDead set [_i, -1];

			_deleteListVehDead = _deleteListVehDead - [-1];

			if ([_x_veh, 3] call gosa_fnc_mining) then {
				// TODO: это не работает, тк если все игроки мертвы возвращает !(false) == true
				// TODO: в итоге происходит минирование под носом у игроков их техники
				if !([_x_veh, _min_dist2/2] call gosa_fnc_CheckPlayersDistance) then {
					_mining_list set [count _mining_list, _x_veh];
					[_x_veh, 1] call gosa_fnc_mining;
					diag_log format ["Log: [GC2] #mining %1 mined", _x_veh];
				};
			};
		};

	};

	sleep 5;


};
