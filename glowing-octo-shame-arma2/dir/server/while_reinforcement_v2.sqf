/*
скрипт отвечает за вызов подкреплений на клиентском компьетере
*/

#define __A2OA__

private["_minGroups","_e_cfi","_playerCoefficient","_center_e_dir",
	"_enemyCoefficientCfg","_timeFriendlyReinforcements","_limit_fps",
	"_frames_required","_time","_dyn_limit","_z","_dfi","_conveyer",
	"_conveyer_limit","_limits","_l_enemy","_fnc_fl","_grp","_e_multipler",
	"_fl","_cfg_cfi","_patrol_percent","_respawn_mode","_run",
	"_lg","_enemySide","_friendlySide","_sleep"];

diag_log format ["Log: [reinforcements] started %1", time ];

waitUntil {!isNil "bis_fnc_init"};
	waitUntil {!isNil "gosa_fnc_init"};
	waitUntil {!isNil "locationStarted"};
	waitUntil {!isNil "GroupsStarted"};
	waitUntil {!isNil "gosa_framesAVG"};

diag_log format ["Log: [reinforcements] post waitUntil %1", time];

private["_diag_log_m_fl_e","_diag_log_m_fl_w","_diag_log_m_fl_r"];
	if(gosa_loglevel>0)then{ // diag_log
		_diag_log_m_fl_e = createMarker ["gosa_fl_e", [0,0]];
		_diag_log_m_fl_e setMarkerTextLocal _diag_log_m_fl_e;
		_diag_log_m_fl_e setMarkerType "Dot";
		_diag_log_m_fl_w = createMarker ["gosa_fl_w", [0,0]];
		_diag_log_m_fl_w setMarkerTextLocal _diag_log_m_fl_w;
		_diag_log_m_fl_w setMarkerType "Dot";
		_diag_log_m_fl_r = createMarker ["gosa_fl_r", [0,0]];
		_diag_log_m_fl_r setMarkerTextLocal _diag_log_m_fl_r;
		_diag_log_m_fl_r setMarkerType "Dot";
	}; // diag_log

_conveyer = [];
_conveyer_limit = 8;

_patrol_percent = ((missionNamespace getVariable "gosa_patrolCoefficient") / 100);
_dfi = gosa_server_diag_fps_interval;
if (gosa_deviceType == 2) then {
	_minGroups = missionNamespace getVariable "ai_client_count";
	_limit_fps = (missionNamespace getVariable "gosa_ai_client_create_fps");
	_sleep = 120;
	_respawn_mode = missionNamespace getVariable "respawn";
	if (_respawn_mode == 1 or
		_minGroups > 0 or
		_limit_fps > 0
	 )then{
		_run = true;
	 }else{
		_run = false;
	};
}else{
	_minGroups = missionNamespace getVariable "minGroups";
	_limit_fps = (missionNamespace getVariable "gosa_ai_create_fps");
	_sleep = 30;
	_run = true;
};
// FIXME: =+? При записи в _dyn_limit возможно перезаписывается _minGroups.
_dyn_limit = _minGroups;
_cfg_cfi = missionNamespace getVariable "enemyCoefficient";
// TODO: количество игроков не учитывается
_playerCoefficient = missionNamespace getVariable "playerCoefficient";
_timeFriendlyReinforcements = (missionNamespace getVariable "timeFriendlyReinforcements") * 60;
_e_multipler = _timeFriendlyReinforcements / _cfg_cfi;
_frames_required = _limit_fps * _dfi;
_time = time;


_friendlySide = gosa_friendlyside - [civilian];
	_enemySide = [west,east,resistance] - gosa_friendlyside;
	for "_i" from 0 to count _enemySide -1 do {
		switch (_enemySide select _i) do {
			case EAST: 		{_enemySide set [_i, 0]};
			case WEST:		{_enemySide set [_i, 1]};
			case RESISTANCE: {_enemySide set [_i, 2]};
			case CIVILIAN: 	{_enemySide set [_i, 3]};
			default {};
		};
	};
	for "_i" from 0 to count _friendlySide -1 do {
		switch (_friendlySide select _i) do {
			case EAST: 		{_friendlySide set [_i, 0]};
			case WEST:		{_friendlySide set [_i, 1]};
			case RESISTANCE: {_friendlySide set [_i, 2]};
			case CIVILIAN: 	{_friendlySide set [_i, 3]};
			default {};
		};
	};

_fnc_fl = {
	private["_r"];
	_r = _this;

	for "_i" from 0 to count _r -1 do {
		if (!isNil {_r select _i getVariable "patrol"}) then {
			_r set [_i, grpNull]
		};
	};
	_r = _r -[grpNull];

	if (count _r > 0) then {
		_r = _r call gosa_fnc_centerOfImpact;
	};

	_r;
};

while{_run}do{

	_grp = call gosa_fnc_getGroups;

	_lg=((count (_grp select 0))+(count (_grp select 1))+(count (_grp select 2)));

	diag_log format ["Log: [reinforcements] count local group %1,", _lg, [count (_grp select 0),count (_grp select 1),count (_grp select 2),count (_grp select 3)]];


	//--- conveyer ---
		for "_i" from 0 to count _conveyer -1 do {
			if (scriptDone (_conveyer select _i select 0)) then {
				_conveyer set [_i, -1];
			};
		};
		_conveyer = _conveyer -[-1];
		diag_log format ["Log: [reinforcements] count conveyer %1", count _conveyer];


	if (gosa_deviceType != 2) then {
		_p = [] call BIS_fnc_listPlayers;
	} else {
		_p = [player];
	};

	//--- динамические ограничения

		// TODO: Приватная переменная.
		if (gosa_pvp) then {
			_limits = [
				_dyn_limit	/ 6,
				_dyn_limit	/ 6,
				_dyn_limit	/ 6,
				nil,
				_dyn_limit	/ 6,
				_dyn_limit	/ 6,
				_dyn_limit	/ 6,
				nil,
				_dyn_limit
			];
		}else{

			//--- enemyCoefficient
				if(!isNil {CivilianLocationStartTime})then{
					_z = time - CivilianLocationStartTime;
					_z = 0 max (_timeFriendlyReinforcements - _z);
					_e_cfi = _z / _e_multipler;

					if (_cfg_cfi >= 1) then {
						_e_cfi = _e_cfi max 1;
					};
					diag_log format ["Log: [reinforcements] _e_cfi %1", _e_cfi];
				}else{
					_e_cfi = _cfg_cfi;
				};

				_limits = [];
					{
						_limits set [_x, 	round (((_dyn_limit / (1+_e_cfi)) * _e_cfi) * (1 - _patrol_percent) / count _enemySide)];
						_limits set [_x+4, round (((_dyn_limit / (1+_e_cfi)) * _e_cfi) * _patrol_percent / count _enemySide)];
					} forEach _enemySide;
					{
						_limits set [_x, 	round (( _dyn_limit / (1+_e_cfi)) * (1 - _patrol_percent) / count _friendlySide)];
						_limits set [_x+4, round (( _dyn_limit / (1+_e_cfi)) * _patrol_percent / count _friendlySide)];
					} forEach _friendlySide;
					_limits set [8, _dyn_limit];
		};
		diag_log format ["Log: [reinforcements] _limits %1", _limits];



	//--- чистка при значительном превышении лимита
		_z = (_dyn_limit*1.4+1) max (_dyn_limit+5);
		if (_lg + count _conveyer > _z) then {
			if (gosa_deviceType != 2) then {
				private["_side","_l","_grp","_rm","_d"];
				diag_log format ["Log: [reinforcements] групп слишком много %1+%2 > %3", _lg, count _conveyer, _z];
				{
					_grp=_x;
					//_side = side _grp;
					_l = leader _grp;
					if (local _l) then {
						if({_x call gosa_fnc_isPlayer} count units _grp == 0)then{

							if (isNil {_d}) then {
								_d = civilianBasePos distance vehicle _l;
								_rm = [_grp];
							}else{
								if (_d < civilianBasePos distance vehicle _l) then {
									_rm = [_grp]+_rm;
									_rm resize (0 max round ((_lg-_z) min count _rm));
								};
							};
							diag_log format ["Log: [reinforcements] rm %1", _rm];
						};
					};
				}forEach allGroups;

				if (!isNil {_rm}) then {
					if (count _rm > 0) then {
						for "_i" from 0 to count _rm -1 do {
							{
								diag_log format ["Log: [reinforcements] %1 в очередь на удаление", vehicle _x];
								vehicle _x setVariable ["gosa_timeDeleteVehicle", 0];
								diag_log format ["Log: [reinforcements] %1 в очередь на удаление", _x];
								_x setVariable ["gosa_timeDeleteVehicle", 0];
							}forEach units (_rm select _i);
						};
					};
				};
			};
		}else{

	//--- Аварийная группа возрождения.
		// FIXME: Не проверенно в одиночной игре.
		// Чтобы не закончились юниты для перерождения.
		// Переменная на стороне клиента.
		_z = isNil "gosa_player_needs_revival";
			if (_z) then {
				_z = {local _x} count units player;
				diag_log format ["Log: [reinforcements] %1 local units %2", _z, units player];
				if (_z < 3 ) then {

					_z = 0;

					//if (_z == 0) then {
						if (east getFriend playerSide >= 0.6) then {
							_z = {isNil {_x getVariable "patrol"}} count (((_grp select 0)+(_grp select 3))-[group player]);
							diag_log format ["Log: [reinforcements] %1 east grp %2", _z];
						};
					//};

					if (_z == 0) then {
						if (west getFriend playerSide >= 0.6) then {
							_z = {isNil {_x getVariable "patrol"}} count (((_grp select 1)+(_grp select 4))-[group player]);
							diag_log format ["Log: [reinforcements] %1 west grp %2", _z];
						};
					};

					if (_z == 0) then {
						if (resistance getFriend playerSide >= 0.6) then {
							_z = {isNil {_x getVariable "patrol"}} count (((_grp select 2)+(_grp select 5))-[group player]);
							diag_log format ["Log: [reinforcements] %1 guer grp %2", _z];
						};
					};

					if (_z == 0) then {
						_z = true;
					}else{
						_z = false;
					};
				}else{
					_z = false;
				};
			}else{
				_z = !_z;
				diag_log format ["Log: [reinforcements] _player_needs_revival %1 %2", _z, gosa_player_needs_revival];
			};

			if (_z) then {
				if ({_x select 1 == 8} count _conveyer < 1) then {
					_conveyer set [count _conveyer, [[gosa_friendlyside - [civilian]] spawn gosa_fnc_failoverGroup, 8]];
					//_conveyer set [count _conveyer, [[west, objNull, _fl] spawn gosa_fnc_failoverGroup, 8]];
				};
			};

	//--- создание отрядов
		if (count _conveyer < _conveyer_limit) then {

			// _p игроки
				if (count _p == 0) then {
					_p = [objNull];
				};

			// EAST
				//--- линия фронта
					_fl = missionNamespace getVariable "gosa_frontLine_east";
					if (_fl == 0) then {
						_fl = [];
					}else{
						_z = [];

						if (_fl == 1) then {
							if (east getFriend west >= 0.6) then {
								_z = (_grp select 1) +_z;
							};
							if (east getFriend resistance >= 0.6) then {
								_z = (_grp select 2) +_z;
							};
						};
						if (_fl == 2) then {
							if (east getFriend west < 0.6) then {
								_z = (_grp select 1) +_z;
							};
							if (east getFriend resistance < 0.6) then {
								_z = (_grp select 2) +_z;
							};
						};

						// позиция
						_z = _z call _fnc_fl;

						if (count _z == 0) then {
							_fl = _z;
						}else{
							if(gosa_loglevel>0)then{_diag_log_m_fl_e setMarkerPos _z};

							// азимут
							_z = [civilianBasePos, _z] call BIS_fnc_dirTo;
								if (_fl == 2) then {
									_fl = [_z+180, 3];
								}else{
									_fl = [_z, 3];
								};
						};

						diag_log format ["Log: [reinforcements] frontLine east %1", [_z,_fl]];
					};

				// _z [нападающие, патрули,  нападающие.уд.пк,  патрули.уд.пк]
				_z = {isNil {_x getVariable "patrol"}} count (_grp select 0);
					_z = [_z, count (_grp select 0) - _z];
					_z set [2, {isNil {_x getVariable "patrol"}} count (_grp select 4)];
					_z set [3, count (_grp select 4) - (_z select 2)];
					diag_log format ["Log: [reinforcements] east сейчас %1 %2", _z, [count (_grp select 0), count (_grp select 4)]];

				if ((_z select 0) + ((_z select 2) * 0.5) + ({_x select 1 == 0} count _conveyer) < (_limits select 0)) then {
					_conveyer set [count _conveyer, [[east, objNull, _fl] spawn gosa_fnc_call_reinforcement, 0]];
				};
				if ((_z select 1) + ((_z select 3) * 0.5) + ({_x select 1 == 4} count _conveyer) < (_limits select 4)) then {
					_conveyer set [count _conveyer, [[east, _p call BIS_fnc_selectRandom, _fl] spawn gosa_fnc_call_reinforcement, 4]];
				};

			// WEST
				//--- линия фронта
					_fl = missionNamespace getVariable "gosa_frontLine_west";
					if (_fl == 0) then {
						_fl = [];
					}else{
						_z = [];

						if (_fl == 1) then {

							if (west getFriend east >= 0.6) then {
								_z = (_grp select 0) +_z;
							};
							if (west getFriend resistance >= 0.6) then {
								_z = (_grp select 2) +_z;
							};

						};
						if (_fl == 2) then {

							if (west getFriend east < 0.6) then {
								_z = (_grp select 0) +_z;
							};
							if (west getFriend resistance < 0.6) then {
								_z = (_grp select 2) +_z;
							};

						};

						// позиция
						_z = _z call _fnc_fl;

						if (count _z == 0) then {
							_fl = _z;
						}else{
							if(gosa_loglevel>0)then{_diag_log_m_fl_w setMarkerPos _z};

							// азимут
							_z = [civilianBasePos, _z] call BIS_fnc_dirTo;
								if (_fl == 2) then {
									_fl = [_z+180, 3];
								}else{
									_fl = [_z, 3];
								};
						};

						diag_log format ["Log: [reinforcements] frontLine west %1", [_z,_fl]];
					};

				_z = {isNil {_x getVariable "patrol"}} count (_grp select 1);
					_z = [_z, count (_grp select 1) - _z];
					_z set [2, {isNil {_x getVariable "patrol"}} count (_grp select 5)];
					_z set [3, count (_grp select 5) - (_z select 2)];
					diag_log format ["Log: [reinforcements] west сейчас %1 %2", _z, [count (_grp select 1), count (_grp select 5)]];

				if ((_z select 0) + ((_z select 2) * 0.5) + ({_x select 1 == 1} count _conveyer) < (_limits select 1)) then {
					_conveyer set [count _conveyer, [[west, objNull, _fl] spawn gosa_fnc_call_reinforcement, 1]];
				};
				if ((_z select 1) + ((_z select 3) * 0.5) + ({_x select 1 == 5} count _conveyer) < (_limits select 5)) then {
					_conveyer set [count _conveyer, [[west, _p call BIS_fnc_selectRandom, _fl] spawn gosa_fnc_call_reinforcement, 5]];
				};

			// GUE
				//--- линия фронта
					_fl = missionNamespace getVariable "gosa_frontLine_guer";
					if (_fl == 0) then {
						_fl = [];
					}else{
						_z = [];

						if (_fl == 1) then {

							if (resistance getFriend east >= 0.6) then {
								_z = (_grp select 0) +_z;
							};
							if (resistance getFriend west >= 0.6) then {
								_z = (_grp select 1) +_z;
							};

						};
						if (_fl == 2) then {

							if (resistance getFriend east < 0.6) then {
								_z = (_grp select 0) +_z;
							};
							if (resistance getFriend west < 0.6) then {
								_z = (_grp select 1) +_z;
							};

						};

						// позиция
						_z = _z call _fnc_fl;

						if (count _z == 0) then {
							_fl = _z;
						}else{
							if(gosa_loglevel>0)then{_diag_log_m_fl_r setMarkerPos _z};

							// азимут
							_z = [civilianBasePos, _z] call BIS_fnc_dirTo;
								if (_fl == 2) then {
									_fl = [_z+180, 3];
								}else{
									_fl = [_z, 3];
								};
						};

						diag_log format ["Log: [reinforcements] frontLine guer %1", [_z,_fl]];
					};

				_z = {isNil {_x getVariable "patrol"}} count (_grp select 2);
					_z = [_z, count (_grp select 2) - _z];
					_z set [2, {isNil {_x getVariable "patrol"}} count (_grp select 6)];
					_z set [3, count (_grp select 6) - (_z select 2)];
					diag_log format ["Log: [reinforcements] guer сейчас %1 %2", _z, [count (_grp select 2), count (_grp select 6)]];

				if ((_z select 0) + ((_z select 2) * 0.5) + ({_x select 1 == 2} count _conveyer) < (_limits select 2)) then {
					_conveyer set [count _conveyer, [[resistance, objNull, _fl] spawn gosa_fnc_call_reinforcement, 2]];
				};
				if ((_z select 1) + ((_z select 3) * 0.5) + ({_x select 1 == 6} count _conveyer) < (_limits select 6)) then {
					_conveyer set [count _conveyer, [[resistance, _p call BIS_fnc_selectRandom, _fl] spawn gosa_fnc_call_reinforcement, 6]];
				};
			};

		};

	sleep (_sleep call gosa_fnc_dynSleep);

	_z = 2*((time-_time) / _dfi);
	if(gosa_framesAVG > _frames_required)then{
		_dyn_limit = _dyn_limit + _z;
		diag_log format ["Log: [reinforcements] + 2* %1 / %2 = %3", _z, _dfi, _z];
	}else{
		diag_log format ["Log: [reinforcements] - 2* %1 / %2 = %3", _z, _dfi, _z];
		if (gosa_deviceType != 2) then {
			_dyn_limit = _minGroups max (_dyn_limit - _z);
		}else{
			_dyn_limit = 0 max (_dyn_limit - _z);
		};
	};
	diag_log format ["Log: [reinforcements] _frames_current %2, _frames_required %3, _limit %4", time, gosa_framesAVG, _frames_required, _dyn_limit];
	_time = time;
};

diag_log format ["Log: [reinforcements] scriptDone %1", time];
