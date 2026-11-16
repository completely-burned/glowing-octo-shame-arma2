#define __exclude ["CUP_B_US_Army","CUP_B_USMC","BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
//-- SPEX_GER_DAK, [SPEX] Wehrmacht (Tropic)
_arr = [
	//- Support, Поддержка пехоты
	// SPEX_GER_DAK_HMG_team, Расчет тяжелого пулемета
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Support" >> "SPEX_GER_DAK_HMG_team"]],0.5],
	// SPEX_GER_DAK_81_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Support" >> "SPEX_GER_DAK_81_Mortar_Team"]],0.4],
	//- SPEX_FSJ_DAK, Десантники
	// SPEX_FSJ_DAK_Infantry_Patrol, 3 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "SPEX_FSJ_DAK" >> "SPEX_FSJ_DAK_Infantry_Patrol"]],0],
	// SPEX_FSJ_DAK_Infantry_HQ, Командный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "SPEX_FSJ_DAK" >> "SPEX_FSJ_DAK_Infantry_HQ"]],0],
	// SPEX_FSJ_DAK_Infantry_Team, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "SPEX_FSJ_DAK" >> "SPEX_FSJ_DAK_Infantry_Team"]],0],
	// SPEX_FSJ_DAK_Infantry_MG_Team, Пулеметный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "SPEX_FSJ_DAK" >> "SPEX_FSJ_DAK_Infantry_MG_Team"]],0],
	// SPEX_FSJ_DAK_Infantry_squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "SPEX_FSJ_DAK" >> "SPEX_FSJ_DAK_Infantry_squad"]],0],
	// SPEX_FSJ_DAK_Infantry_Assault_squad, Штурмовое отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "SPEX_FSJ_DAK" >> "SPEX_FSJ_DAK_Infantry_Assault_squad"]],0],
	// SPEX_FSJ_DAK_Infantry_Panzerjaeger, Отряд Panzerjäger
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "SPEX_FSJ_DAK" >> "SPEX_FSJ_DAK_Infantry_Panzerjaeger"]],0],
	// SPEX_FSJ_DAK_HMG_team, Расчет тяжелого пулемета
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "SPEX_FSJ_DAK" >> "SPEX_FSJ_DAK_HMG_team"]],0],
	// SPEX_FSJ_DAK_81mm_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "SPEX_FSJ_DAK" >> "SPEX_FSJ_DAK_81mm_Mortar_Team"]],0],
	//- Infantry, Пехота
	// SPEX_GER_DAK_Platoon_Troop, Командный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_Platoon_Troop"]],0.6],
	// SPEX_GER_DAK_infantry_squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_infantry_squad"]],0.8],
	// SPEX_GER_DAK_AT_squad, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_AT_squad"]],0.4],
	// SPEX_GER_DAK_sentry_squad_2, 2 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_sentry_squad_2"]],0.4],
	// SPEX_GER_DAK_sentry_squad_3, 3 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_sentry_squad_3"]],0.4],
	// SPEX_GER_DAK_sniper_team, Снайперская группа
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_sniper_team"]],0.4],
	// SPEX_GER_DAK_Flamethrower_Team, Команда огнеметчиков
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_Flamethrower_Team"]],0.4],
	// SPEX_GER_DAK_Assault_Engineer_Squad, Штурмовой инженерный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_Assault_Engineer_Squad"]],0.5],
	// SPEX_GER_DAK_MG_team, Пулеметный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_MG_team"]],0.5],
	// SPEX_GER_DAK_Panzerjaeger_squad, Отряд Panzerjäger
	[[[configFile >> "CfgGroups" >> "West" >> "SPEX_GER_DAK" >> "Infantry" >> "SPEX_GER_DAK_Panzerjaeger_squad"]],0.4]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// SPEX_DAK_Bedford_MWD_Open, SPEX_GER_DAK_MG_team
	[[[["SPEX_GER_DAK_SquadLead","SPEX_DAK_Bedford_MWD_Open","SPEX_GER_DAK_mgunner2","SPEX_GER_DAK_rifleman","SPEX_GER_DAK_amgunner"],[[5,-5,0],[0,0,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// SPEX_DAK_Bedford_MWD_Open, SPEX_GER_DAK_Panzerjaeger_squad
	[[[["SPEX_GER_DAK_AT_Soldier_SquadLead","SPEX_DAK_Bedford_MWD_Open","SPEX_GER_DAK_AT_Soldier","SPEX_GER_DAK_AT_Soldier","SPEX_GER_DAK_AT_Soldier_Assistant","SPEX_GER_DAK_AT_Soldier_Assistant"],[[5,-5,0],[0,0,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],

	// SPE_Motorized_Infantry_Squad
	[[[["SPEX_GER_DAK_SquadLead","SPEX_DAK_OpelBlitz_Open","SPEX_GER_DAK_mgunner","SPEX_GER_DAK_medic","SPEX_GER_DAK_Assist_SquadLead","SPEX_GER_DAK_rifleman","SPEX_GER_DAK_amgunner","SPEX_GER_DAK_LAT_Rifleman","SPEX_GER_DAK_ober_grenadier","SPEX_GER_DAK_rifleman"],[[5,-5,0],[0,0,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// SPE_Command_Section
	[[[["SPEX_GER_DAK_lieutenant","SPEX_DAK_R200_Unarmed","SPEX_GER_DAK_medic","SPEX_GER_DAK_radioman"],[[5,-5,0],[0,0,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","CORPORAL","PRIVATE","PRIVATE"]]],0.6],
	// SPE_GER_Scout_250_Recon_Team
	[[[["SPEX_GER_DAK_scout_SquadLead","SPEX_DAK_SdKfz250_1","SPEX_GER_DAK_scout_mgunner","SPEX_GER_DAK_scout_amgunner","SPEX_GER_DAK_scout_ober_rifleman"],[[5,-5,0],[0,0,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.6],

	// SPE_GER_PzKpfwIV_G_Platoon
	[[[["SPEX_DAK_PzKpfwIV_G","SPEX_DAK_PzKpfwIV_G","SPEX_DAK_PzKpfwIV_G","SPEX_DAK_PzKpfwIV_G"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/6],
	// SPE_GER_PzKpfwIII_L_Platoon
	[[[["SPEX_DAK_PzKpfwIII_L","SPEX_DAK_PzKpfwIII_L","SPEX_DAK_PzKpfwIII_L","SPEX_DAK_PzKpfwIII_L"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/6],
	// SPE_GER_PzKpfwIII_J_Platoon
	[[[["SPEX_DAK_PzKpfwIII_J","SPE_PzKpfwIII_J","SPE_PzKpfwIII_J","SPE_PzKpfwIII_J"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/6],
	// SPE_GER_PzKpfwVI_H1_Platoon
	[[[["SPEX_DAK_PzKpfwVI_H1","SPEX_DAK_PzKpfwVI_H1","SPEX_DAK_PzKpfwVI_H1","SPEX_DAK_PzKpfwVI_H1"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/6],
	// SPE_GER_STUG_G_Early_Section
	[[[["SPEX_DAK_StuG_III_G_Early","SPEX_DAK_StuG_III_G_Early"],[[0,0,0],[10,-10,0]],["SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/6],
	// SPE_GER_STUH_42_Section
	[[[["SPEX_DAK_StuH_42","SPEX_DAK_StuH_42"],[[0,0,0],[10,-10,0]],["SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/6]
];
_n = count _arr;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
diag_log format ["Log: [config_groups_SPE] count SPEX_GER_DAK %1", [count _arr, _n]];
if (count _arr * 1.5 >= _n) then {_n=225}else{_n=1000};
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "SPE_WEHRMACHT",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [225,999], __exclude
	] call gosa_fnc_map_groups_add;
};

//-- SPE_WEHRMACHT, [SPE] Вермахт
_arr = [
	//- InfantryVolkGren, Infantry (Volks-Grenadier)
	// SEP_B_GER_Infantry_VolkGren_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryVolkGren" >> "SEP_B_GER_Infantry_VolkGren_Command_Section"]],0.5],
	// SEP_B_GER_Infantry_VolkGren_Sqd, Infantry Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryVolkGren" >> "SEP_B_GER_Infantry_VolkGren_Sqd"]],0.5],
	// SEP_B_GER_Infantry_VolkGren_AT_Sqd, AT Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryVolkGren" >> "SEP_B_GER_Infantry_VolkGren_AT_Sqd"]],0.5],
	// SEP_B_GER_Infantry_VolkGren_MG_Team, Machine Gun Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryVolkGren" >> "SEP_B_GER_Infantry_VolkGren_MG_Team"]],0.5],
	// SEP_B_GER_Infantry_VolkGren_Sniper_Team, Sniper Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryVolkGren" >> "SEP_B_GER_Infantry_VolkGren_Sniper_Team"]],0.5],
	// SEP_B_GER_Infantry_VolkGren_Flamethrower_Team, Flamethrower Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryVolkGren" >> "SEP_B_GER_Infantry_VolkGren_Flamethrower_Team"]],0.5],
	// SEP_B_GER_Infantry_VolkGren_2Man_Sentry, 2 Man Sentry
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryVolkGren" >> "SEP_B_GER_Infantry_VolkGren_2Man_Sentry"]],0.5],
	// SEP_B_GER_Infantry_VolkGren_3Man_Sentry, 3 Man Sentry 
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryVolkGren" >> "SEP_B_GER_Infantry_VolkGren_3Man_Sentry"]],0.5],
	//- InfantryBlueDivision, Infantry (Blue Division)
	// SEP_B_GER_Infantry_BD_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryBlueDivision" >> "SEP_B_GER_Infantry_BD_Command_Section"]],0.5],
	// SEP_B_GER_Infantry_BD_Sqd, Infantry Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryBlueDivision" >> "SEP_B_GER_Infantry_BD_Sqd"]],0.5],
	// SEP_B_GER_Infantry_BD_AT_Sqd, AT Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryBlueDivision" >> "SEP_B_GER_Infantry_BD_AT_Sqd"]],0.5],
	// SEP_B_GER_Infantry_BD_MG_Team, Machine Gun Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryBlueDivision" >> "SEP_B_GER_Infantry_BD_MG_Team"]],0.5],
	// SEP_B_GER_Infantry_BD_2Man_Sentry, 2 Man Sentry
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryBlueDivision" >> "SEP_B_GER_Infantry_BD_2Man_Sentry"]],0.5],
	// SEP_B_GER_Infantry_BD_3Man_Sentry, 3 Man Sentry 
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryBlueDivision" >> "SEP_B_GER_Infantry_BD_3Man_Sentry"]],0.5],
	//- InfantryEarly, Infantry (Early)
	// SEP_B_GER_Infantry_Early_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryEarly" >> "SEP_B_GER_Infantry_Early_Command_Section"]],0.5],
	// SEP_B_GER_Infantry_Early_Sqd, Infantry Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryEarly" >> "SEP_B_GER_Infantry_Early_Sqd"]],0.5],
	// SEP_B_GER_Infantry_Early_MG_Team, Machine Gun Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryEarly" >> "SEP_B_GER_Infantry_Early_MG_Team"]],0.5],
	// SEP_B_GER_Infantry_Early_Flamethrower_Team, Flamethrower Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryEarly" >> "SEP_B_GER_Infantry_Early_Flamethrower_Team"]],0.5],
	// SEP_B_GER_Infantry_Early_2Man_Sentry, 2 Man Sentry
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryEarly" >> "SEP_B_GER_Infantry_Early_2Man_Sentry"]],0.5],
	// SEP_B_GER_Infantry_Early_3Man_Sentry, 3 Man Sentry 
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryEarly" >> "SEP_B_GER_Infantry_Early_3Man_Sentry"]],0.5],
	//- InfantryLwFD, Infantry (Field Division)
	// SEP_B_GER_Infantry_LwFD_Sqd, Infantry Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryLwFD" >> "SEP_B_GER_Infantry_LwFD_Sqd"]],0.5],
	// SEP_B_GER_Infantry_LwFD_AT_Sqd, AT Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryLwFD" >> "SEP_B_GER_Infantry_LwFD_AT_Sqd"]],0.5],
	// SEP_B_GER_Infantry_LwFD_MG_Team, Machine Gun Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryLwFD" >> "SEP_B_GER_Infantry_LwFD_MG_Team"]],0.5],
	// SEP_B_GER_Infantry_LwFD_Sniper_Team, Sniper Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryLwFD" >> "SEP_B_GER_Infantry_LwFD_Sniper_Team"]],0.5],
	// SEP_B_GER_Infantry_LwFD_2Man_Sentry, 2 Man Sentry
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryLwFD" >> "SEP_B_GER_Infantry_LwFD_2Man_Sentry"]],0.5],
	// SEP_B_GER_Infantry_LwFD_3Man_Sentry, 3 Man Sentry 
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "InfantryLwFD" >> "SEP_B_GER_Infantry_LwFD_3Man_Sentry"]],0.5],
	//- SPE_FSJ, Десантники
	// SPE_FSJ_Infantry_Patrol, 3 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "SPE_FSJ" >> "SPE_FSJ_Infantry_Patrol"]],0],
	// SPE_FSJ_Infantry_HQ, Командный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "SPE_FSJ" >> "SPE_FSJ_Infantry_HQ"]],0],
	// SPE_FSJ_Infantry_Team, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "SPE_FSJ" >> "SPE_FSJ_Infantry_Team"]],0],
	// SPE_FSJ_Infantry_MG_Team, Пулеметный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "SPE_FSJ" >> "SPE_FSJ_Infantry_MG_Team"]],0],
	// SPE_FSJ_Infantry_squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "SPE_FSJ" >> "SPE_FSJ_Infantry_squad"]],0],
	// SPE_FSJ_Infantry_Assault_squad, Штурмовое отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "SPE_FSJ" >> "SPE_FSJ_Infantry_Assault_squad"]],0],
	// SPE_FSJ_Infantry_Panzerjaeger, Отряд Panzerjäger
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "SPE_FSJ" >> "SPE_FSJ_Infantry_Panzerjaeger"]],0],
	// SPE_FSJ_HMG_team, Расчет тяжелого пулемета
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "SPE_FSJ" >> "SPE_FSJ_HMG_team"]],0],
	// SPE_FSJ_81mm_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "SPE_FSJ" >> "SPE_FSJ_81mm_Mortar_Team"]],0],
	//- Infantry_OST, POA
	// SPE_OST_Platoon_Troop, Командный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_Platoon_Troop"]],0.6],
	// SPE_OST_infantry_squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_infantry_squad"]],0.8],
	// SPE_OST_AT_squad, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_AT_squad"]],0.4],
	// SPE_OST_CSK_squad, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_CSK_squad"]],0.4],
	// SPE_OST_sentry_squad_2, 2 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_sentry_squad_2"]],0.4],
	// SPE_OST_sentry_squad_3, 3 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_sentry_squad_3"]],0.4],
	// SPE_OST_sniper_team, Снайперская группа
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_sniper_team"]],0.4],
	// SPE_OST_Flamethrower_Team, Команда огнеметчиков
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_Flamethrower_Team"]],0.4],
	// SPE_OST_Assault_Engineer_Squad, Штурмовой инженерный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_Assault_Engineer_Squad"]],0.5],
	// SPE_OST_MG_team, Пулеметный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry_OST" >> "SPE_OST_MG_team"]],0.5],
	//- Support_OST, Поддержка POA
	// SPE_OST_HMG_team, Расчет тяжелого пулемета
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Support_OST" >> "SPE_OST_HMG_team"]],0.5],
	// SPE_OST_81_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Support_OST" >> "SPE_OST_81_Mortar_Team"]],0.4],
	//- Support, Поддержка пехоты
	// SPE_GER_HMG_team, Расчет тяжелого пулемета
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Support" >> "SPE_GER_HMG_team"]],0.5],
	// SPE_GER_81_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Support" >> "SPE_GER_81_Mortar_Team"]],0.4],
	//- Infantry, Пехота
	// SPE_GER_Lehr_Panzergrenadier_Squad, Бронепехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_Lehr_Panzergrenadier_Squad"]],0.4],
	// SPE_GER_Lehr_Panzergrenadier_MG_Team, Бронепехотная группа с легкими пулеметами
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_Lehr_Panzergrenadier_MG_Team"]],0.4],
	// SPE_GER_Platoon_Troop, Командный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_Platoon_Troop"]],0.6],
	// SPE_GER_infantry_squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_infantry_squad"]],0.8],
	// SPE_GER_AT_squad, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_AT_squad"]],0.4],
	// SPE_GER_scout_squad, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_scout_squad"]],0.4],
	// SPE_GER_sentry_squad_2, 2 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_sentry_squad_2"]],0.4],
	// SPE_GER_sentry_squad_3, 3 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_sentry_squad_3"]],0.4],
	// SPE_GER_sniper_team, Снайперская группа
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_sniper_team"]],0.4],
	// SPE_GER_Flamethrower_Team, Команда огнеметчиков
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_Flamethrower_Team"]],0.4],
	// SPE_GER_Assault_Engineer_Squad, Штурмовой инженерный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_Assault_Engineer_Squad"]],0.5],
	// SPE_GER_MG_team, Пулеметный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_MG_team"]],0.5],
	// SPE_GER_Panzerjaeger_squad, Отряд Panzerjäger
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Infantry" >> "SPE_GER_Panzerjaeger_squad"]],0.4],
	//- Motorized, Моторизованная пехота
	// SPE_Motorized_Infantry_Squad, Моторизованное пехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Motorized" >> "SPE_Motorized_Infantry_Squad"]],0.6],
	// SPE_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Motorized" >> "SPE_Command_Section"]],0.6],
	//- Mechanized, Механизированная пехота
	// SPE_GER_Scout_250_Recon_Team, Механизированная разведывательная группа
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Mechanized" >> "SPE_GER_Scout_250_Recon_Team"]],0.6],
	//- Air, Воздушная
	// SPE_GER_fw190f8_Group, Звено Fw 190 F-8
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Air" >> "SPE_GER_fw190f8_Group"]],0.5],
	//- Armored, Бронетанковая
	// SPE_GER_PzKpfwIV_G_Platoon, Взвод PzKpfw IV Ausf.G
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_PzKpfwIV_G_Platoon"]],_rarity_TankPlatoon/16],
	// SPE_GER_PzKpfwIII_M_Platoon, Взвод PzKpfw III Ausf.M
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_PzKpfwIII_M_Platoon"]],_rarity_TankPlatoon/16],
	// SPE_GER_PzKpfwIII_N_Platoon, Взвод PzKpfw III Ausf.N
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_PzKpfwIII_N_Platoon"]],_rarity_TankPlatoon/16],
	// SPE_GER_PzKpfwIII_L_Platoon, Взвод PzKpfw III Ausf.L
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_PzKpfwIII_L_Platoon"]],_rarity_TankPlatoon/16],
	// SPE_GER_PzKpfwIII_J_Platoon, Взвод PzKpfw III Ausf.J
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_PzKpfwIII_J_Platoon"]],_rarity_TankPlatoon/16],
	// SPE_GER_Nashorn_TD_Platoon, Взвод Sd.Kfz. 164 Panzerjäger
	/*
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_Nashorn_TD_Platoon"]],0.25],
	*/
	// SPE_GER_PzKpfwVI_H1_Platoon, Взвод PzKpfw VI Ausf.H1
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_PzKpfwVI_H1_Platoon"]],_rarity_TankPlatoon/16],
	// SPE_GER_PzKpfwV_G_Platoon, Взвод PzKpfw V Ausf.G
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_PzKpfwV_G_Platoon"]],_rarity_TankPlatoon/16],
	// SPE_GER_STUG_G_Late_Section, Отделение Sd.Kfz. 142/1 StuG (поздн.)
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_STUG_G_Late_Section"]],_rarity_TankPlatoon/16],
	// SPE_GER_STUG_G_Early_Section, Отделение Sd.Kfz. 142/1 StuG (ранний)
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_STUG_G_Early_Section"]],_rarity_TankPlatoon/16],
	// SPE_GER_STUH_42_Section, Отделение Sd.Kfz. 142/2 StuH 42
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_STUH_42_Section"]],_rarity_TankPlatoon/16],
	// SPE_GER_Jagdpanther_Section, Отделение Sd.Kfz. 173 Jagdpanther
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_Jagdpanther_Section"]],_rarity_TankPlatoon/16]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// 1942г. mg42 > mg34, stg44 > mp40, at.
	// SPE_GER_infantry_squad_42
	[[[["SPE_GER_SquadLead","SPE_GER_mgunner2","SPE_GER_medic","SPE_GER_Assist_SquadLead","SPE_GER_rifleman","SPE_GER_amgunner","SPE_GER_LAT_Klein_Rifleman","SPE_GER_ober_grenadier","SPE_GER_rifleman"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],
	_rarity_InfSquad],
	// SPE_GER_AT_squad_42
	[[[["SPE_GER_SquadLead","SPE_GER_AT_grenadier","SPE_GER_AT_grenadier","SPE_GER_Assist_SquadLead","SPE_GER_LAT_Klein_Rifleman","SPE_GER_LAT_Klein_Rifleman","SPE_GER_LAT_Klein_Rifleman","SPE_GER_ober_grenadier","SPE_GER_LAT_Klein_Rifleman"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],
	_rarity_InfTeam_AT],
	// SPE_GER_scout_squad_42
	[[[["SPE_GER_scout_Assist_SquadLead","SPE_GER_scout_mgunner2","SPE_GER_scout_sniper","SPE_GER_scout_Assist_SquadLead","SPE_GER_scout_ober_rifleman","SPE_GER_scout_amgunner","SPE_GER_scout_rifleman","SPE_GER_scout_ober_grenadier","SPE_GER_scout_rifleman"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],
	_rarity_reconSquad],
	// SPE_GER_sentry_squad_3_42
	[[[["SPE_GER_SquadLead","SPE_GER_rifleman","SPE_GER_rifleman"],[[0,0,0],[5,-5,0],[-5,-5,0]],["CORPORAL","PRIVATE","PRIVATE"]]],
	_rarity_InfSentry],
	// SPE_GER_Assault_Engineer_Squad_42
	[[[["SPE_GER_SquadLead","SPE_GER_mgunner2","SPE_GER_mgunner2","SPE_GER_sapper_gefr","SPE_GER_rifleman_2","SPE_GER_amgunner","SPE_GER_sapper","SPE_GER_sapper","SPE_GER_amgunner","SPE_GER_Flamethrower_Operator","SPE_GER_AT_grenadier","SPE_GER_AT_grenadier"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],
	_rarity_bad],
	// SPE_GER_MG_team_42
	[[[["SPE_GER_SquadLead","SPE_GER_mgunner2","SPE_GER_rifleman","SPE_GER_amgunner"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],
	_rarity_InfTeam_MG]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "SPE_WEHRMACHT",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, _n-1], __exclude
	] call gosa_fnc_map_groups_add;
};
_arr = [
	// SPE_GER_PzKpfwIII_M_Platoon
	[[[["SPE_PzKpfwIII_M","SPE_PzKpfwIII_M","SPE_PzKpfwIII_M","SPE_PzKpfwIII_M"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/16],
	// SPE_GER_PzKpfwIII_N_Platoon
	[[[["SPE_PzKpfwIII_N","SPE_PzKpfwIII_N","SPE_PzKpfwIII_N","SPE_PzKpfwIII_N"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/16],
	// SPE_GER_PzKpfwV_G_Platoon
	[[[["SPE_PzKpfwV_G","SPE_PzKpfwV_G","SPE_PzKpfwV_G","SPE_PzKpfwV_G"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/16],
	// SPE_GER_STUG_G_Late_Section
	[[[["SPE_StuG_III_G_Late","SPE_StuG_III_G_SKB"],[[0,0,0],[10,-10,0]],["SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/16],
	// SPE_GER_Jagdpanther_Section
	[[[["SPE_Jagdpanther_G1","SPE_Jagdpanther_G1"],[[0,0,0],[10,-10,0]],["SERGEANT","CORPORAL"]]],_rarity_TankPlatoon/16]
];
// FIXME: Поддержка плохо совместима с lambs, потомучто ИИ покидает водительское место.
_arr append [
	[[[["SPE_OpelBlitz_Repair","SPE_OpelBlitz_Ammo","SPE_OpelBlitz_Fuel"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["SPE_OpelBlitz_Ambulance"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
_arr append [
	// TODO: Нужен более осмысленный отряд.
	[[[["SPE_OpelBlitz_Flak38","SPE_OpelBlitz_Flak38"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.1]
];
if (_landing in [1,4,24,34]) then {
	_arr append [
		[[[["SPE_GER_SquadLead",
			"SPE_GER_Assist_SquadLead","SPE_GER_LAT_Rifleman",
			"SPE_GER_ober_grenadier","B_Boat_Transport_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],
			["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],
			[nil,nil,nil,nil,["SPE_GER_rifleman","SPE_GER_rifleman","SPE_GER_rifleman","SPE_GER_rifleman","SPE_GER_rifleman"]],0]
		],0.1]
	];
};
if (_Artillery) then {
	_arr append [
		// SPE_GER_Nashorn_TD_Platoon, Взвод Sd.Kfz. 164 Panzerjäger
		[[[configFile >> "CfgGroups" >> "West" >> "SPE_WEHRMACHT" >> "Armored" >> "SPE_GER_Nashorn_TD_Platoon"]],0.25]
	];
};
_arr append [
	[[[["SPE_FlaK_36","SPE_FlaK_36"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT"]]],0.01],
	[[[["SPE_FlaK_36_AA","SPE_FlaK_36_AA"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT"]]],0.01]
];
[_arr] call gosa_fnc_groups_convNormal;
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "SPE_WEHRMACHT",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 999], __exclude
	] call gosa_fnc_map_groups_add;
};

//-- SPE_STURM, [SPE] Штурмовики
_arr = [
	//- InfantryFrench, Infantry (French Volunteers)
	// SEP_B_GER_Infantry_French_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryFrench" >> "SEP_B_GER_Infantry_French_Command_Section"]],0.5],
	// SEP_B_GER_Infantry_French_Sqd, Infantry Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryFrench" >> "SEP_B_GER_Infantry_French_Sqd"]],0.5],
	// SEP_B_GER_Infantry_French_AT_Sqd, AT Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryFrench" >> "SEP_B_GER_Infantry_French_AT_Sqd"]],0.5],
	// SEP_B_GER_Infantry_French_MG_Team, Machine Gun Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryFrench" >> "SEP_B_GER_Infantry_French_MG_Team"]],0.5],
	// SEP_B_GER_Infantry_French_Flamethrower_Team, Flamethrower Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryFrench" >> "SEP_B_GER_Infantry_French_Flamethrower_Team"]],0.5],
	// SEP_B_GER_Infantry_French_Sniper_Team, Sniper Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryFrench" >> "SEP_B_GER_Infantry_French_Sniper_Team"]],0.5],
	// SEP_B_GER_Infantry_French_2Man_Sentry, 2 Man Sentry
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryFrench" >> "SEP_B_GER_Infantry_French_2Man_Sentry"]],0.5],
	// SEP_B_GER_Infantry_French_3Man_Sentry, 3 Man Sentry 
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryFrench" >> "SEP_B_GER_Infantry_French_3Man_Sentry"]],0.5],
	//- InfantryEarlySturm, Infantry (Early)
	// SEP_B_GER_Infantry_Sturm_Early_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryEarlySturm" >> "SEP_B_GER_Infantry_Sturm_Early_Command_Section"]],0.5],
	// SEP_B_GER_Infantry_Sturm_Early_Sqd, Infantry Squad
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryEarlySturm" >> "SEP_B_GER_Infantry_Sturm_Early_Sqd"]],0.5],
	// SEP_B_GER_Infantry_Sturm_Early_MG_Team, Machine Gun Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryEarlySturm" >> "SEP_B_GER_Infantry_Sturm_Early_MG_Team"]],0.5],
	// SEP_B_GER_Infantry_Sturm_Early_Flamethrower_Team, Flamethrower Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryEarlySturm" >> "SEP_B_GER_Infantry_Sturm_Early_Flamethrower_Team"]],0.5],
	// SEP_B_GER_Infantry_Sturm_Early_Sniper_Team, Sniper Team
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryEarlySturm" >> "SEP_B_GER_Infantry_Sturm_Early_Sniper_Team"]],0.5],
	// SEP_B_GER_Infantry_Sturm_Early_2Man_Sentry, 2 Man Sentry
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryEarlySturm" >> "SEP_B_GER_Infantry_Sturm_Early_2Man_Sentry"]],0.5],
	// SEP_B_GER_Infantry_Sturm_Early_3Man_Sentry, 3 Man Sentry 
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "InfantryEarlySturm" >> "SEP_B_GER_Infantry_Sturm_Early_3Man_Sentry"]],0.5],
	//- Support, Поддержка пехоты
	// SPE_sturmtrooper_HMG_team, Расчет тяжелого пулемета
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Support" >> "SPE_sturmtrooper_HMG_team"]],0.5],
	// SPE_sturmtrooper_81_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Support" >> "SPE_sturmtrooper_81_Mortar_Team"]],0.4],
	//- Infantry, Пехота
	// SPE_sturmtrooper_MG_team, Пулеметный расчет
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_sturmtrooper_MG_team"]],0.4],
	// SPE_sturmtrooper_sniper_team, Снайперская группа
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_sturmtrooper_sniper_team"]],0.4],
	// SPE_sturmtrooper_sentry_team_2, 2 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_sturmtrooper_sentry_team_2"]],0.8],
	// SPE_sturmtrooper_sentry_team_3, 3 часовых
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_sturmtrooper_sentry_team_3"]],0.8],
	// SPE_sturmtrooper_Flamethrower_Team, Команда огнеметчиков
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_sturmtrooper_Flamethrower_Team"]],0.4],
	// SPE_sturmtrooper_command_section, Командный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_sturmtrooper_command_section"]],0.8],
	// SPE_sturmtrooper_infantry_squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_sturmtrooper_infantry_squad"]],0.8],
	// SPE_sturmtrooper_AT_squad, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_sturmtrooper_AT_squad"]],0.4],
	// SPE_sturmtrooper_Assault_Engineer_Squad, Штурмовой инженерный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_sturmtrooper_Assault_Engineer_Squad"]],0.5],
	// SPE_ST_Panzerjaeger_squad, Отряд Panzerjäger
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Infantry" >> "SPE_ST_Panzerjaeger_squad"]],0.4],
	//- Motorized, Моторизованная пехота
	// SPE_Motorized_Infantry_Squad, Моторизованное пехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Motorized" >> "SPE_Motorized_Infantry_Squad"]],0.6],
	// SPE_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Motorized" >> "SPE_Command_Section"]],0.6],
	//- Mechanized, Механизированная пехота
	// SPE_Sturm_Scout_250_Recon_Team, Механизированная разведывательная группа
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Mechanized" >> "SPE_Sturm_Scout_250_Recon_Team"]],0.6],
	//- Armored, Бронетанковая
	// SPE_GER_PzKpfwIV_G_Platoon, Взвод PzKpfw IV Ausf.G
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_GER_PzKpfwIV_G_Platoon"]],_rarity_TankPlatoon/11],
	// SPE_GER_PzKpfwIII_M_Platoon, Взвод PzKpfw III Ausf.M
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_GER_PzKpfwIII_M_Platoon"]],_rarity_TankPlatoon/11],
	// SPE_GER_PzKpfwIII_L_Platoon, Взвод PzKpfw III Ausf.L
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_GER_PzKpfwIII_L_Platoon"]],_rarity_TankPlatoon/11],
	// SPE_GER_PzKpfwIII_J_Platoon, Взвод PzKpfw III Ausf.J
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_GER_PzKpfwIII_J_Platoon"]],_rarity_TankPlatoon/11],
	// SPE_STUR_PzKpfwIII_N_Platoon, Взвод PzKpfw III Ausf.N
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_STUR_PzKpfwIII_N_Platoon"]],_rarity_TankPlatoon/11],
	// SPE_STUR_PzKpfwVI_H1_Platoon, Взвод PzKpfw VI Ausf.H1
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_STUR_PzKpfwVI_H1_Platoon"]],_rarity_TankPlatoon/11],
	// SPE_ST_PzKpfwV_G_Platoon, Взвод PzKpfw V Ausf.G
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_ST_PzKpfwV_G_Platoon"]],_rarity_TankPlatoon/11],
	// SPE_ST_STUG_G_Late_Section, Отделение Sd.Kfz. 142/1 StuG (поздн.)
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_ST_STUG_G_Late_Section"]],_rarity_TankPlatoon/11],
	// SPE_ST_STUG_G_Early_Section, Отделение Sd.Kfz. 142/1 StuG (ранний)
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_ST_STUG_G_Early_Section"]],_rarity_TankPlatoon/11],
	// SPE_ST_STUH_42_Section, Отделение Sd.Kfz. 142/2 StuH 42
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_ST_STUH_42_Section"]],_rarity_TankPlatoon/11],
	// SPE_ST_Jagdpanther_Section, Отделение Sd.Kfz. 173 Jagdpanther
	[[[configFile >> "CfgGroups" >> "West" >> "SPE_STURM" >> "Armored" >> "SPE_ST_Jagdpanther_Section"]],_rarity_TankPlatoon/11]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// 1942г. mg42 > mg34, stg44 > mp40, at.
	// SPE_sturmtrooper_MG_team_42
	[[[["SPE_sturmtrooper_Assist_SquadLead","SPE_sturmtrooper_mgunner","SPE_sturmtrooper_ober_rifleman","SPE_sturmtrooper_amgunner"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],
	_rarity_InfTeam_MG],
	// SPE_sturmtrooper_sentry_team_2_42
	[[[["SPE_sturmtrooper_Assist_SquadLead","SPE_sturmtrooper_rifleman"],[[0,0,0],[5,-5,0]],["SERGEANT","PRIVATE"]]],
	_rarity_InfSentry],
	// SPE_sturmtrooper_infantry_squad_42
	[[[["SPE_sturmtrooper_Assist_SquadLead","SPE_sturmtrooper_mgunner","SPE_sturmtrooper_medic","SPE_sturmtrooper_Assist_SquadLead","SPE_sturmtrooper_rifleman","SPE_sturmtrooper_amgunner","SPE_sturmtrooper_LAT_Klein_Rifleman","SPE_sturmtrooper_ober_grenadier","SPE_sturmtrooper_rifleman"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],
	_rarity_InfSquad],
	// SPE_sturmtrooper_AT_squad_42
	[[[["SPE_sturmtrooper_Assist_SquadLead","SPE_sturmtrooper_AT_grenadier","SPE_sturmtrooper_AT_grenadier","SPE_sturmtrooper_Assist_SquadLead","SPE_sturmtrooper_LAT_Klein_Rifleman","SPE_sturmtrooper_LAT_Klein_Rifleman","SPE_sturmtrooper_LAT_Klein_Rifleman","SPE_sturmtrooper_ober_grenadier","SPE_sturmtrooper_LAT_Klein_Rifleman"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],
	_rarity_InfTeam_AT/2],
	// SPE_sturmtrooper_Assault_Engineer_Squad_42
	[[[["SPE_sturmtrooper_Assist_SquadLead","SPE_sturmtrooper_mgunner","SPE_sturmtrooper_mgunner","SPE_sturmtrooper_sapper_gefr","SPE_sturmtrooper_rifleman","SPE_sturmtrooper_amgunner","SPE_sturmtrooper_sapper","SPE_sturmtrooper_sapper","SPE_sturmtrooper_amgunner","SPE_sturmtrooper_Flamethrower_Operator","SPE_sturmtrooper_AT_grenadier","SPE_sturmtrooper_AT_grenadier"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],
	_rarity_bad],
	// SPE_ST_Panzerjaeger_squad_42
	[[[["SPE_sturmtrooper_LAT_Klein_Rifleman","SPE_sturmtrooper_LAT_Klein_Rifleman","SPE_sturmtrooper_LAT_Klein_Rifleman","SPE_sturmtrooper_AT_grenadier","SPE_sturmtrooper_AT_grenadier"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],
	_rarity_InfTeam_AT/2]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "SPE_STURM",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 225-1], __exclude
	] call gosa_fnc_map_groups_add;
};


//-- SPEX_CW_ARMY_TROP, [SPEX] Commonwealth (Tropic)
_arr = [
	//- Infantry_Alt, Men (Altian)
	// SEP_I_CW_ALT_Trop_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Trop_Command_Section"]],0.5],
	// SEP_I_CW_ALT_Trop_Infantry_Section, Infantry Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Trop_Infantry_Section"]],0.5],
	// SEP_I_CW_ALT_Trop_Rifle_Group, Rifle Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Trop_Rifle_Group"]],0.5],
	// SEP_I_CW_ALT_Trop_Bren_Group, BREN Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Trop_Bren_Group"]],0.5],
	// SEP_I_CW_ALT_Trop_PIAT_Group, AT Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Trop_PIAT_Group"]],0.5],
	// SEP_I_CW_ALT_Trop_Mortar_Group, Mortar Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Trop_Mortar_Group"]],0.5],
	// SEP_I_CW_ALT_Trop_Scout_Section, Scout Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Trop_Scout_Section"]],0.5],
	//- Infantry_Sikh, Men (Sikh)
	// SEP_I_CW_SIKH_Trop_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Trop_Command_Section"]],0.5],
	// SEP_I_CW_SIKH_Trop_Infantry_Section, Infantry Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Trop_Infantry_Section"]],0.5],
	// SEP_I_CW_SIKH_Trop_Rifle_Group, Rifle Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Trop_Rifle_Group"]],0.5],
	// SEP_I_CW_SIKH_Trop_Bren_Group, BREN Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Trop_Bren_Group"]],0.5],
	// SEP_I_CW_SIKH_Trop_PIAT_Group, AT Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Trop_PIAT_Group"]],0.5],
	// SEP_I_CW_SIKH_Trop_Mortar_Group, Mortar Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Trop_Mortar_Group"]],0.5],
	// SEP_I_CW_SIKH_Trop_Scout_Section, Scout Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Trop_Scout_Section"]],0.5],
	//- Infantry_CMD, Men (Commandos)
	// SEP_I_CW_CMD_T_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CMD" >> "SEP_I_CW_CMD_T_Command_Section"]],0.5],
	// SEP_I_CW_CMD_T_Infantry_Section, Infantry Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CMD" >> "SEP_I_CW_CMD_T_Infantry_Section"]],0.5],
	// SEP_I_CW_CMD_T_Rifle_Group, Rifle Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CMD" >> "SEP_I_CW_CMD_T_Rifle_Group"]],0.5],
	// SEP_I_CW_CMD_T_Bren_Group, BREN Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CMD" >> "SEP_I_CW_CMD_T_Bren_Group"]],0.5],
	// SEP_I_CW_CMD_T_PIAT_Group, AT Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CMD" >> "SEP_I_CW_CMD_T_PIAT_Group"]],0.5],
	// SEP_I_CW_CMD_T_Mortar_Group, Mortar Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CMD" >> "SEP_I_CW_CMD_T_Mortar_Group"]],0.5],
	// SEP_I_CW_CMD_T_Scout_Section, Scout Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CMD" >> "SEP_I_CW_CMD_T_Scout_Section"]],0.5],
	//- Infantry_AUS_41, Men (Australian)
	// SPEX_CW_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_AUS_41" >> "SPEX_CW_Command_Section"]],0],
	// SPEX_CW_Bren_Group, Группа с BREN
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_AUS_41" >> "SPEX_CW_Bren_Group"]],0],
	// SPEX_CW_mortar_Group, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_AUS_41" >> "SPEX_CW_mortar_Group"]],0],
	// SPEX_CW_Rifle_Group, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_AUS_41" >> "SPEX_CW_Rifle_Group"]],0],
	// SPEX_CW_infantry_Section, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_AUS_41" >> "SPEX_CW_infantry_Section"]],0],
	//- Infantry_KD_42, Пехота
	// SPEX_CW_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_KD_42" >> "SPEX_CW_Command_Section"]],0],
	// SPEX_CW_Bren_Group, Группа с BREN
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_KD_42" >> "SPEX_CW_Bren_Group"]],0],
	// SPEX_CW_PIAT_Group, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_KD_42" >> "SPEX_CW_PIAT_Group"]],0],
	// SPEX_CW_mortar_Group, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_KD_42" >> "SPEX_CW_mortar_Group"]],0],
	// SPEX_CW_Rifle_Group, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_KD_42" >> "SPEX_CW_Rifle_Group"]],0],
	// SPEX_CW_infantry_Section, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_KD_42" >> "SPEX_CW_infantry_Section"]],0],
	//- Infantry_CAN_KD, Men (Canadian)
	// SPEX_CW_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CAN_KD" >> "SPEX_CW_Command_Section"]],0],
	// SPEX_CW_Bren_Group, Группа с BREN
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CAN_KD" >> "SPEX_CW_Bren_Group"]],0],
	// SPEX_CW_PIAT_Group, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CAN_KD" >> "SPEX_CW_PIAT_Group"]],0],
	// SPEX_CW_mortar_Group, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CAN_KD" >> "SPEX_CW_mortar_Group"]],0],
	// SPEX_CW_Rifle_Group, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CAN_KD" >> "SPEX_CW_Rifle_Group"]],0],
	// SPEX_CW_scout_Section, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CAN_KD" >> "SPEX_CW_scout_Section"]],0],
	// SPEX_CW_infantry_Section, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Infantry_CAN_KD" >> "SPEX_CW_infantry_Section"]],0],
	//- Motorized, Моторизованная пехота
	// SPEX_CW_Trop_Motorized_Infantry_Squad, Моторизованное пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Motorized" >> "SPEX_CW_Trop_Motorized_Infantry_Squad"]],0.6],
	// SPEX_CW_Trop_Jeep_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Motorized" >> "SPEX_CW_Trop_Jeep_Command_Section"]],0.6],
	//- Mechanized, Механизированная пехота
	// SPEX_CW_Trop_Mechanized_Platoon_HQ, Штаб бронетанкового взвода
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Mechanized" >> "SPEX_CW_Trop_Mechanized_Platoon_HQ"]],0.6],
	// SPEX_CW_Trop_Mechanized_Infantry_Squad, Механизированное пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Mechanized" >> "SPEX_CW_Trop_Mechanized_Infantry_Squad"]],0.6],
	//- Armored, Бронетанковая
	// SPEX_CW_Trop_sherman_II_Troop, Взвод Sherman II
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Armored" >> "SPEX_CW_Trop_sherman_II_Troop"]],_rarity_TankPlatoon/3],
	// SPEX_CW_Trop_M10_TD_Troop, Взвод истребителей танков M10
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Armored" >> "SPEX_CW_Trop_M10_TD_Troop"]],_rarity_TankPlatoon/3],
	// SPEX_CW_Trop_sherman_V_Troop, Взвод Sherman V
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY_TROP" >> "Armored" >> "SPEX_CW_Trop_sherman_V_Troop"]],_rarity_TankPlatoon/3]
];
[_arr] call gosa_fnc_groups_convNormal;
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "SPEX_CW_Army",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [225, 999], __exclude
	] call gosa_fnc_map_groups_add;
};

#define __exclude ["CUP_O_RU","OPF_SFIA_lxWS","OPF_TURA_lxWS","OPF_T_F","OPF_F","OPF_G_F","OPF_R_F","IND_F","IND_E_F","IND_G_F","IND_C_F"]
// TODO: Баланс.
//-- SPEX_CW_ARMY, [SPEX] Commonwealth
_arr = [
	//- Infantry_CMD_L, Men (Commandos, Landing)
	// SEP_I_CW_CMD_L_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD_L" >> "SEP_I_CW_CMD_L_Command_Section"]],0.5],
	// SEP_I_CW_CMD_L_Infantry_Section, Infantry Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD_L" >> "SEP_I_CW_CMD_L_Infantry_Section"]],0.5],
	// SEP_I_CW_CMD_L_Rifle_Group, Rifle Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD_L" >> "SEP_I_CW_CMD_L_Rifle_Group"]],0.5],
	// SEP_I_CW_CMD_L_Bren_Group, BREN Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD_L" >> "SEP_I_CW_CMD_L_Bren_Group"]],0.5],
	// SEP_I_CW_CMD_L_PIAT_Group, AT Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD_L" >> "SEP_I_CW_CMD_L_PIAT_Group"]],0.5],
	// SEP_I_CW_CMD_L_Mortar_Group, Mortar Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD_L" >> "SEP_I_CW_CMD_L_Mortar_Group"]],0.5],
	// SEP_I_CW_CMD_L_Scout_Section, Scout Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD_L" >> "SEP_I_CW_CMD_L_Scout_Section"]],0.5],
	//- Infantry_CAN, Men (Canadian)
	// SPEX_CW_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CAN" >> "SPEX_CW_Command_Section"]],0],
	// SPEX_CW_Bren_Group, Группа с BREN
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CAN" >> "SPEX_CW_Bren_Group"]],0],
	// SPEX_CW_PIAT_Group, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CAN" >> "SPEX_CW_PIAT_Group"]],0],
	// SPEX_CW_mortar_Group, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CAN" >> "SPEX_CW_mortar_Group"]],0],
	// SPEX_CW_Rifle_Group, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CAN" >> "SPEX_CW_Rifle_Group"]],0],
	// SPEX_CW_scout_Section, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CAN" >> "SPEX_CW_scout_Section"]],0],
	// SPEX_CW_infantry_Section, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CAN" >> "SPEX_CW_infantry_Section"]],0],
	//- Infantry_BEF, Men (1940)
	// SPEX_CW_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_BEF" >> "SPEX_CW_Command_Section"]],0],
	// SPEX_CW_Bren_Group, Группа с BREN
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_BEF" >> "SPEX_CW_Bren_Group"]],0],
	// SPEX_CW_mortar_Group, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_BEF" >> "SPEX_CW_mortar_Group"]],0],
	// SPEX_CW_Rifle_Group, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_BEF" >> "SPEX_CW_Rifle_Group"]],0],
	// SPEX_CW_infantry_Section, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_BEF" >> "SPEX_CW_infantry_Section"]],0],
	//- Infantry_AUS_43, Men (Australian, Jungle)
	// SPEX_CW_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_AUS_43" >> "SPEX_CW_Command_Section"]],0],
	// SPEX_CW_Bren_Group, Группа с BREN
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_AUS_43" >> "SPEX_CW_Bren_Group"]],0],
	// SPEX_CW_PIAT_Group, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_AUS_43" >> "SPEX_CW_PIAT_Group"]],0],
	// SPEX_CW_mortar_Group, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_AUS_43" >> "SPEX_CW_mortar_Group"]],0],
	// SPEX_CW_Rifle_Group, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_AUS_43" >> "SPEX_CW_Rifle_Group"]],0],
	// SPEX_CW_infantry_Section, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_AUS_43" >> "SPEX_CW_infantry_Section"]],0],
	//- Infantry_Airborne, Men (Airlanding)
	// SPEX_CW_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Airborne" >> "SPEX_CW_Command_Section"]],0],
	// SPEX_CW_Bren_Group, Группа с BREN
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Airborne" >> "SPEX_CW_Bren_Group"]],0],
	// SPEX_CW_PIAT_Group, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Airborne" >> "SPEX_CW_PIAT_Group"]],0],
	// SPEX_CW_mortar_Group, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Airborne" >> "SPEX_CW_mortar_Group"]],0],
	// SPEX_CW_Rifle_Group, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Airborne" >> "SPEX_CW_Rifle_Group"]],0],
	// SPEX_CW_scout_Section, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Airborne" >> "SPEX_CW_scout_Section"]],0],
	// SPEX_CW_infantry_Section, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Airborne" >> "SPEX_CW_infantry_Section"]],0],
	//- Infantry_Alt, Men (Altian)
	// SEP_I_CW_ALT_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Command_Section"]],0.5],
	// SEP_I_CW_ALT_Infantry_Section, Infantry Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Infantry_Section"]],0.5],
	// SEP_I_CW_ALT_Rifle_Group, Rifle Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Rifle_Group"]],0.5],
	// SEP_I_CW_ALT_Bren_Group, BREN Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Bren_Group"]],0.5],
	// SEP_I_CW_ALT_PIAT_Group, AT Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Alt" >> "SEP_I_CW_ALT_PIAT_Group"]],0.5],
	// SEP_I_CW_ALT_Mortar_Group, Mortar Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Mortar_Group"]],0.5],
	// SEP_I_CW_ALT_Scout_Section, Scout Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Alt" >> "SEP_I_CW_ALT_Scout_Section"]],0.5],
	//- Infantry_Sikh, Men (Sikh)
	// SEP_I_CW_SIKH_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Command_Section"]],0.5],
	// SEP_I_CW_SIKH_Infantry_Section, Infantry Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Infantry_Section"]],0.5],
	// SEP_I_CW_SIKH_Rifle_Group, Rifle Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Rifle_Group"]],0.5],
	// SEP_I_CW_SIKH_Bren_Group, BREN Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Bren_Group"]],0.5],
	// SEP_I_CW_SIKH_PIAT_Group, AT Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_PIAT_Group"]],0.5],
	// SEP_I_CW_SIKH_Mortar_Group, Mortar Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Mortar_Group"]],0.5],
	// SEP_I_CW_SIKH_Scout_Section, Scout Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_Sikh" >> "SEP_I_CW_SIKH_Scout_Section"]],0.5],
	//- Infantry_CMD, Men (Commandos)
	// SEP_I_CW_CMD_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD" >> "SEP_I_CW_CMD_Command_Section"]],0.5],
	// SEP_I_CW_CMD_Infantry_Section, Infantry Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD" >> "SEP_I_CW_CMD_Infantry_Section"]],0.5],
	// SEP_I_CW_CMD_Rifle_Group, Rifle Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD" >> "SEP_I_CW_CMD_Rifle_Group"]],0.5],
	// SEP_I_CW_CMD_Bren_Group, BREN Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD" >> "SEP_I_CW_CMD_Bren_Group"]],0.5],
	// SEP_I_CW_CMD_PIAT_Group, AT Group
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD" >> "SEP_I_CW_CMD_PIAT_Group"]],0.5],
	// SEP_I_CW_CMD_Mortar_Group, Mortar Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD" >> "SEP_I_CW_CMD_Mortar_Group"]],0.5],
	// SEP_I_CW_CMD_Scout_Section, Scout Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry_CMD" >> "SEP_I_CW_CMD_Scout_Section"]],0.5],
	//- Motorized, Моторизованная пехота
	// SPEX_CW_Motorized_Infantry_Squad, Моторизованное пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Motorized" >> "SPEX_CW_Motorized_Infantry_Squad"]],0.6],
	// SPEX_CW_Jeep_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Motorized" >> "SPEX_CW_Jeep_Command_Section"]],0.6],
	//- Mechanized, Механизированная пехота
	// SPEX_CW_Mechanized_Platoon_HQ, Штаб бронетанкового взвода
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Mechanized" >> "SPEX_CW_Mechanized_Platoon_HQ"]],0.6],
	// SPEX_CW_Mechanized_Infantry_Squad, Механизированное пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Mechanized" >> "SPEX_CW_Mechanized_Infantry_Squad"]],0.6],
	//- Armored, Бронетанковая
	// SPEX_CW_sherman_II_Troop, Взвод Sherman II
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Armored" >> "SPEX_CW_sherman_II_Troop"]],_rarity_TankPlatoon/6],
	// SPEX_CW_sherman_I_Troop, Взвод Sherman I
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Armored" >> "SPEX_CW_sherman_I_Troop"]],_rarity_TankPlatoon/6],
	// SPEX_CW_M10_TD_Troop, Взвод истребителей танков M10
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Armored" >> "SPEX_CW_M10_TD_Troop"]],_rarity_TankPlatoon/6],
	// SPEX_CW_sherman_V_Troop, Взвод Sherman V
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Armored" >> "SPEX_CW_sherman_V_Troop"]],_rarity_TankPlatoon/6],
	// SPEX_CW_Cromwell_Troop, Взвод Cromwell
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Armored" >> "SPEX_CW_Cromwell_Troop"]],_rarity_TankPlatoon/6],
	// SPEX_CW_Cromwell_CS_Troop, Взвод Cromwell HQ
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Armored" >> "SPEX_CW_Cromwell_CS_Troop"]],_rarity_TankPlatoon/6],
	//- Infantry, Пехота
	// SPEX_CW_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry" >> "SPEX_CW_Command_Section"]],0],
	// SPEX_CW_Bren_Group, Группа с BREN
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry" >> "SPEX_CW_Bren_Group"]],0],
	// SPEX_CW_PIAT_Group, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry" >> "SPEX_CW_PIAT_Group"]],0],
	// SPEX_CW_mortar_Group, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry" >> "SPEX_CW_mortar_Group"]],0],
	// SPEX_CW_Rifle_Group, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry" >> "SPEX_CW_Rifle_Group"]],0],
	// SPEX_CW_scout_Section, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry" >> "SPEX_CW_scout_Section"]],0],
	// SPEX_CW_infantry_Section, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_CW_ARMY" >> "Infantry" >> "SPEX_CW_infantry_Section"]],0]
];
[_arr] call gosa_fnc_groups_convNormal;
if (_landing in [1,2,23,24]) then {
	_arr append [
		// SPEX_CW_infantry_Section
		[[[["SPEX_CW_C47_Dakota"],[],[]],
			[["SPEX_CW_Para_Section_Lead","SPEX_CW_Para_rifleman","SPEX_CW_Para_Team_Lead","SPEX_CW_Para_mortar_gunner","SPEX_CW_Para_Bren_gunner","SPEX_CW_Para_rifleman_2","SPEX_CW_Para_Bren_asst","SPEX_CW_Para_rifleman","SPEX_CW_Para_rifleman_AmmoBearer","SPEX_CW_Para_rifleman_2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0+0.1]
	];
};
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "SPEX_CW_Army",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 225-1], __exclude
	] call gosa_fnc_map_groups_add;
};

//-- SPE_US_ARMY, [SPE] Армия США
_arr = [
	//- Support, Поддержка пехоты
	// SPE_US_Heavy_Machine_Gun_Team, Расчет тяжелого пулемета
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support" >> "SPE_US_Heavy_Machine_Gun_Team"]],0.4],
	// SPE_US_81_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support" >> "SPE_US_81_Mortar_Team"]],0.4],
	// SPE_US_M2_Heavy_Machine_Gun_Team, Расчет тяжелого пулемета (M2)
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support" >> "SPE_US_M2_Heavy_Machine_Gun_Team"]],0.4],
	//- SpecOps, 5-й батальон рейнджеров
	// SPE_US_Rangers_Assault_Section, Штурмовое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "SpecOps" >> "SPE_US_Rangers_Assault_Section"]],0.8],
	// SPE_US_Rangers_Assault_Section_BAR, Штурмовое отделение (BAR)
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "SpecOps" >> "SPE_US_Rangers_Assault_Section_BAR"]],0.8],
	// SPE_US_Rangers_AT_squad, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "SpecOps" >> "SPE_US_Rangers_AT_squad"]],0.4],
	// SPE_US_Rangers_MG_Squad, Отделение с легкими пулеметами
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "SpecOps" >> "SPE_US_Rangers_MG_Squad"]],0.8],
	// SPE_US_Rangers_Rifle_Squad, Стрелковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "SpecOps" >> "SPE_US_Rangers_Rifle_Squad"]],0.8],
	// SPE_US_Ranger_scout_squad, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "SpecOps" >> "SPE_US_Ranger_scout_squad"]],0.4],
	// SPE_US_Ranger_Assault_Engineer_Squad, Штурмовой инженерный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "SpecOps" >> "SPE_US_Ranger_Assault_Engineer_Squad"]],0.2],
	//- Infantry_101st_AB, Пехота (101-я воздушно-десантная)
	// SPE_US_101AB_Infantry_squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_101st_AB" >> "SPE_US_101AB_Infantry_squad"]],0],
	// SPE_US_101AB_HQ_squad, Командное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_101st_AB" >> "SPE_US_101AB_HQ_squad"]],0],
	// SPE_US_101AB_Rifle_Team, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_101st_AB" >> "SPE_US_101AB_Rifle_Team"]],0],
	// SPE_US_101AB_MG_Team, Пулеметный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_101st_AB" >> "SPE_US_101AB_MG_Team"]],0],
	// SPE_US_101AB_Assault_Squad, Штурмовое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_101st_AB" >> "SPE_US_101AB_Assault_Squad"]],0],
	// SPE_US_101AB_Assault_Engineer_Squad, Штурмовой инженерный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_101st_AB" >> "SPE_US_101AB_Assault_Engineer_Squad"]],0],
	// SPE_US_101AB_AT_Team, Противотанковое группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_101st_AB" >> "SPE_US_101AB_AT_Team"]],0],
	//- Support_101st_AB, Поддержка пехоты (101-я воздушно-десантная)
	// SPE_US_101AB_HMG_Team, Расчет тяжелого пулемета (M2)
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support_101st_AB" >> "SPE_US_101AB_HMG_Team"]],0],
	// SPE_US_101AB_81mm_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support_101st_AB" >> "SPE_US_101AB_81mm_Mortar_Team"]],0],
	//- Infantry_82d_AB, Пехота (82-я воздушно-десантная)
	// SPE_US_82AB_Infantry_squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_82d_AB" >> "SPE_US_82AB_Infantry_squad"]],0],
	// SPE_US_82AB_HQ_squad, Командное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_82d_AB" >> "SPE_US_82AB_HQ_squad"]],0],
	// SPE_US_82AB_Rifle_Team, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_82d_AB" >> "SPE_US_82AB_Rifle_Team"]],0],
	// SPE_US_82AB_MG_Team, Пулеметный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_82d_AB" >> "SPE_US_82AB_MG_Team"]],0],
	// SPE_US_82AB_Assault_Squad, Штурмовое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_82d_AB" >> "SPE_US_82AB_Assault_Squad"]],0],
	// SPE_US_82AB_Assault_Engineer_Squad, Штурмовой инженерный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_82d_AB" >> "SPE_US_82AB_Assault_Engineer_Squad"]],0],
	// SPE_US_82AB_AT_Team, Противотанковое группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_82d_AB" >> "SPE_US_82AB_AT_Team"]],0],
	//- Support_82d_AB, Поддержка пехоты (82-я воздушно-десантная)
	// SPE_US_82AB_HMG_Team, Расчет тяжелого пулемета (M2)
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support_82d_AB" >> "SPE_US_82AB_HMG_Team"]],0],
	// SPE_US_82AB_81mm_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support_82d_AB" >> "SPE_US_82AB_81mm_Mortar_Team"]],0],
	//- Infantry_Late, Пехота (поздн.)
	// SPE_US_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_Command_Section"]],0.6],
	// SPE_US_Command_Squad, Командное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_Command_Squad"]],0.6],
	// SPE_US_Infantry_Squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_Infantry_Squad"]],0.8],
	// SPE_US_AT_Squad, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_AT_Squad"]],0.4],
	// SPE_US_Scout_Squad, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_Scout_Squad"]],0.4],
	// SPE_US_Flamethrower_Team, Команда огнеметчиков
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_Flamethrower_Team"]],0.4],
	// SPE_US_Sentry_Squad_2, 2 часовых
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_Sentry_Squad_2"]],0.4],
	// SPE_US_Sentry_Squad_3, 3 часовых
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_Sentry_Squad_3"]],0.4],
	// SPE_US_Sniper_Team, Снайперская группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_Sniper_Team"]],0.4],
	// SPE_US_Rifle_Team, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_Rifle_Team"]],0.4],
	// SPE_US_BAR_Team, Группа с BAR
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Late" >> "SPE_US_BAR_Team"]],0.4],
	//- Support_Late, Поддержка пехоты (поздн.)
	// SPE_US_Heavy_Machine_Gun_Team, Расчет тяжелого пулемета
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support_Late" >> "SPE_US_Heavy_Machine_Gun_Team"]],0.4],
	// SPE_US_81_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support_Late" >> "SPE_US_81_Mortar_Team"]],0.4],
	// SPE_US_M2_Heavy_Machine_Gun_Team, Расчет тяжелого пулемета (M2)
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support_Late" >> "SPE_US_M2_Heavy_Machine_Gun_Team"]],0.4],
	//- Air, Воздушная
	// SPE_US_P47_Group, Звено P-47D Thunderbolt
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Air" >> "SPE_US_P47_Group"]],0.5],
	//- Infantry_Gliderborne, Infantry (Glider-borne)
	// SPE_US_AB_327AB_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_Command_Section"]],0.6],
	// SPE_US_AB_327AB_Command_Squad, Командное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_Command_Squad"]],0.6],
	// SPE_US_AB_327AB_Infantry_Squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_Infantry_Squad"]],0.8],
	// SPE_US_AB_327AB_AT_Squad, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_AT_Squad"]],0.4],
	// SPE_US_AB_327AB_Scout_Squad, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_Scout_Squad"]],0.4],
	// SPE_US_AB_327AB_Flamethrower_Team, Команда огнеметчиков
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_Flamethrower_Team"]],0.4],
	// SPE_US_AB_327AB_Sentry_Squad_2, 2 часовых
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_Sentry_Squad_2"]],0.4],
	// SPE_US_AB_327AB_Sentry_Squad_3, 3 часовых
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_Sentry_Squad_3"]],0.4],
	// SPE_US_AB_327AB_Sniper_Team, Снайперская группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_Sniper_Team"]],0.4],
	// SPE_US_AB_327AB_Rifle_Team, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_Rifle_Team"]],0.4],
	// SPE_US_AB_327AB_BAR_Team, Группа с BAR
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry_Gliderborne" >> "SPE_US_AB_327AB_BAR_Team"]],0.4],
	//- Support_Gliderborne, Support Infantry (Glider-borne)
	// SPE_US_AB_327AB_Heavy_Machine_Gun_Team, Расчет тяжелого пулемета
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support_Gliderborne" >> "SPE_US_AB_327AB_Heavy_Machine_Gun_Team"]],0.4],
	// SPE_US_AB_327AB_81_Mortar_Team, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Support_Gliderborne" >> "SPE_US_AB_327AB_81_Mortar_Team"]],0.4],
	//- Motorized, Моторизованная пехота
	// SPE_Motorized_Infantry_Squad, Моторизованное пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Motorized" >> "SPE_Motorized_Infantry_Squad"]],0.6],
	// SPE_US_Jeep_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Motorized" >> "SPE_US_Jeep_Command_Section"]],0.6],
	//- Mechanized, 2-й бронепехотный
	// SPE_US_2AD_Mechanized_Platoon_HQ, Штаб бронетанкового взвода
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Mechanized" >> "SPE_US_2AD_Mechanized_Platoon_HQ"]],0.6],
	// SPE_US_2AD_Mechanized_Infantry_Squad, Бронепехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Mechanized" >> "SPE_US_2AD_Mechanized_Infantry_Squad"]],0.6],
	// SPE_US_2AD_Mechanized_MG_Squad, Бронепехотное отделение с легкими пулеметами
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Mechanized" >> "SPE_US_2AD_Mechanized_MG_Squad"]],0.6],
	// SPE_US_2AD_Mechanized_Engineer_Squad, Бронетанковый штурмовой инженерный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Mechanized" >> "SPE_US_2AD_Mechanized_Engineer_Squad"]],0.6],
	//- Armored, Бронетанковая
	// SPE_M4A1_75_Platoon, Взвод M4 Sherman
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M4A1_75_Platoon"]],0.3],
	// SPE_M4A1_76_Platoon, Взвод M4 (76) Sherman
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M4A1_76_Platoon"]],0.3],
	// SPE_M10_TD_Platoon, Взвод истребителей танков M10
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M10_TD_Platoon"]],0.3],
	// SPE_M18_TD_Platoon, Взвод истребителей танков M18 Hellcat
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M18_TD_Platoon"]],0.3],
	// SPE_M4A1_Calliope_Section, Расчет реактивной артиллерии «Каллиопа»
	/*
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M4A1_Calliope_Section"]],0.3],
	*/
	// SPE_M4A3_75_Platoon, Взвод M4A3 Sherman
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M4A3_75_Platoon"]],_rarity_TankPlatoon/5],
	// SPE_M4A3_76_Platoon, Взвод M4A3 (76) Sherman
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M4A3_76_Platoon"]],_rarity_TankPlatoon/5],
	// SPE_M4_105_Platoon, Взвод M4 (105) Sherman
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M4_105_Platoon"]],_rarity_TankPlatoon/5],
	// SPE_M8_Recon_Section, Отделение разведки M8 LAC
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M8_Recon_Section"]],_rarity_TankPlatoon/5],
	// SPE_M20_AUC_Section, Отделение разведки M20 AUC
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M20_AUC_Section"]],_rarity_TankPlatoon/5],
	//- Infantry, Пехота
	// SPE_US_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_Command_Section"]],0.6],
	// SPE_US_Command_Squad, Командное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_Command_Squad"]],0.6],
	// SPE_US_Infantry_Squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_Infantry_Squad"]],0.8],
	// SPE_US_AT_Squad, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_AT_Squad"]],0.4],
	// SPE_US_Scout_Squad, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_Scout_Squad"]],0.4],
	// SPE_US_Flamethrower_Team, Команда огнеметчиков
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_Flamethrower_Team"]],0.4],
	// SPE_US_Sentry_Squad_2, 2 часовых
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_Sentry_Squad_2"]],0.4],
	// SPE_US_Sentry_Squad_3, 3 часовых
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_Sentry_Squad_3"]],0.4],
	// SPE_US_Sniper_Team, Снайперская группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_Sniper_Team"]],0.4],
	// SPE_US_Rifle_Team, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_Rifle_Team"]],0.4],
	// SPE_US_BAR_Team, Группа с BAR
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_BAR_Team"]],0.4],
	// SPE_US_2AD_Dismounted_Platoon_HQ, Штаб бронетанкового взвода
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_2AD_Dismounted_Platoon_HQ"]],0.6],
	// SPE_US_2AD_Dismounted_RifleSquad, Бронепехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_2AD_Dismounted_RifleSquad"]],0.8],
	// SPE_US_2AD_Dismounted_MGSquad, Бронепехотное отделение с легкими пулеметами
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_2AD_Dismounted_MGSquad"]],0.8],
	// SPE_US_2AD_Dismounted_AssaultEngineer_Squad, Бронетанковый штурмовой инженерный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Infantry" >> "SPE_US_2AD_Dismounted_AssaultEngineer_Squad"]],0.4]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr append [
	[[[["MWB_M24Chaffee","MWB_M24Chaffee"],[[0,0,0],[10,-10,0]],["SERGEANT","CORPORAL"]]],0.25],
	[[[["MWB_M36B2","MWB_M36B2","MWB_M36B2","MWB_M36B2"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.3],
	[[[["MWB_M36","MWB_M36","MWB_M36","MWB_M36"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.3],
	[[[["SPE_US_M3_Halftrack_Repair","SPE_US_M3_Halftrack_Ammo","SPE_US_M3_Halftrack_Fuel"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.025],
	[[[["SPE_CCKW_353_Repair","SPE_CCKW_353_Ammo","SPE_CCKW_353_Fuel"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.025],
	[[[["SPE_US_M3_Halftrack_Ambulance"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.017],
	[[[["SPE_CCKW_353_Ambulance"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.017],
	[[[["SPE_US_G503_MB_Ambulance"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.016]
];
_arr append [
	// TODO: Нужен более осмысленный отряд.
	[[[["SPE_US_M16_Halftrack","SPE_US_M16_Halftrack"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.1]
];
if (_landing in [1,4,24,34]) then {
	// Застревает с убитым водителем.
	_arr append [
		[[[["SPE_US_SquadLead",
			"SPE_US_Assist_SquadLead","SPE_US_AT_Soldier",
			"SPE_US_Grenadier","I_Boat_Transport_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],
			["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],
			[nil,nil,nil,nil,["SPE_US_Rifleman","SPE_US_Rifleman","SPE_US_Rifleman","SPE_US_Rifleman","SPE_US_Rifleman"]],0]
		],0.1]
	];
	if (_vivt) then {
		_arr append [
			[[[["jns_JNS_LCVP"],[],[]],[["SPE_M8_LAC"],[[0,-15,0]],["CORPORAL"]]],0.1],
			[[[["jns_JNS_LCVP"],[],[]],[["SPE_US_G503_MB_M1919_Armoured"],[[0,-15,0]],["CORPORAL"]]],0.1]
		];
	};
};
if (_landing in [1,2,23,24]) then {
	_arr append [
		// SPE_US_101AB_Infantry_squad
		[[[["SPEX_C47_Skytrain"],[],[]],
			[["SPE_US_101AB_SquadLead","SPE_US_101AB_mgunner","SPE_US_101AB_mgunner_assistant","SPE_US_101AB_Rifleman_AmmoBearer","SPE_US_101AB_rifleman","SPE_US_101AB_rifleman","SPE_US_101AB_Assist_SquadLead","SPE_US_101AB_grenadier","SPE_US_101AB_smgunner","SPE_US_101AB_rifleman","SPE_US_101AB_rifleman","SPE_US_101AB_medic"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.1],
		// SPE_US_82AB_Infantry_squad
		[[[["SPEX_C47_Skytrain"],[],[]],
			[["SPE_US_82AB_SquadLead","SPE_US_82AB_mgunner","SPE_US_82AB_mgunner_assistant","SPE_US_82AB_Rifleman_AmmoBearer","SPE_US_82AB_rifleman","SPE_US_82AB_rifleman","SPE_US_82AB_Assist_SquadLead","SPE_US_82AB_grenadier","SPE_US_82AB_smgunner","SPE_US_82AB_rifleman","SPE_US_82AB_rifleman","SPE_US_82AB_medic"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.1]
	];
};
if (_Artillery) then {
	_arr append [
		// SPE_M4A1_Calliope_Section, Расчет реактивной артиллерии «Каллиопа»
		[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_US_ARMY" >> "Armored" >> "SPE_M4A1_Calliope_Section"]],0.3]
	];
}else{
	_arr append [
		[[[["SPE_M4A3_T34_Calliope_Direct","SPE_M4A3_T34_Calliope_Direct"],[[0,0,0],[10,-10,0]],["SERGEANT","CORPORAL"]]],0.03]
	];
};
[_arr] call gosa_fnc_groups_convNormal;
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "SPE_US_ARMY",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 999], __exclude
	] call gosa_fnc_map_groups_add;
};

//-- SPE_FFI, [SPE] Французские внутренние войска
_arr = [
	//- Mechanized, Механизированная пехота
	// SPE_FFI_250_Team, Механизированная разведывательная группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Mechanized" >> "SPE_FFI_250_Team"]],0.6],
	//- Infantry, Пехота
	// SEP_I_FFI_Partisan_Team, Partisan Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SEP_I_FFI_Partisan_Team"]],0.5],
	// SPE_FFI_Command_Circle, Командование
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Command_Circle"]],0.6],
	// SPE_FFI_FighterCell, Боевая ячейка
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_FighterCell"]],0.8],
	// SPE_FFI_Tankhunter_team, Группа истребителей танков
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Tankhunter_team"]],0.4],
	// SPE_FFI_Sentry_Squad_2, 2 часовых
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Sentry_Squad_2"]],0.4],
	// SPE_FFI_Sentry_Squad_3, 3 часовых
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Sentry_Squad_3"]],0.4],
	// SPE_FFI_Sniper_Team, Снайперская группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Sniper_Team"]],0.4],
	// SPE_FFI_Assault_Team, Штурмовая группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Assault_Team"]],0.4],
	// SPE_FFI_Machinegun_team, Пулеметный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Machinegun_team"]],0.4],
	// SPE_FFI_Sapper_Team, Саперная группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Sapper_Team"]],0.4],
	// SPE_FFI_Saboteur_Team, Диверсионная группа
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Saboteur_Team"]],0.9],
	// SPE_FFI_Militia_Group, Отряд ополченцев
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPE_FFI" >> "Infantry" >> "SPE_FFI_Militia_Group"]],0.4]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr append [
	[[[["SPE_FFI_OpelBlitz_Ambulance"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "SPE_FFI",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 999], __exclude
	] call gosa_fnc_map_groups_add;
};

//-- SPEX_PL_ARMY, [SPEX] Polish West Corps
_arr = [
	//- Motorized, Моторизованная пехота
	// SPEX_CW_Motorized_Infantry_Squad, Моторизованное пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Motorized" >> "SPEX_CW_Motorized_Infantry_Squad"]],0.6],
	// SPEX_CW_Jeep_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Motorized" >> "SPEX_CW_Jeep_Command_Section"]],0.6],
	//- Mechanized, Механизированная пехота
	// SPEX_CW_Mechanized_Platoon_HQ, Штаб бронетанкового взвода
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Mechanized" >> "SPEX_CW_Mechanized_Platoon_HQ"]],0.6],
	// SPEX_CW_Mechanized_Infantry_Squad, Механизированное пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Mechanized" >> "SPEX_CW_Mechanized_Infantry_Squad"]],0.6],
	//- Armored, Бронетанковая
	// SPEX_PL_M10_TD_Troop, Взвод истребителей танков M10
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Armored" >> "SPEX_PL_M10_TD_Troop"]],_rarity_TankPlatoon/4],
	// SPEX_PL_sherman_V_Troop, Взвод Sherman V
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Armored" >> "SPEX_PL_sherman_V_Troop"]],_rarity_TankPlatoon/4],
	// SPEX_PL_Cromwell_Troop, Взвод Cromwell
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Armored" >> "SPEX_PL_Cromwell_Troop"]],_rarity_TankPlatoon/4],
	// SPEX_PL_Cromwell_CS_Troop, Взвод Cromwell HQ
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Armored" >> "SPEX_PL_Cromwell_CS_Troop"]],_rarity_TankPlatoon/4],
	//- Infantry, Пехота
	// SPEX_PL_Command_Section, Командный отряд
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Infantry" >> "SPEX_PL_Command_Section"]],0],
	// SPEX_PL_Bren_Group, Группа с BREN
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Infantry" >> "SPEX_PL_Bren_Group"]],0],
	// SPEX_PL_PIAT_Group, Противотанковое отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Infantry" >> "SPEX_PL_PIAT_Group"]],0],
	// SPEX_PL_mortar_Group, Минометный расчет
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Infantry" >> "SPEX_PL_mortar_Group"]],0],
	// SPEX_PL_Rifle_Group, Стрелковая команда
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Infantry" >> "SPEX_PL_Rifle_Group"]],0],
	// SPEX_PL_scout_Section, Разведывательное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Infantry" >> "SPEX_PL_scout_Section"]],0],
	// SPEX_PL_infantry_Section, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "SPEX_PL_ARMY" >> "Infantry" >> "SPEX_PL_infantry_Section"]],0]
];
[_arr] call gosa_fnc_groups_convNormal;
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "SPEX_PL_ARMY",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160, 999], __exclude
	] call gosa_fnc_map_groups_add;
};
