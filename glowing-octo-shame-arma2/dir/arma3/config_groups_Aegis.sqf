//-- OPF_A_F, Argana
#define __cfg configFile >> "CfgGroups" >> "East" >> "OPF_A_F"
_arr = [
//- Motorized, Мотопехота
// O_A_MotInf_Team, Моторизованная группа
[[[__cfg >> "Motorized" >> "O_A_MotInf_Team"]],0.1],
// O_A_MotInf_AT, Моторизованная противотанковая группа
[[[__cfg >> "Motorized" >> "O_A_MotInf_AT"]],0.1],
// O_A_MotInf_AA, Моторизованная группа ПВО
[[[__cfg >> "Motorized" >> "O_A_MotInf_AA"]],0.1],
// O_A_MotInf_Reinforcements, Моторизованные подкрепления
[[[__cfg >> "Motorized" >> "O_A_MotInf_Reinforcements"]],0.1],
//- Armored, Бронетехника
// O_A_TankPlatoon, Танковый взвод
[[[__cfg >> "Armored" >> "O_A_TankPlatoon"]],0.1],
// O_A_TankSection, Танковое отделение
[[[__cfg >> "Armored" >> "O_A_TankSection"]],0.1],
//- Mechanized, Механизированая пехота
// O_A_MechInfSquad, Механизированное стрелковое отделение
[[[__cfg >> "Mechanized" >> "O_A_MechInfSquad"]],0.3],
// O_A_MechInf_AT, Механизированное противотанковое отделение
[[[__cfg >> "Mechanized" >> "O_A_MechInf_AT"]],0.4],
// O_A_MechInf_AA, Механизированное отделение ПВО
[[[__cfg >> "Mechanized" >> "O_A_MechInf_AA"]],0.2],
// O_A_MechConSquad_A, Mechanized Conscript Squad (Marid)
[[[__cfg >> "Mechanized" >> "O_A_MechConSquad_A"]],0.6],
// O_A_MechConSquad_B, Mechanized Conscript Squad (BTR-100A)
[[[__cfg >> "Mechanized" >> "O_A_MechConSquad_B"]],0.6],
//- Infantry, Пехота
// O_A_InfSquad, Стрелковое отделение
[[[__cfg >> "Infantry" >> "O_A_InfSquad"]],1],
// O_A_InfSquad_Weapons, Отделение тяж. оружия
[[[__cfg >> "Infantry" >> "O_A_InfSquad_Weapons"]],0.5],
// O_A_InfTeam, Огневая группа
[[[__cfg >> "Infantry" >> "O_A_InfTeam"]],0.3],
// O_A_InfTeam_AT, Противотанковая группа
[[[__cfg >> "Infantry" >> "O_A_InfTeam_AT"]],0.4],
// O_A_InfTeam_AA, Группа ПВО
[[[__cfg >> "Infantry" >> "O_A_InfTeam_AA"]],0.2],
// O_A_InfSentry, Охрана
[[[__cfg >> "Infantry" >> "O_A_InfSentry"]],0.05],
// O_A_ConscriptSquad, Conscript Squad
[[[__cfg >> "Infantry" >> "O_A_ConscriptSquad"]],0.5],
// O_A_ConscriptTeam, Conscript Team
[[[__cfg >> "Infantry" >> "O_A_ConscriptTeam"]],0.1]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "OPF_A_F", _arr,
	gosa_date_default, [275,999],
	[]
] call gosa_fnc_map_groups_add;

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
	["OPF_F"]
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
	gosa_date_default, [250,999],
	[]
] call gosa_fnc_map_groups_add;
