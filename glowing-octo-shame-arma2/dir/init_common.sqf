EnableTeamSwitch false;

private["_list","_tmp","_str","_cfgVeh","_cfgAmm","_arr","_arr0"];

BIS_WFdPath = "\CA\Warfare2\";

_cfgVeh = configFile >> "CfgVehicles";
_cfgAmm = configFile >> "CfgAmmo";
LIB_cfgVeh = _cfgVeh;
LIB_cfgWea = configFile >> "CfgWeapons";
LIB_cfgAmm = _cfgAmm;
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

gosa_var_noDelete = "_noDelete";
gosa_var_respawnVehicle = "gosa_respawnVehicle";
gosa_var_respawnVehicle_old = "respawnVehicle";
gosa_var_spawn_time = "gosa_respawnveht";

// [0inf,1veh,2air,3Ship,4StaticWeapon,5base,6frigate]
_arr = [1000,1500,3500,1500,1500,3500,4000];
gosa_param_safeSpawnDistance = _arr;
safeSpawnDistance = _arr;
gosa_minDeepFrigate = 25;

gosa_deviceType = ([] call gosa_fnc_getDeviceType);
gosa_IslandType = ([] call gosa_fnc_getIslandType);

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

// Обычные города или деревни.
_arr = ["LocationCity_F", "LocationLogicCity", "LocationLogicCityCenter"];
gosa_types_location_City = ([_arr, _cfgVeh] call gosa_fnc_arr_fix_configName);

// Большие города.
_arr = ["LocationCityCapital_F"];
gosa_types_location_CityCapital = ([_arr, _cfgVeh] call gosa_fnc_arr_fix_configName);

// Прочие маленькие локации.
_arr = ["LocationVillage_F"];
gosa_types_location_Village = ([_arr, _cfgVeh] call gosa_fnc_arr_fix_configName);

// Бункеры и лагеря.
_arr = ["LocationFOB_F", "LocationLogicDepot", "LocationLogicCityFlatArea"];
gosa_types_location_Depot = ([_arr, _cfgVeh] call gosa_fnc_arr_fix_configName);

_arr = ["LocationCamp_F", "LocationLogicCamp"];
gosa_types_location_Camp = ([_arr, _cfgVeh] call gosa_fnc_arr_fix_configName);


_arr = [
	"LocationCity_F",
	"LocationVillage_F",
	"LocationCityCapital_F",
	"LocationLogicCity"
];
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_str = configName (_cfgVeh >> (_arr select _i));
	if (_str != "") then {
		_arr0 set [count _arr0, _str];
	};
};
gosa_types_location = _arr0;

gosa_dist_houselist = 750;
gosa_silvieManager_dist_player = 1000;

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
		"rhs_vdv_driver",
		"rhs_vdv_driver_armored",
		"rhs_vdv_des_driver",
		"rhs_vdv_des_driver_armored",
		"rhs_vdv_mflora_driver",
		"rhs_vdv_mflora_driver_armored",
		"rhs_vdv_flora_driver",
		"rhs_vdv_flora_driver_armored",
		"rhs_vmf_emr_driver",
		"rhs_vmf_emr_driver_armored",
		"rhs_vmf_flora_driver",
		"rhs_vmf_flora_driver_armored",
		"rhs_msv_emr_driver",
		"rhs_msv_emr_driver_armored",
		"rhs_msv_driver",
		"rhs_msv_driver_armored",
		"rhsusf_army_ucp_driver",
		"rhsusf_army_ucp_driver_armored",
		"rhsusf_army_ocp_driver",
		"rhsusf_army_ocp_driver_armored",
		"rhsusf_usmc_marpat_wd_driver",
		"rhsusf_usmc_marpat_d_driver",

		"rhs_vdv_crew",
		"rhs_vdv_armoredcrew",
		"rhs_vdv_combatcrew",
		"rhs_vdv_crew_commander",
		"rhs_vdv_des_crew_commander",
		"rhs_vdv_des_crew",
		"rhs_vdv_des_armoredcrew",
		"rhs_vdv_des_combatcrew",
		"rhs_vdv_mflora_crew_commander",
		"rhs_vdv_mflora_crew",
		"rhs_vdv_mflora_armoredcrew",
		"rhs_vdv_mflora_combatcrew",
		"rhs_vdv_flora_crew_commander",
		"rhs_vdv_flora_crew",
		"rhs_vdv_flora_armoredcrew",
		"rhs_vdv_flora_combatcrew",
		"rhs_vmf_emr_crew_commander",
		"rhs_vmf_emr_crew",
		"rhs_vmf_emr_armoredcrew",
		"rhs_vmf_emr_combatcrew",
		"rhs_vmf_flora_crew_commander",
		"rhs_vmf_flora_crew",
		"rhs_vmf_flora_armoredcrew",
		"rhs_vmf_flora_combatcrew",
		"rhs_msv_emr_crew_commander",
		"rhs_msv_emr_crew",
		"rhs_msv_emr_armoredcrew",
		"rhs_msv_emr_combatcrew",
		"rhs_msv_crew_commander",
		"rhs_msv_crew",
		"rhs_msv_armoredcrew",
		"rhs_msv_combatcrew",
		"rhs_rva_crew",
		"rhs_rva_crew_armored",
		"rhs_rva_crew_officer",
		"rhs_rva_crew_officer_armored",
		"rhssaf_army_o_m10_para_crew",
		"rhssaf_army_o_m10_digital_crew_armored",
		"rhssaf_army_o_m10_digital_crew",
		"rhssaf_army_o_m93_oakleaf_summer_crew",

		"rhsusf_army_ucp_crewman",
		"rhsusf_army_ucp_combatcrewman",
		"rhsusf_army_ocp_crewman",
		"rhsusf_army_ocp_combatcrewman",
		"rhsusf_usmc_marpat_wd_crewman",
		"rhsusf_usmc_marpat_wd_combatcrewman",
		"rhsusf_usmc_lar_marpat_wd_crewman",
		"rhsusf_usmc_lar_marpat_wd_combatcrewman",
		"rhsusf_usmc_lar_marpat_wd_machinegunner",
		"rhsusf_usmc_marpat_d_crewman",
		"rhsusf_usmc_marpat_d_combatcrewman",
		"rhsusf_usmc_lar_marpat_d_crewman",
		"rhsusf_usmc_lar_marpat_d_combatcrewman",
		"rhsusf_usmc_lar_marpat_d_machinegunner",
		"rhsusf_socom_swcc_officer",
		"rhsusf_socom_swcc_crewman",

		"rhsgref_ins_crew",
		"rhsgref_tla_crew",
		"rhsgref_cdf_b_ngd_crew",
		"rhsgref_cdf_b_reg_crew_commander",
		"rhsgref_cdf_b_reg_crew",
		"rhsgref_cdf_b_para_crew",
		"rhsgref_hidf_crewman",

		"rhssaf_army_m10_para_crew",
		"rhssaf_army_m10_digital_crew_armored_nco",
		"rhssaf_army_m10_digital_crew_armored",
		"rhssaf_army_m10_digital_crew",
		"rhssaf_army_m93_oakleaf_summer_crew",
		"rhssaf_un_m10_digital_desert_crew",
		"rhssaf_un_m10_digital_crew",
		"rhsgref_nat_pmil_crew",
		"rhsgref_nat_crew",
		"rhsgref_ins_g_crew",
		"rhsgref_cdf_ngd_crew",
		"rhsgref_cdf_un_crew",
		"rhsgref_cdf_reg_crew_commander",
		"rhsgref_cdf_reg_crew",
		"rhsgref_cdf_para_crew",
		"rhsgref_tla_g_crew",

		"gm_gc_army_crew_mpiaks74nk_80_blk",
		"gm_pl_army_crew_pm63_80_moro",
		"gm_dk_army_crew_84_oli",
		"gm_ge_army_crew_mp2a1_80_oli",
		"gm_ge_army_crew_90_flk",
		"gm_ge_bgs_crew_80_grn",

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
		"rhssaf_airforce_pilot_mig29",
		"rhssaf_airforce_pilot_transport_heli",
		"rhsgref_ins_g_pilot",
		"rhsgref_cdf_air_pilot",
		"rhsgref_cdf_un_pilot",

		"rhs_pilot_combat_heli",
		"rhs_pilot",
		"rhs_pilot_transport_heli",
		"rhs_pilot_tan",
		"rhssaf_airforce_o_pilot_mig29",
		"rhssaf_airforce_o_pilot_transport_heli",

		"rhsusf_army_ucp_ah64_pilot",
		"rhsusf_army_ucp_helicrew",
		"rhsusf_army_ucp_helipilot",
		"rhsusf_army_ocp_ah64_pilot",
		"rhsusf_army_ocp_helicrew",
		"rhsusf_army_ocp_helipilot",
		"rhsusf_airforce_jetpilot",
		"rhsusf_airforce_pilot",
		"rhsusf_usmc_marpat_wd_helicrew",
		"rhsusf_usmc_marpat_wd_helipilot",
		"rhsusf_usmc_marpat_d_helicrew",
		"rhsusf_usmc_marpat_d_helipilot",

		"rhsgref_ins_pilot",
		"rhsgref_cdf_b_air_pilot",
		"rhsgref_hidf_helipilot",

		"gm_gc_airforce_pilot_pm_80_blu",
		"gm_pl_airforce_pilot_pm_80_gry",
		"gm_ge_army_pilot_p1_80_oli",
		"gm_ge_army_pilot_80_rolled_sar",
		"gm_ge_bgs_pilot_p1_80_grn",

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

// Осветительные ракеты.
_arr = [
	"SPE_40mm_White","gm_flare_illum_wht",
	"vn_22mm_lume_ammo","vn_40mm_m583_flare_w_ammo",
	"LIB_40mm_White"
];
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_str = toLower configName (_cfgAmm >> (_arr select _i));
	if (_str != "") then {
		_arr0 set [count _arr0, _str];
	};
};
if (count _arr0 <= 0) then {
	_arr = ["ACE_40mm_Flare_white"];
	for "_i" from 0 to (count _arr -1) do {
		_str = toLower configName (_cfgAmm >> (_arr select _i));
		if (_str != "") then {
			_arr0 set [count _arr0, _str];
		};
	};
};
if (count _arr0 <= 0) then {
	_arr = ["F_40mm_White"];
	for "_i" from 0 to (count _arr -1) do {
		_str = toLower configName (_cfgAmm >> (_arr select _i));
		if (_str != "") then {
			_arr0 set [count _arr0, _str];
		};
	};
};
gosa_flare = _arr0;
// Эти осветительные ракеты не излучают свет.
gosa_flare_blacklist = [
	// "F_40mm_White" родитель многих и его нет смысла добавлять сюда.
	"US85_FlareBase"
];

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

_str = "gosa_menu";
gosa_menu_str = _str;
gosa_commandingMenu = "#USER:"+_str+"_0";

[] call gosa_fnc_worldSize;

#ifdef __ARMA3__
	if (missionNamespace getVariable "gosa_useAISteeringComponent" > 0) then {useAISteeringComponent true};
#else
	// TODO: Всё это необходимо проверить.

	// Error Undefined variable in expression: rhsdecalsoff
	RHSDecalsOff = true;

	// Error Undefined variable in expression: i44_tankpenetration
	// File x\inv44\addons\i44_scripts_vehicles\s\post_init.sqf, line 3
	i44_tankpenetration = false;
#endif

// Без этого некоторые юниты не могут инициализировать новые заскриптованые маршруты.
{
	for "_i" from (count waypoints _x -1) to 0 step -1 do {deleteWaypoint [_x, _i]};
} forEach allGroups;

[] execVM ("dir\common\while_init.sqf");
// [] execVM "dir\ais\gosa_is.sqf";
[] execVM ("dir\common\while_vehicles_lock.sqf");
[] execVM ("dir\common\while_fps.sqf");

diag_log format ["Log: [init_common] Done %1", time];
