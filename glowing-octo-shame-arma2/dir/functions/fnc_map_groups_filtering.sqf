private ["_west","_east","_guer","_groups_map","_n","_d","_pvp","_landing","_b",
	"_westN","_eastN","_guerN","_westD","_eastD","_guerD","_depth",
	"_arr","_cfg_factions_def","_groups_use","_factions_blocked",
	"_grp","_groups_failover","_factions_used","_climate","_date",
	"_groups_failover_map","_sides_friendly","_copyRef",
	"_groups_enabled","_factions_enabled","_groups_enabled_map",
	"_groups_pending_map","_str","_param_default","_side",
	"_sl","_tl","_date_tolerance","_climate_tolerance",
	"_alliances","_alliances_enabled","_alliance","_sides",
	"_default_east","_default_west","_default_guer"];

_groups_map = _this select 0;
_sides = _this select 1;
_date = _this select 2 select 0;
_climate = _this select 2 select 1;
_date_tolerance = _this select 3 select 0;
_climate_tolerance = _this select 3 select 1;

_groups_enabled = [];
_groups_enabled_map = [];
_groups_failover = [];
_groups_failover_map = [];
_factions_blocked = [];
_factions_enabled = [];
_groups_pending_map = [];
_groups_use = [];
_param_default = -1;

//-- Включены по стартовым параметрам.
for "_i" from 0 to (count _groups_map -1) do {
	// [_side,_name,_groups,_date,_climate,_blacklist,_failover_prio]
	_arr = _groups_map select _i;
	if (count (_arr select 2) > 0) then {
		_str = _arr select 1;
		_b = true;
		if (_arr select 2 in _sides) then {
			_n = -1;
		}else{
			_n = 1;
		};
		//- Проверка даты.
		if (((_arr select 3 select 0) + (_date_tolerance select 0)*_n) > _date or 
			((_arr select 3 select 1) + (_date_tolerance select 1)*_n) < _date) then
		{
			diag_log format ["Log: [fnc_map_groups] %1 исключена, дата %2", _str, [_date, _arr select 3]];
			_b = false;
		};
		//- Климат.
		if (((_arr select 4 select 0) + (_climate_tolerance select 0)*_n) > _climate or 
			((_arr select 4 select 1) + (_climate_tolerance select 1)*_n) < _climate) then
		{
			diag_log format ["Log: [fnc_map_groups] %1 исключена, климат %2", _str, [_climate, _arr select 4]];
			_b = false;
		};

		_n = missionNamespace getVariable ("gosa_faction_multiplier_" + _str);
		if (_n > 0) then {
			if (_b) then {
				_groups_enabled set [count _groups_enabled, _i];
				_groups_enabled_map set [count _groups_enabled_map, _arr];
				diag_log format ["Log: [fnc_map_groups] %1, enabled", _str];
			}else{
				diag_log format ["Log: [fnc_map_groups] %1, failover", _str];
				//- Если группа включена в настройках, но нет подходящей.
				_n = _groups_failover find _str;
				if (_n >= 0) then {
					if (_arr select 6 > (_groups_failover_map select _n select 6)) then {
						_groups_failover_map set [_n, _arr];
					};
				}else{
					_groups_failover set [count _groups_failover, _str];
					_groups_failover_map set [count _groups_failover, _arr];
				};
			};
			//- 
			{
				if !(_x in _factions_blocked) then {
					_factions_blocked set [count _factions_blocked, _x];
					diag_log format ["Log: [fnc_map_groups] %1, blocked", _x];
				};
			} forEach (_arr select 5);
			if !(_str in _factions_enabled) then {
				_factions_enabled set [count _factions_enabled, _str];
			};
		}else{
			if (_n == _param_default && _b) then {
				if !(_i in _groups_pending_map) then {
					_groups_pending_map set [count _groups_pending_map, _i];
					diag_log format ["Log: [fnc_map_groups] %1, pending", _str];
				};
			};
		};
	};
};

//-- failover
#ifdef __ARMA3__
	_groups_enabled_map append _groups_failover_map;
#else
	_groups_enabled_map = _groups_enabled_map + _groups_failover_map;
#endif

//- Автомат.
for "_i" from 0 to (count _groups_pending_map -1) do {
	_n = _groups_pending_map select _i;
	_arr = _groups_map select _n;
	_str = _arr select 1;
	//- Первые по списку вытесняют последних.
	// TODO: Нужна рандомизация.
	if !(_str in _factions_blocked) then {
		_groups_use set [count _groups_use, _n];
		_groups_enabled_map set [count _groups_enabled_map, _arr];
		diag_log format ["Log: [fnc_map_groups] %1, enabled, pending", _str];
		{
			if !(_x in _factions_blocked) then {
				_factions_blocked set [count _factions_blocked, _x];
				diag_log format ["Log: [fnc_map_groups] %1, blocked", _x];
			};
		} forEach (_arr select 5);
	};
};

_groups_enabled_map;
