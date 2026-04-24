#define __A2OA__
private["_b"];

#ifndef __ARMA3__
	waitUntil{!isNil "BIS_fnc_init"};
#endif
waitUntil {!isNil "gosa_fnc_init"};
waitUntil {!isNil "gosa_crewL" && !isNil "listMHQ"};
waitUntil {!isNil "silvieManagerBlacklist" && !isNil "silvieManagerVehicles"};

diag_log format ["Log: [updateServer.sqf] post waitUntil %1", time];

[] execVM "dir\server\while_respawnvehicles.sqf";
[] execVM "dir\server\while_vehicles_other.sqf";
#ifdef __A2OA__
	[] execVM "dir\server\while_restore_objects.sqf";
	[] execVM "dir\server\server_update_other.sqf";
#endif
[] execVM "dir\server\server_update_location.sqf";
[] execVM "dir\server\transport.sqf";
// [] execVM "dir\server\server_update_staticweapon.sqf";
// [] execVM "dir\server\server_gc_water.sqf";
[] execVM "dir\server\while_canstand.sqf";
// [] execVM "dir\server\while_reveal.sqf";
[] execVM "dir\server\while_group_system_units.sqf";

[] execVM "dir\server\while_groups_gc.sqf";
[] execVM "dir\server\while_groups_cleanup.sqf";

[] execVM "dir\server\modules.sqf";
[] execVM "dir\testing\laser.sqf";
[] execVM "dir\ssm\ssm_sv.sqf";
[] execVM "dir\server\while_groups_other.sqf";

#ifndef __ARMA3__
	_b = if (missionNamespace getVariable "gosa_silvieManager" <= 0) then {false} else {true};
	if (_b) then {
		[] execVM "dir\server\while_silviemanager.sqf";
	};
#endif
