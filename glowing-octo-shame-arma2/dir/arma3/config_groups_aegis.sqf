// TODO: Нужно объединить OPF_CD_F с OPF_F.
//-- OPF_CD_F, Китай (Desert)
#define __cfg configFile >> "CfgGroups" >> "East" >> "OPF_CD_F"
_arr = [
//- Infantry, Пехота
// O_CD_InfSquad, Стрелковое отделение
[[[__cfg >> "Infantry" >> "O_CD_InfSquad"]],1],
// O_CD_InfSquad_Weapons, Отделение тяж. оружия
[[[__cfg >> "Infantry" >> "O_CD_InfSquad_Weapons"]],0.5],
// O_CD_InfTeam, Огневая группа
[[[__cfg >> "Infantry" >> "O_CD_InfTeam"]],0.3],
// O_CD_InfTeam_AT, Противотанковая группа
[[[__cfg >> "Infantry" >> "O_CD_InfTeam_AT"]],0.4],
// O_CD_InfTeam_AA, Группа ПВО
[[[__cfg >> "Infantry" >> "O_CD_InfTeam_AA"]],0.2],
// O_CD_InfSentry, Охрана
[[[__cfg >> "Infantry" >> "O_CD_InfSentry"]],0.05],
//- SpecOps, Спецподразделения
// O_CD_reconTeam, Разведгруппа
[[[__cfg >> "SpecOps" >> "O_CD_reconTeam"]],0.2],
// O_CD_reconSentry, Разведывательный дозор
[[[__cfg >> "SpecOps" >> "O_CD_reconSentry"]],0.01],
// O_CD_reconPatrol, Разведывательный патруль
[[[__cfg >> "SpecOps" >> "O_CD_reconPatrol"]],0.1]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "OPF_CD_F", _arr,
	gosa_date_default, [275,999],
	["OPF_F","OPF_T_F"]
] call gosa_fnc_map_groups_add;

//-- OPF_Raven_F, Ворон
#define __cfg configFile >> "CfgGroups" >> "East" >> "OPF_Raven_F"
_arr = [
//- Motorized_MTP, Мотопехота
// O_Raven_MotInf_Team, Моторизованная группа
[[[__cfg >> "Motorized_MTP" >> "O_Raven_MotInf_Team"]],1],
// O_Raven_MotInf_Reinforcements, Моторизованные подкрепления
[[[__cfg >> "Motorized_MTP" >> "O_Raven_MotInf_Reinforcements"]],0.1],
//- Mechanized, Механизированая пехота
// O_Raven_MechInfSquad, Механизированное стрелковое отделение
[[[__cfg >> "Mechanized" >> "O_Raven_MechInfSquad"]],0.3],
//- Infantry, Пехота
// O_Raven_InfSquad, Стрелковое отделение
[[[__cfg >> "Infantry" >> "O_Raven_InfSquad"]],1],
// O_Raven_InfTeam, Огневая группа
[[[__cfg >> "Infantry" >> "O_Raven_InfTeam"]],0.7],
// O_Raven_InfSentry, Охрана
[[[__cfg >> "Infantry" >> "O_Raven_InfSentry"]],0.02]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "OPF_Raven_F", _arr,
	gosa_date_default, [160,249],
	["IND_Raven_F"]
] call gosa_fnc_map_groups_add;


//-- BLU_A_tna_F, BAF (Тихий океан)
#define __cfg configFile >> "CfgGroups" >> "West" >> "BLU_A_tna_F"
_arr = [
	//- Infantry, Пехота
	// B_A_InfSquad_T, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "B_A_InfSquad_T"]],1],
	// B_A_InfSquad_Weapons_T, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "B_A_InfSquad_Weapons_T"]],0.5],
	// B_A_InfTeam_T, Огневая группа
	[[[__cfg >> "Infantry" >> "B_A_InfTeam_T"]],0.3],
	// B_A_InfTeam_AT_T, Противотанковая группа
	[[[__cfg >> "Infantry" >> "B_A_InfTeam_AT_T"]],0.4],
	// B_A_InfTeam_AA_T, Группа ПВО
	[[[__cfg >> "Infantry" >> "B_A_InfTeam_AA_T"]],0.2],
	// B_A_InfSentry_T, Охрана
	[[[__cfg >> "Infantry" >> "B_A_InfSentry_T"]],0.01],
	//- SpecOps, Спецподразделения
	// B_A_ReconTeam_T, Разведгруппа
	[[[__cfg >> "SpecOps" >> "B_A_ReconTeam_T"]],0.5],
	// B_A_ReconPatrol_T, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "B_A_ReconPatrol_T"]],0.15],
	// B_A_ReconSentry_T, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "B_A_ReconSentry_T"]],0.01],
	// B_A_DiverTeam_T, Группа аквалангистов
	[[[__cfg >> "SpecOps" >> "B_A_DiverTeam_T"]],0.01],
	//- Support, Пехота поддержки
	// B_A_Support_CLS_T, Группа поддержки (санитар)
	[[[__cfg >> "Support" >> "B_A_Support_CLS_T"]],0.01],
	// B_A_Support_EOD_T, Группа поддержки (сапер)
	[[[__cfg >> "Support" >> "B_A_Support_EOD_T"]],0.01],
	// B_A_Support_ENG_T, Группа поддержки (инженер)
	[[[__cfg >> "Support" >> "B_A_Support_ENG_T"]],0.01],
	// B_A_Recon_EOD_T, Группа поддержки разведки (EOD)
	[[[__cfg >> "Support" >> "B_A_Recon_EOD_T"]],0.01],
	// B_A_Support_MG_T, Расчет крупнокалиберного пулемета
	[[[__cfg >> "Support" >> "B_A_Support_MG_T"]],0.01],
	// B_A_Support_GMG_T, Расчет автоматического гранатомета
	[[[__cfg >> "Support" >> "B_A_Support_GMG_T"]],0.01],
	// B_A_Support_Mort_T, Минометный расчет
	[[[__cfg >> "Support" >> "B_A_Support_Mort_T"]],0.01],
	// B_A_Support_Mort_tna_RF, Расчет легкого миномета
	[[[__cfg >> "Support" >> "B_A_Support_Mort_tna_RF"]],0.01],
	//- Motorized, Мотопехота
	// B_A_MotInf_Team_T, Моторизованная группа
	[[[__cfg >> "Motorized" >> "B_A_MotInf_Team_T"]],1],
	// B_A_MotInf_AT_T, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "B_A_MotInf_AT_T"]],0.4],
	// B_A_MotInf_AA_T, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "B_A_MotInf_AA_T"]],0.2],
	// B_A_MotInf_MGTeam_T, Моторизованный расчет крупнокалиберного пулемета
	[[[__cfg >> "Motorized" >> "B_A_MotInf_MGTeam_T"]],0.01],
	// B_A_MotInf_GMGTeam_T, Моторизованный расчет автоматического гранатомета
	[[[__cfg >> "Motorized" >> "B_A_MotInf_GMGTeam_T"]],0.01],
	// B_A_MotInf_MortTeam_T, Моторизованный минометный расчет
	[[[__cfg >> "Motorized" >> "B_A_MotInf_MortTeam_T"]],0.01],
	// B_A_MotInf_Reinforcements_T, Моторизованные подкрепления
	[[[__cfg >> "Motorized" >> "B_A_MotInf_Reinforcements_T"]],0.3],
	//- Mechanized, Механизированая пехота
	// B_A_MechInfSquad_T, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "B_A_MechInfSquad_T"]],1],
	// B_A_MechInf_AT_T, Механизированное противотанковое отделение
	[[[__cfg >> "Mechanized" >> "B_A_MechInf_AT_T"]],0.4],
	// B_A_MechInf_AA_T, Механизированное отделение ПВО
	[[[__cfg >> "Mechanized" >> "B_A_MechInf_AA_T"]],0.2],
	// B_A_MechInf_Support_T, Механизированное отделение поддержки
	[[[__cfg >> "Mechanized" >> "B_A_MechInf_Support_T"]],0.01]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "BLU_A_F", _arr,
	gosa_date_default, [225,249],
	[]
] call gosa_fnc_map_groups_add;

//-- BLU_A_wdl_F, BAF (лесной)
#define __cfg configFile >> "CfgGroups" >> "West" >> "BLU_A_wdl_F"
_arr = [
	//- Infantry, Пехота
	// B_A_InfSquad_W, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "B_A_InfSquad_W"]],1],
	// B_A_InfSquad_Weapons_W, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "B_A_InfSquad_Weapons_W"]],0.5],
	// B_A_InfTeam_W, Огневая группа
	[[[__cfg >> "Infantry" >> "B_A_InfTeam_W"]],0.3],
	// B_A_InfTeam_AT_W, Противотанковая группа
	[[[__cfg >> "Infantry" >> "B_A_InfTeam_AT_W"]],0.4],
	// B_A_InfTeam_AA_W, Группа ПВО
	[[[__cfg >> "Infantry" >> "B_A_InfTeam_AA_W"]],0.2],
	// B_A_InfSentry_W, Охрана
	[[[__cfg >> "Infantry" >> "B_A_InfSentry_W"]],0.01],
	//- SpecOps, Спецподразделения
	// B_A_ReconTeam_W, Разведгруппа
	[[[__cfg >> "SpecOps" >> "B_A_ReconTeam_W"]],0.5],
	// B_A_ReconPatrol_W, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "B_A_ReconPatrol_W"]],0.15],
	// B_A_ReconSentry_W, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "B_A_ReconSentry_W"]],0.01],
	//- Support, Пехота поддержки
	// B_A_Support_CLS_W, Группа поддержки (санитар)
	[[[__cfg >> "Support" >> "B_A_Support_CLS_W"]],0.01],
	// B_A_Support_EOD_W, Группа поддержки (сапер)
	[[[__cfg >> "Support" >> "B_A_Support_EOD_W"]],0.01],
	// B_A_Support_ENG_W, Группа поддержки (инженер)
	[[[__cfg >> "Support" >> "B_A_Support_ENG_W"]],0.01],
	// B_A_Recon_EOD_W, Группа поддержки разведки (EOD)
	[[[__cfg >> "Support" >> "B_A_Recon_EOD_W"]],0.01],
	// B_A_Support_MG_W, Расчет крупнокалиберного пулемета
	[[[__cfg >> "Support" >> "B_A_Support_MG_W"]],0.01],
	// B_A_Support_GMG_W, Расчет автоматического гранатомета
	[[[__cfg >> "Support" >> "B_A_Support_GMG_W"]],0.01],
	// B_A_Support_Mort_W, Минометный расчет
	[[[__cfg >> "Support" >> "B_A_Support_Mort_W"]],0.01],
	// B_A_Support_Mort_wdl_RF, Расчет легкого миномета
	[[[__cfg >> "Support" >> "B_A_Support_Mort_wdl_RF"]],0.01],
	//- Motorized, Мотопехота
	// B_A_MotInf_Team_W, Моторизованная группа
	[[[__cfg >> "Motorized" >> "B_A_MotInf_Team_W"]],1],
	// B_A_MotInf_AT_W, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "B_A_MotInf_AT_W"]],0.4],
	// B_A_MotInf_AA_W, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "B_A_MotInf_AA_W"]],0.2],
	// B_A_MotInf_MGTeam_W, Моторизованный расчет крупнокалиберного пулемета
	[[[__cfg >> "Motorized" >> "B_A_MotInf_MGTeam_W"]],0.01],
	// B_A_MotInf_GMGTeam_W, Моторизованный расчет автоматического гранатомета
	[[[__cfg >> "Motorized" >> "B_A_MotInf_GMGTeam_W"]],0.01],
	// B_A_MotInf_MortTeam_W, Моторизованный минометный расчет
	[[[__cfg >> "Motorized" >> "B_A_MotInf_MortTeam_W"]],0.01],
	// B_A_MotInf_Reinforcements_W, Моторизованные подкрепления
	[[[__cfg >> "Motorized" >> "B_A_MotInf_Reinforcements_W"]],0.3],
	//- Mechanized, Механизированая пехота
	// B_A_MechInfSquad_W, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "B_A_MechInfSquad_W"]],1],
	// B_A_MechInf_AT_W, Механизированное противотанковое отделение
	[[[__cfg >> "Mechanized" >> "B_A_MechInf_AT_W"]],0.4],
	// B_A_MechInf_AA_W, Механизированное отделение ПВО
	[[[__cfg >> "Mechanized" >> "B_A_MechInf_AA_W"]],0.2],
	// B_A_MechInf_Support_W, Механизированное отделение поддержки
	[[[__cfg >> "Mechanized" >> "B_A_MechInf_Support_W"]],0.01]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "BLU_A_F", _arr,
	gosa_date_default, [160,224],
	[]
] call gosa_fnc_map_groups_add;

//-- BLU_A_F, BAF
#define __cfg configFile >> "CfgGroups" >> "West" >> "BLU_A_F"
_arr = [
	//- Infantry, Пехота
	// B_A_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "B_A_InfSquad"]],1],
	// B_A_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "B_A_InfSquad_Weapons"]],0.5],
	// B_A_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "B_A_InfTeam"]],0.3],
	// B_A_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "B_A_InfTeam_AT"]],0.4],
	// B_A_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "B_A_InfTeam_AA"]],0.2],
	// B_A_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "B_A_InfSentry"]],0.01],
	//- SpecOps, Спецподразделения
	// B_A_ReconTeam, Разведгруппа
	[[[__cfg >> "SpecOps" >> "B_A_ReconTeam"]],0.5],
	// B_A_ReconPatrol, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "B_A_ReconPatrol"]],0.15],
	// B_A_ReconSentry, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "B_A_ReconSentry"]],0.01],
	// B_A_DiverTeam, Группа аквалангистов
	[[[__cfg >> "SpecOps" >> "B_A_DiverTeam"]],0.01],
	//- Support, Пехота поддержки
	// B_A_Support_CLS, Группа поддержки (санитар)
	[[[__cfg >> "Support" >> "B_A_Support_CLS"]],0.01],
	// B_A_Support_EOD, Группа поддержки (сапер)
	[[[__cfg >> "Support" >> "B_A_Support_EOD"]],0.01],
	// B_A_Support_ENG, Группа поддержки (инженер)
	[[[__cfg >> "Support" >> "B_A_Support_ENG"]],0.01],
	// B_A_Recon_EOD, Группа поддержки разведки (EOD)
	[[[__cfg >> "Support" >> "B_A_Recon_EOD"]],0.01],
	// B_A_Support_MG, Расчет крупнокалиберного пулемета
	[[[__cfg >> "Support" >> "B_A_Support_MG"]],0.01],
	// B_A_Support_GMG, Расчет автоматического гранатомета
	[[[__cfg >> "Support" >> "B_A_Support_GMG"]],0.01],
	// B_A_Support_Mort, Минометный расчет
	[[[__cfg >> "Support" >> "B_A_Support_Mort"]],0.01],
	// B_A_Support_Mort_RF, Расчет легкого миномета
	[[[__cfg >> "Support" >> "B_A_Support_Mort_RF"]],0.01],
	//- Motorized, Мотопехота
	// B_A_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "B_A_MotInf_Team"]],1],
	// B_A_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "B_A_MotInf_AT"]],0.4],
	// B_A_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "B_A_MotInf_AA"]],0.2],
	// B_A_MotInf_MGTeam, Моторизованный расчет крупнокалиберного пулемета
	[[[__cfg >> "Motorized" >> "B_A_MotInf_MGTeam"]],0.01],
	// B_A_MotInf_GMGTeam, Моторизованный расчет автоматического гранатомета
	[[[__cfg >> "Motorized" >> "B_A_MotInf_GMGTeam"]],0.01],
	// B_A_MotInf_MortTeam, Моторизованный минометный расчет
	[[[__cfg >> "Motorized" >> "B_A_MotInf_MortTeam"]],0.01],
	// B_A_MotInf_Reinforcements, Моторизованные подкрепления
	[[[__cfg >> "Motorized" >> "B_A_MotInf_Reinforcements"]],0.3],
	//- Mechanized, Механизированая пехота
	// B_A_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "B_A_MechInfSquad"]],1],
	// B_A_MechInf_AT, Механизированное противотанковое отделение
	[[[__cfg >> "Mechanized" >> "B_A_MechInf_AT"]],0.4],
	// B_A_MechInf_AA, Механизированное отделение ПВО
	[[[__cfg >> "Mechanized" >> "B_A_MechInf_AA"]],0.2],
	// B_A_MechInf_Support, Механизированное отделение поддержки
	[[[__cfg >> "Mechanized" >> "B_A_MechInf_Support"]],0.01]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "BLU_A_F", _arr,
	gosa_date_default, [250,275-1],
	[]
] call gosa_fnc_map_groups_add;

//-- BLU_EAF_ard_F, LDF (засушливая местность)
#define __cfg configFile >> "CfgGroups" >> "West" >> "BLU_EAF_ard_F"
_arr = [
	//- Infantry, Пехота
	// Aegis_B_E_ard_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "Aegis_B_E_ard_InfSquad"]],1],
	// Aegis_B_E_ard_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "Aegis_B_E_ard_InfSquad_Weapons"]],0.5],
	// Aegis_B_E_ard_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "Aegis_B_E_ard_InfTeam"]],0.3],
	// Aegis_B_E_ard_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "Aegis_B_E_ard_InfTeam_AT"]],0.4],
	// Aegis_B_E_ard_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "Aegis_B_E_ard_InfTeam_AA"]],0.2],
	// Aegis_B_E_ard_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "Aegis_B_E_ard_InfSentry"]],0.01],
	// Aegis_B_E_ard_InfTeam_Light, Стрелки (легкие)
	[[[__cfg >> "Infantry" >> "Aegis_B_E_ard_InfTeam_Light"]],0.3],
	//- SpecOps, Спецподразделения
	// Aegis_B_E_ard_ReconTeam, Разведгруппа
	[[[__cfg >> "SpecOps" >> "Aegis_B_E_ard_ReconTeam"]],0.5],
	// Aegis_B_E_ard_ReconPatrol, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "Aegis_B_E_ard_ReconPatrol"]],0.15],
	// Aegis_B_E_ard_ReconSentry, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "Aegis_B_E_ard_ReconSentry"]],0.01],
	//- Support, Пехота поддержки
	// Aegis_B_E_ard_Support_CLS, Группа поддержки (санитар)
	[[[__cfg >> "Support" >> "Aegis_B_E_ard_Support_CLS"]],0.01],
	// Aegis_B_E_ard_Support_EOD, Группа поддержки (сапер)
	[[[__cfg >> "Support" >> "Aegis_B_E_ard_Support_EOD"]],0.01],
	// Aegis_B_E_ard_Support_ENG, Группа поддержки (инженер)
	[[[__cfg >> "Support" >> "Aegis_B_E_ard_Support_ENG"]],0.01],
	// Aegis_B_E_ard_Support_MG, Расчет крупнокалиберного пулемета
	[[[__cfg >> "Support" >> "Aegis_B_E_ard_Support_MG"]],0.01],
	// Aegis_B_E_ard_Support_GMG, Расчет автоматического гранатомета
	[[[__cfg >> "Support" >> "Aegis_B_E_ard_Support_GMG"]],0.01],
	// Aegis_B_E_ard_Support_Mort, Минометный расчет
	[[[__cfg >> "Support" >> "Aegis_B_E_ard_Support_Mort"]],0.01],
	// Aegis_B_E_Support_Mort_ard_RF, Расчет легкого миномета
	[[[__cfg >> "Support" >> "Aegis_B_E_Support_Mort_ard_RF"]],0.01],
	//- Motorized, Мотопехота
	// Aegis_B_E_ard_MotInf_Squad, Механизированное стрелковое отделение
	[[[__cfg >> "Motorized" >> "Aegis_B_E_ard_MotInf_Squad"]],0.5],
	// Aegis_B_E_ard_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "Aegis_B_E_ard_MotInf_Team"]],0.25],
	// Aegis_B_E_ard_MotInf_Reinforcements, Моторизованные подкрепления
	[[[__cfg >> "Motorized" >> "Aegis_B_E_ard_MotInf_Reinforcements"]],0.15],
	// Aegis_B_E_ard_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "Aegis_B_E_ard_MotInf_AT"]],0.15],
	// Aegis_B_E_ard_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "Aegis_B_E_ard_MotInf_AA"]],0.1],
	// Aegis_B_E_ard_MotInf_MGTeam, Моторизованный расчет крупнокалиберного пулемета
	[[[__cfg >> "Motorized" >> "Aegis_B_E_ard_MotInf_MGTeam"]],0.01],
	// Aegis_B_E_ard_MotInf_GMGTeam, Моторизованный расчет автоматического гранатомета
	[[[__cfg >> "Motorized" >> "Aegis_B_E_ard_MotInf_GMGTeam"]],0.01],
	// Aegis_B_E_ard_MotInf_MortTeam, Моторизованный минометный расчет
	[[[__cfg >> "Motorized" >> "Aegis_B_E_ard_MotInf_MortTeam"]],0.01],
	//- Mechanized, Механизированая пехота
	// Aegis_B_E_ard_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "Aegis_B_E_ard_MechInfSquad"]],1],
	// Aegis_B_E_ard_MechInf_AT, Механизированное противотанковое отделение
	[[[__cfg >> "Mechanized" >> "Aegis_B_E_ard_MechInf_AT"]],0.4],
	// Aegis_B_E_ard_MechInf_AA, Механизированное отделение ПВО
	[[[__cfg >> "Mechanized" >> "Aegis_B_E_ard_MechInf_AA"]],0.2],
	// Aegis_B_E_ard_MechInf_Support, Механизированное отделение поддержки
	[[[__cfg >> "Mechanized" >> "Aegis_B_E_ard_MechInf_Support"]],0.01],
	//- Armored, Бронетехника
	// Aegis_B_E_ard_TankPlatoon, Танковый взвод
	[[[__cfg >> "Armored" >> "Aegis_B_E_ard_TankPlatoon"]],0.3],
	// Aegis_B_E_ard_TankSection, Танковое отделение
	[[[__cfg >> "Armored" >> "Aegis_B_E_ard_TankSection"]],0.3],
	// Aegis_B_E_ard_TankPlatoon_AA, Танковый взвод (сводный)
	[[[__cfg >> "Armored" >> "Aegis_B_E_ard_TankPlatoon_AA"]],0.3]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "BLU_EAF_F", _arr,
	gosa_date_default, [250,999],
	["IND_E_F"]
] call gosa_fnc_map_groups_add;

//-- BLU_EAF_F, ВСЛ
#define __cfg configFile >> "CfgGroups" >> "West" >> "BLU_EAF_F"
_arr = [
	//- Infantry, Пехота
	// Aegis_B_E_InfSquad, Стрелковое отделение
	[[[__cfg >> "Infantry" >> "Aegis_B_E_InfSquad"]],1],
	// Aegis_B_E_InfSquad_Weapons, Отделение тяж. оружия
	[[[__cfg >> "Infantry" >> "Aegis_B_E_InfSquad_Weapons"]],0.5],
	// Aegis_B_E_InfTeam, Огневая группа
	[[[__cfg >> "Infantry" >> "Aegis_B_E_InfTeam"]],0.3],
	// Aegis_B_E_InfTeam_AT, Противотанковая группа
	[[[__cfg >> "Infantry" >> "Aegis_B_E_InfTeam_AT"]],0.4],
	// Aegis_B_E_InfTeam_AA, Группа ПВО
	[[[__cfg >> "Infantry" >> "Aegis_B_E_InfTeam_AA"]],0.2],
	// Aegis_B_E_InfSentry, Охрана
	[[[__cfg >> "Infantry" >> "Aegis_B_E_InfSentry"]],0.01],
	// Aegis_B_E_InfTeam_Light, Стрелки (легкие)
	[[[__cfg >> "Infantry" >> "Aegis_B_E_InfTeam_Light"]],0.3],
	//- SpecOps, Спецподразделения
	// Aegis_B_E_ReconTeam, Разведгруппа
	[[[__cfg >> "SpecOps" >> "Aegis_B_E_ReconTeam"]],0.5],
	// Aegis_B_E_ReconPatrol, Разведывательный патруль
	[[[__cfg >> "SpecOps" >> "Aegis_B_E_ReconPatrol"]],0.15],
	// Aegis_B_E_ReconSentry, Разведывательный дозор
	[[[__cfg >> "SpecOps" >> "Aegis_B_E_ReconSentry"]],0.01],
	//- Support, Пехота поддержки
	// Aegis_B_E_Support_CLS, Группа поддержки (санитар)
	[[[__cfg >> "Support" >> "Aegis_B_E_Support_CLS"]],0.01],
	// Aegis_B_E_Support_EOD, Группа поддержки (сапер)
	[[[__cfg >> "Support" >> "Aegis_B_E_Support_EOD"]],0.01],
	// Aegis_B_E_Support_ENG, Группа поддержки (инженер)
	[[[__cfg >> "Support" >> "Aegis_B_E_Support_ENG"]],0.01],
	// Aegis_B_E_Support_MG, Расчет крупнокалиберного пулемета
	[[[__cfg >> "Support" >> "Aegis_B_E_Support_MG"]],0.01],
	// Aegis_B_E_Support_GMG, Расчет автоматического гранатомета
	[[[__cfg >> "Support" >> "Aegis_B_E_Support_GMG"]],0.01],
	// Aegis_B_E_Support_Mort, Минометный расчет
	[[[__cfg >> "Support" >> "Aegis_B_E_Support_Mort"]],0.01],
	// Aegis_B_E_Support_Mort_RF, Расчет легкого миномета
	[[[__cfg >> "Support" >> "Aegis_B_E_Support_Mort_RF"]],0.01],
	//- Motorized, Мотопехота
	// Aegis_B_E_MotInf_Squad, Механизированное стрелковое отделение
	[[[__cfg >> "Motorized" >> "Aegis_B_E_MotInf_Squad"]],0.5],
	// Aegis_B_E_MotInf_Team, Моторизованная группа
	[[[__cfg >> "Motorized" >> "Aegis_B_E_MotInf_Team"]],0.25],
	// Aegis_B_E_MotInf_Reinforcements, Моторизованные подкрепления
	[[[__cfg >> "Motorized" >> "Aegis_B_E_MotInf_Reinforcements"]],0.15],
	// Aegis_B_E_MotInf_AT, Моторизованная противотанковая группа
	[[[__cfg >> "Motorized" >> "Aegis_B_E_MotInf_AT"]],0.2],
	// Aegis_B_E_MotInf_AA, Моторизованная группа ПВО
	[[[__cfg >> "Motorized" >> "Aegis_B_E_MotInf_AA"]],0.1],
	// Aegis_B_E_MotInf_MGTeam, Моторизованный расчет крупнокалиберного пулемета
	[[[__cfg >> "Motorized" >> "Aegis_B_E_MotInf_MGTeam"]],0.01],
	// Aegis_B_E_MotInf_GMGTeam, Моторизованный расчет автоматического гранатомета
	[[[__cfg >> "Motorized" >> "Aegis_B_E_MotInf_GMGTeam"]],0.01],
	// Aegis_B_E_MotInf_MortTeam, Моторизованный минометный расчет
	[[[__cfg >> "Motorized" >> "Aegis_B_E_MotInf_MortTeam"]],0.01],
	//- Mechanized, Механизированая пехота
	// Aegis_B_E_MechInfSquad, Механизированное стрелковое отделение
	[[[__cfg >> "Mechanized" >> "Aegis_B_E_MechInfSquad"]],1],
	// Aegis_B_E_MechInf_AT, Механизированное противотанковое отделение
	[[[__cfg >> "Mechanized" >> "Aegis_B_E_MechInf_AT"]],0.4],
	// Aegis_B_E_MechInf_AA, Механизированное отделение ПВО
	[[[__cfg >> "Mechanized" >> "Aegis_B_E_MechInf_AA"]],0.2],
	// Aegis_B_E_MechInf_Support, Механизированное отделение поддержки
	[[[__cfg >> "Mechanized" >> "Aegis_B_E_MechInf_Support"]],0.01],
	//- Armored, Бронетехника
	// Aegis_B_E_TankPlatoon, Танковый взвод
	[[[__cfg >> "Armored" >> "Aegis_B_E_TankPlatoon"]],0.3],
	// Aegis_B_E_TankSection, Танковое отделение
	[[[__cfg >> "Armored" >> "Aegis_B_E_TankSection"]],0.3],
	// Aegis_B_E_TankPlatoon_AA, Танковый взвод (сводный)
	[[[__cfg >> "Armored" >> "Aegis_B_E_TankPlatoon_AA"]],0.3]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "BLU_EAF_F", _arr,
	gosa_date_default, [160,249],
	["IND_E_F"]
] call gosa_fnc_map_groups_add;


//-- IND_Raven_F, Ворон
_arr = [
	//- Infantry, Пехота
	// I_Raven_InfSquad, Стрелковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "IND_Raven_F" >> "Infantry" >> "I_Raven_InfSquad"]],1],
	// I_Raven_InfTeam, Огневая группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "IND_Raven_F" >> "Infantry" >> "I_Raven_InfTeam"]],0.5],
	// I_Raven_InfSentry, Охрана
	[[[configFile >> "CfgGroups" >> "Indep" >> "IND_Raven_F" >> "Infantry" >> "I_Raven_InfSentry"]],0.01],
	//- Motorized_MTP, Мотопехота
	// I_Raven_MotInf_Team, Моторизованная группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "IND_Raven_F" >> "Motorized_MTP" >> "I_Raven_MotInf_Team"]],0.5],
	// I_Raven_MotInf_Reinforcements, Моторизованные подкрепления
	[[[configFile >> "CfgGroups" >> "Indep" >> "IND_Raven_F" >> "Motorized_MTP" >> "I_Raven_MotInf_Reinforcements"]],0.15],
	//- Mechanized, Механизированая пехота
	// I_Raven_MechInfSquad, Механизированное стрелковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "IND_Raven_F" >> "Mechanized" >> "I_Raven_MechInfSquad"]],1]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, resistance, "IND_Raven_F", _arr,
	gosa_date_default, [160,249],
	["OPF_Raven_F"]
] call gosa_fnc_map_groups_add;
