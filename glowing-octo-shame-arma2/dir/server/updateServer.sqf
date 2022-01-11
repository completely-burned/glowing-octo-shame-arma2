waitUntil {!isNil "bis_fnc_init" && !isNil "gosa_fnc_init"};
waitUntil {!isNil "gosa_crewL" && !isNil "listMHQ"};
waitUntil {!isNil "silvieManagerBlacklist" && !isNil "silvieManagerVehicles"};

diag_log format ["Log: [updateServer.sqf] post waitUntil %1", time];

private["_path"];
_path = "dir\server\";
[] execVM (_path + "while_vehicles_other.sqf");
[] execVM (_path + "server_update_other.sqf");
[] execVM (_path + "server_update_location.sqf");
[] execVM (_path + "server_update_silvieManager.sqf");
[] execVM (_path + "transport.sqf");
// [] execVM (_path + "server_update_StaticWeapon.sqf");
// [] execVM (_path + "server_gc_water.sqf");
[] execVM (_path + "while_canStand.sqf");
// [] execVM (_path + "while_reveal.sqf");
[] execVM (_path + "while_group_system_units.sqf");
[] execVM (_path + "while_mhq.sqf");

[] execVM (_path + "while_groups_gc.sqf");
[] execVM (_path + "while_groups_cleanup.sqf");

[] execVM (_path + "server_update_groups_other.sqf");
[] execVM (_path + "modules.sqf");
[] execVM "dir\testing\laser.sqf";
[] execVM "dir\ssm\ssm_sv.sqf";
