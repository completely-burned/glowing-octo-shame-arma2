EnableTeamSwitch false;

private["_list","_tmp","_str","_cfgVeh","_cfgAmm","_arr","_arr0","_n","_arr1",
	"_date_default","_date_a2"];

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
diag_log format ["Log: [init_common] gosa_deviceType %1", gosa_deviceType];
gosa_IslandType = ([] call gosa_fnc_getIslandType);

// Взаимоисключения фракций.
gosa_faction_mutual_exclusions = [
	["IND_UN_LXWS","BLU_UN_LXWS","CUP_I_UN"],
	["IND_ION_LXWS","OPF_ION_LXWS","BLU_ION_LXWS","CUP_I_PMC_ION"],
	["CUP_O_RUS_M","CUP_O_RU"],
	["EF_B_MJTF_DES","EF_B_MJTF_WDL"],
	["OPF_F","OPF_T_F"],
	["IND_G_F","BLU_G_F","OPF_G_F"],
	["OPF_SFIA_LXWS","IND_SFIA_LXWS"],
	["IND_TURA_LXWS","OPF_TURA_LXWS","BLU_TURA_LXWS"],
	["BLU_NATO_LXWS","BLU_F","BLU_T_F","BLU_W_F"]
];

gosa_vehiclesKindOf_Loiter = [
	"VTOL_01_armed_base_F",
	"vnx_air_ac119k_base"
];

// Камуфляжи.
_date_default = [1995,2100];
gosa_date_default = _date_default;
_date_a2 = [1970, (_date_default select 0) -1];
gosa_camouflages = [
	// [[factions, textures, [uniformClass]], islands, dates, temperatures]
	[[["CUP_O_RUS_M"],[],[]],
		[], [_date_default], []],
	[[["CUP_O_RU"],[],[]],
		[], [_date_a2], []],
	[[["CUP_B_GB"],[],[]],
		[], [_date_a2], []],
	[[["CUP_B_US_ARMY"],[],[]],
		[], [_date_a2], []],
	[[["CUP_B_USMC"],[],[]],
		[], [_date_a2], []],
	[[["CUP_O_CHDKZ"],[],[]],
		[], [_date_a2], []],
	[[["CUP_B_GER"],[],[]],
		[], [_date_a2], []],
	[[["CUP_B_CZ"],[],[]],
		[], [_date_a2], []],
	[[["CUP_B_CDF"],[],[]],
		[], [_date_a2], []],
	[[["CUP_I_RACS"],[],[]],
		[], [_date_a2], []],
	[[["CUP_B_HIL"],[],[]],
		[], [_date_a2], []],
	[[["CUP_I_UN"],[],[]],
		[], [_date_a2], []],

	[[["EF_B_MJTF_WDL"],[],[]],
		[], [_date_default], [[150,249]]],
	[[["EF_B_MJTF_DES"],[],[]],
		[], [_date_default], [[250,999]]],

	[[["IND_UN_LXWS","BLU_UN_LXWS"],[],[]],
		["sefrouramal"], [_date_default], [[275,999]]],
	[[["IND_ION_LXWS","OPF_ION_LXWS","BLU_ION_LXWS"],[],[]],
		["sefrouramal"], [_date_default], [[275,999]]],
	[[["BLU_NATO_LXWS"],[],[]],
		["sefrouramal"], [_date_default], [[300,999]]],
	[[["OPF_SFIA_LXWS","IND_SFIA_LXWS"],[],[]],
		["sefrouramal"], [_date_default], [[275,999]]],
	[[["OPF_TURA_LXWS","BLU_TURA_LXWS","IND_TURA_LXWS"],[],[]],
		["sefrouramal"], [_date_default], [[300,999]]],

	[[["IND_E_F","OPF_R_F"],[],[]],
		["enoch"], [_date_default], [[160,249]]],

	[[["OPF_T_F"],[],[]],
		["tanoa"], [_date_default], [[160,249]]],
	[[["OPF_F"],[],[]],
		["altis"], [_date_default], [[250,274]]],
	[[["BLU_W_F"],[],[]],
		["enoch"], [_date_default], [[160,224]]],
	[[["BLU_T_F"],[],[]],
		["tanoa"], [_date_default], [[225,249]]],
	[[["BLU_F"],[],[]],
		["altis"], [_date_default], [[250,299]]],
	[[["IND_F"],[],[]],
		["altis"], [_date_default], [[250,299]]]
];

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

_arr = ["Land_SS_hangar","Land_SS_hangard",
	"Land_CSLA_UL_V1","Land_csla_Mil_hangar",
	"Land_vn_airport_02_hangar_left_f", 
	"Land_vn_airport_02_hangar_right_f", 
	"Land_vn_airport_01_hangar_f", 
	"Land_vn_usaf_hangar_01", 
	"Land_vn_usaf_hangar_02", 
	"Land_vn_usaf_hangar_03",	
	"WarfareBAirport","Land_Airport_01_hangar_F",
	"Land_Mil_hangar_EP1","Land_Hangar_F","Land_TentHangar_V1_F",
	"Land_ServiceHangar_01_R_F","Land_ServiceHangar_01_L_F",
	"Land_Airport_02_hangar_right_F","Land_Airport_02_hangar_left_F"];
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_str = configName (_cfgVeh >> (_arr select _i));
	if (_str != "") then {
		_arr0 set [count _arr0, _str];
	};
};
diag_log format ["Log: [init_common] gosa_types_Airport %1", _arr0];
gosa_types_Airport = _arr0;
gosa_type_Airport = _arr0;
gosa_typesOf_airports = _arr0;
Airport = _arr0;

// [typeOf, sizeOf inside, boundingBox inside, [side]]
_arr = [
	["Land_CSLA_UL_V1", 18]
];
_arr0 = [[],[]];
for "_i" from 0 to (count _arr -1) do {
	_arr1 = _arr select _i;
	_str = configName (_cfgVeh >> (_arr1 select 0));
	if (_str != "") then {
		_arr0 select 1 set [count (_arr0 select 0), _arr1 select 1];
		_arr0 select 0 set [count (_arr0 select 0), _str];
	};
};
diag_log format ["Log: [init_common] gosa_params_Airport %1", _arr0];
gosa_params_Airport = _arr0;

_arr = [
	// Центр смещен.
	//"Land_csla_Hospital_side2",
	"Land_vn_usaf_revetment_helipad_02",
	// Мало места.
	"Land_vn_usaf_revetment_helipad_01",

	"Land_vn_b_helipad_01",
	"Land_vn_helipadsquare_f",
	"Land_vn_helipadcircle_f",
	"Land_vn_helipadrescue_f",
	"Land_vn_helipadcivil_f",
	"Land_AirstripPlatform_01_F",
	"Land_vn_helipadempty_f"
];
gosa_types_helipad = _arr;

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

// Верхние перекрывают нижних.
gosa_typesKindOf_bunker = [
	["Land_Barracks_02_F",[[0,0,0.3]]],
	["Land_Barracks_03_F",[[0,-1,0.4]]],
	["Land_Barracks_04_F",[[2,5,0.4]]],
	["Land_Barracks_05_F",[[2,-2,0.2]]],
	["Land_Airport_02_controlTower_F",[[0,0,13.1]]],
	["Land_Barracks_01_camo_F",[[0,0,4]]],
	["Land_Barracks_01_grey_F",[[0,0,4]]],
	["Land_Cargo_HQ_V3_F",[[0,0,0.65]]],
	["Land_Cargo_Tower_V3_F",[[0,0,15.5]]],
	"Land_SPE_Tent_02",
	["Land_JNS_Bunker_AA_Camo",[[-1,2.5,0.3]]],
	["Land_JNS_Bunker_Rs65a_Omaha",[[0.9,-4.1,2.5]]],
	["Land_JNS_LAWZ_FA_Unterstand_Omaha_Net",[[0,0,0.8]]],
	["Land_i_Barracks_V1_F",[[-5,-4,4]]],
	["Land_i_Barracks_V2_F",[[-5,-4,4]]],
	["Land_csla_bunker_01",[[0,-2.5,0]]],
	["Land_ControlTower_02_F",[[0,3.5,5]]],
	["Land_Radar_01_HQ_F",[[0,0,5]]],
	["Land_csla_Mil_Barracks_i_camo",[[0,0,0.3]]],
	["Land_csla_Fire_Station",[[-7,-4,0]]],
	["Land_csla_Fire_Station",[[-7,-4,0]]],
	["Land_i_Shed_Ind_old_F",[[-8,-1,0.1]]],
	"Land_vn_barracks_02_f",
	"Land_vn_barracks_03_f",
	"Land_vn_b_trench_bunker_01_01",
	"Land_vn_b_trench_bunker_02_01",
	"Land_vn_b_trench_bunker_03_01",
	"Land_vn_b_trench_bunker_03_04",
	"Land_vn_b_trench_bunker_04_01",
	"Land_vn_b_trench_bunker_06_02",
	"Land_vn_barracks_03_01",
	"Land_vn_barracks_03_04",
	"Land_vn_quonset_02_01",
	"Land_vn_hootch_02_11"
];

gosa_modelNames_Barracks = [
	"spe_tent_02.p3d"
];

gosa_vehiclesKindOf_LCVP = ["SPEX_LCVP","EF_LCC_Base"];

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
_n = 1000000;
gosa_flare_intensity_best = _n;
_arr = [_n] call gosa_fnc_flare_Weighted;
gosa_flare_Weighted = _arr;
diag_log format ["Log: [init_common]: gosa_flare_Weighted %1", _arr];

// Устарело.
_n = 100000;
#ifdef __ARMA3__
	_n = _n min getNumber(configfile >> "CfgAmmo" >> "F_40mm_White" >> "intensity");
#endif
gosa_flare_intensity_required = _n;
_arr = _arr select 0;
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_str = toLower configName (_cfgAmm >> (_arr select _i));
	if (_str != "") then {
		if (getNumber (_cfgAmm >> _str >> "intensity") >= _n) then {
		_arr0 set [count _arr0, _str];
		};
	};
};
gosa_flare = _arr0;
// Эти осветительные ракеты не излучают свет.
gosa_flare_blacklist = [
	// "F_40mm_White" родитель многих и его нет смысла добавлять сюда.
	// Модификации могут изменить яркость, поэтому нет смысла в этом массиве.
];

// TODO: Нужно искать по отличиям в configFile.
_arr = [
	"SPE_GER_oberst","SPE_sturmtrooper_standartenfuhrer",
	"SPE_Milice_FG_Regional_Commander","SPE_FFI_CellLeader",

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
