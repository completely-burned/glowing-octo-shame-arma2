//-- East
#define __exclude ["CUP_O_RU","OPF_SFIA_lxWS","OPF_TURA_lxWS","OPF_T_F","OPF_F","OPF_G_F","OPF_R_F"]
//-- CSLA_DES, CSLA (Desert)
_arr = [
	//- CSLA_TankUnitsDes, Armored Units
	// CSLA_T72MptnDes, T-72 platoon
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_TankUnitsDes" >> "CSLA_T72MptnDes"]],_rarity_TankPlatoon/2],
	// CSLA_T72infTeamDes, T-72 with rifle team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_TankUnitsDes" >> "CSLA_T72infTeamDes"]],_rarity_TankSection],
	//- CSLA_MotoriflemanUnitsDes, Motorized Rifle Units
	// CSLA_mrSqdBVP1Des, Motorized squad on BMP-1
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_MotoriflemanUnitsDes" >> "CSLA_mrSqdBVP1Des"]],_rarity_MechInfSquad/2],
	// CSLA_mrSqdOT64Des, Motorized squad on OT-64
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_MotoriflemanUnitsDes" >> "CSLA_mrSqdOT64Des"]],_rarity_MotInf_Team/2],
	// CSLA_mrSqdHWOT64Des, Motorized Heavy Weapon squad on OT-64
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_MotoriflemanUnitsDes" >> "CSLA_mrSqdHWOT64Des"]],_rarity_MotInf_Team/2],
	// CSLA_mrSqdOT62Des, Motorized squad on OT-62
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_MotoriflemanUnitsDes" >> "CSLA_mrSqdOT62Des"]],_rarity_MechInfSquad/2],
	// CSLA_mrADTeamOT65Des, AA team on OT-65
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_MotoriflemanUnitsDes" >> "CSLA_mrADTeamOT65Des"]],_rarity_MotInf_AA/2],
	//- CSLA_RiflemanUnitsDes, Rifle Units
	// CSLA_cpSentryTeamDes, Sentry team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_cpSentryTeamDes"]],_rarity_InfSentry],
	// CSLA_cpFireTeamDes, Fire team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_cpFireTeamDes"]],_rarity_InfTeam_MG],
	// CSLA_cpRifleTeamDes, Riflemen team AT
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_cpRifleTeamDes"]],_rarity_InfTeam_AT],
	// CSLA_rSqdDes, Riflemen squad
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rSqdDes"]],_rarity_InfSquad],
	// CSLA_rTeamDes, Riflemen team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rTeamDes"]],_rarity_InfTeam],
	// CSLA_rPLTeamDes, Platoon leader team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rPLTeamDes"]],_rarity_bad],
	// CSLA_rUK59TeamDes, UK-59 Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rUK59TeamDes"]],_rarity_bad],
	// CSLA_rDSKMTeamDes, DSKM Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rDSKMTeamDes"]],_rarity_bad],
	// CSLA_rAGS17TeamDes, AGS-17 Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rAGS17TeamDes"]],_rarity_bad],
	// CSLA_rM52TeamDes, M-52 Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rM52TeamDes"]],_rarity_bad],
	// CSLA_rT21TeamDes, T21 Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rT21TeamDes"]],_rarity_bad],
	// CSLA_r9P135MTeamDes, 9P135M Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_r9P135MTeamDes"]],_rarity_bad],
	// CSLA_rADTeamAZUDes, AA team on AZU 469
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rADTeamAZUDes"]],_rarity_MotInf_AA/2],
	// CSLA_rADTeamInfDes, Infantry AA team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rADTeamInfDes"]],_rarity_InfTeam_AA],
	// CSLA_rADTeamV3SDes, Squad on V3S
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_RiflemanUnitsDes" >> "CSLA_rADTeamV3SDes"]],_rarity_MotInf_Reinforce/2],
	//- CSLA_LongRangeReconUnitsDes, Recon Units
	// CSLA_lrrAbPrlDes, Long Range Recon Patrol
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_LongRangeReconUnitsDes" >> "CSLA_lrrAbPrlDes"]],_rarity_reconSquad],
	// CSLA_lrrSbtDtmtDes, Long-Range Recon Sabotage Detachment
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_LongRangeReconUnitsDes" >> "CSLA_lrrSbtDtmtDes"]],_rarity_ReconPatrol],
	// CSLA_lrrOT65PrlDes, Recon patrol on OT-65
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA_DES" >> "CSLA_LongRangeReconUnitsDes" >> "CSLA_lrrOT65PrlDes"]],_rarity_reconSquad*_rarity_MotInf_Team]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// User
	[[[["CSLA_OZV90_Des"],[],[]]],_rarity_MotInf_AA],
	[[[["CSLA_V3Sa_Des","CSLA_V3Sf_Des","CSLA_V3Sr_Des","CSLA_CS_CATOR"],[[0,-12,0],[0,-24,0],[0,-36,0],[0,-48,0],[0,-60,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],_rarity_bad],
	//[[[["CSLA_lrrSnpG","CSLA_lrrSptG"],[[0,0,0],[4,0,0]],["Sergeant","Corporal"]]],0.1],
	[[[["CSLA_T72M1_Des","CSLA_T72M1_Des","CSLA_T72M1_Des","CSLA_T72M1_Des"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_TankPlatoon/2],
	[[[["CSLA_rSgtDes","CSLA_rSgtDes","CSLA_F813_Des","CSLA_rRF10Des","CSLA_rSa58VDes","CSLA_rUK59LDes","CSLA_rUK59LDes","CSLA_rRPG7Des","CSLA_rRPG7aDes","CSLA_rMediDes","CSLA_rVG70Des","CSLA_r9K32Des","CSLA_rRPG7Des","CSLA_rUK59LDes","CSLA_mrSa58PpDes","CSLA_mrSa58PpDes","CSLA_engSapperDes","CSLA_mrOP63Des"],[[3,-3,0],[6,-3,0],[0,0,0],[0,-12,0],[-3,-3,0],[-3,-9,0],[3,-9,0],[3,-12,0],[-3,-12,0],[0,-15,0],[3,-15,0],[-3,-15,0],[6,-6,0],[6,-9,0],[-6,-3,0],[-6,-6,0],[-6,-9,0],[-6,-12,0]],
		["Sergeant","Sergeant","Corporal","Corporal","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private"]]
	],_rarity_MotInf_Reinforce/2]
];
// Если юнитов с пустынным камуфляжем недостаточно, то обычные тоже будут добавлены. FIXME: Это временное решение.
_n = count _arr;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
diag_log format ["Log: [config_groups_CSLA] count CSLA Desert %1", [count _arr, _n]];
if (count _arr * 1.5 >= _n) then {_n=250}else{_n=1000};
// Вспомогательные отряды не должны учитываться.
if (_Artillery) then {
	_arr append [
		[[[["CSLA_ShKH77_Des","CSLA_ShKH77_Des"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],_rarity_MotInf_MortTeam/2],
		[[[["CSLA_RM51_Des","CSLA_RM51_Des"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],_rarity_MotInf_MortTeam/2]
	];
};
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, east, "CSLA",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [250,999],
		__exclude
	] call gosa_fnc_map_groups_add;
};

//-- CSLA, CSLA
_arr = [
	//- CSLA_TankUnits, Armored Units
	// CSLA_T72Mptn, T-72 platoon
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_TankUnits" >> "CSLA_T72Mptn"]],_rarity_TankPlatoon/2],
	// CSLA_T72infTeam, T-72 with rifle team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_TankUnits" >> "CSLA_T72infTeam"]],_rarity_TankSection],
	//- CSLA_MotoriflemanUnits, Motorized Rifle Units
	// CSLA_mrSqdBVP1, Motorized squad on BMP-1
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_MotoriflemanUnits" >> "CSLA_mrSqdBVP1"]],_rarity_MechInfSquad/2],
	// CSLA_mrSqdOT64, Motorized squad on OT-64
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_MotoriflemanUnits" >> "CSLA_mrSqdOT64"]],_rarity_MotInf_Team/2],
	// CSLA_mrSqdHWOT64, Motorized Heavy Weapon squad on OT-64
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_MotoriflemanUnits" >> "CSLA_mrSqdHWOT64"]],_rarity_MotInf_Team/2],
	// CSLA_mrSqdOT62, Motorized squad on OT-62
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_MotoriflemanUnits" >> "CSLA_mrSqdOT62"]],_rarity_MechInfSquad/2],
	// CSLA_mrADTeamOT65, AA team on OT-65
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_MotoriflemanUnits" >> "CSLA_mrADTeamOT65"]],_rarity_MotInf_AA/2],
	//- CSLA_RiflemanUnits, Rifle Units
	// CSLA_cpSentryTeam, Sentry team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_cpSentryTeam"]],_rarity_InfSentry],
	// CSLA_cpFireTeam, Fire team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_cpFireTeam"]],_rarity_InfTeam_MG],
	// CSLA_cpRifleTeam, Riflemen team AT
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_cpRifleTeam"]],_rarity_InfTeam_AT],
	// CSLA_rSqd, Riflemen squad
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rSqd"]],_rarity_InfSquad],
	// CSLA_rTeam, Riflemen team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rTeam"]],_rarity_InfTeam],
	// CSLA_rPLTeam, Platoon leader team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rPLTeam"]],_rarity_bad],
	// CSLA_rUK59Team, UK-59 Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rUK59Team"]],_rarity_bad],
	// CSLA_rDSKMTeam, DSKM Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rDSKMTeam"]],_rarity_bad],
	// CSLA_rAGS17Team, AGS-17 Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rAGS17Team"]],_rarity_bad],
	// CSLA_rM52Team, M-52 Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rM52Team"]],_rarity_bad],
	// CSLA_rT21Team, T21 Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rT21Team"]],_rarity_bad],
	// CSLA_r9P135MTeam, 9P135M Crew
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_r9P135MTeam"]],_rarity_bad],
	// CSLA_rADTeamAZU, AA team on AZU 469
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rADTeamAZU"]],_rarity_MotInf_AA/2],
	// CSLA_rADTeamInf, Infantry AA team
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rADTeamInf"]],_rarity_InfTeam_AA],
	// CSLA_rADTeamV3S, Squad on V3S
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_RiflemanUnits" >> "CSLA_rADTeamV3S"]],_rarity_MotInf_Reinforce/2],
	//- CSLA_AirbornUnits, Airborne Units
	// CSLA_abSqd, Airborne squad
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_AirbornUnits" >> "CSLA_abSqd"]],_rarity_reconSquad*0.25/2],
	// CSLA_abDtmt, Airborne Detachment
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_AirbornUnits" >> "CSLA_abDtmt"]],_rarity_ReconPatrol*0.25/2],
	//- CSLA_LongRangeReconUnits, Recon Units
	// CSLA_lrrAbPrl, Long Range Recon Patrol
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_LongRangeReconUnits" >> "CSLA_lrrAbPrl"]],_rarity_reconSquad*0.75/2],
	// CSLA_lrrSbtDtmt, Long-Range Recon Sabotage Detachment
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_LongRangeReconUnits" >> "CSLA_lrrSbtDtmt"]],_rarity_ReconPatrol*0.75/2],
	// CSLA_lrrOT65Prl, Recon patrol on OT-65
	[[[configFile >> "CfgGroups" >> "East" >> "CSLA" >> "CSLA_LongRangeReconUnits" >> "CSLA_lrrOT65Prl"]],_rarity_reconSquad*_rarity_MotInf_Team]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// User
	// AA
	[[[["CSLA_OZV90"],[],[]]],_rarity_MotInf_AA],
	// Support
	[[[["CSLA_V3Sa","CSLA_V3Sf","CSLA_V3Sr","CSLA_CS_CATOR"],[[0,-12,0],[0,-24,0],[0,-36,0],[0,-48,0],[0,-60,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],_rarity_bad],
	// T72M1
	[[[["CSLA_T72M1","CSLA_T72M1","CSLA_T72M1","CSLA_T72M1"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_TankPlatoon/2],
	// F813
	[[[["CSLA_rSgt","CSLA_rSgt","CSLA_F813","CSLA_rRF10","CSLA_rSa58V","CSLA_rUK59L","CSLA_rUK59L","CSLA_rRPG7","CSLA_rRPG7a","CSLA_rMedi","CSLA_rVG70","CSLA_r9K32","CSLA_rRPG7","CSLA_rUK59L","CSLA_mrSa58Pp","CSLA_mrSa58Pp","CSLA_engSapper","CSLA_mrOP63"],[[3,-3,0],[6,-3,0],[0,0,0],[0,-12,0],[-3,-3,0],[-3,-9,0],[3,-9,0],[3,-12,0],[-3,-12,0],[0,-15,0],[3,-15,0],[-3,-15,0],[6,-6,0],[6,-9,0],[-6,-3,0],[-6,-6,0],[-6,-9,0],[-6,-12,0]],
		["Sergeant","Sergeant","Corporal","Corporal","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private"]]
	],_rarity_MotInf_Reinforce/2]
];
// Вспомогательные отряды можно исключить.
if (_Artillery) then {
	_arr append [
		[[[["CSLA_ShKH77","CSLA_ShKH77"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],_rarity_MotInf_MortTeam/2],
		[[[["CSLA_RM51","CSLA_RM51"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],_rarity_MotInf_MortTeam/2]
	];
};
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, east, "CSLA",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, _n-1],
		__exclude
	] call gosa_fnc_map_groups_add;
};

// Без альтернативного камуфляжа.
_arr = [
	// Снайперы
	[[[["CSLA_lrrSnpG","CSLA_lrrSptG"],[[0,0,0],[4,0,0]],["Sergeant","Corporal"]]],_rarity_SniperTeam]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, east, "CSLA",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 250-1],
		__exclude
	] call gosa_fnc_map_groups_add;
};

//- CSLA Common. Общие для Des и Wdl.
_arr = [
	// User
	[[[["CSLA_lodka","CSLA_rSa58P","CSLA_rRPG75","CSLA_rVG70","CSLA_rUK59L"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0]],
		["Private","Corporal","Private","Private","Private"]]
	],_rarity_bad],
	// Air
	[[[["CSLA_Mi24V","CSLA_Mi24V"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_Heli/3],
	[[[["CSLA_Mi17pylons","CSLA_Mi17pylons"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_Heli/3],
	[[[["CSLA_Mi17mg","CSLA_Mi17mg"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_Heli/3]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, east, "CSLA",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 999],
		__exclude
	] call gosa_fnc_map_groups_add;
};


//-- West
#define __exclude ["CUP_B_US_Army","CUP_B_USMC","BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
//-- AFMC, AFMC
_arr = [
	//- AFMC_InfantryUnits, Infantry Units
	// AFMC_cpSentryTeam, Sentry team
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_cpSentryTeam"]],_rarity_InfSentry],
	// AFMC_cpFireTeam, Fire team
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_cpFireTeam"]],_rarity_InfTeam_MG/2],
	// AFMC_cpRifleTeam, Riflemen team AT
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_cpRifleTeam"]],_rarity_InfTeam_AT/2],
	// AFMC_infSqd, Rifle Squad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_infSqd"]],_rarity_InfSquad],
	// AFMC_infPLTeam, PL Team
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_infPLTeam"]],_rarity_bad],
	// AFMC_infTeam, Infantry Team
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_infTeam"]],_rarity_InfTeam],
	// AFMC_infM60Team, M60 Team
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_infM60Team"]],_rarity_InfTeam_MG/2],
	// AFMC_infADSqd, AD Squad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_infADSqd"]],_rarity_InfTeam_AA],
	// AFMC_infM252Sqd, M252 Squad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_infM252Sqd"]],_rarity_bad],
	// AFMC_infAslSqd, Assault Squad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_infAslSqd"]],_rarity_InfTeam_AT/2],
	// AFMC_infCHQ, Company HQ
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_InfantryUnits" >> "AFMC_infCHQ"]],_rarity_bad],
	//- AFMC_MechanizedUnits, Mechanized Units
	// AFMC_M113Sec, M113 Infantry Section
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_MechanizedUnits" >> "AFMC_M113Sec"]],_rarity_MechInfSquad/2],
	// AFMC_M113Sqd, M113 Squad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_MechanizedUnits" >> "AFMC_M113Sqd"]],_rarity_MechInfSquad/2],
	// AFMC_M113ADSqd, M113 AA Squad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_MechanizedUnits" >> "AFMC_M113ADSqd"]],_rarity_MechInf_AA],
	// AFMC_LAV25sqd, LAV-25 Squad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_MechanizedUnits" >> "AFMC_LAV25sqd"]],_rarity_MotInf_Team],
	//- AFMC_MotorizedUnits, Motorized Units
	// AFMC_M1008Team, M1008 Team
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_MotorizedUnits" >> "AFMC_M1008Team"]],_rarity_MotInf_Team/2],
	// AFMC_M1008HfSqd, M1008 Halfsquad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_MotorizedUnits" >> "AFMC_M1008HfSqd"]],_rarity_MotInf_Team/2],
	// AFMC_TruckSqd, Motorized Squad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_MotorizedUnits" >> "AFMC_TruckSqd"]],_rarity_MotInf_Reinforce],
	//- AFMC_AirbornUnits, Airborne Units
	// AFMC_abSqd, Rifle Squad
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_AirbornUnits" >> "AFMC_abSqd"]],_rarity_ReconTeam],
	// AFMC_abDtmt, Sabotage Detachment
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_AirbornUnits" >> "AFMC_abDtmt"]],_rarity_reconSquad/2],
	//- AFMC_SpecForUnits, Special Forces Units
	// AFMC_sfSqd, Special Forces Team
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_SpecForUnits" >> "AFMC_sfSqd"]],_rarity_reconSquad/2],
	//- AFMC_TankUnits, Tank Units
	// AFMC_M1A1ptn, M1A1 Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_TankUnits" >> "AFMC_M1A1ptn"]],_rarity_TankPlatoon],
	// AFMC_M1A1scM113sqd, M1A1 Section with Squad on M113
	[[[configFile >> "CfgGroups" >> "West" >> "AFMC" >> "AFMC_TankUnits" >> "AFMC_M1A1scM113sqd"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;

	_arr append [
		[[[["AFMC_M113A2_AMB"],[],[]]],_rarity_bad],
		[[[["AFMC_M113A2_DTP"],[],[]]],_rarity_bad],
		[[[["AFMC_M923a","AFMC_M923f","AFMC_M923r"],[[0,12,0],[0,0,0],[0,-12,0]],["CORPORAL","PRIVATE","PRIVATE"]]
		],_rarity_bad],

		[[[["AFMC_sfM21G","AFMC_sfSptG"],[[0,0,0],[4,0,0]],["Sergeant","Corporal"]]],_rarity_SniperTeam],

		[[[["AFMC_AH1F"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
		],_rarity_Heli/2],
		[[[["AFMC_UH60M240","AFMC_UH60M240"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
		],_rarity_Heli/2]
	];
	if (_Artillery) then {
		_arr append [
			// AFMC_infM252Sqd
			[[[["AFMC_infM252g","AFMC_infMB","AFMC_infM252m","AFMC_infM252m"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0]],["Sergeant","Corporal","Private","Private"]]],_rarity_MotInf_MortTeam/2],
			[[[["AFMC_M270","AFMC_M270"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],_rarity_MotInf_MortTeam/2]
		];
	};
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "AFMC",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 250-1],
		__exclude
	] call gosa_fnc_map_groups_add;
};

//-- US85_DES, US '85 (Desert)
_arr = [
	//- US85_InfantryUnitsDes, Infantry Units
	// US85_cpSentryTeamDes, Sentry team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_cpSentryTeamDes"]],_rarity_InfSentry],
	// US85_cpFireTeamDes, Fire team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_cpFireTeamDes"]],_rarity_InfTeam],
	// US85_cpRifleTeamDes, Riflemen team AT
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_cpRifleTeamDes"]],_rarity_InfTeam_AT/2],
	// US85_infSqdDes, Rifle Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infSqdDes"]],_rarity_InfSquad],
	// US85_infPLTeamDes, PL Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infPLTeamDes"]],_rarity_bad],
	// US85_infTeamDes, Infantry Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infTeamDes"]],_rarity_InfTeam],
	// US85_infM60TeamDes, M60 Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infM60TeamDes"]],_rarity_InfTeam_MG],
	// US85_infM2TeamDes, M2 Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infM2TeamDes"]],_rarity_bad],
	// US85_infMk19TeamDes, Mk. 19 Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infMk19TeamDes"]],_rarity_bad],
	// US85_infADSqdDes, AD Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infADSqdDes"]],_rarity_InfTeam_AA],
	// US85_infM252SqdDes, M252 Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infM252SqdDes"]],_rarity_bad],
	// US85_infAslSqdDes, Assault Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infAslSqdDes"]],_rarity_InfTeam_AT/2],
	// US85_infCHQDes, Company HQ
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_InfantryUnitsDes" >> "US85_infCHQDes"]],_rarity_bad],
	//- US85_MechanizedUnitsDes, Mechanized Units
	// US85_M113SecDes, M113 Infantry Section
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_MechanizedUnitsDes" >> "US85_M113SecDes"]],_rarity_MechInfSquad/2],
	// US85_M113SqdDes, M113 Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_MechanizedUnitsDes" >> "US85_M113SqdDes"]],_rarity_MechInfSquad/2],
	// US85_M113ADSqdDes, M113 AA Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_MechanizedUnitsDes" >> "US85_M113ADSqdDes"]],_rarity_MechInf_AA],
	// US85_LAV25SqdDes, LAV-25 Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_MechanizedUnitsDes" >> "US85_LAV25SqdDes"]],_rarity_MotInf_Team],
	//- US85_MotorizedUnitsDes, Motorized Units
	// US85_M1043TeamDes, M1043 Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_MotorizedUnitsDes" >> "US85_M1043TeamDes"]],_rarity_MotInf_Team],
	// US85_LCvlAssaultScnDes, Light Cavalry Assault Section
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_MotorizedUnitsDes" >> "US85_LCvlAssaultScnDes"]],_rarity_MotInf_GMGTeam],
	// US85_LCvlScoutScnDes, Light Cavalry Scout Section
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_MotorizedUnitsDes" >> "US85_LCvlScoutScnDes"]],_rarity_MotInf_HMGTeam/2],
	// US85_LCvlATScnDes, Light Cavalry Anti-Tank Section
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_MotorizedUnitsDes" >> "US85_LCvlATScnDes"]],_rarity_MotInf_AT],
	// US85_TruckSqdDes, Motorized Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_MotorizedUnitsDes" >> "US85_TruckSqdDes"]],_rarity_MotInf_Reinforce],
	//- US85_SpecForUnitsDes, Special Forces Units
	// US85_sfSqdDes, Special Forces Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_SpecForUnitsDes" >> "US85_sfSqdDes"]],_rarity_reconSquad],
	// US85_sfTLDTeam, LTD Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_SpecForUnitsDes" >> "US85_sfTLDTeam"]],_rarity_SniperTeam],
	//- US85_TankUnitsDes, Tank Units
	// US85_M1A1ptnDes, M1A1 Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_TankUnitsDes" >> "US85_M1A1ptnDes"]],_rarity_TankPlatoon/2],
	// US85_M1A1scM113SqdDes, M1A1 Section with Squad on M113
	[[[configFile >> "CfgGroups" >> "West" >> "US85_DES" >> "US85_TankUnitsDes" >> "US85_M1A1scM113SqdDes"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// User
	[[[["US85_M113_AMB_DES"],[],[]]],_rarity_bad],
	[[[["US85_M113_DTP_DES"],[],[]]],_rarity_bad],
	[[[["US85_M1025_M60_DES","US85_M923a_DES","US85_M923f_DES","US85_M923r_DES"],[[0,-12,0],[0,-24,0],[0,-36,0],[0,-48,0],[0,-60,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],_rarity_bad],
	//[[[["US85_sfM21G","US85_sfSptG"],[[0,0,0],[4,0,0]],["Sergeant","Corporal"]]],0.1],
	[[[["US85_M1IP_DES","US85_M1IP_DES","US85_M1IP_DES","US85_M1IP_DES"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_TankPlatoon/2],
	// TruckM2
	[[[["US85_mcSgtDES","US85_mcM60DES","US85_mcM16GLDES","US85_mcM16DES","US85_mcM60DES","US85_mcCGDES","US85_mcCGDES","US85_mcM47DES","US85_mcM16DES","US85_mcM16DES","US85_mcM16DES","US85_mcCprsDES","US85_M923a1om2_DES"],[[3,6,0],[3,4,0],[-3,4,0],[3,2,0],[-3,2,0],[3,0,0],[-3,0,0],[3,-2,0],[-3,-2,0],[3,-4,0],[-3,-4,0],[3,-6,0],[-3,-6,0],[0,0,0]],["Sergeant","Corporal","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private"]]
	],_rarity_MotInf_HMGTeam/2]
];
_n = count _arr;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
diag_log format ["Log: [config_groups_CSLA] count US85 Desert %1", [count _arr, _n]];
if (count _arr * 1.5 >= _n) then {_n=250}else{_n=1000};
if (_Artillery) then {
	_arr append [
		[[[["US85_M270_DES","US85_M270_DES"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],_rarity_MotInf_MortTeam]
	];
};
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "US85",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [250,999],
		__exclude
	] call gosa_fnc_map_groups_add;
};

//-- US85, US '85
_arr = [
	//- US85_InfantryUnits, Infantry Units
	// US85_cpSentryTeam, Sentry team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_cpSentryTeam"]],_rarity_InfSentry],
	// US85_cpFireTeam, Fire team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_cpFireTeam"]],_rarity_InfTeam],
	// US85_cpRifleTeam, Riflemen team AT
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_cpRifleTeam"]],_rarity_InfTeam_AT/2],
	// US85_infSqd, Rifle Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infSqd"]],_rarity_InfSquad],
	// US85_infPLTeam, PL Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infPLTeam"]],_rarity_bad],
	// US85_infTeam, Infantry Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infTeam"]],_rarity_InfTeam],
	// US85_infM60Team, M60 Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infM60Team"]],_rarity_InfTeam_MG],
	// US85_infM2Team, M2 Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infM2Team"]],_rarity_bad],
	// US85_infMk19Team, Mk. 19 Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infMk19Team"]],_rarity_bad],
	// US85_infADSqd, AD Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infADSqd"]],_rarity_InfTeam_AA],
	// US85_infM252Sqd, M252 Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infM252Sqd"]],_rarity_bad],
	// US85_infAslSqd, Assault Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infAslSqd"]],_rarity_InfTeam_AT/2],
	// US85_infCHQ, Company HQ
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_InfantryUnits" >> "US85_infCHQ"]],_rarity_bad],
	//- US85_MechanizedUnits, Mechanized Units
	// US85_M113Sec, M113 Infantry Section
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_MechanizedUnits" >> "US85_M113Sec"]],_rarity_MechInfSquad/2],
	// US85_M113Sqd, M113 Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_MechanizedUnits" >> "US85_M113Sqd"]],_rarity_MechInfSquad/2],
	// US85_M113ADSqd, M113 AA Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_MechanizedUnits" >> "US85_M113ADSqd"]],_rarity_MechInf_AA],
	// US85_LAV25sqd, LAV-25 Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_MechanizedUnits" >> "US85_LAV25sqd"]],_rarity_MotInf_Team],
	//- US85_MotorizedUnits, Motorized Units
	// US85_M1043Team, M1043 Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_MotorizedUnits" >> "US85_M1043Team"]],_rarity_MotInf_Team],
	// US85_LCvlAssaultScn, Light Cavalry Assault Section
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_MotorizedUnits" >> "US85_LCvlAssaultScn"]],_rarity_MotInf_GMGTeam],
	// US85_LCvlScoutScn, Light Cavalry Scout Section
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_MotorizedUnits" >> "US85_LCvlScoutScn"]],_rarity_MotInf_HMGTeam/2],
	// US85_LCvlATScn, Light Cavalry Anti-Tank Section
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_MotorizedUnits" >> "US85_LCvlATScn"]],_rarity_MotInf_AT],
	// US85_TruckSqd, Motorized Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_MotorizedUnits" >> "US85_TruckSqd"]],_rarity_MotInf_Reinforce],
	//- US85_AirbornUnits, Airborne Units
	// US85_abSqd, Rifle Squad
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_AirbornUnits" >> "US85_abSqd"]],_rarity_reconSquad*0.25/2],
	// US85_abDtmt, Sabotage Detachment
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_AirbornUnits" >> "US85_abDtmt"]],_rarity_ReconPatrol/2],
	//- US85_SpecForUnits, Special Forces Units
	// US85_sfSqd, Special Forces Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_SpecForUnits" >> "US85_sfSqd"]],_rarity_reconSquad*0.75],
	// US85_sfSnpTeam, Sniper Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_SpecForUnits" >> "US85_sfSnpTeam"]],_rarity_SniperTeam],
	// US85_sfTLDTeam, LTD Team
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_SpecForUnits" >> "US85_sfTLDTeam"]],_rarity_SniperTeam],
	//- US85_TankUnits, Tank Units
	// US85_M1A1ptn, M1A1 Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_TankUnits" >> "US85_M1A1ptn"]],_rarity_TankPlatoon/2],
	// US85_M1A1scM113sqd, M1A1 Section with Squad on M113
	[[[configFile >> "CfgGroups" >> "West" >> "US85" >> "US85_TankUnits" >> "US85_M1A1scM113sqd"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// User
	[[[["US85_M113_AMB"],[],[]]],_rarity_bad],
	[[[["US85_M113_DTP"],[],[]]],_rarity_bad],
	[[[["US85_M1025_M60","US85_M923a","US85_M923f","US85_M923r"],[[0,-12,0],[0,-24,0],[0,-36,0],[0,-48,0],[0,-60,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],_rarity_bad],
	[[[["US85_M1IP","US85_M1IP","US85_M1IP","US85_M1IP"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_TankPlatoon/2],
	// TruckM2
	[[[["US85_mcSgt","US85_mcM60","US85_mcM16GL","US85_mcM16","US85_mcM60","US85_mcCG","US85_mcCG","US85_mcM47","US85_mcM16","US85_mcM16","US85_mcM16","US85_mcCprs","US85_M923a1om2"],[[3,6,0],[3,4,0],[-3,4,0],[3,2,0],[-3,2,0],[3,0,0],[-3,0,0],[3,-2,0],[-3,-2,0],[3,-4,0],[-3,-4,0],[3,-6,0],[-3,-6,0],[0,0,0]],["Sergeant","Corporal","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private"]]
	],_rarity_MotInf_HMGTeam/2]
];
if (_Artillery) then {
	_arr append [
		[[[["US85_M270","US85_M270"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],_rarity_MotInf_MortTeam]
	];
};
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "US85",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, _n-1],
		__exclude
	] call gosa_fnc_map_groups_add;
};

//- US85 Common
_arr = [
	// User
	[[[["US85_zodiac","US85_mcM16","US85_mcM16GL","US85_mcM249","US85_mcLAW"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0]],
		["PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],_rarity_bad],
	[[[["US85_AH1F","US85_AH1F"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_Heli/3],
	[[[["US85_MH60FFAR","US85_MH60FFAR"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_Heli/3],
	[[[["US85_MH60M134","US85_MH60M134"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]
	],_rarity_Heli/3]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "US85",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 999],
		__exclude
	] call gosa_fnc_map_groups_add;
};


#define __exclude ["IND_F","IND_E_F","IND_G_F","IND_C_F"]
//-- FIA, FIA [CSLA]
_arr = [
	//- FIA_RiflemanUnits, Guerrillas
	// FIA_cpSentryTeam, Sentry team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_RiflemanUnits" >> "FIA_cpSentryTeam"]],_rarity_InfSentry/2],
	// FIA_cpFireTeam, Fire team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_RiflemanUnits" >> "FIA_cpFireTeam"]],_rarity_InfTeam/3/2],
	// FIA_cpRifleTeam, Riflemen team AT
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_RiflemanUnits" >> "FIA_cpRifleTeam"]],_rarity_InfTeam_AT/2/2],
	// FIA_rScn, Rifle Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_RiflemanUnits" >> "FIA_rScn"]],_rarity_InfTeam/3/2],
	// FIA_rTeam, Riflemen team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_RiflemanUnits" >> "FIA_rTeam"]],_rarity_InfTeam/3/2],
	// FIA_rSqd, Riflemen squad
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_RiflemanUnits" >> "FIA_rSqd"]],_rarity_InfSquad/2],
	// FIA_rTeamRPG, AT Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_RiflemanUnits" >> "FIA_rTeamRPG"]],_rarity_InfTeam_AT/2/2],
	// FIA_rTeamBTR40DSKM, Motorized Patrol (BTR-40 DShKM)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_RiflemanUnits" >> "FIA_rTeamBTR40DSKM"]],_rarity_MotInf_HMGTeam/2],
	// FIA_rTeamBTR40, Motorized Patrol (BTR-40)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_RiflemanUnits" >> "FIA_rTeamBTR40"]],_rarity_MotInf_Team/2],
	//- FIA_CloudsUnits, Clouds Camo
	// FIA_cpCldsSentryTeam, Sentry team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cpCldsSentryTeam"]],_rarity_InfSentry/2],
	// FIA_cpCldsFireTeam, Fire team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cpCldsFireTeam"]],_rarity_InfTeam/2/2],
	// FIA_cpCldsRifleTeam, Riflemen team AT
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cpCldsRifleTeam"]],_rarity_InfTeam_AT/2],
	// FIA_cldsScn, Rifle Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cldsScn"]],_rarity_InfTeam/2/2],
	// FIA_cldsSqd, Riflemen squad
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cldsSqd"]],_rarity_InfSquad/2],
	// FIA_cldsSqdBTR40DSKM, Motorized Squad (BTR-40 DShKM)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cldsSqdBTR40DSKM"]],_rarity_MotInf_HMGTeam/3/2],
	// FIA_cldsPtrAZUpara, Motorized Patrol (AZU Para)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cldsPtrAZUpara"]],_rarity_MotInf_Team/2/2],
	// FIA_cldsPtrAZUT21, Motorized Patrol (AZU T21)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cldsPtrAZUT21"]],_rarity_MotInf_AT],
	// FIA_cldsPtrAZUDSKM, Motorized Patrol (AZU DshKM)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cldsPtrAZUDSKM"]],_rarity_MotInf_HMGTeam/3/2],
	// FIA_cldsSqdAZUAslt, Motorized Assault Squad (AZU)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cldsSqdAZUAslt"]],_rarity_MotInf_Team/2/2],
	// FIA_cldsSqdV3S, Motorized Infantry Squad (V3S)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cldsSqdV3S"]],_rarity_MotInf_Reinforce],
	// FIA_cldsSqdV3SGT, Gun Truck Patrol (V3S GT)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CloudsUnits" >> "FIA_cldsSqdV3SGT"]],_rarity_MotInf_HMGTeam/3/2],
	//- FIA_CommandoUnits, Commando
	// FIA_cdDtmt, Airborne Detachment
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CommandoUnits" >> "FIA_cdDtmt"]],_rarity_reconSquad],
	// FIA_cdPrl, Long Range Recon Patrol
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA" >> "FIA_CommandoUnits" >> "FIA_cdPrl"]],_rarity_ReconPatrol]
]; [_arr] call gosa_fnc_groups_convNormal;
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "FIA_CSLA",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 250-1],
		__exclude
	] call gosa_fnc_map_groups_add;
};
//-- FIA_DES, FIA [CSLA] (Desert)
_arr = [
	//- FIA_RiflemanUnitsDes, Desert Camo
	// FIA_cpSentryTeamDes, Sentry team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_cpSentryTeamDes"]],_rarity_InfSentry],
	// FIA_cpFireTeamDes, Fire team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_cpFireTeamDes"]],_rarity_InfTeam],
	// FIA_cpRifleTeamDes, Riflemen team AT
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_cpRifleTeamDes"]],_rarity_InfTeam_AT/2],
	// FIA_desScnInf, Rifle Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desScnInf"]],_rarity_InfSquad/4],
	// FIA_desTeamInf, Riflemen team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desTeamInf"]],_rarity_InfTeam],
	// FIA_desSqdInf, Riflemen squad
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desSqdInf"]],_rarity_InfSquad/4],
	// FIA_desSqdInf76243, Riflemen squad (7.62×39)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desSqdInf76243"]],_rarity_InfSquad/4],
	// FIA_desSqdInf76252, Riflemen squad (7.62×45)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desSqdInf76252"]],_rarity_InfSquad/4],
	// FIA_desTeamRPG, AT Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desTeamRPG"]],_rarity_InfTeam_AT/2],
	// FIA_desTeamBTR40DSKM, Motorized Patrol (BTR-40 DShKM)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desTeamBTR40DSKM"]],_rarity_MotInf_HMGTeam/3],
	// FIA_desTeamBTR40, Motorized Patrol (BTR-40)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desTeamBTR40"]],_rarity_MotInf_Team/2],
	// FIA_desPtrAZUpara, Motorized Patrol (AZU Para)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desPtrAZUpara"]],_rarity_MotInf_Team/2],
	// FIA_desPtrAZUT21, Motorized Patrol (AZU T21)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desPtrAZUT21"]],_rarity_MotInf_AT],
	// FIA_desPtrAZUDSKM, Motorized Patrol (AZU DshKM)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desPtrAZUDSKM"]],_rarity_MotInf_HMGTeam/3],
	// FIA_desSqdAZUAslt, Motorized Assault Squad (AZU)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desSqdAZUAslt"]],_rarity_MotInf_GMGTeam],
	// FIA_desSqdV3S, Motorized Infantry Squad (V3S)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desSqdV3S"]],_rarity_MotInf_Reinforce],
	// FIA_desSqdV3SGT, Gun Truck Patrol (V3S GT)
	[[[configFile >> "CfgGroups" >> "Indep" >> "FIA_DES" >> "FIA_RiflemanUnitsDes" >> "FIA_desSqdV3SGT"]],_rarity_MotInf_HMGTeam/3]
]; [_arr] call gosa_fnc_groups_convNormal;
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "FIA_CSLA",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [250, 999],
		__exclude
	] call gosa_fnc_map_groups_add;
};
