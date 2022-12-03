EnableTeamSwitch false;

private["_list","_tmp","_str"];

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
//-- Разные переменные необходимые для дальнейшей работы штабов.
[] call compile preprocessFileLineNumbers "dir\common\init_hq.sqf";

gosa_deviceType = ([] call gosa_fnc_getDeviceType);
gosa_IslandType = ([] call gosa_fnc_getIslandType);

listSalvageTruck = ["WarfareSalvageTruck_RU","WarfareSalvageTruck_USMC","WarfareSalvageTruck_CDF","WarfareSalvageTruck_Gue","WarfareSalvageTruck_INS",
"MtvrSalvage_DES_EP1","UralSalvage_TK_EP1","V3S_Salvage_TK_GUE_EP1"];
_list = ["Land_SS_hangar","WarfareBAirport","Land_Mil_hangar_EP1","Land_Hangar_F","Land_TentHangar_V1_F"];
gosa_typesOf_airports = _list;
// Совместимость.
Airport = _list;
pier = ["Land_nav_pier_m_2","Land_nav_pier_m_F"];

safeDistance = 15;

_list = [
	"InvisibleManE_EP1",
	"InvisibleManW_EP1",
	"InvisibleManG_EP1",
	"InvisibleManR_EP1",
	"InvisibleManC_EP1",
	""
];
// Исправление регистра. Не нужно удалять классы.
for "_i" from 0 to (count _list -1) do {
	_str = configName (LIB_cfgVeh >> (_list select _i));
	if (_str != "") then {
		_list set [_i, _str];
	};
};
gosa_types_InvisibleMan = _list;
// Этими классами не должны управлять игроки.
gosa_blacklisted_player_classes_L = _list;
diag_log format ["Log: [init_common]: gosa_blacklisted_player_classes_L %1", gosa_blacklisted_player_classes_L];



//-- listCrew
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
	"I44_Man_A_Army_Crew_NCO_M1911A1",
	"I44_Man_A_Army_Crew_M3Greasegun",
	"I44_Man_A_Army_Crew_M1911A1",
	"I44_Man_A_Army_Crew_Eng",
	"I44_Man_A_Army_DDay_Crew_NCO_M1911A1",
	"I44_Man_A_Army_DDay_Crew_M3Greasegun",
	"I44_Man_A_Army_DDay_Crew_M1911A1",
	"I44_Man_A_Army_DDay_Crew_Eng",
	"I44_Man_B_Army_Crew_NCO_WebleyMk6",
	"I44_Man_B_Army_Crew_StenMk2",
	"I44_Man_B_Army_Crew_WebleyMk6",
	"I44_Man_B_Army_Crew_Eng",
	"I44_Man_B_Army_Crew_NCO_WebleyMk6_Winter",
	"I44_Man_B_Army_Crew_StenMk2_Winter",
	"I44_Man_B_Army_Crew_WebleyMk6_Winter",
	"I44_Man_B_Army_Crew_Eng_Winter",
	"I44_Man_G_SS_Crew_NCO_P38",
	"I44_Man_G_SS_Crew_MP40",
	"I44_Man_G_SS_Crew_P38",
	"I44_Man_G_SS_Crew_Eng",
	"I44_Man_G_SS_Crew_NCO_P38_Winter",
	"I44_Man_G_SS_Crew_MP40_Winter",
	"I44_Man_G_SS_Crew_P38_Winter",
	"I44_Man_G_SS_Crew_Eng_Winter",
	"I44_Man_G_WH_Crew_NCO_P38",
	"I44_Man_G_WH_Crew_MP40",
	"I44_Man_G_WH_Crew_P38",
	"I44_Man_G_WH_Crew_Eng",
	"FDF_M05_FRDF_Crew",
	"FDF_M91_Crew",
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
	"I44_Man_A_AAF_Pilot_M1911A1",
	"I44_Man_A_AAF_B17Pilot_M1911A1",
	"I44_Man_A_AAF_COPilot_M1911A1",
	"I44_Man_A_AAF_Gunner_M1911A1",
	"I44_Man_B_RAF_Pilot_M1911A1",
	"I44_Man_B_RAF_PCrew_M1911A1",
	"I44_Man_G_WL_Pilot_P38",
	"I44_Man_G_WL_LCrew_P38",
	"FDF_Pilot_Helicopter",
	"FDF_Pilot_F18",
	//"FDF_Pilot_NoEquip_Helicopter",
	//"FDF_Pilot_NoEquip_F18",
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
