#define __A2OA__

/*
	Скрипт удаляет накопившуюся бесхозную технику и мертвых юнитов,
	и минирует некоторых.
	TODO: Нужна проверка и ревизия, код древний и вероятно с ошибками.
*/


//--- gc
private["_min_dist","_min_vehicles_count","_min_dist2","_tmp","_sleep","_arr",
	"_s"];
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
_sleep = 30/5;

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

	_arr = allUnits;
	_c = count _arr;
	if (_c > 0) then {
	_s = (_sleep/_c);
	for "_i" from 0 to (_c -1) do {
		sleep _s;
		_x_veh = _arr select _i;

		// узнать время удаления
		_time = (_x_veh getVariable "gosa_timeDeleteVehicle");
		if ( isNil "_time" ) then {
			_time = ( time + ( 60 * 30 ) );
			_x_veh setVariable ["gosa_timeDeleteVehicle", _time];
			diag_log format ["Log: [GC2] %1 isNil time = %2", _x_veh, _time];
		};

		//--- allUnits отображает убитых юнитов на других комьютерах, но не отображает убитых созданных на сервере
		#ifndef __A2OA__
		if (!alive _x_veh) then {
			_deleteListManDead set [count _deleteListManDead, _x_veh];
		};
		#endif

		if !(_x_veh call gosa_fnc_isPlayer) then {

			_assignedVehicle = _x_veh call gosa_fnc_assignedVeh;
			diag_log format ["Log: [GC2] %1 assignedVehicle = %2", _x_veh, _assignedVehicle];

			// не патрульный бот, далеко от точки и без транспорта
			if (isNull _assignedVehicle) then {
				if (isNil {group _x_veh getVariable "patrol"}) then {
					if (vehicle _x_veh distance civilianBasePos > 2500 max gosa_locationSize) then {
						_timeNew = _time min (time + _timerDelete);
						diag_log format ["Log: [GC2] %1 %2- далеко от точки и без транспорта", _x_veh, _time];
					};
				};
			};

			// пилоты и танкисты без техники
			_type = typeOf _x_veh;
			if(_type in gosa_crewL+gosa_pilotL)then{
				if(isNull _assignedVehicle && (vehicle _x_veh == _x_veh))then{
					if (currentCommand _x_veh in ["MOVE"]) then {
						_timeNew = _time min (time + _timerDelete);
						diag_log format ["Log: [GC2] %1 %2- crew", _x_veh, _time];
					};
				};
			};

			// водитель ремонтного грузовика с без грузовика
			if(waypointType [group _x_veh, currentwaypoint group _x_veh] == "SUPPORT")then{
				if(!alive _assignedVehicle or !canMove _assignedVehicle)then{
					_timeNew = _time min (time + _timerDelete);
					diag_log format ["Log: [GC2] %1 %2- support", _x_veh, _time];
				};
			};


			// на точке !не удалять!
			if ((vehicle _x_veh distance civilianBasePos) <= (gosa_locationSize / 2 + gosa_locationSize)) then {
				_timeNew = _time max (time + _timerLocation);
				diag_log format ["Log: [GC2] %1 %2+ inLocation", _x_veh, _time];
			};

			// Гражданские на точке. Не удалять!
			_tmp = _x_veh getVariable "ALICE_twn";
			if !(isNil "_tmp") then {
				if (_tmp == CivilianLocation) then {
					_timeNew = _time max (time + _timerDelete);
					diag_log format ["Log: [GC2] %1 + юнит закреплен за локацией %2", _x_veh, CivilianLocation];
				};
			};

			// атакует !не удалять!
			// FIXME: Проверять всех каждый раз?
			_tmp = units _x_veh;
			for "_i" from 0 to (count _tmp -1) do {
				_tmp set [_i, currentCommand (_tmp select _i)];
			};
			if({_x in ["ATTACK","FIRE","ATTACKFIRE"]} count _tmp > 0 )then{
				_timeNew = _time max (time + _timerAttack);
				diag_log format ["Log: [GC2] %1 %2+ Attack, %3", _x_veh, _timeNew, _tmp];
			};

			// отряд игрока !не удалять!
			if ({_x call gosa_fnc_isPlayer} count units _x_veh > 0) then {
				_timeNew = _time max (time + _timerPlayer);
				diag_log format ["Log: [GC2] %1 %2+ isPlayer grp", _x_veh, _timeNew];
			};

			// TODO: Пилот должн быть в неисправном тс. Не удалять!

			// обновить время удаления
			if (!isNil {_timeNew}) then {
				if (_time != _timeNew) then {
					diag_log format ["Log: [GC2] %1, time %2, new %3", _x_veh, _time, _timeNew];
					_time = _timeNew;
					_x_veh setVariable ["gosa_timeDeleteVehicle", _timeNew];
				};
			};

		};



		// добавить в список на удаление
		if (_time < time) then {
			diag_log format ["Log: [GC2] %1 delete+ ManAlive", _x_veh];
			_deleteListManAlive set [count _deleteListManAlive, _x_veh];
		};

		_timeNew = nil;

	};
	};

#ifndef __A2OA__
	allDead = allDead - [objNull];
#endif

	_arr = allDead;
	_c = count _arr;
	if (_c > 0) then {
	_s = (_sleep/_c);
	for "_i" from 0 to (_c -1) do {
		sleep _s;
		_x_veh = _arr select _i;
		if (getNumber(configFile >> "CfgVehicles" >> typeOf _x_veh >> "isMan") == 1) then {
			diag_log format ["Log: [GC2] %1 delete+ ManDead", _x_veh];
			_deleteListManDead set [count _deleteListManDead, _x_veh];
		}else{ //diag_log
			diag_log format ["Log: [GC2] %1 delete- not Man %2", _x_veh, typeOf _x_veh];
		};
	};
	};

	_arr = vehicles;
	_c = count _arr;
	if (_c > 0) then {
	_s = (_sleep/_c);
	for "_i" from 0 to (_c -1) do {
		sleep _s;
		_x_veh = _arr select _i;

		_delete = false;

		_time = (_x_veh getVariable "gosa_timeDeleteVehicle");
		if ( isNil "_time" ) then {
			_time = time + _timerDelete;
			_x_veh setVariable ["gosa_timeDeleteVehicle", _time];
			diag_log format ["Log: [GC2] %1 isNil time = %2", _x_veh, _time];
		}else{
			if ( _time < time )then {
				diag_log format ["Log: [GC2] %1, %2 < time", _x_veh, _time];
				_delete = true;
			};
		};

		if(alive _x_veh)then{
			if (_x_veh call gosa_fnc_isCrewAlive) then{
				_delete = false;
				_timeNew = _time max (time + _timerDelete);
				diag_log format ["Log: [GC2] %1 %2+ alive crew", _x_veh, _timeNew];
			};
		};

		if(_x_veh == (gosa_cache_HQ select 0))then{
			_delete = false;
			_timeNew = _time max (time + _timerDelete);
			diag_log format ["Log: [GC2] %1 %2+ MHQ", _x_veh,  _timeNew];
		};

		if (_delete) then{
			_deleteListVehDead set [count _deleteListVehDead, _x_veh];
			diag_log format ["Log: [GC2] %1 delete+ VehDead", _x_veh];
		}else{ //diag_log
			diag_log format ["Log: [GC2] %1 delete- %2, %3", _x_veh, typeOf _x_veh, _time];
		};

		if (!isNil {_timeNew}) then {
			if (_time != _timeNew) then {
				_x_veh setVariable ["gosa_timeDeleteVehicle", _timeNew];
				diag_log format ["Log: [GC2] %1 time %2, new %3", _x_veh, _time, _timeNew];
			};
		};

		_timeNew = nil;

	};
	};

		diag_log format ["Log: [GC2] count allDead %1, count ManDead %2, count VehDead %3, %4", count allDead, count _deleteListManDead, count _deleteListVehDead, time];

	// vehicles - allDead;

	// TODO: это писано в нездоровом состоянии?
	if ( !isMultiplayer ) then {
		private["_playerSP"];
		waitUntil {_playerSP = player; !alive _playerSP};
		_deleteListManAlive = _deleteListManAlive - [_playerSP];
		_deleteListManDead = _deleteListManDead - [_playerSP];
	};

	if (_min_vehicles_count > 0) then {
		_min_dist2 = _min_dist-(_noDeleteCount*(_min_dist/_min_vehicles_count))+_min_vehicles_count;
		diag_log format ["Log: [GC2] min_dist %1", _min_dist2];
		// чтобы объект не удалялся под носом
		_min_dist2 = _min_dist2 max 10;
	}else{
		_min_dist2 = 10;
	};


	_arr = _deleteListManAlive;
	_c = count _arr;
	if (_c > 0) then {
	_s = (_sleep/_c);
	for "_i" from 0 to (_c -1) do {
		sleep _s;
		_x_veh = _arr select _i;
		if !([_x_veh, _min_dist2] call gosa_fnc_CheckPlayersDistance) then {

				diag_log format ["Log: [GC2] %1 ManAlive, delete", _x_veh];

			if !(_x_veh call gosa_fnc_isPlayer) then {
				_x_veh setDamage 1;
				deleteVehicle _x_veh;
			};
		}else{
			diag_log format ["Log: [GC2] %1 ManAlive, not deleted, player distance", _x_veh];
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};
	};
	};


		diag_log format ["Log: [GC2] perf 2 %1", time];


	_arr = gosa_GC_array;
	_c = count _arr;
	if (_c > 0) then {
	_s = (_sleep/_c);
	for "_i" from 0 to (_c -1) do {
		sleep _s;
		_x_veh = _arr select _i;
		if !([_x_veh, _min_dist2] call gosa_fnc_CheckPlayersDistance) then {
			diag_log format ["Log: [GC2] %1 GC_array, delete", _x_veh];
			// FIXME: Вероятно deleteVehicle не срабатывает на объектах определенного типа.
			deleteVehicle _x_veh;
			// FIXME: это лишнее тк объект после удаления станет objNull
			diag_log format ["Log: [GC2] %1 GC_array, post deleted, isNull = %2", _x_veh, isNull _x_veh];
			gosa_GC_array set [_i, objNull];
		}else{
			diag_log format ["Log: [GC2] %1 GC_array, not deleted, player distance", _x_veh];
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};
	};
	};

	gosa_GC_array = gosa_GC_array - [objNull];


	while { count _deleteListManDead > _min_vehicles_count } do {



		_i = random (count _deleteListManDead -1);

		_x_veh = _deleteListManDead select _i;

		_deleteListManDead set [_i, -1];

		_deleteListManDead = _deleteListManDead - [-1];

		if !([_x_veh, _min_dist2] call gosa_fnc_CheckPlayersDistance) then {
				diag_log format ["Log: [GC2] %1 ManDead, delete", _x_veh];

			if !(_x_veh call gosa_fnc_isPlayer) then {
				_x_veh setDamage 1;
				moveOut _x_veh;
				deleteVehicle _x_veh;
			};
		}else{
			diag_log format ["Log: [GC2] %1 ManDead, not deleted, player distance", _x_veh];
			_noDeleteCountTmp = _noDeleteCountTmp +1;
		};


	};

	while { count _deleteListVehDead > _min_vehicles_count } do {

		_i = random (count _deleteListVehDead -1);

		_x_veh = _deleteListVehDead select _i;

		_deleteListVehDead set [_i, -1];

		_deleteListVehDead = _deleteListVehDead - [-1];


		if !([_x_veh, _min_dist2] call gosa_fnc_CheckPlayersDistance) then {
				diag_log format ["Log: [GC2] %1 VehDead delete", _x_veh];
			// _x_veh setDamage 1;
			deleteVehicle _x_veh;
		}else{
			diag_log format ["Log: [GC2] %1 VehDead, not deleted, player distance", _x_veh];
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
				// TODO: Это не работает,
				//     : если все игроки мертвы возвращает !(false) == true
				//     : в итоге происходит минирование под носом у игроков их техники.
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
