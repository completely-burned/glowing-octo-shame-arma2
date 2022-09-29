EnableTeamSwitch false;

private["_list","_tmp"];

BIS_WFdPath = "\CA\Warfare2\";

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

//--- функции
[] call compile preprocessFileLineNumbers "dir\functions\INIT_fnc.sqf";

gosa_deviceType = ([] call gosa_fnc_getDeviceType);
gosa_IslandType = ([] call gosa_fnc_getIslandType);

listSalvageTruck = ["WarfareSalvageTruck_RU","WarfareSalvageTruck_USMC","WarfareSalvageTruck_CDF","WarfareSalvageTruck_Gue","WarfareSalvageTruck_INS",
"MtvrSalvage_DES_EP1","UralSalvage_TK_EP1","V3S_Salvage_TK_GUE_EP1"];
Airport = ["Land_SS_hangar","WarfareBAirport","Land_Mil_hangar_EP1","Land_Hangar_F"];
pier = ["Land_nav_pier_m_2","Land_nav_pier_m_F"];

safeDistance = 15;

// этими классами не должны управлять игроки
_list = [
	"InvisibleManE_EP1",
	"InvisibleManW_EP1",
	"InvisibleManG_EP1",
	"InvisibleManR_EP1",
	"InvisibleManC_EP1",
	""
];
gosa_blacklisted_player_classes_L = [];
{
	_tmp = configName (LIB_cfgVeh >> _x);
	if (_tmp != "") then {
		gosa_blacklisted_player_classes_L set [
			count gosa_blacklisted_player_classes_L, _tmp];
	};
} forEach _list;
diag_log format ["Log: [init_common]: gosa_blacklisted_player_classes_L %1", gosa_blacklisted_player_classes_L];



/// listCrew + listMHQ ///
// TODO: Совместимость с pvp.
listMHQ = [
	"BRDM2_HQ_Base",
	"BMP2_HQ_Base",
	"M1130_CV_EP1",
	"BTR90_HQ",
	"LAV25_HQ",
	"MHQ"
];

#ifdef __ARMA3__
listMHQ=listMHQ+[
	"B_Truck_01_medical_F",
	"O_Truck_03_medical_F",
	"O_Truck_02_medical_F",
	"I_Truck_02_medical_F",
	"B_T_Truck_01_medical_F",
	"O_T_Truck_03_medical_ghex_F"
];
#endif

_list = [
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
#ifdef __ARMA3__
	_list=_list+[
		"B_W_Crew_F",
		"B_crew_F",
		"B_T_Crew_F",
		"O_crew_F",
		"O_T_Crew_F",
		"I_E_Crew_F",
		"I_crew_F"
	];
#endif
gosa_crewL = [];
{
	_tmp = configName (LIB_cfgVeh >> _x);
	if (_tmp != "") then {
		gosa_crewL set [count gosa_crewL, _tmp];
	};
} forEach _list;
diag_log format ["Log: [init_common]: gosa_crewL %1", gosa_crewL];

_list = [
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
#ifdef __ARMA3__
	_list=_list+[
		"B_Fighter_Pilot_F",
		"B_W_Helipilot_F",
		"B_W_Helicrew_F",
		"B_helicrew_F",
		"B_Pilot_F",
		"B_Helipilot_F",
		"B_T_Helicrew_F",
		"B_T_Pilot_F",
		"B_T_Helipilot_F",
		"O_Fighter_Pilot_F",
		"O_helicrew_F",
		"O_Pilot_F",
		"O_helipilot_F",
		"O_T_Helicrew_F",
		"O_T_Pilot_F",
		"O_T_Helipilot_F",
		"I_Fighter_Pilot_F",
		"I_C_Pilot_F",
		"I_C_Helipilot_F",
		"I_E_Helipilot_F",
		"I_E_Helicrew_F",
		"I_helicrew_F",
		"I_pilot_F",
		"I_helipilot_F"
	];
#endif
gosa_pilotL = [];
{
	_tmp = configName (LIB_cfgVeh >> _x);
	if (_tmp != "") then {
		gosa_pilotL set [count gosa_pilotL, _tmp];
	};
} forEach _list;
diag_log format ["Log: [init_common]: gosa_pilotL %1", gosa_pilotL];

_list = [
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
gosa_StealthL = [];
{
	_tmp = configName (LIB_cfgVeh >> _x);
	if (_tmp != "") then {
		gosa_StealthL set [count gosa_StealthL, _tmp];
	};
} forEach _list;
diag_log format ["Log: [init_common]: gosa_StealthL %1", gosa_StealthL];

// TODO: Совместимость с pvp.
HQ = ["WarfareBDepot","WarfareBCamp"];
#ifdef __ARMA3__
HQ = HQ+["Land_BagBunker_Large_F","Cargo_HQ_base_F","Cargo_Tower_base_F"];
#endif
Warfare_HQ = ["Warfare_HQ_base_unfolded"];

UAVterminal = listMHQ + HQ + ["Base_WarfareBUAVterminal","HMMWV_Terminal_EP1"];

gosa_objectsTeleport = listMHQ + HQ + Warfare_HQ + ["Base_WarfareBBarracks","BASE_WarfareBFieldhHospital"];

gosa_objectsReammo = listMHQ + HQ + ["Base_WarfareBBarracks","Base_WarfareBLightFactory"];
gosa_distanceReammo = 150;

gosa_objectsCoinBase = Warfare_HQ+HQ;
gosa_distanceCoinBase = 150;
gosa_objectsCoinMHQ = listMHQ;
gosa_distanceCoinMHQ = 15;
gosa_BuyDistance = gosa_distanceCoinBase;
respawnSafeDistance = 10;
gosa_posDefaultHiden = [-2000, 0];
gosa_posDefaultHidenRandom = 1000;

gosa_server_diag_fps_interval = 600;

Officers = [
	"RU_Commander","RU_Soldier_Officer","Ins_Commander","TK_Soldier_Officer_EP1","TK_Aziz_EP1","TK_INS_Warlord_EP1",
	"USMC_Soldier_Officer","CDF_Commander","US_Soldier_Officer_EP1","CZ_Soldier_Office_DES_EP1","BAF_Soldier_Officer_MTP",
	"GUE_Commander","TK_GUE_Warlord_EP1","UN_CDF_Soldier_Officer_EP1"
];

// [inf,veh,air,Ship,StaticWeapon,base,]
safeSpawnDistance = [1000,1500,3500,1500,1500,3500];

[] call gosa_fnc_worldSize;

[] execVM ("dir\common\while_init.sqf");
// [] execVM "dir\ais\gosa_is.sqf";
[] execVM ("dir\common\while_vehicles_lock.sqf");
[] execVM ("dir\common\while_fps.sqf");
