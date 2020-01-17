waitUntil {!isNil "bis_fnc_init" && !isNil "m_fnc_init"};
waitUntil {!isNil "listCrew" && !isNil "listMHQ"};
waitUntil {!isNil "silvieManagerBlacklist" && !isNil "silvieManagerVehicles"};

private["_path"];
_path = "m\server\";
[] execVM (_path + "server_update_units.sqf");
[] execVM (_path + "server_update_vehicles.sqf");
[] execVM (_path + "server_update_other.sqf");
[] execVM (_path + "server_update_location.sqf");
[] execVM (_path + "server_update_silvieManager.sqf");
[] execVM (_path + "server_update_groups.sqf");
[] execVM (_path + "server_update_wp.sqf");
[] execVM (_path + "transport.sqf");
[] execVM (_path + "server_update_StaticWeapon.sqf");
[] execVM (_path + "lag.sqf");

private ["_time2","_delay","_time2_select"];
_time2 = [time,time,time,time,time,time,time,time,time,time,time,time,time,time];

while {true} do {
	sleep 5;

	_delay = (time - (_time2 select 0));
	_time2 set [0,time];
	_time2_select = 1;

	allDead call fnc_cleanup;

	// BIS_GC_trashItFunc
	if( (_time2 select _time2_select) < time )then{
		_time2 set [_time2_select,time+30+random 5]; _time2_select = _time2_select + 1;
		#include "server_update_gc.sqf";
	};

	// if(true)then{
		// #include "server_update_groups.sqf";
	// };
};
