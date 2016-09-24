EnableTeamSwitch false;

LIB_cfgVeh = configFile >> "CfgVehicles";
LIB_cfgWea = configFile >> "CfgWeapons";
// LIB_cfgAmm = configFile >> "CfgAmmo";
LIB_cfgWor = configFile >> "CfgWorlds" >> worldName;
// LIB_cfgWAr = LIB_cfgWor >> "Armory";
// LIB_cfgArm = configFile >> "CfgArmory";
// LIB_disableShips = getNumber(LIB_cfgWAr >> "disableShips");
LIB_a2Avail = false;
if (configName(LIB_cfgVeh >> "RU_Commander") != "") then {LIB_a2Avail = true};
LIB_ahAvail = false;
if (configName(LIB_cfgVeh >> "TK_Soldier_Officer_EP1") != "") then {LIB_ahAvail = true};
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

safeDistance = 15;

/// listCrew + listMHQ ///
listCrew = [];
listMHQ=["BRDM2_HQ_Base","BMP2_HQ_Base"];
if ( LIB_a2Avail ) then {
	listMHQ=listMHQ+[
		"BTR90_HQ",
		"LAV25_HQ"
	];
	listCrew=listCrew+[
		"USMC_Soldier_Crew", 
		"USMC_Soldier_Pilot", 
		"CDF_Soldier_Crew", 
		"CDF_Soldier_Pilot", 
		"RU_Soldier_Crew", 
		"RU_Soldier_Pilot", 
		"Ins_Soldier_Crew", 
		"Ins_Soldier_Pilot", 
		"GUE_Soldier_Crew", 
		"GUE_Soldier_Pilot"
	];
};
if ( LIB_ahAvail ) then {
	listMHQ=listMHQ+[
		"M1130_CV_EP1"
	];
	listCrew=listCrew+[
		"US_Soldier_Crew_EP1", 
		"US_Soldier_Pilot_EP1", 
		"TK_Soldier_Crew_EP1", 
		"TK_Soldier_Pilot_EP1", 
		"UN_CDF_Soldier_Crew_EP1", 
		"UN_CDF_Soldier_Pilot_EP1",
		"Soldier_Crew_PMC", 
		"Soldier_Pilot_PMC",
		"BAF_crewman_MTP", 
		"BAF_crewman_w",
		"BAF_Pilot_MTP"
	];
};
if ( configName(configFile >> "CfgMods" >> "ACR") != "" ) then {
	listCrew=listCrew+[
		"CZ_Soldier_Crew_Dst_ACR",
		"CZ_Soldier_Crew_Wdl_ACR",
		"CZ_Soldier_Pilot_EP1"
	];
};

HQ = listMHQ + ["Warfare_HQ_base_unfolded","WarfareBDepot","WarfareBCamp"];
