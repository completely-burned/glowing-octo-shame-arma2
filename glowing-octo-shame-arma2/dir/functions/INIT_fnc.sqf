﻿//--- переменные нужные для некоторых функций

// для fnc_deleteGroup
deadGroup = grpNull;
gosa_cache_HQ = [objNull];

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
		#ifndef __ARMA3__
			"fnc_createHQ",
			"fnc_list_HQ",
		#endif
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
if !(IsDedicated) then {
	{
		call compile format ["%1%2 = compile (preprocessFileLineNumbers '%3%2.sqf')", _prefix, _x, _path];
	} forEach [
		#ifndef __ARMA3__
			"fnc_menu_factory",
			"fnc_menu_factories",
		#endif
		"fnc_selectPlayer",
		"fnc_eh_playerRespawn",
		"fnc_reveal",
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
		"fnc_handleTeleport",
		"fnc_handleLocationTask",
		"fnc_turnVehicle"
	];
};

//--- общие
{
	call compile format ["%1%2 = compile (preprocessFileLineNumbers '%3%2.sqf')", _prefix, _x, _path];
} forEach [
	"fnc_arrSorting_confGroups",
	"fnc_selectRandomWeighted",
	"fnc_getSideNum",
	"fnc_selectPlayer_isFit",
	"fnc_getSafePosForObject",
	"fnc_getGroupUnits",
	"fnc_initAirports",
	"fnc_getPlayerParam",
	"fnc_groupUnitsDismiss",
	"fnc_isZeroPos",
	"fnc_menu_selectLeader",
	"fnc_getTypeOfSide",
	"fnc_getStartingPosMHQ",
	"fnc_getIslandType",
	"fnc_getDeviceType",
	"fnc_isCrewAlive",
	"fnc_getHQ",
	"fnc_addWaypoint",
	"fnc_canAttack",
	"fnc_canAttackGroup",
	"fnc_assignedVeh",
	"fnc_eh_killed",
	"fnc_clean_vars",
	"fnc_rankConv",
	"fnc_SSM_RequestRadio",
	"fnc_SSM_Request",
	"fnc_SSM_findReadyVehicle",
	"fnc_SSM_spawnAir",
	"fnc_SSM_AmmoDropWaypointReached",
	"fnc_getRandomWorldPos",
	"fnc_getUnitClass",
	"fnc_crewUAV",
	"fnc_explosionCar",
	"fnc_dynSleep",
	"fnc_getGroups",
	"fnc_find_heliUnload_pos",
	"fnc_getPosBehind",
	"fnc_paraJump",
	"fnc_withinMap",
	"fnc_worldSize",
	"fnc_centerOfImpact",
	"fnc_allowGetIn",
	"fnc_he",
	"fnc_failoverGroup",
	"fnc_groupsRarity",
	"fnc_getGroupType",
	"fnc_dynSkill",
	"fnc_act_repairVehicle",
	"fnc_repairVehicle",
	"fnc_getFaction",
	"fnc_autoLeader",
	"fnc_find_AA_pos",
	"fnc_isNight",
	"fnc_aiFlareSupport",
	"fnc_unitFlareFire",
	"fnc_canSee",
	"fnc_deleteGroup",
	"fnc_call_reinforcement",
	"fnc_mining",
	"fnc_laserBomb",
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
	#ifndef __ARMA3__
		"fnc_fixType",
		"fnc_isObjHQ",
		"fnc_isHQ",
		"fnc_vehInit2",
	#endif
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

if (!isMultiplayer) then {
	{
		call compile format ["%1%2 = compile (preprocessFileLineNumbers '%3%2SP.sqf')", _prefix, _x, _path];
	} forEach [
		"fnc_isPlayer"
	];
};


#ifdef __ARMA3__
	BIS_fnc_distance2D = {_this select 0 distance2D (_this select 1)};
#else
	BIS_fnc_selectRandomWeighted = gosa_fnc_selectRandomWeighted;
#endif

gosa_fnc_init = true;
