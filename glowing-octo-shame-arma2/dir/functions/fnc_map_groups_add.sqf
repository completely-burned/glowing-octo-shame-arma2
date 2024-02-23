private ["_map","_side","_name","_groups","_date","_climate","_blacklist","_failover_prio"];

_map = _this select 0;
_side = _this select 1;
_name = _this select 2;
_groups = _this select 3;
_date = _this select 4;
_climate = _this select 5;
_blacklist = _this select 6;
_failover_prio = _this select 7;
if (isNil "_failover_prio") then {
	_failover_prio = 0;
};

if (count _groups > 0) then {
	_map set [count _map, [_side,_name,_groups,_date,_climate,_blacklist,_failover_prio]];
};
