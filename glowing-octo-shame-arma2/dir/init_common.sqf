EnableTeamSwitch false;

private["_list","_tmp","_str","_cfgVeh","_arr","_arr0"];

BIS_WFdPath = "\CA\Warfare2\";

_cfgVeh = configFile >> "CfgVehicles";
LIB_cfgVeh = _cfgVeh;
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
if (configName(_cfgVeh >> "ACE_Logic") != "") then {ACE_Avail = true};
acex_ru_Avail = false;
if (configName(configFile >> "CfgMods" >> "acex_ru") != "") then {acex_ru_Avail = true};
acex_usnavy_Avail = false;
if (configName(configFile >> "CfgMods" >> "acex_usnavy") != "") then {acex_usnavy_Avail = true};

//--- функции
[] call compile preprocessFileLineNumbers "dir\functions\INIT_fnc.sqf";
//-- Разные переменные необходимые для дальнейшей работы штабов.
[] call compile preprocessFileLineNumbers "dir\common\init_hq.sqf";

// [inf,veh,air,Ship,StaticWeapon,base,]
_arr = [1000,1500,3500,1500,1500,3500];
gosa_param_safeSpawnDistance = _arr;
safeSpawnDistance = _arr;

gosa_deviceType = ([] call gosa_fnc_getDeviceType);
gosa_IslandType = ([] call gosa_fnc_getIslandType);

_arr = ([
	// [side, реальный тип, виртуальный тип].
	[east,	"bmp2_hq_ins_unfolded",			"i44_hq_g_unfolded"],
	[west,	"bmp2_hq_cdf_unfolded",			"i44_hq_a_unfolded"],
	[east,			"o_truck_03_covered_f",	"o_truck_03_command_f"],
	[west,			"b_truck_01_covered_f",	"b_truck_01_command_f"],
	[resistance,	"i_truck_02_covered_f",	"i_truck_02_command_f"],
	[civilian,		"c_truck_02_covered_f",	"c_truck_02_command_f"],
	[east,	"i44_truck_g_kfz305_gray_wh",	"i44_truck_g_command_wh"],
	[west,	"i44_truck_a_gmc_cckw_army",	"i44_truck_a_command_army"]
] call gosa_fnc_arr_sorting0);
gosa_types_virt = _arr;
gosa_types_mhq_virt = _arr;

_arr = ([
	// [side, мобильный тип, разложенный тип].
	[west,	"m1130_cv_ep1",	"m1130_hq_unfolded_ep1"],
	[east,	"btr90_hq",		"btr90_hq_unfolded"],
	[west,	"lav25_hq",		"lav25_hq_unfolded"],
	[east,	"bmp2_hq_tk_ep1",	"bmp2_hq_tk_unfolded_ep1"],
	[east,	"bmp2_hq_ins",		"bmp2_hq_ins_unfolded"],
	[west,	"bmp2_hq_cdf",		"bmp2_hq_cdf_unfolded"],
	[resistance, "brdm2_hq_tk_gue_ep1",	"brdm2_hq_tk_gue_unfolded_ep1"],
	[resistance, "brdm2_hq_gue",		"brdm2_hq_gue_unfolded"],

	[east,			"o_truck_03_device_f",	nil],
	[east,			"o_t_truck_03_device_ghex_f",	nil],
	[west,			"b_truck_01_mover_f",	nil],
	[west,			"b_t_truck_01_mover_f",	nil],
	[west,			"b_gen_offroad_01_comms_f",	nil],
	[resistance,	"i_e_offroad_01_comms_f",	nil],
	[civilian,		"c_offroad_01_comms_f",	nil],
	[civilian,		"c_idap_van_02_vehicle_f",	nil],

	[east,			"o_truck_03_command_f",	nil],
	[west,			"b_truck_01_command_f",	nil],
	[resistance,	"i_truck_02_command_f",	nil],
	[civilian,		"c_truck_02_command_f",	nil],

	[east,	"i44_truck_g_command_wh",		"i44_hq_g_unfolded"],
	[east,	"i44_truck_a_command_army",		"i44_hq_a_unfolded"]
] call gosa_fnc_arr_sorting0);
gosa_types_mhq = _arr;

_arr = [
	"WarfareSalvageTruck_RU",
	"WarfareSalvageTruck_USMC",
	"WarfareSalvageTruck_CDF",
	"WarfareSalvageTruck_Gue",
	"WarfareSalvageTruck_INS",
	"MtvrSalvage_DES_EP1",
	"UralSalvage_TK_EP1",
	"V3S_Salvage_TK_GUE_EP1"
];
gosa_types_SalvageTruck = _arr;
listSalvageTruck = _arr;

_arr = ["Land_SS_hangar","WarfareBAirport","Land_Mil_hangar_EP1","Land_Hangar_F","Land_TentHangar_V1_F"];
gosa_types_Airport = _arr;
gosa_type_Airport = _arr;
gosa_typesOf_airports = _arr;
Airport = _arr;

_arr = ["Land_nav_pier_m_2","Land_nav_pier_m_F"];
gosa_types_pier = _arr;
pier = _arr;

safeDistance = 15;

_arr = [
	"InvisibleManE_EP1",
	"InvisibleManW_EP1",
	"InvisibleManG_EP1",
	"InvisibleManR_EP1",
	"InvisibleManC_EP1",
	""
];
// Исправление регистра. Не нужно удалять классы.
for "_i" from 0 to (count _arr -1) do {
	_str = configName (_cfgVeh >> (_arr select _i));
	if (_str != "") then {
		_arr set [_i, _str];
	};
};
gosa_types_InvisibleMan = _arr;
// Этими классами не должны управлять игроки.
gosa_blacklisted_player_classes_L = _arr;
diag_log format ["Log: [init_common]: gosa_blacklisted_player_classes_L %1", _arr];



//-- listCrew
_arr = [
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
	_arr append [
		"B_W_Crew_F",
		"B_crew_F",
		"B_T_Crew_F",
		"O_crew_F",
		"O_T_Crew_F",
		"I_E_Crew_F",
		"I_crew_F"
	];
#endif
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_str = configName (_cfgVeh >> (_arr select _i));
	if (_str != "") then {
		_arr0 set [count _arr0, _str];
	};
};
gosa_types_crew = _arr0;
gosa_crewL = _arr0;
diag_log format ["Log: [init_common]: gosa_crewL %1", _arr0];


_arr = [
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
	_arr append [
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
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_str = configName (_cfgVeh >> (_arr select _i));
	if (_str != "") then {
		_arr0 set [count _arr0, _str];
	};
};
gosa_types_pilot = _arr0;
gosa_pilotL = _arr0;
diag_log format ["Log: [init_common]: gosa_pilotL %1", _arr0];


_arr = [
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
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_str = configName (_cfgVeh >> (_arr select _i));
	if (_str != "") then {
		_arr0 set [count _arr0, _str];
	};
};
gosa_types_Stealth = _arr0;
gosa_StealthL = _arr0;
diag_log format ["Log: [init_common]: gosa_StealthL %1", _arr0];

HQ = gosa_empty_arr;
Warfare_HQ = gosa_empty_arr;
listMHQ = gosa_empty_arr;

//-- Заводы.
gosa_type_Barracks = ["Base_WarfareBBarracks"];
gosa_type_LightFactory = ["Base_WarfareBLightFactory"];
gosa_type_HeavyFactory = ["Base_WarfareBHeavyFactory"];
gosa_type_AircraftFactory = ["Base_WarfareBAircraftFactory"];

_arr = ["Base_WarfareBUAVterminal","HMMWV_Terminal_EP1"];
gosa_types_UAVterminal = _arr;
UAVterminal = _arr;

gosa_objectsTeleport = gosa_empty_arr;

gosa_objectsReammo = gosa_empty_arr;
gosa_distanceReammo = 150;

gosa_objectsCoinBase = gosa_empty_arr;
gosa_distanceCoinBase = 150;
gosa_objectsCoinMHQ = listMHQ;
gosa_distanceCoinMHQ = 15;
gosa_BuyDistance = gosa_distanceCoinBase;
respawnSafeDistance = 10;
gosa_posDefaultHiden = [-2000, 0];
gosa_posDefaultHidenRandom = 1000;

gosa_server_diag_fps_interval = 600;

_arr = [
	"RU_Commander","RU_Soldier_Officer",
	"Ins_Commander","TK_INS_Warlord_EP1",
	"USMC_Soldier_Officer",
	"CDF_Commander",
	"GUE_Commander",

	"US_Soldier_Officer_EP1",
	"TK_Soldier_Officer_EP1","TK_Aziz_EP1",
	"CZ_Soldier_Office_DES_EP1",
	"BAF_Soldier_Officer_MTP",
	"TK_GUE_Warlord_EP1",
	"UN_CDF_Soldier_Officer_EP1",
	"Officer"
];
gosa_types_officer = _arr;
Officers = _arr;

// Error Undefined variable in expression: i44_tankpenetration
// File x\inv44\addons\i44_scripts_vehicles\s\post_init.sqf, line 3
i44_tankpenetration = false;

[] call gosa_fnc_worldSize;

[] execVM ("dir\common\while_init.sqf");
// [] execVM "dir\ais\gosa_is.sqf";
[] execVM ("dir\common\while_vehicles_lock.sqf");
[] execVM ("dir\common\while_fps.sqf");
