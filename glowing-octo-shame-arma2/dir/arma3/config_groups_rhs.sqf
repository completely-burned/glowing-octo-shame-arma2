
#include "..\include\ranks.sqf"

//--- East
#define __exclude ["CUP_O_RU","OPF_SFIA_lxWS","OPF_TURA_lxWS","OPF_T_F","OPF_F","OPF_G_F","OPF_R_F"]
#define __cfg configFile >> "CfgGroups" >> "East" >> "rhs_faction_msv"
// Отряды бмп3*, бтр80* идут с камуфляжем ЕМР.
#define __date_emr 2009
//-- rhs_faction_msv, Россия (МСВ)
_arr = [
	// >1998
	//- rhs_group_rus_msv_infantry, Мотострелки (флора)
	// rhs_group_rus_msv_infantry_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_chq"]],_rarity_bad/2],
	// rhs_group_rus_msv_infantry_squad, Отряд
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_squad"]],_rarity_InfSquad],
	// rhs_group_rus_msv_infantry_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_squad_2mg"]],_rarity_InfSquad_Weapon/3],
	// rhs_group_rus_msv_infantry_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_squad_sniper"]],_rarity_InfSquad_Weapon/3],
	// rhs_group_rus_msv_infantry_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_squad_mg_sniper"]],_rarity_InfSquad_Weapon/3],
	// rhs_group_rus_msv_infantry_section_mg, Пулемётное отделение
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_section_mg"]],_rarity_InfTeam_MG],
	// rhs_group_rus_msv_infantry_section_marksman, Снайперская группа
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_section_marksman"]],_rarity_SniperTeam],
	// rhs_group_rus_msv_infantry_section_AT, Гранатомётное отделение
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_section_AT"]],_rarity_InfTeam_AT],
	// rhs_group_rus_msv_infantry_section_AA, Отделение ПВО
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_section_AA"]],_rarity_InfTeam_AA],
	// rhs_group_rus_msv_infantry_fireteam, Огневая группа
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_fireteam"]],_rarity_InfTeam],
	// rhs_group_rus_msv_infantry_MANEUVER, Маневренная группа
	[[[__cfg >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_MANEUVER"]],_rarity_InfSentry]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1964,__date_emr], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

_arr = [
	// >2009
	//- rhs_group_rus_msv_infantry_emr, Мотострелки (ЕМР)
	// rhs_group_rus_msv_infantry_emr_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_chq"]],_rarity_bad/2],
	// rhs_group_rus_msv_infantry_emr_squad, Отряд
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_squad"]],_rarity_InfSquad],
	// rhs_group_rus_msv_infantry_emr_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_squad_2mg"]],_rarity_InfSquad_Weapon/3],
	// rhs_group_rus_msv_infantry_emr_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_squad_sniper"]],_rarity_InfSquad_Weapon/3],
	// rhs_group_rus_msv_infantry_emr_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_squad_mg_sniper"]],_rarity_InfSquad_Weapon/3],
	// rhs_group_rus_msv_infantry_emr_section_mg, Пулемётное отделение
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_section_mg"]],_rarity_InfTeam_MG],
	// rhs_group_rus_msv_infantry_emr_section_marksman, Снайперская группа
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_section_marksman"]],_rarity_SniperTeam],
	// rhs_group_rus_msv_infantry_emr_section_AT, Гранатомётное отделение
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_section_AT"]],_rarity_InfTeam_AT],
	// rhs_group_rus_msv_infantry_emr_section_AA, Отделение ПВО
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_section_AA"]],_rarity_InfTeam_AA],
	// rhs_group_rus_msv_infantry_emr_fireteam, Огневая группа
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_fireteam"]],_rarity_InfTeam],
	// rhs_group_rus_msv_infantry_emr_MANEUVER, Маневренная группа
	[[[__cfg >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_MANEUVER"]],_rarity_InfSentry]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[__date_emr,2100], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

_arr = [
	// >1973
	//- rhs_group_rus_msv_Ural, Мотострелки (Урал-4320)
	// rhs_group_rus_msv_Ural_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_msv_Ural" >> "rhs_group_rus_msv_Ural_chq"]],_rarity_bad/2],
	// rhs_group_rus_msv_Ural_squad, Отряд
	[[[__cfg >> "rhs_group_rus_msv_Ural" >> "rhs_group_rus_msv_Ural_squad"]],_rarity_MotInf_Reinforce/5/2],
	// rhs_group_rus_msv_Ural_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_Ural" >> "rhs_group_rus_msv_Ural_squad_2mg"]],_rarity_MotInf_Reinforce/5/2],
	// rhs_group_rus_msv_Ural_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_msv_Ural" >> "rhs_group_rus_msv_Ural_squad_sniper"]],_rarity_MotInf_Reinforce/5/2],
	// rhs_group_rus_msv_Ural_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_Ural" >> "rhs_group_rus_msv_Ural_squad_mg_sniper"]],_rarity_MotInf_Reinforce/5/2],
	// rhs_group_rus_msv_Ural_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_rus_msv_Ural" >> "rhs_group_rus_msv_Ural_squad_aa"]],_rarity_MotInf_Reinforce/5/2]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1973,2100], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

_arr = [
	// >1964
	//- rhs_group_rus_msv_gaz66, Десантники (ГАЗ-66)
	// rhs_group_rus_msv_gaz66_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_msv_gaz66" >> "rhs_group_rus_msv_gaz66_chq"]],_rarity_bad/2],
	// rhs_group_rus_msv_gaz66_squad, Отряд
	[[[__cfg >> "rhs_group_rus_msv_gaz66" >> "rhs_group_rus_msv_gaz66_squad"]],_rarity_MotInf_Reinforce/5/2],
	// rhs_group_rus_msv_gaz66_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_gaz66" >> "rhs_group_rus_msv_gaz66_squad_2mg"]],_rarity_MotInf_Reinforce/5/2],
	// rhs_group_rus_msv_gaz66_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_msv_gaz66" >> "rhs_group_rus_msv_gaz66_squad_sniper"]],_rarity_MotInf_Reinforce/5/2],
	// rhs_group_rus_msv_gaz66_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_gaz66" >> "rhs_group_rus_msv_gaz66_squad_mg_sniper"]],_rarity_MotInf_Reinforce/5/2],
	// rhs_group_rus_msv_gaz66_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_rus_msv_gaz66" >> "rhs_group_rus_msv_gaz66_squad_aa"]],_rarity_MotInf_Reinforce/5/2]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1964,2000], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

_arr = [
	// >1972
	//- rhs_group_rus_msv_btr70, Мотострелки (БТР-70)
	// rhs_group_rus_msv_btr70_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_msv_btr70" >> "rhs_group_rus_msv_btr70_chq"]],_rarity_bad/3],
	// rhs_group_rus_msv_btr70_squad, Отряд
	[[[__cfg >> "rhs_group_rus_msv_btr70" >> "rhs_group_rus_msv_btr70_squad"]],_rarity_MotInf_Team/3],
	// rhs_group_rus_msv_btr70_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_btr70" >> "rhs_group_rus_msv_btr70_squad_2mg"]],_rarity_MotInf_MGTeam/3/3],
	// rhs_group_rus_msv_btr70_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_msv_btr70" >> "rhs_group_rus_msv_btr70_squad_sniper"]],_rarity_MotInf_MGTeam/3/3],
	// rhs_group_rus_msv_btr70_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_btr70" >> "rhs_group_rus_msv_btr70_squad_mg_sniper"]],_rarity_MotInf_MGTeam/3/3],
	// rhs_group_rus_msv_btr70_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_rus_msv_btr70" >> "rhs_group_rus_msv_btr70_squad_aa"]],_rarity_MotInf_AA/3]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1972,1990 min __date_emr], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

_arr = [
	// >1982
	//- rhs_group_rus_msv_BTR80, Пехота (БТР-80)
	// rhs_group_rus_msv_BTR80_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_msv_BTR80" >> "rhs_group_rus_msv_BTR80_chq"]],_rarity_bad/3],
	// rhs_group_rus_msv_BTR80_squad, Отряд
	[[[__cfg >> "rhs_group_rus_msv_BTR80" >> "rhs_group_rus_msv_BTR80_squad"]],_rarity_MotInf_Team/3],
	// rhs_group_rus_msv_BTR80_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_BTR80" >> "rhs_group_rus_msv_BTR80_squad_2mg"]],_rarity_MotInf_MGTeam/3/3],
	// rhs_group_rus_msv_BTR80_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_msv_BTR80" >> "rhs_group_rus_msv_BTR80_squad_sniper"]],_rarity_MotInf_MGTeam/3/3],
	// rhs_group_rus_msv_BTR80_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_BTR80" >> "rhs_group_rus_msv_BTR80_squad_mg_sniper"]],_rarity_MotInf_MGTeam/3/3],
	// rhs_group_rus_msv_BTR80_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_rus_msv_BTR80" >> "rhs_group_rus_msv_BTR80_squad_aa"]],_rarity_MotInf_AA/3]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1982 max __date_emr,2100], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

_arr = [
	// >1990
	//- rhs_group_rus_msv_BTR80a, Пехота (БТР-80А)
	// rhs_group_rus_msv_BTR80a_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_msv_BTR80a" >> "rhs_group_rus_msv_BTR80a_chq"]],_rarity_bad/3],
	// rhs_group_rus_msv_BTR80a_squad, Отряд
	[[[__cfg >> "rhs_group_rus_msv_BTR80a" >> "rhs_group_rus_msv_BTR80a_squad"]],_rarity_MotInf_Team/3],
	// rhs_group_rus_msv_BTR80a_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_BTR80a" >> "rhs_group_rus_msv_BTR80a_squad_2mg"]],_rarity_MotInf_MGTeam/3/3],
	// rhs_group_rus_msv_BTR80a_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_msv_BTR80a" >> "rhs_group_rus_msv_BTR80a_squad_sniper"]],_rarity_MotInf_MGTeam/3/3],
	// rhs_group_rus_msv_BTR80a_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_BTR80a" >> "rhs_group_rus_msv_BTR80a_squad_mg_sniper"]],_rarity_MotInf_MGTeam/3/3],
	// rhs_group_rus_msv_BTR80a_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_rus_msv_BTR80a" >> "rhs_group_rus_msv_BTR80a_squad_aa"]],_rarity_MotInf_AA/3]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1990 max __date_emr,2100], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

_arr = [
	// >1966
	//- rhs_group_rus_msv_bmp1, Мотострелки (БМП-1)
	// rhs_group_rus_msv_bmp1_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_msv_bmp1" >> "rhs_group_rus_msv_bmp1_chq"]],_rarity_bad/4],
	// rhs_group_rus_msv_bmp1_squad, Отряд
	[[[__cfg >> "rhs_group_rus_msv_bmp1" >> "rhs_group_rus_msv_bmp1_squad"]],_rarity_MechInfSquad/4],
	// rhs_group_rus_msv_bmp1_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_bmp1" >> "rhs_group_rus_msv_bmp1_squad_2mg"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_msv_bmp1_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_msv_bmp1" >> "rhs_group_rus_msv_bmp1_squad_sniper"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_msv_bmp1_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_bmp1" >> "rhs_group_rus_msv_bmp1_squad_mg_sniper"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_msv_bmp1_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_rus_msv_bmp1" >> "rhs_group_rus_msv_bmp1_squad_aa"]],_rarity_MotInf_AA/4]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1966,1990 min __date_emr], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

_arr = [
	// >1987
	//- rhs_group_rus_MSV_BMP3, Мотострелки (БМП-3)
	// rhs_group_rus_MSV_BMP3_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_MSV_BMP3" >> "rhs_group_rus_MSV_BMP3_chq"]],_rarity_bad/4],
	// rhs_group_rus_MSV_BMP3_squad, Отряд
	[[[__cfg >> "rhs_group_rus_MSV_BMP3" >> "rhs_group_rus_MSV_BMP3_squad"]],_rarity_MechInfSquad/4],
	// rhs_group_rus_MSV_BMP3_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_MSV_BMP3" >> "rhs_group_rus_MSV_BMP3_squad_2mg"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_MSV_BMP3_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_MSV_BMP3" >> "rhs_group_rus_MSV_BMP3_squad_sniper"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_MSV_BMP3_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_MSV_BMP3" >> "rhs_group_rus_MSV_BMP3_squad_mg_sniper"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_MSV_BMP3_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_rus_MSV_BMP3" >> "rhs_group_rus_MSV_BMP3_squad_aa"]],_rarity_MotInf_AA/4],
	//- rhs_group_rus_MSV_bmp3m, МСВ (БМП-3М)
	// rhs_group_rus_MSV_bmp3m_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_MSV_bmp3m" >> "rhs_group_rus_MSV_bmp3m_chq"]],_rarity_bad/4],
	// rhs_group_rus_MSV_bmp3m_squad, Отряд
	[[[__cfg >> "rhs_group_rus_MSV_bmp3m" >> "rhs_group_rus_MSV_bmp3m_squad"]],_rarity_MechInfSquad/4],
	// rhs_group_rus_MSV_bmp3m_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_MSV_bmp3m" >> "rhs_group_rus_MSV_bmp3m_squad_2mg"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_MSV_bmp3m_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_MSV_bmp3m" >> "rhs_group_rus_MSV_bmp3m_squad_sniper"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_MSV_bmp3m_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_MSV_bmp3m" >> "rhs_group_rus_MSV_bmp3m_squad_mg_sniper"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_MSV_bmp3m_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_rus_MSV_bmp3m" >> "rhs_group_rus_MSV_bmp3m_squad_aa"]],_rarity_MotInf_AA/4]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1987 max __date_emr,2100], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

_arr = [
	// >1980
	//- rhs_group_rus_msv_bmp2, Мотострелки (БМП-2)
	// rhs_group_rus_msv_bmp2_chq, Группа командира роты
	[[[__cfg >> "rhs_group_rus_msv_bmp2" >> "rhs_group_rus_msv_bmp2_chq"]],_rarity_bad/4],
	// rhs_group_rus_msv_bmp2_squad, Отряд
	[[[__cfg >> "rhs_group_rus_msv_bmp2" >> "rhs_group_rus_msv_bmp2_squad"]],_rarity_MechInfSquad/4],
	// rhs_group_rus_msv_bmp2_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_bmp2" >> "rhs_group_rus_msv_bmp2_squad_2mg"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_msv_bmp2_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_rus_msv_bmp2" >> "rhs_group_rus_msv_bmp2_squad_sniper"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_msv_bmp2_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_rus_msv_bmp2" >> "rhs_group_rus_msv_bmp2_squad_mg_sniper"]],_rarity_MotInf_MGTeam/3/4],
	// rhs_group_rus_msv_bmp2_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_rus_msv_bmp2" >> "rhs_group_rus_msv_bmp2_squad_aa"]],_rarity_MotInf_AA/4]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1980,2030 min __date_emr], [160,999],
__exclude
] call gosa_fnc_map_groups_add;

if (_Artillery) then {
	_arr = [
		//- rhs_group_rus_msv_bm21, BM-21 Artillery
		// RHS_SPGPlatoon_msv_bm21, BM-21 Platoon
		[[[__cfg >> "rhs_group_rus_msv_bm21" >> "RHS_SPGPlatoon_msv_bm21"]],_rarity_MotInf_MortTeam/2/2],
		// RHS_SPGSection_msv_bm21, BM-21 Section
		[[[__cfg >> "rhs_group_rus_msv_bm21" >> "RHS_SPGSection_msv_bm21"]],_rarity_MotInf_MortTeam/2/2]
	]; [_arr] call gosa_fnc_groups_convNormal;
	[_groups_map, east, "RHS_MSV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1964,2100], [160,999],
	__exclude
	] call gosa_fnc_map_groups_add;
};

#define __cfg configFile >> "CfgGroups" >> "East" >> "rhs_faction_tv"
//-- rhs_faction_tv, Россия (ТВ)
_arr = [
	//- rhs_group_rus_tv_14, T-14 Groups
	// RHS_T14Platoon, T-14 Platoon
	[[[__cfg >> "rhs_group_rus_tv_14" >> "RHS_T14Platoon"]],_rarity_TankPlatoon],
	// RHS_T14Platoon_AA, T-14 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_14" >> "RHS_T14Platoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T14Section, T-14 Section
	[[[__cfg >> "rhs_group_rus_tv_14" >> "RHS_T14Section"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2021,2100], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;

//- rhs_group_rus_tv_72, T-72 Groups
_arr = [
	// RHS_T72BAPlatoon, T-72B g.1984 Platoon
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BAPlatoon"]],_rarity_TankPlatoon/2],
	// RHS_T72BAPlatoon_AA, T-72B g.1984 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BAPlatoon_AA"]],_rarity_TankPlatoon_AA/2],
	// RHS_T72BASection, T-72B g.1984 Section
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BASection"]],_rarity_TankSection/2],
	// RHS_T72BBPlatoon, T-72B g.1985 Platoon
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BBPlatoon"]],_rarity_TankPlatoon/2],
	// RHS_T72BBPlatoon_AA, T-72B g.1985 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BBPlatoon_AA"]],_rarity_TankPlatoon_AA/2],
	// RHS_T72BBSection, T-72B g.1985 Section
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BBSection"]],_rarity_TankSection/2]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1984,2015], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// RHS_T72BCPlatoon, T-72B g.1989 Platoon
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BCPlatoon"]],_rarity_TankPlatoon],
	// RHS_T72BCPlatoon_AA, T-72B g.1989 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BCPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T72BCSection, T-72B g.1989 Section
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BCSection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1989,2020], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// RHS_T72BDPlatoon, T-72B3 g.2012 Platoon
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BDPlatoon"]],_rarity_TankPlatoon],
	// RHS_T72BDPlatoon_AA, T-72B3 g.2012 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BDPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T72BDSection, T-72B3 g.2012 Section
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BDSection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2011,2030], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// RHS_T72BEPlatoon, T-72B3 g.2016 Platoon
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BEPlatoon"]],_rarity_TankPlatoon],
	// RHS_T72BEPlatoon_AA, T-72B3 g.2016 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BEPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T72BESection, T-72B3 g.2016 Section
	[[[__cfg >> "rhs_group_rus_tv_72" >> "RHS_T72BESection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2016,2100], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;

//- rhs_group_rus_tv_80, T-80 Groups
_arr = [
	// >1976
	// RHS_T80Platoon, T-80 Platoon
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80Platoon"]],_rarity_TankPlatoon],
	// RHS_T80Platoon_AA, T-80 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80Platoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T80Section, T-80 Section
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80Section"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1976,1995], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// >1978
	// RHS_T80BPlatoon, T-80B Platoon
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80BPlatoon"]],_rarity_TankPlatoon],
	// RHS_T80BPlatoon_AA, T-80B Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80BPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T80BSection, T-80B Section
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80BSection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1978,1997], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// 1982-1984
	// RHS_T80APlatoon, T-80A Platoon
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80APlatoon"]],_rarity_TankPlatoon/10],
	// RHS_T80APlatoon_AA, T-80A Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80APlatoon_AA"]],_rarity_TankPlatoon_AA/10],
	// RHS_T80ASection, T-80A Section
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80ASection"]],_rarity_TankSection/10]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1982,1984], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// >1984
	// RHS_T80BVPlatoon, T-80BV Platoon
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80BVPlatoon"]],_rarity_TankPlatoon],
	// RHS_T80BVPlatoon_AA, T-80BV Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80BVPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T80BVSection, T-80BV Section
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80BVSection"]],_rarity_TankSection],
	// RHS_T80UPlatoon, T-80U Platoon
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80UPlatoon"]],_rarity_TankPlatoon],
	// RHS_T80UPlatoon_AA, T-80U Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80UPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T80USection, T-80U Section
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80USection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1984,2010], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// >1992
	// RHS_T80UMPlatoon, T-80UM Platoon
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80UMPlatoon"]],_rarity_TankPlatoon],
	// RHS_T80UMPlatoon_AA, T-80UM Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80UMPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T80UMSection, T-80UM Section
	[[[__cfg >> "rhs_group_rus_tv_80" >> "RHS_T80UMSection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1992,2020], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// >2005
	// rhs_t80ue1Platoon, T-80UE-1 Platoon
	[[[__cfg >> "rhs_group_rus_tv_80" >> "rhs_t80ue1Platoon"]],_rarity_TankPlatoon/10],
	// rhs_t80ue1Platoon_AA, T-80UE-1 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_80" >> "rhs_t80ue1Platoon_AA"]],_rarity_TankPlatoon_AA/10],
	// rhs_t80ue1Section, T-80UE-1 Section
	[[[__cfg >> "rhs_group_rus_tv_80" >> "rhs_t80ue1Section"]],_rarity_TankSection/10]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2005,2020], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// >2009
	// rhs_t80u45mPlatoon, T-80U (45m) Platoon
	[[[__cfg >> "rhs_group_rus_tv_80" >> "rhs_t80u45mPlatoon"]],_rarity_TankPlatoon/10],
	// rhs_t80u45mPlatoon_AA, T-80U (45m) Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_80" >> "rhs_t80u45mPlatoon_AA"]],_rarity_TankPlatoon_AA/10],
	// rhs_t80u45mSection, T-80U (45m) Section
	[[[__cfg >> "rhs_group_rus_tv_80" >> "rhs_t80u45mSection"]],_rarity_TankSection/10]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2009,2020], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;

//- rhs_group_rus_tv_90, T-90 Groups
// >1992, Чечня
_arr = [
	// RHS_T90Platoon, T-90 Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90Platoon"]],_rarity_TankPlatoon],
	// RHS_T90Platoon_AA, T-90 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90Platoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T90Section, T-90 Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90Section"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1992,2015], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;

// >2004, Сирия с 2015
_arr = [
	// RHS_t90aPlatoon, T-90A Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_t90aPlatoon"]],_rarity_TankPlatoon],
	// RHS_t90aPlatoon_AA, T-90A Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_t90aPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_t90aSection, T-90A Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_t90aSection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2004,2020], [160,225-1],
	__exclude
] call gosa_fnc_map_groups_add;

// 2020-е
_arr = [
	// RHS_T90AMPlatoon, T-90AM Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90AMPlatoon"]],_rarity_TankPlatoon],
	// RHS_T90AMPlatoon_AA, T-90AM Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90AMPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T90AMSection, T-90AM Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90AMSection"]],_rarity_TankSection],

	// RHS_T90SMPlatoon, T-90SM Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SMPlatoon"]],_rarity_TankPlatoon],
	// RHS_T90SMPlatoon_AA, T-90SM Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SMPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T90SMSection, T-90SM Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SMSection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2016,2030], [160,225-1],
	__exclude
] call gosa_fnc_map_groups_add;

// Экспорт
_arr = [
	// RHS_T90SAPlatoon, T-90SA g.2004 Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SAPlatoon"]],_rarity_TankPlatoon],
	// RHS_T90SAPlatoon_AA, T-90SA g.2004 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SAPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T90SASection, T-90SA g.2004 Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SASection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2004,2020], [225,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// RHS_T90SABPlatoon, T-90SA g.2016 Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SABPlatoon"]],_rarity_TankPlatoon],
	// RHS_T90SABPlatoon_AA, T-90SA g.2016 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SABPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T90SABSection, T-90SA g.2016 Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SABSection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2016,2030], [225,999],
	__exclude
] call gosa_fnc_map_groups_add;

if (_Artillery) then {
	_arr = [
		//- rhs_group_rus_tv_2S1, 2S1 Artillery
		// RHS_SPGPlatoon_tv_2S1, Artillery 2S1 Platoon
		[[[__cfg >> "rhs_group_rus_tv_2S1" >> "RHS_SPGPlatoon_tv_2S1"]],_rarity_MotInf_MortTeam/4/2],
		// RHS_SPGSection_tv_2S1, Artillery 2S1 Section
		[[[__cfg >> "rhs_group_rus_tv_2S1" >> "RHS_SPGSection_tv_2S1"]],_rarity_MotInf_MortTeam/4/2],
		//- rhs_group_rus_tv_2s3, 2S3 Artillery
		// RHS_SPGPlatoon_tv_2s3, Artillery 2S3 Platoon
		[[[__cfg >> "rhs_group_rus_tv_2s3" >> "RHS_SPGPlatoon_tv_2s3"]],_rarity_MotInf_MortTeam/4/2],
		// RHS_SPGSection_tv_2s3, Artillery 2S3 Section
		[[[__cfg >> "rhs_group_rus_tv_2s3" >> "RHS_SPGSection_tv_2s3"]],_rarity_MotInf_MortTeam/4/2]
	]; [_arr] call gosa_fnc_groups_convNormal;
	[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1970,2100], [160,999],
		__exclude
	] call gosa_fnc_map_groups_add;
};

#define __exclude ["CUP_O_ChDKZ","gmx_chdkz","OPF_SFIA_lxWS","OPF_TURA_lxWS","OPF_T_F","OPF_F","OPF_G_F","OPF_R_F"]
#define __cfg configFile >> "CfgGroups" >> "East" >> "rhsgref_faction_chdkz"
//-- rhsgref_faction_chdkz, ChDKZ Insurgents
_arr = [
	//- rhsgref_group_chdkz_insurgents_infantry, Infantry
	// rhsgref_group_chdkz_insurgents_squad, Team
	[[[__cfg >> "rhsgref_group_chdkz_insurgents_infantry" >> "rhsgref_group_chdkz_insurgents_squad"]],_rarity_InfSquad],
	// rhsgref_group_chdkz_infantry_patrol, Patrol
	[[[__cfg >> "rhsgref_group_chdkz_insurgents_infantry" >> "rhsgref_group_chdkz_infantry_patrol"]],_rarity_InfTeam],
	// rhsgref_group_chdkz_infantry_mg, MG pair
	[[[__cfg >> "rhsgref_group_chdkz_insurgents_infantry" >> "rhsgref_group_chdkz_infantry_mg"]],_rarity_InfTeam_MG],
	// rhsgref_group_chdkz_infantry_at, AT pair
	[[[__cfg >> "rhsgref_group_chdkz_insurgents_infantry" >> "rhsgref_group_chdkz_infantry_at"]],_rarity_InfTeam_AT],
	// rhsgref_group_chdkz_infantry_aa, AA pair
	[[[__cfg >> "rhsgref_group_chdkz_insurgents_infantry" >> "rhsgref_group_chdkz_infantry_aa"]],_rarity_InfTeam_AA]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1964,2030], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_bm21, BM-21 Artillery
	// RHS_SPGPlatoon_ins_bm21, BM-21 Platoon
	[[[__cfg >> "rhs_group_indp_ins_bm21" >> "RHS_SPGPlatoon_ins_bm21"]],_rarity_MotInf_MortTeam/2],
	// RHS_SPGSection_ins_bm21, BM-21 Section
	[[[__cfg >> "rhs_group_indp_ins_bm21" >> "RHS_SPGSection_ins_bm21"]],_rarity_MotInf_MortTeam/2]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1963,2030], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_bmd1, Mechanized (BMD-1)
	// rhs_group_rus_ins_bmd1_chq, Группа командира роты
	[[[__cfg >> "rhs_group_indp_ins_bmd1" >> "rhs_group_rus_ins_bmd1_chq"]],_rarity_bad/4],
	// rhs_group_rus_ins_bmd1_squad, Отряд
	[[[__cfg >> "rhs_group_indp_ins_bmd1" >> "rhs_group_rus_ins_bmd1_squad"]],_rarity_MechInfSquad/4],
	// rhs_group_rus_ins_bmd1_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_bmd1" >> "rhs_group_rus_ins_bmd1_squad_2mg"]],_rarity_MechInf_MG/3/4],
	// rhs_group_rus_ins_bmd1_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_indp_ins_bmd1" >> "rhs_group_rus_ins_bmd1_squad_sniper"]],_rarity_MechInf_MG/3/4],
	// rhs_group_rus_ins_bmd1_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_bmd1" >> "rhs_group_rus_ins_bmd1_squad_mg_sniper"]],_rarity_MechInf_MG/3/4],
	// rhs_group_rus_ins_bmd1_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_indp_ins_bmd1" >> "rhs_group_rus_ins_bmd1_squad_aa"]],_rarity_MechInf_AA/4]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1969,2010], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_bmd2, Mechanized (BMD-2)
	// rhs_group_rus_ins_bmd2_chq, Группа командира роты
	[[[__cfg >> "rhs_group_indp_ins_bmd2" >> "rhs_group_rus_ins_bmd2_chq"]],_rarity_bad/4],
	// rhs_group_rus_ins_bmd2_squad, Отряд
	[[[__cfg >> "rhs_group_indp_ins_bmd2" >> "rhs_group_rus_ins_bmd2_squad"]],_rarity_MechInfSquad/4],
	// rhs_group_rus_ins_bmd2_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_bmd2" >> "rhs_group_rus_ins_bmd2_squad_2mg"]],_rarity_MechInf_MG/3/4],
	// rhs_group_rus_ins_bmd2_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_indp_ins_bmd2" >> "rhs_group_rus_ins_bmd2_squad_sniper"]],_rarity_MechInf_MG/3/4],
	// rhs_group_rus_ins_bmd2_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_bmd2" >> "rhs_group_rus_ins_bmd2_squad_mg_sniper"]],_rarity_MechInf_MG/3/4],
	// rhs_group_rus_ins_bmd2_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_indp_ins_bmd2" >> "rhs_group_rus_ins_bmd2_squad_aa"]],_rarity_MechInf_AA/4]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1985,2030], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_bmp1, Mechanized (BMP-1)
	// rhs_group_indp_ins_bmp1_chq, Группа командира роты
	[[[__cfg >> "rhs_group_indp_ins_bmp1" >> "rhs_group_indp_ins_bmp1_chq"]],_rarity_bad/4],
	// rhs_group_indp_ins_bmp1_squad, Отряд
	[[[__cfg >> "rhs_group_indp_ins_bmp1" >> "rhs_group_indp_ins_bmp1_squad"]],_rarity_MechInfSquad/4],
	// rhs_group_indp_ins_bmp1_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_bmp1" >> "rhs_group_indp_ins_bmp1_squad_2mg"]],_rarity_MechInf_MG/3/4],
	// rhs_group_indp_ins_bmp1_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_indp_ins_bmp1" >> "rhs_group_indp_ins_bmp1_squad_sniper"]],_rarity_MechInf_MG/3/4],
	// rhs_group_indp_ins_bmp1_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_bmp1" >> "rhs_group_indp_ins_bmp1_squad_mg_sniper"]],_rarity_MechInf_MG/3/4],
	// rhs_group_indp_ins_bmp1_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_indp_ins_bmp1" >> "rhs_group_indp_ins_bmp1_squad_aa"]],_rarity_MechInf_AA/4]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1966,2010], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_bmp2, Mechanized (BMP-2)
	// rhs_group_indp_ins_bmp2_chq, Группа командира роты
	[[[__cfg >> "rhs_group_indp_ins_bmp2" >> "rhs_group_indp_ins_bmp2_chq"]],_rarity_bad/4],
	// rhs_group_indp_ins_bmp2_squad, Отряд
	[[[__cfg >> "rhs_group_indp_ins_bmp2" >> "rhs_group_indp_ins_bmp2_squad"]],_rarity_MechInfSquad/4],
	// rhs_group_indp_ins_bmp2_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_bmp2" >> "rhs_group_indp_ins_bmp2_squad_2mg"]],_rarity_MechInf_MG/3/4],
	// rhs_group_indp_ins_bmp2_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_indp_ins_bmp2" >> "rhs_group_indp_ins_bmp2_squad_sniper"]],_rarity_MechInf_MG/3/4],
	// rhs_group_indp_ins_bmp2_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_bmp2" >> "rhs_group_indp_ins_bmp2_squad_mg_sniper"]],_rarity_MechInf_MG/3/4],
	// rhs_group_indp_ins_bmp2_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_indp_ins_bmp2" >> "rhs_group_indp_ins_bmp2_squad_aa"]],_rarity_MechInf_AA/4]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1980,2030], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_btr70, Motorized (BTR-70)
	// rhs_group_chdkz_btr70_chq, Группа командира роты
	[[[__cfg >> "rhs_group_indp_ins_btr70" >> "rhs_group_chdkz_btr70_chq"]],_rarity_bad/2],
	// rhs_group_chdkz_btr70_squad, Отряд
	[[[__cfg >> "rhs_group_indp_ins_btr70" >> "rhs_group_chdkz_btr70_squad"]],_rarity_MotInf_Team/2],
	// rhs_group_chdkz_btr70_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_btr70" >> "rhs_group_chdkz_btr70_squad_2mg"]],_rarity_MotInf_MG/3/2],
	// rhs_group_chdkz_btr70_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_indp_ins_btr70" >> "rhs_group_chdkz_btr70_squad_sniper"]],_rarity_MotInf_MG/3/2],
	// rhs_group_chdkz_btr70_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_btr70" >> "rhs_group_chdkz_btr70_squad_mg_sniper"]],_rarity_MotInf_MG/3/2],
	// rhs_group_chdkz_btr70_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_indp_ins_btr70" >> "rhs_group_chdkz_btr70_squad_aa"]],_rarity_MotInf_AA/2]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1972,2010], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_btr60, Motorized (BTR-60)
	// rhs_group_chdkz_btr60_chq, Группа командира роты
	[[[__cfg >> "rhs_group_indp_ins_btr60" >> "rhs_group_chdkz_btr60_chq"]],_rarity_bad/2],
	// rhs_group_chdkz_btr60_squad, Отряд
	[[[__cfg >> "rhs_group_indp_ins_btr60" >> "rhs_group_chdkz_btr60_squad"]],_rarity_MotInf_Team/2],
	// rhs_group_chdkz_btr60_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_btr60" >> "rhs_group_chdkz_btr60_squad_2mg"]],_rarity_MotInf_MG/3/2],
	// rhs_group_chdkz_btr60_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_indp_ins_btr60" >> "rhs_group_chdkz_btr60_squad_sniper"]],_rarity_MotInf_MG/3/2],
	// rhs_group_chdkz_btr60_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_btr60" >> "rhs_group_chdkz_btr60_squad_mg_sniper"]],_rarity_MotInf_MG/3/2],
	// rhs_group_chdkz_btr60_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_indp_ins_btr60" >> "rhs_group_chdkz_btr60_squad_aa"]],_rarity_MotInf_AA/2]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1964,2000], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_ural, Motorized (Ural-4320)
	// rhs_group_chdkz_ural_chq, Группа командира роты
	[[[__cfg >> "rhs_group_indp_ins_ural" >> "rhs_group_chdkz_ural_chq"]],_rarity_bad/5],
	// rhs_group_chdkz_ural_squad, Отряд
	[[[__cfg >> "rhs_group_indp_ins_ural" >> "rhs_group_chdkz_ural_squad"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_chdkz_ural_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_ural" >> "rhs_group_chdkz_ural_squad_2mg"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_chdkz_ural_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_indp_ins_ural" >> "rhs_group_chdkz_ural_squad_sniper"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_chdkz_ural_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_ural" >> "rhs_group_chdkz_ural_squad_mg_sniper"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_chdkz_ural_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_indp_ins_ural" >> "rhs_group_chdkz_ural_squad_aa"]],_rarity_MotInf_Reinforce/5],

	//- rhs_group_indp_ins_uaz, Motorized (UAZ)
	// BUS_MotInf_Team_GMG, Mot. Team (AGS-30)
	[[[__cfg >> "rhs_group_indp_ins_uaz" >> "BUS_MotInf_Team_GMG"]],_rarity_MotInf_GMGTeam],
	// BUS_MotInf_Team_HMG, Mot. Team (DShkM)
	[[[__cfg >> "rhs_group_indp_ins_uaz" >> "BUS_MotInf_Team_HMG"]],_rarity_MotInf_HMGTeam],
	// BUS_MotInf_AT, Mot. Team (SPG-9)
	[[[__cfg >> "rhs_group_indp_ins_uaz" >> "BUS_MotInf_AT"]],_rarity_MotInf_AT],
	// BUS_MotInf_AA, Mot. Air-defense Team
	[[[__cfg >> "rhs_group_indp_ins_uaz" >> "BUS_MotInf_AA"]],_rarity_MotInf_AA]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1973,2030], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_gaz66, Motorized (GAZ-66)
	// rhs_group_chdkz_gaz66_chq, Группа командира роты
	[[[__cfg >> "rhs_group_indp_ins_gaz66" >> "rhs_group_chdkz_gaz66_chq"]],_rarity_bad/5],
	// rhs_group_chdkz_gaz66_squad, Отряд
	[[[__cfg >> "rhs_group_indp_ins_gaz66" >> "rhs_group_chdkz_gaz66_squad"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_chdkz_gaz66_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_gaz66" >> "rhs_group_chdkz_gaz66_squad_2mg"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_chdkz_gaz66_squad_sniper, Отряд (снайпер)
	[[[__cfg >> "rhs_group_indp_ins_gaz66" >> "rhs_group_chdkz_gaz66_squad_sniper"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_chdkz_gaz66_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >> "rhs_group_indp_ins_gaz66" >> "rhs_group_chdkz_gaz66_squad_mg_sniper"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_chdkz_gaz66_squad_aa, Отряд ПВО
	[[[__cfg >> "rhs_group_indp_ins_gaz66" >> "rhs_group_chdkz_gaz66_squad_aa"]],_rarity_MotInf_Reinforce/5]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1964,2000], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_indp_ins_72, T-72 Groups
	// RHS_T72baPlatoon, T-72 g.1984 Platoon
	[[[__cfg >> "rhs_group_indp_ins_72" >> "RHS_T72baPlatoon"]],_rarity_TankPlatoon],
	// RHS_T72baPlatoon_AA, T-72 g.1984 Platoon (Combined)
	[[[__cfg >> "rhs_group_indp_ins_72" >> "RHS_T72baPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T72baSection, T-72 g.1984 Section
	[[[__cfg >> "rhs_group_indp_ins_72" >> "RHS_T72baSection"]],_rarity_TankSection],

	// RHS_T72BBPlatoon, T-72 g.1985 Platoon
	[[[__cfg >> "rhs_group_indp_ins_72" >> "RHS_T72BBPlatoon"]],_rarity_TankPlatoon],
	// RHS_T72BBPlatoon_AA, T-72 g.1985 Platoon (Combined)
	[[[__cfg >> "rhs_group_indp_ins_72" >> "RHS_T72BBPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_T72BBSection, T-72 g.1985 Section
	[[[__cfg >> "rhs_group_indp_ins_72" >> "RHS_T72BBSection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1984,2000], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// RHS_t72bcPlatoon, T-72 g.1989 Platoon
	[[[__cfg >> "rhs_group_indp_ins_72" >> "RHS_t72bcPlatoon"]],_rarity_TankPlatoon],
	// RHS_t72bcPlatoon_AA, T-72 g.1989 Platoon (Combined)
	[[[__cfg >> "rhs_group_indp_ins_72" >> "RHS_t72bcPlatoon_AA"]],_rarity_TankPlatoon_AA],
	// RHS_t72bcSection, T-72 g.1989 Section
	[[[__cfg >> "rhs_group_indp_ins_72" >> "RHS_t72bcSection"]],_rarity_TankSection]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "rhsgref_faction_chdkz", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1989,2030], [150,999],
	__exclude
] call gosa_fnc_map_groups_add;


//--- West
#define __exclude ["CUP_B_US_Army","CUP_B_USMC","BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
//-- rhs_faction_usmc_wd, США (КМП - Лесной)
_arr = [
	// >2005 FROG MARPAT
	//- rhs_group_nato_usmc_wd_infantry, Пехота
	// rhs_group_nato_usmc_wd_infantry_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_squad"]],0.75],
	// rhs_group_nato_usmc_wd_infantry_weaponsquad, Ор. отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_weaponsquad"]],0.75],
	// rhs_group_nato_usmc_wd_infantry_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_squad_sniper"]],0.75],
	// rhs_group_nato_usmc_wd_infantry_team, Команда
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_team"]],0.75],
	// rhs_group_nato_usmc_wd_infantry_team_MG, Команда (пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_team_MG"]],0.75],
	// rhs_group_nato_usmc_wd_infantry_team_AA, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_team_AA"]],0.75],
	// rhs_group_nato_usmc_wd_infantry_team_support, Команда (подд.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_team_support"]],0.75],
	// rhs_group_nato_usmc_wd_infantry_team_heavy_AT, Команда (ПТ)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_team_heavy_AT"]],0.75],

	//- rhs_group_nato_usmc_recon_wd_infantry, Пехота (разведка)
	// rhs_group_nato_usmc_recon_wd_infantry_team, Команда
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_recon_wd_infantry" >> "rhs_group_nato_usmc_recon_wd_infantry_team"]],0.75],
	// rhs_group_nato_usmc_recon_wd_infantry_team_MG, Команда (пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_recon_wd_infantry" >> "rhs_group_nato_usmc_recon_wd_infantry_team_MG"]],0.75],
	// rhs_group_nato_usmc_recon_wd_infantry_team_support, Команда (подд.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_recon_wd_infantry" >> "rhs_group_nato_usmc_recon_wd_infantry_team_support"]],0.75],
	// rhs_group_nato_usmc_recon_wd_infantry_team_lite, Команда (лёгк.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_recon_wd_infantry" >> "rhs_group_nato_usmc_recon_wd_infantry_team_lite"]],0.75],
	// rhs_group_nato_usmc_recon_wd_infantry_team_fast, Команда (Fast)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_recon_wd_infantry" >> "rhs_group_nato_usmc_recon_wd_infantry_team_fast"]],0.75],

	// >1985
	//- rhs_group_nato_usmc_wd_HMMWV, Пехота (HMMWV)
	// BUS_MotInf_Team_GMG, Mot. Team (GMG)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_HMMWV" >> "BUS_MotInf_Team_GMG"]],0],
	// BUS_MotInf_Team_HMG, Mot. Team (HMG)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_HMMWV" >> "BUS_MotInf_Team_HMG"]],0],
	// BUS_MotInf_AT, Mot. Anti-armor Team
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_HMMWV" >> "BUS_MotInf_AT"]],0],
	// BUS_MotInf_AA, Mot. Air-defense Team
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_HMMWV" >> "BUS_MotInf_AA"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "RHS_USMC_WD", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1985,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usmc_wd_RG33, Пехота (RG-33)
	// rhs_group_nato_usmc_wd_RG33_squad, Отряд (RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_RG33" >> "rhs_group_nato_usmc_wd_RG33_squad"]],0.75],
	// rhs_group_nato_usmc_wd_RG33_squad_2mg, Отряд (2x пул./RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_RG33" >> "rhs_group_nato_usmc_wd_RG33_squad_2mg"]],0.75],
	// rhs_group_nato_usmc_wd_RG33_squad_sniper, Отряд (Снайпер/RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_RG33" >> "rhs_group_nato_usmc_wd_RG33_squad_sniper"]],0.75],
	// rhs_group_nato_usmc_wd_RG33_squad_mg_sniper, Отряд (Снайпер + пул./RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_RG33" >> "rhs_group_nato_usmc_wd_RG33_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usmc_wd_RG33_m2_squad, Отряд (RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_RG33" >> "rhs_group_nato_usmc_wd_RG33_m2_squad"]],0.75],
	// rhs_group_nato_usmc_wd_RG33_m2_squad_2mg, Отряд (2x пул./RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_RG33" >> "rhs_group_nato_usmc_wd_RG33_m2_squad_2mg"]],0.75],
	// rhs_group_nato_usmc_wd_RG33_m2_squad_sniper, Отряд (Снайпер/RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_RG33" >> "rhs_group_nato_usmc_wd_RG33_m2_squad_sniper"]],0.75],
	// rhs_group_nato_usmc_wd_RG33_m2_squad_mg_sniper, Отряд (Снайпер + пул./RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_RG33" >> "rhs_group_nato_usmc_wd_RG33_m2_squad_mg_sniper"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "RHS_USMC_WD", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2007,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usmc_wd_m1a1, M1A1 Groups
	// RHS_M1A1AIM_wd_Platoon, M1A1FEP Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_m1a1" >> "RHS_M1A1AIM_wd_Platoon"]],0],
	// RHS_M1A1FEP_wd_Section, M1A1FEP Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_m1a1" >> "RHS_M1A1FEP_wd_Section"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "RHS_USMC_WD", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1995,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;

//-- rhs_faction_usmc_d, США (КМП - Пустынный)
_arr = [
	//- rhs_group_nato_usmc_d_infantry, Пехота
	// rhs_group_nato_usmc_d_infantry_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_infantry" >> "rhs_group_nato_usmc_d_infantry_squad"]],0.75],
	// rhs_group_nato_usmc_d_infantry_weaponsquad, Ор. отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_infantry" >> "rhs_group_nato_usmc_d_infantry_weaponsquad"]],0.75],
	// rhs_group_nato_usmc_d_infantry_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_infantry" >> "rhs_group_nato_usmc_d_infantry_squad_sniper"]],0.75],
	// rhs_group_nato_usmc_d_infantry_team, Команда
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_infantry" >> "rhs_group_nato_usmc_d_infantry_team"]],0.75],
	// rhs_group_nato_usmc_d_infantry_team_MG, Команда (пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_infantry" >> "rhs_group_nato_usmc_d_infantry_team_MG"]],0.75],
	// rhs_group_nato_usmc_d_infantry_team_AA, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_infantry" >> "rhs_group_nato_usmc_d_infantry_team_AA"]],0.75],
	// rhs_group_nato_usmc_d_infantry_team_support, Команда (подд.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_infantry" >> "rhs_group_nato_usmc_d_infantry_team_support"]],0.75],
	// rhs_group_nato_usmc_d_infantry_team_heavy_AT, Команда (ПТ)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_infantry" >> "rhs_group_nato_usmc_d_infantry_team_heavy_AT"]],0.75],

	//- rhs_group_nato_usmc_recon_d_infantry, Пехота (разведка)
	// rhs_group_nato_usmc_recon_d_infantry_team, Команда
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_recon_d_infantry" >> "rhs_group_nato_usmc_recon_d_infantry_team"]],0.75],
	// rhs_group_nato_usmc_recon_d_infantry_team_MG, Команда (пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_recon_d_infantry" >> "rhs_group_nato_usmc_recon_d_infantry_team_MG"]],0.75],
	// rhs_group_nato_usmc_recon_d_infantry_team_support, Команда (подд.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_recon_d_infantry" >> "rhs_group_nato_usmc_recon_d_infantry_team_support"]],0.75],
	// rhs_group_nato_usmc_recon_d_infantry_team_lite, Команда (лёгк.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_recon_d_infantry" >> "rhs_group_nato_usmc_recon_d_infantry_team_lite"]],0.75],
	// rhs_group_nato_usmc_recon_d_infantry_team_fast, Команда (Fast)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_recon_d_infantry" >> "rhs_group_nato_usmc_recon_d_infantry_team_fast"]],0.75],

	//- rhs_group_nato_usmc_d_HMMWV, Пехота (HMMWV)
	// BUS_MotInf_Team_GMG, Mot. Team (GMG)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_HMMWV" >> "BUS_MotInf_Team_GMG"]],0],
	// BUS_MotInf_Team_HMG, Mot. Team (HMG)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_HMMWV" >> "BUS_MotInf_Team_HMG"]],0],
	// BUS_MotInf_AT, Mot. Anti-armor Team
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_HMMWV" >> "BUS_MotInf_AT"]],0],
	// BUS_MotInf_AA, Mot. Air-defense Team
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_HMMWV" >> "BUS_MotInf_AA"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "RHS_USMC_D", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1985,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usmc_d_RG33, Пехота (RG-33)
	// rhs_group_nato_usmc_d_RG33_squad, Отряд (RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_RG33" >> "rhs_group_nato_usmc_d_RG33_squad"]],0.75],
	// rhs_group_nato_usmc_d_RG33_squad_2mg, Отряд (2x пул./RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_RG33" >> "rhs_group_nato_usmc_d_RG33_squad_2mg"]],0.75],
	// rhs_group_nato_usmc_d_RG33_squad_sniper, Отряд (Снайпер/RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_RG33" >> "rhs_group_nato_usmc_d_RG33_squad_sniper"]],0.75],
	// rhs_group_nato_usmc_d_RG33_squad_mg_sniper, Отряд (Снайпер + пул./RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_RG33" >> "rhs_group_nato_usmc_d_RG33_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usmc_d_RG33_m2_squad, Отряд (RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_RG33" >> "rhs_group_nato_usmc_d_RG33_m2_squad"]],0.75],
	// rhs_group_nato_usmc_d_RG33_m2_squad_2mg, Отряд (2x пул./RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_RG33" >> "rhs_group_nato_usmc_d_RG33_m2_squad_2mg"]],0.75],
	// rhs_group_nato_usmc_d_RG33_m2_squad_sniper, Отряд (Снайпер/RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_RG33" >> "rhs_group_nato_usmc_d_RG33_m2_squad_sniper"]],0.75],
	// rhs_group_nato_usmc_d_RG33_m2_squad_mg_sniper, Отряд (Снайпер + пул./RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_RG33" >> "rhs_group_nato_usmc_d_RG33_m2_squad_mg_sniper"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "RHS_USMC_D", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2007,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usmc_d_m1a1, M1A1 Groups
	// RHS_M1A1AIM_d_Platoon, M1A1FEP Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_m1a1" >> "RHS_M1A1AIM_d_Platoon"]],0],
	// RHS_M1A1FEP_d_Section, M1A1FEP Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_d" >> "rhs_group_nato_usmc_d_m1a1" >> "RHS_M1A1FEP_d_Section"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "RHS_USMC_D", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1995,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;

// TODO: Форму UCP можно заменить на OEF-CP.
//-- rhs_faction_usarmy_wd, США (Армия - Лесной)
_arr = [
	// >2004, UCP
	//- rhs_group_nato_usarmy_wd_infantry, Пехота
	// rhs_group_nato_usarmy_wd_company_hq, Группа командира роты
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_company_hq"]],0.75],
	// rhs_group_nato_usarmy_wd_platoon_hq, Отделение (Взвод)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_platoon_hq"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_infantry_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_weaponsquad, Ор. отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_infantry_weaponsquad"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_infantry_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team, Команда
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_infantry_team"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team_MG, Команда (пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_infantry_team_MG"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team_AA, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_infantry_team_AA"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team_support, Команда (подд.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_infantry_team_support"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team_heavy_AT, Команда (ПТ)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry" >> "rhs_group_nato_usarmy_wd_infantry_team_heavy_AT"]],0.75],

	//- rhs_group_nato_usarmy_wd_infantry_arb, Пехота (Arb)
	// rhs_group_nato_usarmy_wd_company_hq, Группа командира роты
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_company_hq"]],0.75],
	// rhs_group_nato_usarmy_wd_platoon_hq, Отделение (Взвод)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_platoon_hq"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_infantry_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_weaponsquad, Ор. отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_infantry_weaponsquad"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_infantry_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team, Команда
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_infantry_team"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team_MG, Команда (пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_infantry_team_MG"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team_AA, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_infantry_team_AA"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team_support, Команда (подд.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_infantry_team_support"]],0.75],
	// rhs_group_nato_usarmy_wd_infantry_team_heavy_AT, Команда (ПТ)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_infantry_arb" >> "rhs_group_nato_usarmy_wd_infantry_team_heavy_AT"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_wd", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1985,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_wd_RG33, Пехота (RG-33)
	// rhs_group_nato_usarmy_wd_RG33_squad, Отряд (RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_RG33" >> "rhs_group_nato_usarmy_wd_RG33_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_RG33_squad_2mg, Отряд (2x пул./RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_RG33" >> "rhs_group_nato_usarmy_wd_RG33_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_RG33_squad_sniper, Отряд (Снайпер/RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_RG33" >> "rhs_group_nato_usarmy_wd_RG33_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_RG33_squad_mg_sniper, Отряд (Снайпер + пул./RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_RG33" >> "rhs_group_nato_usarmy_wd_RG33_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_RG33_m2_squad, Отряд (RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_RG33" >> "rhs_group_nato_usarmy_wd_RG33_m2_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_RG33_m2_squad_2mg, Отряд (2x пул./RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_RG33" >> "rhs_group_nato_usarmy_wd_RG33_m2_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_RG33_m2_squad_sniper, Отряд (Снайпер/RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_RG33" >> "rhs_group_nato_usarmy_wd_RG33_m2_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_RG33_m2_squad_mg_sniper, Отряд (Снайпер + пул./RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_RG33" >> "rhs_group_nato_usarmy_wd_RG33_m2_squad_mg_sniper"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_wd", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2007,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// >1996
	//- rhs_group_nato_usarmy_wd_FMTV, Пехота (FMTV)
	// rhs_group_nato_usarmy_wd_FMTV_1078_squad, Отряд (М1078)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_FMTV" >> "rhs_group_nato_usarmy_wd_FMTV_1078_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_FMTV_1078_squad_2mg, Отряд (2x пул./М1078)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_FMTV" >> "rhs_group_nato_usarmy_wd_FMTV_1078_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_FMTV_1078_squad_sniper, Отряд (Снайпер/М1078)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_FMTV" >> "rhs_group_nato_usarmy_wd_FMTV_1078_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_FMTV_1078_squad_mg_sniper, Отряд (Снайпер + пул./М1078)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_FMTV" >> "rhs_group_nato_usarmy_wd_FMTV_1078_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_FMTV_1083_squad, Отряд (М1083)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_FMTV" >> "rhs_group_nato_usarmy_wd_FMTV_1083_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_FMTV_1083_squad_2mg, Отряд (2x пул./М1083)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_FMTV" >> "rhs_group_nato_usarmy_wd_FMTV_1083_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_FMTV_1083_squad_sniper, Отряд (Снайпер/М1083)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_FMTV" >> "rhs_group_nato_usarmy_wd_FMTV_1083_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_FMTV_1083_squad_mg_sniper, Отряд (Снайпер + пул./М1083)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_FMTV" >> "rhs_group_nato_usarmy_wd_FMTV_1083_squad_mg_sniper"]],0.75],

	// >1995
	//- rhs_group_nato_usarmy_wd_m1a1, M1A1 Groups
	// RHS_M1A1AIM_wd_Platoon, M1A1AIM Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_m1a1" >> "RHS_M1A1AIM_wd_Platoon"]],0],
	// RHS_M1A1AIM_wd_Platoon_AA, M1A1AIM Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_m1a1" >> "RHS_M1A1AIM_wd_Platoon_AA"]],0],
	// RHS_M1A1AIM_wd_Section, M1A1AIM Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_m1a1" >> "RHS_M1A1AIM_wd_Section"]],0],
	// RHS_M1A1AIM_wd_TUSK_Platoon, M1A1AIM (TUSK I) Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_m1a1" >> "RHS_M1A1AIM_wd_TUSK_Platoon"]],0],
	// RHS_M1A1AIM_wd_TUSK_Platoon_AA, M1A1AIM (TUSK I) Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_m1a1" >> "RHS_M1A1AIM_wd_TUSK_Platoon_AA"]],0],
	// RHS_M1A1AIM_wd_TUSK_Section, M1A1AIM (TUSK I) Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_m1a1" >> "RHS_M1A1AIM_wd_TUSK_Section"]],0],
	//- rhs_group_nato_usarmy_wd_M1A2, M1A2 Groups
	// RHS_M1A2SEP_wd_Platoon, M1A2SEPv1 Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M1A2" >> "RHS_M1A2SEP_wd_Platoon"]],0],
	// RHS_M1A2SEP_wd_Platoon_AA, M1A2SEPv1 Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M1A2" >> "RHS_M1A2SEP_wd_Platoon_AA"]],0],
	// RHS_M1A2SEP_wd_Section, M1A2SEPv1 Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M1A2" >> "RHS_M1A2SEP_wd_Section"]],0],
	// RHS_M1A2SEP_wd_TUSK_Platoon, M1A2SEPv1 (TUSK I) Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M1A2" >> "RHS_M1A2SEP_wd_TUSK_Platoon"]],0],
	// RHS_M1A2SEP_wd_TUSK_Platoon_AA, M1A2SEPv1 (TUSK I) Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M1A2" >> "RHS_M1A2SEP_wd_TUSK_Platoon_AA"]],0],
	// RHS_M1A2SEP_wd_TUSK_Section, M1A2SEPv1 (TUSK I) Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M1A2" >> "RHS_M1A2SEP_wd_TUSK_Section"]],0],
	// RHS_M1A2SEP_wd_TUSK2_Platoon, M1A2SEPv1 (TUSK II) Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M1A2" >> "RHS_M1A2SEP_wd_TUSK2_Platoon"]],0],
	// RHS_M1A2SEP_wd_TUSK2_Platoon_AA, M1A2SEPv1 (TUSK II) Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M1A2" >> "RHS_M1A2SEP_wd_TUSK2_Platoon_AA"]],0],
	// RHS_M1A2SEP_wd_TUSK2_Section, M1A2SEPv1 (TUSK II) Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M1A2" >> "RHS_M1A2SEP_wd_TUSK2_Section"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_wd", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1995,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_wd_HMMWV, Пехота (HMMWV)
	// BUS_MotInf_Team_GMG, Mot. Team (GMG)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_HMMWV" >> "BUS_MotInf_Team_GMG"]],0],
	// BUS_MotInf_Team_HMG, Mot. Team (HMG)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_HMMWV" >> "BUS_MotInf_Team_HMG"]],0],
	// BUS_MotInf_AT, Mot. Anti-armor Team
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_HMMWV" >> "BUS_MotInf_AT"]],0],
	// BUS_MotInf_AA, Mot. Air-defense Team
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_HMMWV" >> "BUS_MotInf_AA"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_wd", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1985,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_wd_M113, Пехота (М113)
	// rhs_group_nato_usarmy_wd_M113_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M113" >> "rhs_group_nato_usarmy_wd_M113_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_M113_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M113" >> "rhs_group_nato_usarmy_wd_M113_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_M113_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M113" >> "rhs_group_nato_usarmy_wd_M113_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_M113_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M113" >> "rhs_group_nato_usarmy_wd_M113_squad_mg_sniper"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_wd", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1985,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// >1988
	//- rhs_group_nato_usarmy_wd_bradley, Пехота (М2А2)
	// rhs_group_nato_usarmy_wd_bradley_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley" >> "rhs_group_nato_usarmy_wd_bradley_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_bradley_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley" >> "rhs_group_nato_usarmy_wd_bradley_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_bradley_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley" >> "rhs_group_nato_usarmy_wd_bradley_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_bradley_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley" >> "rhs_group_nato_usarmy_wd_bradley_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley" >> "rhs_group_nato_usarmy_d_bradley_aa"]],0.75],
	//- rhs_group_nato_usarmy_wd_bradley_busk, Пехота (М2А2 BUSK I)
	// rhs_group_nato_usarmy_wd_bradley_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley_busk" >> "rhs_group_nato_usarmy_wd_bradley_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_bradley_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley_busk" >> "rhs_group_nato_usarmy_wd_bradley_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_bradley_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley_busk" >> "rhs_group_nato_usarmy_wd_bradley_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_bradley_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley_busk" >> "rhs_group_nato_usarmy_wd_bradley_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradley_busk" >> "rhs_group_nato_usarmy_d_bradley_aa"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_wd", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1988,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// >2000
	//- rhs_group_nato_usarmy_wd_bradleyA3, Пехота (М2А3)
	// rhs_group_nato_usarmy_wd_bradleyA3_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_bradleyA3_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_bradleyA3_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_bradleyA3_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3" >> "rhs_group_nato_usarmy_d_bradleyA3_aa"]],0.75],
	//- rhs_group_nato_usarmy_wd_bradleyA3_busk, Пехота (М2А3 BUSK I)
	// rhs_group_nato_usarmy_wd_bradleyA3_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_bradleyA3_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_bradleyA3_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_bradleyA3_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk" >> "rhs_group_nato_usarmy_d_bradleyA3_aa"]],0.75],
	//- rhs_group_nato_usarmy_wd_bradleyA3_busk3, Пехота (М2А3 BUSK III)
	// rhs_group_nato_usarmy_wd_bradleyA3_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk3" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_bradleyA3_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk3" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_wd_bradleyA3_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk3" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_wd_bradleyA3_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk3" >> "rhs_group_nato_usarmy_wd_bradleyA3_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_bradleyA3_busk3" >> "rhs_group_nato_usarmy_d_bradleyA3_aa"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_wd", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2000,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// >2003
	//- rhs_group_nato_usarmy_wd_stryker, Пехота (Stryker)
	// rhs_group_nato_usarmy_wd_stryker_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_stryker" >> "rhs_group_nato_usarmy_wd_stryker_squad"]],0.75],
	// rhs_group_nato_usarmy_wd_stryker_wpnsquad, Ор. отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_stryker" >> "rhs_group_nato_usarmy_wd_stryker_wpnsquad"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_wd", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2003,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_wd_M109, M109 Artillery
	// RHS_M109_wd_Platoon, Artillery M109 Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M109" >> "RHS_M109_wd_Platoon"]],0],
	// RHS_M109_wd_Section, Artillery M109 Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_wd" >> "rhs_group_nato_usarmy_wd_M109" >> "RHS_M109_wd_Section"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_wd", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1973,2100], [160,250-1], __exclude
] call gosa_fnc_map_groups_add;

//-- rhs_faction_usarmy_d, США (Армия - Пустынный)
_arr = [
	// >2015 OCP
	//- rhs_group_nato_usarmy_d_infantry, Пехота
	// rhs_group_nato_usarmy_d_company_hq, Группа командира роты
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_company_hq"]],0.75],
	// rhs_group_nato_usarmy_d_platoon_hq, Отделение (Взвод)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_platoon_hq"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_infantry_squad"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_weaponsquad, Ор. отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_infantry_weaponsquad"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_infantry_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team, Команда
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_infantry_team"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team_MG, Команда (пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_infantry_team_MG"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team_AA, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_infantry_team_AA"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team_AT, Команда (ПТ)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_infantry_team_AT"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team_support, Команда (подд.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry" >> "rhs_group_nato_usarmy_d_infantry_team_support"]],0.75],

	//- rhs_group_nato_usarmy_d_infantry_arb, Пехота (Arb)
	// rhs_group_nato_usarmy_d_company_hq, Группа командира роты
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_company_hq"]],0.75],
	// rhs_group_nato_usarmy_d_platoon_hq, Отделение (Взвод)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_platoon_hq"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_infantry_squad"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_weaponsquad, Ор. отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_infantry_weaponsquad"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_infantry_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team, Команда
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_infantry_team"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team_MG, Команда (пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_infantry_team_MG"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team_AA, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_infantry_team_AA"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team_AT, Команда (ПТ)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_infantry_team_AT"]],0.75],
	// rhs_group_nato_usarmy_d_infantry_team_support, Команда (подд.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_infantry_arb" >> "rhs_group_nato_usarmy_d_infantry_team_support"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_d", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1985,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_d_RG33, Пехота (RG-33)
	// rhs_group_nato_usarmy_d_RG33_squad, Отряд (RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_RG33" >> "rhs_group_nato_usarmy_d_RG33_squad"]],0.75],
	// rhs_group_nato_usarmy_d_RG33_squad_2mg, Отряд (2x пул./RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_RG33" >> "rhs_group_nato_usarmy_d_RG33_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_RG33_squad_sniper, Отряд (Снайпер/RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_RG33" >> "rhs_group_nato_usarmy_d_RG33_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_RG33_squad_mg_sniper, Отряд (Снайпер + пул./RG-33)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_RG33" >> "rhs_group_nato_usarmy_d_RG33_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_RG33_m2_squad, Отряд (RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_RG33" >> "rhs_group_nato_usarmy_d_RG33_m2_squad"]],0.75],
	// rhs_group_nato_usarmy_d_RG33_m2_squad_2mg, Отряд (2x пул./RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_RG33" >> "rhs_group_nato_usarmy_d_RG33_m2_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_RG33_m2_squad_sniper, Отряд (Снайпер/RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_RG33" >> "rhs_group_nato_usarmy_d_RG33_m2_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_RG33_m2_squad_mg_sniper, Отряд (Снайпер + пул./RG-33 М2)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_RG33" >> "rhs_group_nato_usarmy_d_RG33_m2_squad_mg_sniper"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_d", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2007,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_d_FMTV, Пехота (FMTV)
	// rhs_group_nato_usarmy_d_FMTV_1078_squad, Отряд (М1078)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_FMTV" >> "rhs_group_nato_usarmy_d_FMTV_1078_squad"]],0.75],
	// rhs_group_nato_usarmy_d_FMTV_1078_squad_2mg, Отряд (2x пул./М1078)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_FMTV" >> "rhs_group_nato_usarmy_d_FMTV_1078_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_FMTV_1078_squad_sniper, Отряд (Снайпер/М1078)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_FMTV" >> "rhs_group_nato_usarmy_d_FMTV_1078_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_FMTV_1078_squad_mg_sniper, Отряд (Снайпер + пул./М1078)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_FMTV" >> "rhs_group_nato_usarmy_d_FMTV_1078_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_FMTV_1083_squad, Отряд (М1083)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_FMTV" >> "rhs_group_nato_usarmy_d_FMTV_1083_squad"]],0.75],
	// rhs_group_nato_usarmy_d_FMTV_1083_squad_2mg, Отряд (2x пул./М1083)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_FMTV" >> "rhs_group_nato_usarmy_d_FMTV_1083_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_FMTV_1083_squad_sniper, Отряд (Снайпер/М1083)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_FMTV" >> "rhs_group_nato_usarmy_d_FMTV_1083_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_FMTV_1083_squad_mg_sniper, Отряд (Снайпер + пул./М1083)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_FMTV" >> "rhs_group_nato_usarmy_d_FMTV_1083_squad_mg_sniper"]],0.75],

	//- rhs_group_nato_usarmy_d_m1a1, M1A1 Groups
	// RHS_M1A1AIM_Platoon, M1A1AIM Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_m1a1" >> "RHS_M1A1AIM_Platoon"]],0],
	// RHS_M1A1AIM_Platoon_AA, M1A1AIM Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_m1a1" >> "RHS_M1A1AIM_Platoon_AA"]],0],
	// RHS_M1A1AIM_Section, M1A1AIM Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_m1a1" >> "RHS_M1A1AIM_Section"]],0],
	// RHS_M1A1AIM_TUSK_Platoon, M1A1AIM (TUSK I) Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_m1a1" >> "RHS_M1A1AIM_TUSK_Platoon"]],0],
	// RHS_M1A1AIM_TUSK_Platoon_AA, M1A1AIM (TUSK I) Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_m1a1" >> "RHS_M1A1AIM_TUSK_Platoon_AA"]],0],
	// RHS_M1A1AIM_TUSK_Section, M1A1AIM (TUSK I) Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_m1a1" >> "RHS_M1A1AIM_TUSK_Section"]],0],
	//- rhs_group_nato_usarmy_d_M1A2, M1A2 Groups
	// RHS_M1A2SEP_Platoon, M1A2SEPv1 Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M1A2" >> "RHS_M1A2SEP_Platoon"]],0],
	// RHS_M1A2SEP_Platoon_AA, M1A2SEPv1 Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M1A2" >> "RHS_M1A2SEP_Platoon_AA"]],0],
	// RHS_M1A2SEP_Section, M1A2SEPv1 Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M1A2" >> "RHS_M1A2SEP_Section"]],0],
	// RHS_M1A2SEP_TUSK_Platoon, M1A2SEPv1 (TUSK I) Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M1A2" >> "RHS_M1A2SEP_TUSK_Platoon"]],0],
	// RHS_M1A2SEP_TUSK_Platoon_AA, M1A2SEPv1 (TUSK I) Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M1A2" >> "RHS_M1A2SEP_TUSK_Platoon_AA"]],0],
	// RHS_M1A2SEP_TUSK_Section, M1A2SEPv1 (TUSK I) Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M1A2" >> "RHS_M1A2SEP_TUSK_Section"]],0],
	// RHS_M1A2SEP_d_TUSK2_Platoon, M1A2SEPv1 (TUSK II) Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M1A2" >> "RHS_M1A2SEP_d_TUSK2_Platoon"]],0],
	// RHS_M1A2SEP_d_TUSK2_Platoon_AA, M1A2SEPv1 (TUSK II) Platoon (Combined)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M1A2" >> "RHS_M1A2SEP_d_TUSK2_Platoon_AA"]],0],
	// RHS_M1A2SEP_d_TUSK2_Section, M1A2SEPv1 (TUSK II) Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M1A2" >> "RHS_M1A2SEP_d_TUSK2_Section"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_d", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1995,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_d_HMMWV, Пехота (HMMWV)
	// BUS_MotInf_Team_GMG, Mot. Team (GMG)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_HMMWV" >> "BUS_MotInf_Team_GMG"]],0],
	// BUS_MotInf_Team_HMG, Mot. Team (HMG)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_HMMWV" >> "BUS_MotInf_Team_HMG"]],0],
	// BUS_MotInf_AT, Mot. Anti-armor Team
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_HMMWV" >> "BUS_MotInf_AT"]],0],
	// BUS_MotInf_AA, Mot. Air-defense Team
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_HMMWV" >> "BUS_MotInf_AA"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_d", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1985,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_d_M113, Пехота (М113)
	// rhs_group_nato_usarmy_d_M113_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M113" >> "rhs_group_nato_usarmy_d_M113_squad"]],0.75],
	// rhs_group_nato_usarmy_d_M113_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M113" >> "rhs_group_nato_usarmy_d_M113_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_M113_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M113" >> "rhs_group_nato_usarmy_d_M113_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_M113_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M113" >> "rhs_group_nato_usarmy_d_M113_squad_mg_sniper"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_d", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1985,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_d_bradley, Пехота (М2А2)
	// rhs_group_nato_usarmy_d_bradley_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley" >> "rhs_group_nato_usarmy_d_bradley_squad"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley" >> "rhs_group_nato_usarmy_d_bradley_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley" >> "rhs_group_nato_usarmy_d_bradley_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley" >> "rhs_group_nato_usarmy_d_bradley_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley" >> "rhs_group_nato_usarmy_d_bradley_aa"]],0.75],
	//- rhs_group_nato_usarmy_d_bradley_busk, Пехота (М2А2 BUSK I)
	// rhs_group_nato_usarmy_d_bradley_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley_busk" >> "rhs_group_nato_usarmy_d_bradley_squad"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley_busk" >> "rhs_group_nato_usarmy_d_bradley_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley_busk" >> "rhs_group_nato_usarmy_d_bradley_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley_busk" >> "rhs_group_nato_usarmy_d_bradley_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradley_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradley_busk" >> "rhs_group_nato_usarmy_d_bradley_aa"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_d", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1988,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_d_bradleyA3, Пехота (М2А3)
	// rhs_group_nato_usarmy_d_bradleyA3_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3" >> "rhs_group_nato_usarmy_d_bradleyA3_squad"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3" >> "rhs_group_nato_usarmy_d_bradleyA3_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3" >> "rhs_group_nato_usarmy_d_bradleyA3_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3" >> "rhs_group_nato_usarmy_d_bradleyA3_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3" >> "rhs_group_nato_usarmy_d_bradleyA3_aa"]],0.75],
	//- rhs_group_nato_usarmy_d_bradleyA3_busk, Пехота (М2А3 BUSK I)
	// rhs_group_nato_usarmy_d_bradleyA3_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk" >> "rhs_group_nato_usarmy_d_bradleyA3_squad"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk" >> "rhs_group_nato_usarmy_d_bradleyA3_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk" >> "rhs_group_nato_usarmy_d_bradleyA3_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk" >> "rhs_group_nato_usarmy_d_bradleyA3_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk" >> "rhs_group_nato_usarmy_d_bradleyA3_aa"]],0.75],
	//- rhs_group_nato_usarmy_d_bradleyA3_busk3, Пехота (М2А3 BUSK III)
	// rhs_group_nato_usarmy_d_bradleyA3_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk3" >> "rhs_group_nato_usarmy_d_bradleyA3_squad"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_squad_2mg, Отряд (2x пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk3" >> "rhs_group_nato_usarmy_d_bradleyA3_squad_2mg"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_squad_sniper, Отряд (снайпер)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk3" >> "rhs_group_nato_usarmy_d_bradleyA3_squad_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_squad_mg_sniper, Отряд (Снайпер + пул.)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk3" >> "rhs_group_nato_usarmy_d_bradleyA3_squad_mg_sniper"]],0.75],
	// rhs_group_nato_usarmy_d_bradleyA3_aa, Команда (ПВО)
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_bradleyA3_busk3" >> "rhs_group_nato_usarmy_d_bradleyA3_aa"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_d", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2000,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_d_stryker, Пехота (Stryker)
	// rhs_group_nato_usarmy_d_stryker_squad, Отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_stryker" >> "rhs_group_nato_usarmy_d_stryker_squad"]],0.75],
	// rhs_group_nato_usarmy_d_stryker_wpnsquad, Ор. отряд
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_stryker" >> "rhs_group_nato_usarmy_d_stryker_wpnsquad"]],0.75]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_d", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2003,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhs_group_nato_usarmy_d_M109, M109 Artillery
	// RHS_M109_Platoon, Artillery M109 Platoon
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M109" >> "RHS_M109_Platoon"]],0],
	// RHS_M109_Section, Artillery M109 Section
	[[[configFile >> "CfgGroups" >> "West" >> "rhs_faction_usarmy_d" >> "rhs_group_nato_usarmy_d_M109" >> "RHS_M109_Section"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhs_faction_usarmy_d", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1973,2100], [250,999], __exclude
] call gosa_fnc_map_groups_add;


#define __cfg configFile >> "CfgGroups" >> "West" >> "rhsgref_faction_hidf"
//-- rhsgref_faction_hidf, Horizon Islands Defence Force
_arr = [
	//- rhsgref_group_hidf_infantry, Infantry
	// rhsgref_group_hidf_infantry_squad, Отряд
	[[[__cfg >>"rhsgref_group_hidf_infantry" >> "rhsgref_group_hidf_infantry_squad"]],_rarity_InfSquad],
	// rhs_group_hidf_infantry_weaponsquad, Ор. отряд
	[[[__cfg >>"rhsgref_group_hidf_infantry" >> "rhs_group_hidf_infantry_weaponsquad"]],_rarity_InfSquad_Weapon],
	// rhs_group_hidf_infantry_squad_sniper, Отряд (снайпер)
	[[[__cfg >>"rhsgref_group_hidf_infantry" >> "rhs_group_hidf_infantry_squad_sniper"]],_rarity_InfSquad_Weapon],
	// rhs_group_hidf_infantry_team, Команда
	[[[__cfg >>"rhsgref_group_hidf_infantry" >> "rhs_group_hidf_infantry_team"]],_rarity_InfTeam],
	// rhs_group_hidf_infantry_team_MG, Команда (пул.)
	[[[__cfg >>"rhsgref_group_hidf_infantry" >> "rhs_group_hidf_infantry_team_MG"]],_rarity_InfTeam_MG],
	// rhs_group_hidf_infantry_team_AT, Команда (ПТ)
	[[[__cfg >>"rhsgref_group_hidf_infantry" >> "rhs_group_hidf_infantry_team_AT"]],_rarity_InfTeam_AT],
	// rhs_group_hidf_infantry_team_support, Команда (подд.)
	[[[__cfg >>"rhsgref_group_hidf_infantry" >> "rhs_group_hidf_infantry_team_support"]],_rarity_bad],
	//- rhsgref_group_hidf_m113, Mechanized (M113)
	// rhsgref_group_hidf_m113_squad, Squad
	[[[__cfg >>"rhsgref_group_hidf_m113" >> "rhsgref_group_hidf_m113_squad"]],_rarity_MechInfSquad],
	// rhsgref_group_hidf_m113_squad_2mg, Squad (2x GPMG)
	[[[__cfg >>"rhsgref_group_hidf_m113" >> "rhsgref_group_hidf_m113_squad_2mg"]],_rarity_MechInf_HMG]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhsgref_faction_hidf", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1964,1990], [150,250-1],
	[]
] call gosa_fnc_map_groups_add;
_arr = [
	//- rhsgref_group_hidf_hmmwv, Motorized (M1025)
	// rhsgref_group_hidf_m1025_gmg, Mot. Team (GMG)
	[[[__cfg >>"rhsgref_group_hidf_hmmwv" >> "rhsgref_group_hidf_m1025_gmg"]],_rarity_MechInf_GMG],
	// rhsgref_group_hidf_m1025_hmg, Mot. Team (HMG)
	[[[__cfg >>"rhsgref_group_hidf_hmmwv" >> "rhsgref_group_hidf_m1025_hmg"]],_rarity_MechInf_HMG]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, west, "rhsgref_faction_hidf", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1983,2000], [150,250-1],
	[]
] call gosa_fnc_map_groups_add;


//--- Indep
#define __exclude ["IND_F","IND_E_F","IND_G_F","IND_C_F"]
_arr = [
	// rhssaf_group_army_m93_oakleaf_company_hq
	[[[["rhssaf_army_m93_oakleaf_summer_officer","rhssaf_army_m93_oakleaf_summer_officer","rhssaf_army_m93_oakleaf_summer_sq_lead","rhssaf_army_m93_oakleaf_summer_rifleman_m70"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m93_oakleaf_platoon_hq
	[[[["rhssaf_army_m93_oakleaf_summer_officer","rhssaf_army_m93_oakleaf_summer_sq_lead","rhssaf_army_m93_oakleaf_summer_medic","rhssaf_army_m93_oakleaf_summer_sq_lead","rhssaf_army_m93_oakleaf_summer_rifleman_m70","rhssaf_army_m93_oakleaf_summer_rifleman_m70"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m93_oakleaf_infantry_squad
	[[[["rhssaf_army_m93_oakleaf_summer_sq_lead","rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_rifleman_m70","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
	],0.75],
	// rhssaf_group_army_m93_oakleaf_infantry_weaponsquad
	[[[["rhssaf_army_m93_oakleaf_summer_sq_lead","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_asst_mgun","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]
	],0.3],
	// rhssaf_group_army_m93_oakleaf_infantry_squad_sniper
	[[[["rhssaf_army_m93_oakleaf_summer_sq_lead","rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_sniper_m76","rhssaf_army_m93_oakleaf_summer_asst_mgun","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
	],0.3],
	// rhssaf_group_army_m93_oakleaf_infantry_team
	[[[["rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.2],
	// rhssaf_group_army_m93_oakleaf_infantry_team_mg
	[[[["rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_asst_mgun"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.2],
	// rhssaf_group_army_m93_oakleaf_infantry_team_AA
	[[[["rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_spec_aa"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m93_oakleaf_infantry_team_support
	[[[["rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_medic"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.2],
	// rhssaf_group_army_m93_oakleaf_infantry_team_heavy_at
	[[[["rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_spec_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.4],
	// rhssaf_group_army_ural_squad
	[[[["rhssaf_army_m93_oakleaf_summer_sq_lead","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_ural","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_rifleman_at","rhssaf_army_m93_oakleaf_summer_rifleman_m70","rhssaf_army_m93_oakleaf_summer_sniper_m76"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_ural_squad_mg
	[[[["rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_rifleman_m70","rhssaf_army_m93_oakleaf_summer_rifleman_m70","rhssaf_army_ural_open","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_rifleman_at","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_mgun_m84"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.2],
	// rhssaf_group_army_ural_squad_sniper
	[[[["rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_rifleman_m70","rhssaf_army_m93_oakleaf_summer_sniper_m76","rhssaf_army_ural","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_rifleman_at","rhssaf_army_m93_oakleaf_summer_medic","rhssaf_army_m93_oakleaf_summer_rifleman_m21","rhssaf_army_m93_oakleaf_summer_rifleman_m21"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_ural_squad_mg_sniper
	[[[["rhssaf_army_m93_oakleaf_summer_sq_lead","rhssaf_army_m93_oakleaf_summer_ft_lead","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_ural","rhssaf_army_m93_oakleaf_summer_sniper_m76","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_rifleman_at","rhssaf_army_m93_oakleaf_summer_rifleman_m70","rhssaf_army_m93_oakleaf_summer_rifleman_m70"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1]
];
_arr append [
	// rhssaf_group_army_m10_digital_company_hq
	[[[["rhssaf_army_m10_digital_officer","rhssaf_army_m10_digital_officer","rhssaf_army_m10_digital_sq_lead","rhssaf_army_m10_digital_rifleman_m21"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m10_digital_platoon_hq
	[[[["rhssaf_army_m10_digital_officer","rhssaf_army_m10_digital_sq_lead","rhssaf_army_m10_digital_medic","rhssaf_army_m10_digital_sq_lead","rhssaf_army_m10_digital_rifleman_m21","rhssaf_army_m10_digital_rifleman_m70"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m10_digital_infantry_squad
	[[[["rhssaf_army_m10_digital_sq_lead","rhssaf_army_m10_digital_ft_lead","rhssaf_army_m10_digital_rifleman_m21","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_ft_lead","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
	// rhssaf_group_army_m10_digital_infantry_weaponsquad
	[[[["rhssaf_army_m10_digital_sq_lead","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_asst_mgun","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]
	],0.2],
	// rhssaf_group_army_m10_digital_infantry_squad_sniper
	[[[["rhssaf_army_m10_digital_sq_lead","rhssaf_army_m10_digital_ft_lead","rhssaf_army_m10_digital_sniper_m76","rhssaf_army_m10_digital_asst_mgun","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_ft_lead","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
	],0.2],
	// rhssaf_group_army_m10_digital_infantry_team
	[[[["rhssaf_army_m10_digital_ft_lead","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.2],
	// rhssaf_group_army_m10_digital_infantry_team_mg
	[[[["rhssaf_army_m10_digital_ft_lead","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_asst_mgun"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.2],
	// rhssaf_group_army_m10_digital_infantry_team_AA
	[[[["rhssaf_army_m10_digital_ft_lead","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_spec_aa"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m10_digital_infantry_team_support
	[[[["rhssaf_army_m10_digital_ft_lead","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_medic"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m10_digital_infantry_team_heavy_at
	[[[["rhssaf_army_m10_digital_ft_lead","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_spec_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],

	// rhssaf_group_army_m10_para_company_hq
	[[[["rhssaf_army_m10_para_officer","rhssaf_army_m10_para_officer","rhssaf_army_m10_para_sq_lead","rhssaf_army_m10_para_rifleman_g36"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT","PRIVATE"]]
	],0.05],
	// rhssaf_group_army_m10_para_platoon_hq
	[[[["rhssaf_army_m10_para_officer","rhssaf_army_m10_para_sq_lead","rhssaf_army_m10_para_medic","rhssaf_army_m10_para_sq_lead","rhssaf_army_m10_para_rifleman_g36","rhssaf_army_m10_para_rifleman_hk416"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.05],
	// rhssaf_group_army_m10_para_infantry_squad
	[[[["rhssaf_army_m10_para_sq_lead","rhssaf_army_m10_para_ft_lead","rhssaf_army_m10_para_rifleman_m21","rhssaf_army_m10_para_mgun_m84","rhssaf_army_m10_para_gl_ag36","rhssaf_army_m10_para_ft_lead","rhssaf_army_m10_para_mgun_minimi","rhssaf_army_m10_para_gl_ag36","rhssaf_army_m10_para_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
	],0.5],
	// rhssaf_group_army_m10_para_infantry_weaponsquad
	[[[["rhssaf_army_m10_para_sq_lead","rhssaf_army_m10_para_mgun_minimi","rhssaf_army_m10_para_asst_mgun_minimi","rhssaf_army_m10_para_gl_ag36","rhssaf_army_m10_para_mgun_m84","rhssaf_army_m10_para_asst_mgun_m84","rhssaf_army_m10_para_gl_m320","rhssaf_army_m10_para_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m10_para_infantry_squad_sniper
	[[[["rhssaf_army_m10_para_sq_lead","rhssaf_army_m10_para_ft_lead","rhssaf_army_m10_para_sniper_m76","rhssaf_army_m10_para_asst_mgun_m84","rhssaf_army_m10_para_sniper_m82a1","rhssaf_army_m10_para_ft_lead","rhssaf_army_m10_para_mgun_m84","rhssaf_army_m10_para_gl_ag36","rhssaf_army_m10_para_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m10_para_infantry_team
	[[[["rhssaf_army_m10_para_ft_lead","rhssaf_army_m10_para_mgun_minimi","rhssaf_army_m10_para_gl_m320","rhssaf_army_m10_para_rifleman_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m10_para_infantry_team_mg
	[[[["rhssaf_army_m10_para_ft_lead","rhssaf_army_m10_para_mgun_minimi","rhssaf_army_m10_para_gl_ag36","rhssaf_army_m10_para_asst_mgun_minimi"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.1],
	// rhssaf_group_army_m10_para_infantry_team_AA
	[[[["rhssaf_army_m10_para_ft_lead","rhssaf_army_m10_para_mgun_minimi","rhssaf_army_m10_para_gl_m320","rhssaf_army_m10_para_spec_aa"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.05],
	// rhssaf_group_army_m10_para_infantry_team_support
	[[[["rhssaf_army_m10_para_ft_lead","rhssaf_army_m10_para_mgun_m84","rhssaf_army_m10_para_gl_ag36","rhssaf_army_m10_para_medic"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.05],
	// rhssaf_group_army_m10_para_infantry_team_heavy_at
	[[[["rhssaf_army_m10_para_ft_lead","rhssaf_army_m10_para_mgun_minimi","rhssaf_army_m10_para_gl_m320","rhssaf_army_m10_para_spec_at"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.05],

	// rhssaf_group_army_motorized_infantry_team_hmg
	[[[["rhssaf_m1025_olive_m2","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_rifleman_at","rhssaf_army_m10_digital_gl"],[[0,0,0],[-12,-12,0],[14,-13,0],[5,0,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL"]]
	],0.01],
	// rhssaf_group_army_motorized_infantry_team_at
	[[[["rhssaf_m1025_olive","rhssaf_army_m10_digital_spec_at","rhssaf_army_m10_digital_spec_at","rhssaf_army_m10_digital_asst_spec_at"],[[0,0,0],[13,-12,0],[-12,-13,0],[18,-17,-2]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]
	],0.01],
	// rhssaf_group_army_motorized_infantry_team_aa
	[[[["rhssaf_m1025_olive","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_spec_aa","rhssaf_army_m10_digital_asst_spec_aa"],[[0,0,0],[13,-12,0],[-12,-13,0],[18,-17,-2]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]
	],0.01]
];
_arr append [
	// rhssaf_army_group_t72s_platoon
	[[[["rhssaf_army_t72s","rhssaf_army_t72s","rhssaf_army_t72s"],[[0,0,0],[20,-30,3],[-21,-30,3]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.1],
	// rhssaf_army_group_t72s_section
	[[[["rhssaf_army_t72s","rhssaf_army_t72s"],[[0,0,0],[20,-30,2]],["LIEUTENANT","SERGEANT"]]],0.1]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, resistance, "rhssaf_army", _arr,
	[1990,2100], [160,999],
	["IND_F","IND_E_F","IND_G_F","IND_C_F"]
] call gosa_fnc_map_groups_add;

#define __cfg configFile >> "CfgGroups" >> "Indep" >> "rhsgref_faction_nationalist"
//-- rhsgref_faction_nationalist, Nationalist Militia
_arr = [
	//- rhsgref_group_national_infantry, Infantry
	// rhsgref_group_national_infantry_squad, Group (Mixed)
	[[[__cfg >>"rhsgref_group_national_infantry" >> "rhsgref_group_national_infantry_squad"]],_rarity_InfSquad],
	// rhsgref_group_national_infantry_squad_2, Group (AT)
	[[[__cfg >>"rhsgref_group_national_infantry" >> "rhsgref_group_national_infantry_squad_2"]],_rarity_InfSquad_Weapon],
	// rhsgref_group_national_infantry_patrol, Cell
	[[[__cfg >>"rhsgref_group_national_infantry" >> "rhsgref_group_national_infantry_patrol"]],_rarity_InfTeam],
	// rhsgref_group_national_infantry_mg, MG pair
	[[[__cfg >>"rhsgref_group_national_infantry" >> "rhsgref_group_national_infantry_mg"]],_rarity_InfTeam_MG],
	// rhsgref_group_national_infantry_at, AT pair
	[[[__cfg >>"rhsgref_group_national_infantry" >> "rhsgref_group_national_infantry_at"]],_rarity_InfTeam_AT]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, resistance, "rhsgref_faction_nationalist", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1964,2030], [150,250-1], __exclude
] call gosa_fnc_map_groups_add;

_arr = [
	//- rhs_group_indp_nat_ural, Motorized (Ural-4320)
	// rhs_group_nat_ural_chq, Группа командира роты
	[[[__cfg >>"rhs_group_indp_nat_ural" >> "rhs_group_nat_ural_chq"]],_rarity_bad/5],
	// rhs_group_nat_ural_squad, Отряд
	[[[__cfg >>"rhs_group_indp_nat_ural" >> "rhs_group_nat_ural_squad"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_nat_ural_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >>"rhs_group_indp_nat_ural" >> "rhs_group_nat_ural_squad_2mg"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_nat_ural_squad_sniper, Отряд (снайпер)
	[[[__cfg >>"rhs_group_indp_nat_ural" >> "rhs_group_nat_ural_squad_sniper"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_nat_ural_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >>"rhs_group_indp_nat_ural" >> "rhs_group_nat_ural_squad_mg_sniper"]],_rarity_MotInf_Reinforce/5],
	// rhs_group_nat_ural_squad_aa, Отряд ПВО
	[[[__cfg >>"rhs_group_indp_nat_ural" >> "rhs_group_nat_ural_squad_aa"]],_rarity_MotInf_Reinforce/5],

	//- rhs_group_nat_uaz, Motorized (UAZ)
	// BUS_MotInf_Team_GMG, Mot. Team (AGS-30)
	[[[__cfg >>"rhs_group_nat_uaz" >> "BUS_MotInf_Team_GMG"]],_rarity_MotInf_GMGTeam],
	// BUS_MotInf_Team_HMG, Mot. Team (DShkM)
	[[[__cfg >>"rhs_group_nat_uaz" >> "BUS_MotInf_Team_HMG"]],_rarity_MotInf_HMGTeam],
	// BUS_MotInf_AT, Mot. Team (SPG-9)
	[[[__cfg >>"rhs_group_nat_uaz" >> "BUS_MotInf_AT"]],_rarity_MotInf_AT],
	// BUS_MotInf_AA, Mot. Air-defense Team
	[[[__cfg >>"rhs_group_nat_uaz" >> "BUS_MotInf_AA"]],_rarity_MotInf_AA],

	//- rhs_group_indp_nat_btr70, Motorized (BTR-70)
	// rhs_group_nat_btr70_chq, Группа командира роты
	[[[__cfg >>"rhs_group_indp_nat_btr70" >> "rhs_group_nat_btr70_chq"]],_rarity_bad],
	// rhs_group_nat_btr70_squad, Отряд
	[[[__cfg >>"rhs_group_indp_nat_btr70" >> "rhs_group_nat_btr70_squad"]],_rarity_MotInf_Team],
	// rhs_group_nat_btr70_squad_2mg, Отряд (2x ПКМ)
	[[[__cfg >>"rhs_group_indp_nat_btr70" >> "rhs_group_nat_btr70_squad_2mg"]],_rarity_MotInf_MG/3],
	// rhs_group_nat_btr70_squad_sniper, Отряд (снайпер)
	[[[__cfg >>"rhs_group_indp_nat_btr70" >> "rhs_group_nat_btr70_squad_sniper"]],_rarity_MotInf_MG/3],
	// rhs_group_nat_btr70_squad_mg_sniper, Отряд (снайпер + ПКМ)
	[[[__cfg >>"rhs_group_indp_nat_btr70" >> "rhs_group_nat_btr70_squad_mg_sniper"]],_rarity_MotInf_MG/3],
	// rhs_group_nat_btr70_squad_aa, Отряд ПВО
	[[[__cfg >>"rhs_group_indp_nat_btr70" >> "rhs_group_nat_btr70_squad_aa"]],_rarity_MotInf_AA]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, resistance, "rhsgref_faction_nationalist", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1973,2030], [150,250-1], __exclude
] call gosa_fnc_map_groups_add;
