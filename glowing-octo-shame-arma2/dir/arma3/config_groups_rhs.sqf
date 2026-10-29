
#include "..\include\ranks.sqf"

//--- East
#define __exclude ["CUP_O_RU","OPF_SFIA_lxWS","OPF_TURA_lxWS","OPF_T_F","OPF_F","OPF_G_F","OPF_R_F"]
#define __cfg configFile >> "CfgGroups" >> "East" >> "rhs_faction_msv"
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
[1964,2010], [160,999],
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
[2010,2100], [160,999],
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
[1972,1990], [160,999],
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
[1982,2100], [160,999],
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
[1990,2100], [160,999],
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
[1966,1990], [160,999],
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
[1987,2100], [160,999],
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
[1980,2030], [160,999],
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
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90Platoon"]],0],
	// RHS_T90Platoon_AA, T-90 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90Platoon_AA"]],0],
	// RHS_T90Section, T-90 Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90Section"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1992,2015], [160,999],
	__exclude
] call gosa_fnc_map_groups_add;

// >2004, Сирия с 2015
_arr = [
	// RHS_t90aPlatoon, T-90A Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_t90aPlatoon"]],0],
	// RHS_t90aPlatoon_AA, T-90A Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_t90aPlatoon_AA"]],0],
	// RHS_t90aSection, T-90A Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_t90aSection"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2004,2020], [160,225-1],
	__exclude
] call gosa_fnc_map_groups_add;

// 2020-е
_arr = [
	// RHS_T90AMPlatoon, T-90AM Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90AMPlatoon"]],0],
	// RHS_T90AMPlatoon_AA, T-90AM Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90AMPlatoon_AA"]],0],
	// RHS_T90AMSection, T-90AM Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90AMSection"]],0],

	// RHS_T90SMPlatoon, T-90SM Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SMPlatoon"]],0],
	// RHS_T90SMPlatoon_AA, T-90SM Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SMPlatoon_AA"]],0],
	// RHS_T90SMSection, T-90SM Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SMSection"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2016,2030], [160,225-1],
	__exclude
] call gosa_fnc_map_groups_add;

// Экспорт
_arr = [
	// RHS_T90SAPlatoon, T-90SA g.2004 Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SAPlatoon"]],0],
	// RHS_T90SAPlatoon_AA, T-90SA g.2004 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SAPlatoon_AA"]],0],
	// RHS_T90SASection, T-90SA g.2004 Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SASection"]],0]
]; [_arr] call gosa_fnc_groups_convNormal;
[_groups_map, east, "RHS_TV", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[2004,2020], [225,999],
	__exclude
] call gosa_fnc_map_groups_add;
_arr = [
	// RHS_T90SABPlatoon, T-90SA g.2016 Platoon
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SABPlatoon"]],0],
	// RHS_T90SABPlatoon_AA, T-90SA g.2016 Platoon (Combined)
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SABPlatoon_AA"]],0],
	// RHS_T90SABSection, T-90SA g.2016 Section
	[[[__cfg >> "rhs_group_rus_tv_90" >> "RHS_T90SABSection"]],0]
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


//--- West
// nato_usmc_wd
[_groups_map, west, "RHS_USMC_WD", [[
	// configName "rhs_group_nato_usmc_wd_infantry_squad",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman",
		"rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_rifleman_m4",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman",
		"rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_riflemanat",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman",
		"rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_marksman"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE","CORPORAL","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_infantry_weaponsquad",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_machinegunner",
		"rhsusf_usmc_marpat_wd_machinegunner_ass","rhsusf_usmc_marpat_wd_teamleader",
		"rhsusf_usmc_marpat_wd_machinegunner","rhsusf_usmc_marpat_wd_machinegunner_ass"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[9,0,0],[11,0,0],[13,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"CORPORAL","CORPORAL",
		"PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_infantry_squad_sniper",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_sniper","rhsusf_usmc_marpat_wd_spotter",
		"rhsusf_usmc_marpat_wd_sniper","rhsusf_usmc_marpat_wd_spotter",
		"rhsusf_usmc_marpat_wd_sniper","rhsusf_usmc_marpat_wd_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[9,0,0],[11,0,0],[13,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"CORPORAL","PRIVATE",
		"CORPORAL","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_infantry_team",
	[[[["rhsusf_usmc_marpat_wd_teamleader",
		"rhsusf_usmc_marpat_wd_autorifleman","rhsusf_usmc_marpat_wd_rifleman_m4",
		"rhsusf_usmc_marpat_wd_riflemanat"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_infantry_team_MG",
	[[[["rhsusf_usmc_marpat_wd_teamleader",
		"rhsusf_usmc_marpat_wd_machinegunner","rhsusf_usmc_marpat_wd_machinegunner_ass",
		"rhsusf_usmc_marpat_wd_rifleman_m4"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_infantry_team_AA",
	[[[["rhsusf_usmc_marpat_wd_teamleader",
		"rhsusf_usmc_marpat_wd_autorifleman","rhsusf_usmc_marpat_wd_rifleman_m4",
		"rhsusf_usmc_marpat_wd_stinger"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT",
		"PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_infantry_team_support",
	[[[["rhsusf_usmc_marpat_wd_teamleader",
		"rhsusf_usmc_marpat_wd_autorifleman","rhsusf_usmc_marpat_wd_rifleman_m4",
		"rhsusf_navy_marpat_wd_medic"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT",
		"PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_infantry_team_heavy_AT",
	[[[["rhsusf_usmc_marpat_wd_teamleader",
		"rhsusf_usmc_marpat_wd_autorifleman","rhsusf_usmc_marpat_wd_rifleman_m4",
		"rhsusf_usmc_marpat_wd_javelin"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT",
		"PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_wd_infantry_team",
	[[[["rhsusf_usmc_recon_marpat_wd_teamleader",
		"rhsusf_usmc_recon_marpat_wd_marksman","rhsusf_usmc_recon_marpat_wd_autorifleman",
		"rhsusf_usmc_recon_marpat_wd_rifleman_at","rhsusf_usmc_recon_marpat_wd_rifleman",
		"rhsusf_usmc_recon_marpat_wd_machinegunner_m249"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL",
		"CORPORAL","CORPORAL",
		"CORPORAL"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_wd_infantry_team_MG",
	[[[["rhsusf_usmc_recon_marpat_wd_teamleader",
		"rhsusf_usmc_recon_marpat_wd_marksman","rhsusf_usmc_recon_marpat_wd_autorifleman",
		"rhsusf_usmc_recon_marpat_wd_rifleman_at","rhsusf_usmc_recon_marpat_wd_rifleman",
		"rhsusf_usmc_recon_marpat_wd_machinegunner"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_wd_infantry_team_support",
	[[[["rhsusf_usmc_recon_marpat_wd_teamleader",
		"rhsusf_usmc_recon_marpat_wd_marksman","rhsusf_usmc_recon_marpat_wd_autorifleman",
		"rhsusf_navy_sarc_w","rhsusf_usmc_recon_marpat_wd_rifleman",
		"rhsusf_usmc_recon_marpat_wd_machinegunner_m249"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_wd_infantry_team_lite",
	[[[["rhsusf_usmc_recon_marpat_wd_teamleader_lite",
		"rhsusf_usmc_recon_marpat_wd_marksman_lite","rhsusf_usmc_recon_marpat_wd_autorifleman_lite",
		"rhsusf_usmc_recon_marpat_wd_rifleman_at_lite","rhsusf_usmc_recon_marpat_wd_rifleman_lite",
		"rhsusf_usmc_recon_marpat_wd_machinegunner_m249_lite"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL",
		"CORPORAL","CORPORAL","CORPORAL"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_wd_infantry_team_fast",
	[[[["rhsusf_usmc_recon_marpat_wd_teamleader_fast",
		"rhsusf_usmc_recon_marpat_wd_marksman_fast","rhsusf_usmc_recon_marpat_wd_autorifleman_fast",
		"rhsusf_usmc_recon_marpat_wd_rifleman_at_fast","rhsusf_usmc_recon_marpat_wd_rifleman_fast",
		"rhsusf_usmc_recon_marpat_wd_machinegunner_m249_fast"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.75],
	// configName "BUS_MotInf_Team_GMG",
	[[[["rhsusf_m1025_w_s_Mk19",
		"rhsusf_usmc_marpat_wd_autorifleman","rhsusf_usmc_marpat_wd_riflemanat",
		"rhsusf_usmc_marpat_wd_rifleman"],[[0,0,0],[-12,-12,0],[14,-13,0],[5,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"CORPORAL"]]],0],
	// configName "BUS_MotInf_Team_HMG",
	[[[["rhsusf_m1025_w_s_m2",
		"rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_riflemanat",
		"rhsusf_usmc_marpat_wd_rifleman"],[[0,0,0],[-12,-12,0],[14,-13,0],[5,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"CORPORAL"]]],0],
	// configName "BUS_MotInf_AT",
	[[[["rhsusf_m1025_w_s",
		"rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_javelin",
		"rhsusf_usmc_marpat_wd_javelin"],[[0,0,0],[13,-12,0],[-12,-13,0],[18,-17,-2]],
		["SERGEANT",
		"CORPORAL","CORPORAL",
		"PRIVATE"]]],0],
	// configName "BUS_MotInf_AA",
	[[[["rhsusf_m1025_w_s",
		"rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_stinger",
		"rhsusf_usmc_marpat_wd_stinger"],[[0,0,0],[13,-12,0],[-12,-13,0],[18,-17,-2]],
		["SERGEANT",
		"CORPORAL","CORPORAL",
		"PRIVATE"]]],0],
	// configName "rhs_group_nato_usmc_wd_RG33_squad",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman",
		"rhsusf_rg33_usmc_wd","rhsusf_usmc_marpat_wd_autorifleman",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_riflemanat",
		"rhsusf_usmc_marpat_wd_marksman"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE",
		"PRIVATE","PRIVATE",
		"PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_RG33_squad_2mg",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_machinegunner",
		"rhsusf_rg33_usmc_wd","rhsusf_usmc_marpat_wd_machinegunner_ass",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_machinegunner",
		"rhsusf_usmc_marpat_wd_machinegunner_ass"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_RG33_squad_sniper",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_sniper",
		"rhsusf_rg33_usmc_wd","rhsusf_usmc_marpat_wd_spotter",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_sniper",
		"rhsusf_usmc_marpat_wd_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_RG33_squad_mg_sniper",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_army_ocp_teamleader","rhsusf_usmc_marpat_wd_machinegunner",
		"rhsusf_rg33_usmc_wd","rhsusf_usmc_marpat_wd_machinegunner_ass",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_sniper",
		"rhsusf_usmc_marpat_wd_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_RG33_m2_squad",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman",
		"rhsusf_rg33_m2_usmc_wd","rhsusf_usmc_marpat_wd_autorifleman",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_riflemanat",
		"rhsusf_usmc_marpat_wd_marksman"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_RG33_m2_squad_2mg",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_machinegunner",
		"rhsusf_rg33_m2_usmc_wd","rhsusf_usmc_marpat_wd_machinegunner_ass",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_machinegunner",
		"rhsusf_usmc_marpat_wd_machinegunner_ass"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_RG33_m2_squad_sniper",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman",
		"rhsusf_rg33_m2_usmc_wd","rhsusf_usmc_marpat_wd_spotter",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_sniper",
		"rhsusf_usmc_marpat_wd_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_wd_RG33_m2_squad_mg_sniper",
	[[[["rhsusf_usmc_marpat_wd_squadleader",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_machinegunner",
		"rhsusf_rg33_m2_usmc_wd","rhsusf_usmc_marpat_wd_machinegunner_ass",
		"rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_sniper",
		"rhsusf_usmc_marpat_wd_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "RHS_M1A1AIM_wd_Platoon",
	[[[["rhsusf_m1a1fep_wd",
		"rhsusf_m1a1fep_wd","rhsusf_m1a1fep_wd",
		"rhsusf_m1a1fep_wd"],[[0,0,0],[-20,-30,3],[20,-30,3],[40,-60,3]],
		["LIEUTENANT",
		"SERGEANT","SERGEANT","CORPORAL"]]],0],
	// configName "RHS_M1A1FEP_wd_Section",
	[[[["rhsusf_m1a1fep_wd","rhsusf_m1a1fep_wd"],[[0,0,0],[-20,-30,2]],
		["LIEUTENANT","SERGEANT"]]],0]
], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1990,2100], [160,249],
["CUP_B_US_Army","CUP_B_USMC","BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
] call gosa_fnc_map_groups_add;

// nato_usmc_d
[_groups_map, west, "RHS_USMC_D", [[
	// configName "rhs_group_nato_usmc_d_infantry_squad",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman",
		"rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_rifleman_m4",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman",
		"rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_riflemanat",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman",
		"rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_marksman"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"CORPORAL","PRIVATE",
		"CORPORAL","PRIVATE",
		"PRIVATE","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_infantry_weaponsquad",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_machinegunner",
		"rhsusf_usmc_marpat_d_machinegunner_ass","rhsusf_usmc_marpat_d_teamleader",
		"rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_d_machinegunner_ass"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[9,0,0],[11,0,0],[13,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_infantry_squad_sniper",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_sniper","rhsusf_usmc_marpat_d_spotter",
		"rhsusf_usmc_marpat_d_sniper","rhsusf_usmc_marpat_d_spotter",
		"rhsusf_usmc_marpat_d_sniper","rhsusf_usmc_marpat_d_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[9,0,0],[11,0,0],[13,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"CORPORAL","PRIVATE",
		"CORPORAL","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_infantry_team",
	[[[["rhsusf_usmc_marpat_d_teamleader",
		"rhsusf_usmc_marpat_d_autorifleman","rhsusf_usmc_marpat_d_rifleman_m4",
		"rhsusf_usmc_marpat_d_riflemanat"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_infantry_team_MG",
	[[[["rhsusf_usmc_marpat_d_teamleader",
		"rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_d_machinegunner_ass",
		"rhsusf_usmc_marpat_d_rifleman_m4"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_infantry_team_AA",
	[[[["rhsusf_usmc_marpat_d_teamleader",
		"rhsusf_usmc_marpat_d_autorifleman","rhsusf_usmc_marpat_d_rifleman_m4",
		"rhsusf_usmc_marpat_d_stinger"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_infantry_team_support",
	[[[["rhsusf_usmc_marpat_d_teamleader",
		"rhsusf_usmc_marpat_d_autorifleman","rhsusf_usmc_marpat_d_rifleman_m4",
		"rhsusf_navy_marpat_d_medic"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_infantry_team_heavy_AT",
	[[[["rhsusf_usmc_marpat_d_teamleader",
		"rhsusf_usmc_marpat_d_autorifleman","rhsusf_usmc_marpat_d_rifleman_m4",
		"rhsusf_usmc_marpat_d_javelin"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
		["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_d_infantry_team",
	[[[["rhsusf_usmc_recon_marpat_d_teamleader",
		"rhsusf_usmc_recon_marpat_d_marksman","rhsusf_usmc_recon_marpat_d_autorifleman",
		"rhsusf_usmc_recon_marpat_d_rifleman_at","rhsusf_usmc_recon_marpat_d_rifleman",
		"rhsusf_usmc_recon_marpat_d_machinegunner_m249"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_d_infantry_team_MG",
	[[[["rhsusf_usmc_recon_marpat_d_teamleader",
		"rhsusf_usmc_recon_marpat_d_marksman","rhsusf_usmc_recon_marpat_d_autorifleman",
		"rhsusf_usmc_recon_marpat_d_rifleman_at","rhsusf_usmc_recon_marpat_d_rifleman",
		"rhsusf_usmc_recon_marpat_d_machinegunner"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_d_infantry_team_support",
	[[[["rhsusf_usmc_recon_marpat_d_teamleader",
		"rhsusf_usmc_recon_marpat_d_marksman","rhsusf_usmc_recon_marpat_d_autorifleman",
		"rhsusf_navy_sarc_d","rhsusf_usmc_recon_marpat_d_rifleman",
		"rhsusf_usmc_recon_marpat_d_machinegunner_m249"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_d_infantry_team_lite",
	[[[["rhsusf_usmc_recon_marpat_d_teamleader_lite",
		"rhsusf_usmc_recon_marpat_d_marksman_lite","rhsusf_usmc_recon_marpat_d_autorifleman_lite",
		"rhsusf_usmc_recon_marpat_d_rifleman_at_lite","rhsusf_usmc_recon_marpat_d_rifleman_lite",
		"rhsusf_usmc_recon_marpat_d_machinegunner_m249_lite"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.75],
	// configName "rhs_group_nato_usmc_recon_d_infantry_team_fast",
	[[[["rhsusf_usmc_recon_marpat_d_teamleader_fast",
		"rhsusf_usmc_recon_marpat_d_marksman_fast","rhsusf_usmc_recon_marpat_d_autorifleman_fast",
		"rhsusf_usmc_recon_marpat_d_rifleman_at_fast","rhsusf_usmc_recon_marpat_d_rifleman_fast",
		"rhsusf_usmc_recon_marpat_d_machinegunner_m249_fast"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
		["SERGEANT",
		"SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.75],
	// configName "rhs_group_nato_usmc_d_RG33_squad",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman",
		"rhsusf_rg33_usmc_d","rhsusf_usmc_marpat_d_autorifleman",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_riflemanat",
		"rhsusf_usmc_marpat_d_marksman"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_RG33_squad_2mg",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_machinegunner",
		"rhsusf_rg33_usmc_d","rhsusf_usmc_marpat_d_machinegunner_ass",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_machinegunner",
		"rhsusf_usmc_marpat_d_machinegunner_ass"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_RG33_squad_sniper",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_sniper",
		"rhsusf_rg33_usmc_d","rhsusf_usmc_marpat_d_spotter",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_sniper",
		"rhsusf_usmc_marpat_d_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_RG33_squad_mg_sniper",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_army_ocp_teamleader","rhsusf_usmc_marpat_d_machinegunner",
		"rhsusf_rg33_usmc_d","rhsusf_usmc_marpat_d_machinegunner_ass",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_sniper",
		"rhsusf_usmc_marpat_d_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_RG33_m2_squad",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman",
		"rhsusf_rg33_m2_usmc_d","rhsusf_usmc_marpat_d_autorifleman",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_riflemanat",
		"rhsusf_usmc_marpat_d_marksman"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_RG33_m2_squad_2mg",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_machinegunner",
		"rhsusf_rg33_m2_usmc_d","rhsusf_usmc_marpat_d_machinegunner_ass",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_machinegunner",
		"rhsusf_usmc_marpat_d_machinegunner_ass"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_RG33_m2_squad_sniper",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_autorifleman",
		"rhsusf_rg33_m2_usmc_d","rhsusf_usmc_marpat_d_spotter",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_sniper",
		"rhsusf_usmc_marpat_d_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "rhs_group_nato_usmc_d_RG33_m2_squad_mg_sniper",
	[[[["rhsusf_usmc_marpat_d_squadleader",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_machinegunner",
		"rhsusf_rg33_m2_usmc_d","rhsusf_usmc_marpat_d_machinegunner_ass",
		"rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_sniper",
		"rhsusf_usmc_marpat_d_spotter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
		["SERGEANT",
		"SERGEANT","PRIVATE",
		"CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.75],
	// configName "BUS_MotInf_Team_GMG",
	[[[["rhsusf_m1025_d_s_Mk19",
	"rhsusf_usmc_marpat_d_autorifleman","rhsusf_usmc_marpat_d_riflemanat",
	"rhsusf_usmc_marpat_d_rifleman"],[[0,0,0],[-12,-12,0],[14,-13,0],[5,0,0]],
	["SERGEANT",
	"CORPORAL","PRIVATE","CORPORAL"]]],0],
	// configName "BUS_MotInf_Team_HMG",
	[[[["rhsusf_m1025_d_s_m2",
		"rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_riflemanat",
		"rhsusf_usmc_marpat_d_rifleman"],[[0,0,0],[-12,-12,0],[14,-13,0],[5,0,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE","CORPORAL"]]],0],
	// configName "BUS_MotInf_AT",
	[[[["rhsusf_m1025_d_s",
		"rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_javelin",
		"rhsusf_usmc_marpat_d_javelin"],[[0,0,0],[13,-12,0],[-12,-13,0],[18,-17,-2]],
		["SERGEANT",
		"CORPORAL","CORPORAL","PRIVATE"]]],0],
	// configName "BUS_MotInf_AA",
	[[[["rhsusf_m1025_d_s",
		"rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_stinger",
		"rhsusf_usmc_marpat_d_stinger"],[[0,0,0],[13,-12,0],[-12,-13,0],[18,-17,-2]],
		["SERGEANT",
		"CORPORAL","CORPORAL","PRIVATE"]]],0],
	// configName "RHS_M1A1AIM_d_Platoon",
	[[[["rhsusf_m1a1fep_d",
		"rhsusf_m1a1fep_d","rhsusf_m1a1fep_d",
		"rhsusf_m1a1fep_d"],[[0,0,0],[-20,-30,3],[20,-30,3],[40,-60,3]],
		["LIEUTENANT",
		"SERGEANT","SERGEANT","CORPORAL"]]],0],
	// configName "RHS_M1A1FEP_d_Section",
	[[[["rhsusf_m1a1fep_d","rhsusf_m1a1fep_d"],[[0,0,0],[-20,-30,2]],
		["LIEUTENANT","SERGEANT"]]],0]
], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1990,2100], [250,999],
["CUP_B_US_Army","CUP_B_USMC","BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
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
