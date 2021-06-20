private["_path","_prefix"];
_path = "dir\Functions\";

// файлы без приставки
_prefix="gosa_";

BIS_fnc_listPlayers = compile (preprocessFileLineNumbers (_path + "fnc_listPlayers.sqf"));

//--- сервер
if (isServer) then {
	{
		call compile format ["%1%2 = compile (preprocessFileLineNumbers '%3%2.sqf')", _prefix, _x, _path];
	} forEach [
		"fnc_call_reinforcement",
		"fnc_cleanup",
		"fnc_StaticWeapon",
		"fnc_playerRespawnSP",
		"fnc_playerRespawn",
		"fnc_call_reinforcement",
		"fnc_StaticWeapon",
		"fnc_playerRespawnSP",
		"fnc_playerRespawn"
	];
};


//--- клиент
if (!IsDedicated) then {
	{
		call compile format ["%1%2 = compile (preprocessFileLineNumbers '%3%2.sqf')", _prefix, _x, _path];
	} forEach [
		"fnc_initBriefing",
		"fnc_Client_BuyUnit",
		"fnc_respawnWeaponsAdd",
		"fnc_teleport",
		"fnc_killcam",
		"fnc_teleport",
		"fnc_teleport2",
		"fnc_resetActions",
		"fnc_getSafePos",
		"fnc_ACT_WinchManager",
		"fnc_rating",
		"fnc_handlePlayableUnitsMarker",
		"fnc_handleJoinGroup",
		"fnc_handleTeleport",
		"fnc_handleLocationTask",
		"fnc_handleBuyMenu",
		"fnc_turnVehicle"
	];
};

//--- общие
{
	call compile format ["%1%2 = compile (preprocessFileLineNumbers '%3%2.sqf')", _prefix, _x, _path];
} forEach [
	"fnc_check_config_use",
	"fnc_CheckCombatNearUnits",
	"fnc_CheckIsKindOfArray",
	"fnc_CheckPlayersDistance",
	"fnc_Fuel",
	"fnc_GetTransportMagazines",
	"fnc_MoveInCargo",
	"fnc_ReammoBox",
	"fnc_updateReammoBox",
	"fnc_SafePosParams",
	"fnc_findSafePos",
	"fnc_getSide",
	"fnc_nearestPlayer",
	"fnc_returnGroups",
	"fnc_returnVehicleTurrets",
	"fnc_reweapon",
	"fnc_spawnCrew",
	"fnc_spawnGroup",
	"fnc_spawnVehicle",
	"fnc_waypoints",
	"fnc_libEnabled",
	"fnc_mobileHQ_init",
	"fnc_vehInit",
	"fnc_SalvageTruck",
	"fnc_defaultCrew",
	"fnc_setNestedElement",
	"fnc_availableVehicles",
	"fnc_availableWeapons",
	"fnc_availableMagazines",
	"fnc_availableBackpacks",
	"fnc_CheckTimeAvailableVehiclesBuyMenu",
	"fnc_setTimeAvailableVehiclesBuyMenu",
	"fnc_megaAmmoBox",
	"fnc_createmenu",
	"fnc_vehicleHandleDamage",
	"fnc_vehInit2",
	"fnc_CheckRespawnDistance",
	"fnc_CheckTurretAlive",
	"fnc_uav",
	"fnc_isUAV",
	"fnc_getPlayersDistance",
	"fnc_roads",
	"fnc_get_MHQ_type",
	"fnc_coin_variable",
	"fnc_smoke",
	"fnc_respawnPos",
	"fnc_eh_getout",
	"fnc_eh_getin",
	"fnc_teamDamaging",
	"fnc_group_cleanup",
	"fnc_group_other",
	"fnc_group_wp",
	"fnc_isPlayer"
];


gosa_fnc_init = true;
