//-- Atlas_OPF_T_F, Takistan
#define __cfg configFile >> "CfgGroups" >> "East" >> "Atlas_OPF_T_F"
_arr = [
	//- Infantry, Пехота
	// O_C_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "O_C_InfSquad"]],1],
	// O_C_InfSquad_Conscript, Rifle Squad (Conscripts)
	[[[__cfg >> "Infantry" >> "O_C_InfSquad_Conscript"]],0.5],
	// O_C_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "O_C_InfSquad_Weapons"]],0.5],
	// O_C_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "O_C_InfTeam"]],0.3],
	// O_C_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "O_C_InfTeam_AT"]],0.4],
	// O_C_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "O_C_InfTeam_AA"]],0.2],
	// O_C_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "O_C_InfSentry"]],0.01],
	//- Motorized, Мотопехота
	// O_C_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "O_C_MotInf_Team"]],0.5],
	// O_C_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "O_C_MotInf_AT"]],0.2],
	// O_C_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "O_C_MotInf_AA"]],0.1],
	// O_C_MotInf_Reinforcements, Моторизованные подкрепления
	[[[__cfg >> "Motorized" >> "O_C_MotInf_Reinforcements"]],0.15],
	//- Mechanized, Механизированая пехота
	// O_C_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "O_C_MechInfSquad"]],1],
	// O_C_MechInf_AT, Механизированное противотанковое отделение
	[[[__cfg >> "Mechanized" >> "O_C_MechInf_AT"]],0.4],
	// O_C_MechInf_AA, Механизированное отделение ПВО
	[[[__cfg >> "Mechanized" >> "O_C_MechInf_AA"]],0.2],
	//- Armored, Бронетехника
	// O_C_TankPlatoon, Танковый взвод
	[[[__cfg >> "Armored" >> "O_C_TankPlatoon"]],0.5],
	// O_C_TankSection, Танковое отделение
	[[[__cfg >> "Armored" >> "O_C_TankSection"]],0.5]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "Atlas_OPF_T_F", _arr,
	gosa_date_default, [250,999],
	["CUP_O_TK","OPF_G_F","OPF_F","OPF_T_F","OPF_R_F","OPF_SFIA_lxWS","OPF_TURA_lxWS"]
] call gosa_fnc_map_groups_add;

//-- Atlas_OPF_W_F, Беларусь
#define __cfg configFile >> "CfgGroups" >> "East" >> "Atlas_OPF_W_F"
_arr = [
	//- SpecOps, Спецподразделения
	// O_W_reconTeam, Разведгруппа
	[[[__cfg >> "SpecOps" >> "O_W_reconTeam"]],0.5],
	// O_W_reconPatrol, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "O_W_reconPatrol"]],0.15],
	// O_W_reconSentry, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "O_W_reconSentry"]],0.01],
	// O_W_ReconSquad, Разведывательный отряд
	[[[__cfg >> "SpecOps" >> "O_W_ReconSquad"]],0.25],
	//- Infantry, Пехота
	// O_W_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "O_W_InfSquad"]],1],
	// O_W_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "O_W_InfSquad_Weapons"]],0.5],
	// O_W_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "O_W_InfTeam"]],0.3],
	// O_W_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "O_W_InfTeam_AT"]],0.4],
	// O_W_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "O_W_InfTeam_AA"]],0.2],
	// O_W_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "O_W_InfSentry"]],0.01],
	//- Motorized, Мотопехота
	// O_W_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "O_W_MotInf_Team"]],1],
	// O_W_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "O_W_MotInf_AT"]],0.4],
	// O_W_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "O_W_MotInf_AA"]],0.2],
	// O_W_MotInf_Reinforcements, Моторизованные подкрепления
	[[[__cfg >> "Motorized" >> "O_W_MotInf_Reinforcements"]],0.15],
	//- Mechanized, Механизированая пехота
	// O_W_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "O_W_MechInfSquad"]],1],
	// O_W_MechInf_AT, Механизированное противотанковое отделение
	[[[__cfg >> "Mechanized" >> "O_W_MechInf_AT"]],0.4],
	// O_W_MechInf_AA, Механизированное отделение ПВО
	[[[__cfg >> "Mechanized" >> "O_W_MechInf_AA"]],0.2],
	//- Armored, Бронетехника
	// O_W_TankPlatoon, Танковый взвод
	[[[__cfg >> "Armored" >> "O_W_TankPlatoon"]],0.5],
	// O_W_TankSection, Танковое отделение
	[[[__cfg >> "Armored" >> "O_W_TankSection"]],0.5]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "Atlas_OPF_W_F", _arr,
	gosa_date_default, [160,999],
	[]
] call gosa_fnc_map_groups_add;

/*
//-- Atlas_OPF_V_wdl_F, Viper (лес)
#define __cfg configFile >> "CfgGroups" >> "East" >> "Atlas_OPF_V_wdl_F"
_arr = [
	//- Motorized_MTP, Мотопехота
	// Atlas_O_V_MotInf_ReconViperTeam, Моторизованная разведгруппа Viper
	[[[__cfg >> "Motorized_MTP" >> "Atlas_O_V_MotInf_ReconViperTeam"]],0],
	// Atlas_O_V_MotInf_AssaultViperTeam, Моторизованный штурмовой отряд Viper
	[[[__cfg >> "Motorized_MTP" >> "Atlas_O_V_MotInf_AssaultViperTeam"]],0],
	//- SpecOps, Спецподразделения
	// Atlas_O_V_ViperTeam, Отряд Viper
	[[[__cfg >> "SpecOps" >> "Atlas_O_V_ViperTeam"]],0],
	// Atlas_O_V_ViperPatrol, Viper Patrol
	[[[__cfg >> "SpecOps" >> "Atlas_O_V_ViperPatrol"]],0],
	// Atlas_O_V_ViperSentry, Viper Sentry
	[[[__cfg >> "SpecOps" >> "Atlas_O_V_ViperSentry"]],0]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "Atlas_OPF_V_wdl_F", _arr,
	gosa_date_default, [275,999],
	[]
] call gosa_fnc_map_groups_add;
*/

// ls_zim35_o_zna_groups
#define __cfg configFile >> "CfgGroups" >> "East" >> "ls_zim35_o_zna_groups"
_arr = [
// Infantry Infantry
// ls_zim35_o_g_zna_riflesquad Rifle Squad
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_riflesquad"]],1],
// ls_zim35_o_g_zna_weapon_squad Weapon Squad
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_weapon_squad"]],0.5],
// ls_zim35_o_g_zna_aa_team AA Team
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_aa_team"]],0.2],
// ls_zim35_o_g_zna_at_team AT Team
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_at_team"]],0.4],
// ls_zim35_o_g_zna_support_team Support Team
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_support_team"]],0.05],
// ls_zim35_o_g_zna_sentry Sentry
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_sentry"]],0.05],
// ls_zim35_o_g_zna_fireteam Fire team
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_fireteam"]],0.3]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_zim35_o_zna_groups", _arr,
	gosa_date_default, [275,999],
	[]
] call gosa_fnc_map_groups_add;


//-- Atlas_BLU_A_F, ADF
#define __cfg configFile >> "CfgGroups" >> "West" >> "Atlas_BLU_A_F"
_arr = [
	//- SpecOps, Спецподразделения
	// Atlas_B_A_ReconTeam, Разведгруппа
	[[[__cfg >> "SpecOps" >> "Atlas_B_A_ReconTeam"]],0.5],
	// Atlas_B_A_ReconPatrol, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "Atlas_B_A_ReconPatrol"]],0.15],
	// Atlas_B_A_ReconSentry, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "Atlas_B_A_ReconSentry"]],0.01],
	//- Infantry, Пехота
	// Atlas_B_A_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "Atlas_B_A_InfSquad"]],1],
	// Atlas_B_A_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "Atlas_B_A_InfSquad_Weapons"]],0.5],
	// Atlas_B_A_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "Atlas_B_A_InfTeam"]],0.3],
	// Atlas_B_A_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "Atlas_B_A_InfTeam_AT"]],0.4],
	// Atlas_B_A_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "Atlas_B_A_InfTeam_AA"]],0.2],
	// Atlas_B_A_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "Atlas_B_A_InfSentry"]],0.01],
	//- Motorized, Мотопехота
	// Atlas_B_A_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "Atlas_B_A_MotInf_Team"]],1],
	// Atlas_B_A_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "Atlas_B_A_MotInf_AT"]],0.4],
	// Atlas_B_A_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "Atlas_B_A_MotInf_AA"]],0.2],
	//- Mechanized, Механизированая пехота
	// Atlas_B_A_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "Atlas_B_A_MechInfSquad"]],1],
	//- Armored, Бронетехника
	// Atlas_B_A_TankPlatoon, Танковый взвод
	[[[__cfg >> "Armored" >> "Atlas_B_A_TankPlatoon"]],0.5],
	// Atlas_B_A_TankSection, Танковое отделение
	[[[__cfg >> "Armored" >> "Atlas_B_A_TankSection"]],0.5]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "Atlas_BLU_A_F", _arr,
	gosa_date_default, [225,275-1],
	[]
] call gosa_fnc_map_groups_add;

//-- Atlas_BLU_A_ard_F, ADF (Arid)
#define __cfg configFile >> "CfgGroups" >> "West" >> "Atlas_BLU_A_ard_F"
_arr = [
	//- SpecOps, Спецподразделения
	// Atlas_B_A_ard_ReconTeam, Разведгруппа
	[[[__cfg >> "SpecOps" >> "Atlas_B_A_ard_ReconTeam"]],0.5],
	// Atlas_B_A_ard_ReconPatrol, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "Atlas_B_A_ard_ReconPatrol"]],0.15],
	// Atlas_B_A_ard_ReconSentry, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "Atlas_B_A_ard_ReconSentry"]],0.01],
	//- Infantry, Пехота
	// Atlas_B_A_ard_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "Atlas_B_A_ard_InfSquad"]],1],
	// Atlas_B_A_ard_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "Atlas_B_A_ard_InfSquad_Weapons"]],0.5],
	// Atlas_B_A_ard_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "Atlas_B_A_ard_InfTeam"]],0.3],
	// Atlas_B_A_ard_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "Atlas_B_A_ard_InfTeam_AT"]],0.4],
	// Atlas_B_A_ard_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "Atlas_B_A_ard_InfTeam_AA"]],0.2],
	// Atlas_B_A_ard_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "Atlas_B_A_ard_InfSentry"]],0.01],
	//- Motorized, Мотопехота
	// Atlas_B_A_ard_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "Atlas_B_A_ard_MotInf_Team"]],1],
	// Atlas_B_A_ard_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "Atlas_B_A_ard_MotInf_AT"]],0.4],
	// Atlas_B_A_ard_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "Atlas_B_A_ard_MotInf_AA"]],0.2],
	//- Mechanized, Механизированая пехота
	// Atlas_B_A_ard_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "Atlas_B_A_ard_MechInfSquad"]],1],
	//- Armored, Бронетехника
	// Atlas_B_A_ard_TankPlatoon, Танковый взвод
	[[[__cfg >> "Armored" >> "Atlas_B_A_ard_TankPlatoon"]],0.5],
	// Atlas_B_A_ard_TankSection, Танковое отделение
	[[[__cfg >> "Armored" >> "Atlas_B_A_ard_TankSection"]],0.5]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "Atlas_BLU_A_F", _arr,
	gosa_date_default, [275,999],
	[]
] call gosa_fnc_map_groups_add;

//-- Atlas_BLU_A_trp_F, ADF (Pacific)
#define __cfg configFile >> "CfgGroups" >> "West" >> "Atlas_BLU_A_trp_F"
_arr = [
	//- SpecOps, Спецподразделения
	// Atlas_B_A_trp_ReconTeam, Разведгруппа
	[[[__cfg >> "SpecOps" >> "Atlas_B_A_trp_ReconTeam"]],0.5],
	// Atlas_B_A_trp_ReconPatrol, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "Atlas_B_A_trp_ReconPatrol"]],0.15],
	// Atlas_B_A_trp_ReconSentry, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "Atlas_B_A_trp_ReconSentry"]],0.01],
	//- Infantry, Пехота
	// Atlas_B_A_trp_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "Atlas_B_A_trp_InfSquad"]],1],
	// Atlas_B_A_trp_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "Atlas_B_A_trp_InfSquad_Weapons"]],0.5],
	// Atlas_B_A_trp_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "Atlas_B_A_trp_InfTeam"]],0.3],
	// Atlas_B_A_trp_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "Atlas_B_A_trp_InfTeam_AT"]],0.4],
	// Atlas_B_A_trp_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "Atlas_B_A_trp_InfTeam_AA"]],0.2],
	// Atlas_B_A_trp_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "Atlas_B_A_trp_InfSentry"]],0.01],
	//- Motorized, Мотопехота
	// Atlas_B_A_trp_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "Atlas_B_A_trp_MotInf_Team"]],1],
	// Atlas_B_A_trp_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "Atlas_B_A_trp_MotInf_AT"]],0.4],
	// Atlas_B_A_trp_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "Atlas_B_A_trp_MotInf_AA"]],0.2],
	//- Mechanized, Механизированая пехота
	// Atlas_B_A_trp_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "Atlas_B_A_trp_MechInfSquad"]],1],
	//- Armored, Бронетехника
	// Atlas_B_A_trp_TankPlatoon, Танковый взвод
	[[[__cfg >> "Armored" >> "Atlas_B_A_trp_TankPlatoon"]],0.5],
	// Atlas_B_A_trp_TankSection, Танковое отделение
	[[[__cfg >> "Armored" >> "Atlas_B_A_trp_TankSection"]],0.5]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "Atlas_BLU_A_F", _arr,
	gosa_date_default, [160,225-1],
	[]
] call gosa_fnc_map_groups_add;

//-- Atlas_BLU_G_F, Бундесвер
#define __cfg configFile >> "CfgGroups" >> "West" >> "Atlas_BLU_G_F"
_arr = [
	//- SpecOps, Спецподразделения
	// B_G_ReconTeam, Разведгруппа
	[[[__cfg >> "SpecOps" >> "B_G_ReconTeam"]],0.5],
	// B_G_ReconPatrol, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "B_G_ReconPatrol"]],0.13],
	// B_G_ReconSentry, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "B_G_ReconSentry"]],0.01],
	//- Infantry, Пехота
	// B_G_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "B_G_InfSquad"]],1],
	// B_G_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "B_G_InfSquad_Weapons"]],0.5],
	// B_G_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "B_G_InfTeam"]],0.3],
	// B_G_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "B_G_InfTeam_AT"]],0.4],
	// B_G_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "B_G_InfTeam_AA"]],0.2],
	// B_G_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "B_G_InfSentry"]],0.01],
	//- Motorized, Мотопехота
	// B_G_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "B_G_MotInf_Team"]],1],
	// B_G_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "B_G_MotInf_AT"]],0.4],
	// B_G_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "B_G_MotInf_AA"]],0.2],
	//- Mechanized, Механизированая пехота
	// B_G_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "B_G_MechInfSquad"]],1],
	//- Armored, Бронетехника
	// B_G_TankPlatoon, Танковый взвод
	[[[__cfg >> "Armored" >> "B_G_TankPlatoon"]],0.5],
	// B_G_TankSection, Танковое отделение
	[[[__cfg >> "Armored" >> "B_G_TankSection"]],0.5],
	// B_G_LTankSection_Assault, Десантное отделение AWC
	[[[__cfg >> "Armored" >> "B_G_LTankSection_Assault"]],0.01],
	// B_G_LTankSection_Recon, Отделение разведки AWC
	[[[__cfg >> "Armored" >> "B_G_LTankSection_Recon"]],0.01],
	// B_G_LTankSection_AA, Отделение ПВО AWC
	[[[__cfg >> "Armored" >> "B_G_LTankSection_AA"]],0.01],
	// B_G_LTankSection_AT, Противотанковое отделение AWC
	[[[__cfg >> "Armored" >> "B_G_LTankSection_AT"]],0.01],
	// B_G_LTankPlatoon_combined, Взвод AWC (сводный)
	[[[__cfg >> "Armored" >> "B_G_LTankPlatoon_combined"]],0.01],
	// B_G_LTankPlatoon_AA, Взвод ПВО AWC
	[[[__cfg >> "Armored" >> "B_G_LTankPlatoon_AA"]],0.01]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "Atlas_BLU_G_F", _arr,
	gosa_date_default, [160,250-1],
	["CUP_B_GER","BWA3"]
] call gosa_fnc_map_groups_add;

//-- Atlas_BLU_G_ard_F, Бундесвер (засушливая местность)
#define __cfg configFile >> "CfgGroups" >> "West" >> "Atlas_BLU_G_ard_F"
_arr = [
	//- SpecOps, Спецподразделения
	// B_G_ard_ReconTeam, Разведгруппа
	[[[__cfg >> "SpecOps" >> "B_G_ard_ReconTeam"]],0.5],
	// B_G_ard_ReconPatrol, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "B_G_ard_ReconPatrol"]],0.15],
	// B_G_ard_ReconSentry, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "B_G_ard_ReconSentry"]],0.01],
	//- Infantry, Пехота
	// B_G_ard_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "B_G_ard_InfSquad"]],1],
	// B_G_ard_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "B_G_ard_InfSquad_Weapons"]],0.5],
	// B_G_ard_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "B_G_ard_InfTeam"]],0.3],
	// B_G_ard_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "B_G_ard_InfTeam_AT"]],0.4],
	// B_G_ard_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "B_G_ard_InfTeam_AA"]],0.2],
	// B_G_ard_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "B_G_ard_InfSentry"]],0.01],
	//- Motorized, Мотопехота
	// B_G_ard_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "B_G_ard_MotInf_Team"]],1],
	// B_G_ard_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "B_G_ard_MotInf_AT"]],0.4],
	// B_G_ard_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "B_G_ard_MotInf_AA"]],0.2],
	//- Mechanized, Механизированая пехота
	// B_G_ard_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "B_G_ard_MechInfSquad"]],1],
	//- Armored, Бронетехника
	// B_G_ard_TankPlatoon, Танковый взвод
	[[[__cfg >> "Armored" >> "B_G_ard_TankPlatoon"]],0.5],
	// B_G_ard_TankSection, Танковое отделение
	[[[__cfg >> "Armored" >> "B_G_ard_TankSection"]],0.5],
	// B_G_ard_LTankSection_Assault, Десантное отделение AWC
	[[[__cfg >> "Armored" >> "B_G_ard_LTankSection_Assault"]],0.01],
	// B_G_ard_LTankSection_Recon, Отделение разведки AWC
	[[[__cfg >> "Armored" >> "B_G_ard_LTankSection_Recon"]],0.01],
	// B_G_ard_LTankSection_AA, Отделение ПВО AWC
	[[[__cfg >> "Armored" >> "B_G_ard_LTankSection_AA"]],0.01],
	// B_G_LTankSection_AT, Противотанковое отделение AWC
	[[[__cfg >> "Armored" >> "B_G_LTankSection_AT"]],0.01],
	// B_G_ard_LTankPlatoon_combined, Взвод AWC (сводный)
	[[[__cfg >> "Armored" >> "B_G_ard_LTankPlatoon_combined"]],0.01],
	// B_G_ard_LTankPlatoon_AA, Взвод ПВО AWC
	[[[__cfg >> "Armored" >> "B_G_ard_LTankPlatoon_AA"]],0.01]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "Atlas_BLU_G_F", _arr,
	gosa_date_default, [250,999],
	["CUP_B_GER","BWA3"]
] call gosa_fnc_map_groups_add;
