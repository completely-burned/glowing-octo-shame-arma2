/*
 * Скрипт отвечает за вызов подкреплений на клиентском компьетере.
 * TODO: Рефакторинг.
 * TODO: Переход на функции.
 * TODO: Совместимость с PvP.
 */

#define __A2OA__

private["_minGroups","_e_cfi","_playerCoefficient","_center_e_dir","_players",
	"_enemyCoefficientCfg","_timeFriendlyReinforcements","_limit_fps",
	"_frames_required","_time","_dyn_limit","_n","_b","_dfi","_conveyer",
	"_conveyer_limit","_limits","_l_enemy","_locationPos","_grp","_e_multipler",
	"_fl","_cfg_cfi","_patrol_percent","_respawn_mode","_run","_allGroups",
	"_frontLine_east","_frontLine_west","_frontLine_guer","_deviceT2",
	"_lg","_enemySide","_friendlySide","_sleep","_obj","_side",
	"_remote_miltipler","_cfi_sides_friendly","_cfi_sides_enemy","_deviceType",
	"_types_pilot","_sides_friendly","_sides_enemy","_mode_pvp"];

diag_log format ["Log: [reinforcements] started %1", time ];

waitUntil {!isNil "bis_fnc_init"};
	waitUntil {!isNil "gosa_fnc_init"};
	waitUntil {!isNil "GroupsStarted"};
	waitUntil {!isNil "gosa_framesAVG"};

diag_log format ["Log: [reinforcements] post waitUntil %1", time];

private["_diag_log_m_fl_e","_diag_log_m_fl_w","_diag_log_m_fl_r"];
	if(gosa_loglevel>0)then{ // diag_log
		_diag_log_m_fl_e = createMarker ["gosa_fl_" + str east, [0,0]];
		_diag_log_m_fl_e setMarkerTextLocal _diag_log_m_fl_e;
		_diag_log_m_fl_e setMarkerType "Dot";
		_diag_log_m_fl_w = createMarker ["gosa_fl_" + str west, [0,0]];
		_diag_log_m_fl_w setMarkerTextLocal _diag_log_m_fl_w;
		_diag_log_m_fl_w setMarkerType "Dot";
		_diag_log_m_fl_r = createMarker ["gosa_fl_" + str resistance, [0,0]];
		_diag_log_m_fl_r setMarkerTextLocal _diag_log_m_fl_r;
		_diag_log_m_fl_r setMarkerType "Dot";
	}; // diag_log

_conveyer = [];
_conveyer_limit = 12;

_deviceType = gosa_deviceType;
// Не выделенный клиент.
if (_deviceType == 2) then {
	_deviceT2 = true;
}else{
	_deviceT2 = false;
};
_remote_miltipler = 0.1;
if (_deviceType in [0,1]) then {
	_remote_miltipler = 0.5;
};

_patrol_percent = ((missionNamespace getVariable "gosa_patrolCoefficient") / 100);
_dfi = gosa_server_diag_fps_interval;
if (_deviceT2) then {
	_minGroups = missionNamespace getVariable "ai_client_count";
	_limit_fps = (missionNamespace getVariable "gosa_ai_client_create_fps");
	_sleep = 15;
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
	_sleep = 5;
	_run = true;
	diag_log format ["Log: [reinforcements] waitUntil locationStarted %1", time];
	waitUntil {!isNil "locationStarted"};
	diag_log format ["Log: [reinforcements] post waitUntil locationStarted %1", time];
};
// FIXME: =+? При записи в _dyn_limit возможно перезаписывается _minGroups.
_dyn_limit = _minGroups;
_cfg_cfi = missionNamespace getVariable "enemyCoefficient";
// TODO: количество игроков не учитывается
_playerCoefficient = missionNamespace getVariable "playerCoefficient";
_timeFriendlyReinforcements = (missionNamespace getVariable "timeFriendlyReinforcements") * 60;
_e_multipler = _timeFriendlyReinforcements / _cfg_cfi;
diag_log format ["Log: [reinforcements] _e_multipler=%1/%2", _timeFriendlyReinforcements, _cfg_cfi];
_frames_required = _limit_fps * _dfi;
_time = time;
_frontLine_east = missionNamespace getVariable "gosa_frontLine_east";
_frontLine_west = missionNamespace getVariable "gosa_frontLine_west";
_frontLine_guer = missionNamespace getVariable "gosa_frontLine_guer";
_mode_pvp = gosa_pvp;
_types_pilot = gosa_pilotL;

_sides_friendly = gosa_friendlyside - [civilian];
_sides_enemy = [west,east,resistance] - gosa_friendlyside;
_friendlySide = [];
_enemySide = [];
	for "_i" from 0 to (count _sides_enemy -1) do {
		switch (_sides_enemy select _i) do {
			case EAST:		{_enemySide set [_i, 0]};
			case WEST:		{_enemySide set [_i, 1]};
			case RESISTANCE:{_enemySide set [_i, 2]};
			case CIVILIAN:	{_enemySide set [_i, 3]};
			default {};
		};
	};
	for "_i" from 0 to (count _sides_friendly -1) do {
		switch (_sides_friendly select _i) do {
			case EAST:		{_friendlySide set [_i, 0]};
			case WEST:		{_friendlySide set [_i, 1]};
			case RESISTANCE:{_friendlySide set [_i, 2]};
			case CIVILIAN:	{_friendlySide set [_i, 3]};
			default {};
		};
	};

_cfi_sides_enemy = ([_enemySide, gosa_Groups_common] call gosa_fnc_groups_get_cfi_side);
for "_i" from 0 to (count _cfi_sides_enemy -1) do {
	_cfi_sides_enemy set [_i, (_cfi_sides_enemy select _i) * count _cfi_sides_enemy];
};
_cfi_sides_friendly = ([_friendlySide, gosa_Groups_common] call gosa_fnc_groups_get_cfi_side);
for "_i" from 0 to (count _cfi_sides_friendly -1) do {
	_cfi_sides_friendly set [_i, (_cfi_sides_friendly select _i) * count _cfi_sides_friendly];
};
diag_log format ["Log: [reinforcements] _cfi_sides %1", [_cfi_sides_enemy, _cfi_sides_friendly]];

waitUntil {!isNil "civilianBasePos"};

while{_run}do{

	_allGroups = allGroups;

	_grp = (_allGroups call gosa_fnc_getGroups);

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

	// Патрули клиента будут ему локальны.
	if (_deviceT2) then {
		_players = [player];
	} else {
		_players = ([] call gosa_fnc_listPlayers);
	};

	//--- динамические ограничения

		// TODO: Приватная переменная.
		if (_mode_pvp) then {
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
					diag_log format ["Log: [reinforcements] _e_cfi, _n=%1-%2", time, CivilianLocationStartTime];
					_n = time - CivilianLocationStartTime;
					diag_log format ["Log: [reinforcements] _e_cfi, _n=%1-%2", _timeFriendlyReinforcements, _n];
					_n = 0 max (_timeFriendlyReinforcements - _n);
					diag_log format ["Log: [reinforcements] _e_cfi=%1/%2", _n, _e_multipler];
					_e_cfi = _n / _e_multipler;

					if (_cfg_cfi >= 1) then {
						_e_cfi = _e_cfi max 1;
					};
					diag_log format ["Log: [reinforcements] _e_cfi %1", _e_cfi];
				}else{
					_e_cfi = _cfg_cfi;
				};

				_limits = [];
					for "_i" from 0 to (count _enemySide -1) do {
						_item = _enemySide select _i;
						_n = (_cfi_sides_enemy select _i);
						_limits set [_item, 	round ((((_dyn_limit / (1+_e_cfi)) * _e_cfi) * (1 - _patrol_percent) / count _enemySide) * _n)];
						_limits set [_item+4, round ((((_dyn_limit / (1+_e_cfi)) * _e_cfi) * _patrol_percent / count _enemySide) * _n)];
					};
					for "_i" from 0 to (count _friendlySide -1) do {
						_item = _friendlySide select _i;
						_n = (_cfi_sides_friendly select _i);
						_limits set [_item, 	round ((( _dyn_limit / (1+_e_cfi)) * (1 - _patrol_percent) / count _friendlySide) * _n)];
						_limits set [_item+4, round ((( _dyn_limit / (1+_e_cfi)) * _patrol_percent / count _friendlySide) * _n)];
					};
					_limits set [8, _dyn_limit];
		};
		diag_log format ["Log: [reinforcements] _limits %1", _limits];

	_locationPos = civilianBasePos;

	//--- чистка при значительном превышении лимита
	_n = (_dyn_limit*1.4+1) max (_dyn_limit+8);
	if (_lg + count _conveyer > _n) then {
			if !(_deviceT2) then {
				private["_side","_l","_grp","_rm","_d"];
				diag_log format ["Log: [reinforcements] групп слишком много %1+%2 > %3", _lg, count _conveyer, _n];
				for "_i" from 0 to (count _allGroups -1) do {
					_grp = _allGroups select _i;
					//_side = side _grp;
					_l = leader _grp;
					#ifdef __ARMA3__
					if (local _grp) then
					#else
					if (local _l) then
					#endif
					{
						if({_x call gosa_fnc_isPlayer} count units _grp < 1)then{

							if (isNil "_d") then {
								_d = _locationPos distance vehicle _l;
								_rm = [_grp];
							}else{
								if (_d < _locationPos distance vehicle _l) then {
									_rm = [_grp]+_rm;
									_rm resize (0 max round ((_lg-_n) min count _rm));
								};
							};
							diag_log format ["Log: [reinforcements] rm %1", _rm];
						};
					};
				};

				if !(isNil "_rm") then {
					if (count _rm > 0) then {
						for "_i" from 0 to (count _rm -1) do {
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
		if !(isNil "gosa_respawnRandom") then {
		if (_deviceT2 or _deviceType in [1,2]) then {
			//--- Аварийная группа возрождения.
			// FIXME: Не проверенно в одиночной игре.
			// Чтобы не закончились юниты для перерождения.
			// Переменная на стороне клиента.
			// TODO: Устранить конфликт с HC.
			_b = isNil "gosa_player_needs_revival";
			if (_b) then {
				_n = {local _x} count units player;
				diag_log format ["Log: [reinforcements] %1 local units %2", _n, units player];
				if (_n < 3) then {
						if (east getFriend playerSide >= 0.6) then {
							_n = {isNil {_x getVariable "patrol"}} count (((_grp select 0)+(_grp select 3))-[group player]);
							diag_log format ["Log: [reinforcements] %1 east grp %2", _n];
						}else{
							_n = 0;
						};

					if (_n < 1) then {
						if (west getFriend playerSide >= 0.6) then {
							_n = {isNil {_x getVariable "patrol"}} count (((_grp select 1)+(_grp select 4))-[group player]);
							diag_log format ["Log: [reinforcements] %1 west grp %2", _n];
						};
					};

					if (_n < 1) then {
						if (resistance getFriend playerSide >= 0.6) then {
							_n = {isNil {_x getVariable "patrol"}} count (((_grp select 2)+(_grp select 5))-[group player]);
							diag_log format ["Log: [reinforcements] %1 guer grp %2", _n];
						};
					};

					if (_n > 0) then {
						// Количество отрядов > 0.
						_b = false;
					};
				}else{
					// Количество юнитов в группе >= 3.
					_b = false;
				};
			}else{
				// Необходимо генерировать отряд если переменная установлена.
				_b = true;
				diag_log format ["Log: [reinforcements] _player_needs_revival %1 %2", _b, gosa_player_needs_revival];
			};
			if (_b) then {
				if ({_x select 1 == 8} count _conveyer < 1) then {
					_n = floor random count _sides_friendly;
					_conveyer set [count _conveyer,
						[[_sides_friendly select _n, _friendlySide select _n, _locationPos]
							spawn gosa_fnc_failoverGroup, 8]
					];
				};
			};
		};
		};

	//--- создание отрядов
		if (count _conveyer < _conveyer_limit) then {

			// Исключения.
			for "_i" from 0 to (count _players -1) do {
				_obj = _players select _i;
				// Отсеим пилотов-игроков чтобы за ними не гонялись боты.
				if (typeOf _obj in _types_pilot) then {
					diag_log format ["Log: [reinforcements] %1 исключён из целей патруля, пилот", _obj];
					_players set [_i, objNull];
				}else{
					// Отсеим гражданских.
					_side = side _obj;
					if !(_side in _sides_enemy or _side in _sides_friendly) then {
						diag_log format ["Log: [reinforcements] %1 исключён из целей патруля, гражданский", _obj];
						_players set [_i, objNull];
					};
				};
			};
			_players = _players-[objNull];
			if (count _players < 1) then {
				_players = [objNull];
			};

			// TODO: Случайность сторон.

			// EAST
			[	_conveyer,
				_frontLine_east,
				east,west,resistance,
				_grp select 1,_grp select 2,
				_grp select 0,_grp select 4,
				_limits select 0,_limits select 4,
				0,4,
				_locationPos,_players,
				_remote_miltipler
			] call gosa_fnc_call_reinforcement_pre;

			// WEST
			[	_conveyer,
				_frontLine_west,
				west,east,resistance,
				_grp select 0,_grp select 2,
				_grp select 1,_grp select 5,
				_limits select 1,_limits select 5,
				1,5,
				_locationPos,_players,
				_remote_miltipler
			] call gosa_fnc_call_reinforcement_pre;

			// GUE
			[	_conveyer,
				_frontLine_guer,
				resistance,east,west,
				_grp select 0,_grp select 1,
				_grp select 2,_grp select 6,
				_limits select 2,_limits select 6,
				2,6,
				_locationPos,_players,
				_remote_miltipler
			] call gosa_fnc_call_reinforcement_pre;
			};
		};

	sleep (_sleep call gosa_fnc_dynSleep);

	_n = 2*((time-_time) / _dfi);
	if(gosa_framesAVG > _frames_required)then{
		_dyn_limit = _dyn_limit + _n;
		diag_log format ["Log: [reinforcements] + 2* %1 / %2 = %3", _n, _dfi, _n];
	}else{
		diag_log format ["Log: [reinforcements] - 2* %1 / %2 = %3", _n, _dfi, _n];
		if (_deviceT2) then {
			_dyn_limit = (0 max (_dyn_limit - _n));
		}else{
			_dyn_limit = (_minGroups max (_dyn_limit - _n));
		};
	};
	diag_log format ["Log: [reinforcements] _frames_current %2, _frames_required %3, _limit %4", time, gosa_framesAVG, _frames_required, _dyn_limit];
	_time = time;
};

diag_log format ["Log: [reinforcements] scriptDone %1", time];
