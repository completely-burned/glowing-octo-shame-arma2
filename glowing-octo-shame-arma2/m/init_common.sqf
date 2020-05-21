EnableTeamSwitch false;

LIB_cfgVeh = configFile >> "CfgVehicles";
LIB_cfgWea = configFile >> "CfgWeapons";
// LIB_cfgAmm = configFile >> "CfgAmmo";
LIB_cfgWor = configFile >> "CfgWorlds" >> worldName;
// LIB_cfgWAr = LIB_cfgWor >> "Armory";
// LIB_cfgArm = configFile >> "CfgArmory";
// LIB_disableShips = getNumber(LIB_cfgWAr >> "disableShips");
LIB_a2Avail = false;
if (configName(configFile >> "CfgMods" >> "CA") != "") then {LIB_a2Avail = true};
LIB_ahAvail = false;
if (configName(configFile >> "CfgMods" >> "Expansion") != "") then {LIB_ahAvail = true};
ACE_Avail = false;
if (configName(LIB_cfgVeh >> "ACE_Logic") != "") then {ACE_Avail = true};
acex_ru_Avail = false;
if (configName(configFile >> "CfgMods" >> "acex_ru") != "") then {acex_ru_Avail = true};
acex_usnavy_Avail = false;
if (configName(configFile >> "CfgMods" >> "acex_usnavy") != "") then {acex_usnavy_Avail = true};

///--- функции
[] call compile preprocessFileLineNumbers "m\functions\INIT_fnc.sqf";

listSalvageTruck = ["WarfareSalvageTruck_RU","WarfareSalvageTruck_USMC","WarfareSalvageTruck_CDF","WarfareSalvageTruck_Gue","WarfareSalvageTruck_INS",
"MtvrSalvage_DES_EP1","UralSalvage_TK_EP1","V3S_Salvage_TK_GUE_EP1"];
Airport = ["Land_SS_hangar","WarfareBAirport","Land_Mil_hangar_EP1","Land_Hangar_F"];
pier = ["Land_nav_pier_m_2","Land_nav_pier_m_F"];

safeDistance = 15;

/// listCrew + listMHQ ///
listMHQ = [
	"BRDM2_HQ_Base",
	"BMP2_HQ_Base",
	"M1130_CV_EP1",
	"BTR90_HQ",
	"LAV25_HQ",
	"MHQ"
];

listCrew = [
	"USMC_Soldier_Crew",
	"CDF_Soldier_Crew",
	"RU_Soldier_Crew",
	"Ins_Soldier_Crew",
	"GUE_Soldier_Crew",
	"US_Soldier_Crew_EP1",
	"TK_Soldier_Crew_EP1",
	"UN_CDF_Soldier_Crew_EP1",
	"Soldier_Crew_PMC",
	"BAF_crewman_MTP",
	"BAF_crewman_w",
	"CZ_Soldier_Crew_Dst_ACR",
	"CZ_Soldier_Crew_Wdl_ACR",
	"Crew"
];

listPilot = [
	"USMC_Soldier_Pilot",
	"CDF_Soldier_Pilot",
	"RU_Soldier_Pilot",
	"Ins_Soldier_Pilot",
	"GUE_Soldier_Pilot",
	"US_Soldier_Pilot_EP1",
	"TK_Soldier_Pilot_EP1",
	"UN_CDF_Soldier_Pilot_EP1",
	"Soldier_Pilot_PMC",
	"BAF_Pilot_MTP",
	"CZ_Soldier_Pilot_EP1",
	"Pilot"
];

listStealthTypes = [
	"GUE_Soldier_Sniper","GUE_Soldier_Scout",
	"INS_Soldier_Sniper","Ins_Soldier_Sab",
	"CDF_Soldier_Sniper","CDF_Soldier_Spotter",
	"USMC_SoldierS_Sniper","USMC_SoldierS_Spotter","USMC_SoldierS_SniperH",
	"RU_Soldier_Sniper","RU_Soldier_Spotter","RU_Soldier_SniperH",
	"BAF_Soldier_Sniper_MTP","BAF_Soldier_SniperH_MTP","BAF_Soldier_spotter_MTP","BAF_Soldier_SniperN_MTP",
	"BAF_Soldier_Sniper_W","BAF_Soldier_SniperH_W","BAF_Soldier_spotter_W","BAF_Soldier_spotterN_W",
	"US_Soldier_Sniper_EP1","US_Soldier_Spotter_EP1",
	"TK_INS_Soldier_Sniper_EP1",
	"TK_Soldier_SniperH_EP1","TK_Soldier_Spotter_EP1",
	"TK_GUE_Soldier_Sniper_EP1"
];

HQ = ["WarfareBDepot","WarfareBCamp"];
Warfare_HQ = ["Warfare_HQ_base_unfolded"];

UAVterminal = listMHQ + HQ + ["Base_WarfareBUAVterminal","HMMWV_Terminal_EP1"];

draga_objectsTeleport = HQ + Warfare_HQ + ["Base_WarfareBBarracks","BASE_WarfareBFieldhHospital"];

draga_objectsReammo = listMHQ + HQ + ["Base_WarfareBBarracks","Base_WarfareBLightFactory"];
draga_distanceReammo = 150;

draga_objectsCoinBase = Warfare_HQ+HQ;
draga_distanceCoinBase = 150;
draga_objectsCoinMHQ = listMHQ;
draga_distanceCoinMHQ = 15;
draga_BuyDistance = draga_distanceCoinBase;
respawnSafeDistance = 10;
draga_posDefaultHiden = [-2000, 0];
draga_posDefaultHidenRandom = 1000;

draga_server_diag_fps_interval = 600;

Officers = [
	"RU_Commander","RU_Soldier_Officer","Ins_Commander","TK_Soldier_Officer_EP1","TK_Aziz_EP1","TK_INS_Warlord_EP1",
	"USMC_Soldier_Officer","CDF_Commander","US_Soldier_Officer_EP1","CZ_Soldier_Office_DES_EP1","BAF_Soldier_Officer_MTP",
	"GUE_Commander","TK_GUE_Warlord_EP1","UN_CDF_Soldier_Officer_EP1"
];

// [inf,veh,air,Ship,StaticWeapon,base,]
safeSpawnDistance = [1000,1500,3500,1500,1500,3500];

[] execVM ("m\draga_update_vehicle_init.sqf");
// [] execVM "m\ais\draga_is.sqf";

listCrewLower = [];
{
	listCrewLower set [count listCrewLower, toLower _x];
} forEach listCrew;

listPilotLower = [];
{
	listPilotLower set [count listPilotLower, toLower _x];
} forEach listPilot;

listStealthTypesLower = [];
{
	listStealthTypesLower set [count listStealthTypesLower, toLower _x];
} forEach listStealthTypes;
