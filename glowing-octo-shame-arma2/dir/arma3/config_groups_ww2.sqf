//-- LIB_RKKA, Красная Армия
_arr = [
	//- Air, Авиация
	// LIB_SOV_P39_Group, Звено P47 Аэрокобра
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Air" >> "LIB_SOV_P39_Group"]],_rarity_bad],
	// LIB_SOV_Pe2_Group, Звено Пе-2 110 серии
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Air" >> "LIB_SOV_Pe2_Group"]],_rarity_bad],
	//- Infantry, Пехота
	// LIB_SOV_infantry_squad, Стрелковое отделение
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Infantry" >> "LIB_SOV_infantry_squad"]],_rarity_InfSquad],
	// LIB_SOV_smg_squad, Отделение автоматчиков
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Infantry" >> "LIB_SOV_smg_squad"]],_rarity_InfSquad_Weapon],
	// LIB_SOV_AT_squad, Отделение противотанкистов
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Infantry" >> "LIB_SOV_AT_squad"]],_rarity_InfTeam_AT],
	// LIB_SOV_scout_squad, Отделение разведчиков
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Infantry" >> "LIB_SOV_scout_squad"]],_rarity_reconSquad],
	// LIB_SOV_sentry_2, 2 Man Sentry
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Infantry" >> "LIB_SOV_sentry_2"]],_rarity_InfSentry/2],
	// LIB_SOV_sentry_3, 3 Man Sentry
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Infantry" >> "LIB_SOV_sentry_3"]],_rarity_InfSentry/2],
	// LIB_SOV_sniper_team, Sniper Team
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Infantry" >> "LIB_SOV_sniper_team"]],_rarity_SniperTeam],
	// LIB_SOV_ATRifle_team, AT Rifle Team
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Infantry" >> "LIB_SOV_ATRifle_team"]],_rarity_InfTeam_AT],
	// LIB_SOV_MG_team, Machine Gun Team
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Infantry" >> "LIB_SOV_MG_team"]],_rarity_InfTeam_MG],
	//- Motorized, Моторизованная пехота
	// LIB_Motorized_Infantry_Squad, Отделение мотопехоты
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Motorized" >> "LIB_Motorized_Infantry_Squad"]],_rarity_MotInf_Team],
	// LIB_Scout_Motorized_Infantry_Squad, Моторизованное отделение разведчиков
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Motorized" >> "LIB_Scout_Motorized_Infantry_Squad"]],_rarity_MotInf_Team*_rarity_reconSquad],
	//- Mechanized, Механизированная пехота
	// LIB_Mechanized_Infantry_Squad, Отделение механизированной пехоты
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Mechanized" >> "LIB_Mechanized_Infantry_Squad"]],_rarity_MechInfSquad],
	//- Armored, Средние танки
	// LIB_SOV_T34_76_Platoon, Взвод Т-34-76
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Armored" >> "LIB_SOV_T34_76_Platoon"]],_rarity_TankPlatoon/4],
	// LIB_SOV_T34_85_Platoon, Взвод Т-34-85
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Armored" >> "LIB_SOV_T34_85_Platoon"]],_rarity_TankPlatoon/4],
	// LIB_SOV_M4A2_Platoon, Взвод Шерман M4A2
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Armored" >> "LIB_SOV_M4A2_Platoon"]],0],
	// LIB_SOV_SU85_Platoon, Взвод САУ СУ-85
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Armored" >> "LIB_SOV_SU85_Platoon"]],_rarity_TankPlatoon/4],
	// LIB_SOV_JS2_43_Platoon, Взвод ИС-122 '43
	[[[configFile >> "CfgGroups" >> "East" >> "LIB_RKKA" >> "Armored" >> "LIB_SOV_JS2_43_Platoon"]],_rarity_TankPlatoon/4]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// Boat
	[[[["LIB_SOV_sergeant","LIB_SOV_smgunner","LIB_SOV_mgunner","LIB_SOV_grenadier","O_Boat_Transport_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],
		["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE"],[[],[],[],[],["LIB_SOV_rifleman"]]]
	],_rarity_bad]
];
if (_landing in [1,2,23,24]) then {
	_arr append [
		// LIB_Li2
		[[[["LIB_Li2"],[],[]],
			[["LIB_SOV_scout_sergeant","LIB_SOV_scout_smgunner","LIB_SOV_scout_rifleman","LIB_SOV_scout_mgunner","LIB_SOV_scout_sniper","LIB_SOV_assault_smgunner","LIB_SOV_assault_smgunner","LIB_SOV_scout_smgunner","LIB_SOV_scout_smgunner","LIB_SOV_scout_smgunner","LIB_SOV_scout_smgunner"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],_rarity_bad]
	];
};
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, east, "LIB_RKKA",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160,999], __exclude
	] call gosa_fnc_map_groups_add;
};
// LIB_RKKA_w
_arr = [
	// LIB_SOV_sentry
	[[[["LIB_SOV_sergeant_w","LIB_SOV_LC_rifleman_w"],[[0,5,0],[3,0,0]],["SERGEANT","CORPORAL"]]],0.4],
	// LIB_SOV_infantry_squad
	[[[["LIB_SOV_sergeant_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w","LIB_SOV_mgunner_w","LIB_SOV_medic_w","LIB_SOV_LAT_Soldier_w","LIB_SOV_AT_grenadier_w","LIB_SOV_LC_rifleman_w","LIB_SOV_rifleman_w","LIB_SOV_rifleman_w","LIB_SOV_rifleman_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_SOV_smg_squad
	[[[["LIB_SOV_sergeant_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w","LIB_SOV_mgunner_w","LIB_SOV_medic_w","LIB_SOV_LAT_Soldier_w","LIB_SOV_AT_grenadier_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_SOV_AT_squad
	[[[["LIB_SOV_sergeant_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w","LIB_SOV_AT_soldier_w","LIB_SOV_AT_M1A1_soldier_w","LIB_SOV_LAT_Soldier_w","LIB_SOV_LAT_Soldier_w","LIB_SOV_AT_grenadier_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_SOV_ATRifle_team
	[[[["LIB_SOV_scout_atrifle_gunner_w","LIB_SOV_scout_atrifle_assistant_w"],[[0,5,0],[3,0,0]],["SERGEANT","CORPORAL"]]],0.4],
	// LIB_SOV_scout_squad
	[[[["LIB_SOV_scout_sergeant_w","LIB_SOV_scout_smgunner_w","LIB_SOV_scout_smgunner_w","LIB_SOV_scout_mgunner_w","LIB_SOV_scout_sniper_w","LIB_SOV_assault_smgunner_w","LIB_SOV_assault_smgunner_w","LIB_SOV_scout_smgunner_w","LIB_SOV_scout_smgunner_w","LIB_SOV_scout_smgunner_w","LIB_SOV_scout_smgunner_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_Motorized_Infantry_Squad
	[[[["LIB_SOV_sergeant_w","LIB_US6_tent_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w","LIB_SOV_mgunner_w","LIB_SOV_medic_w","LIB_SOV_AT_grenadier_w","LIB_SOV_AT_grenadier_w","LIB_SOV_LC_rifleman_w","LIB_SOV_rifleman_w","LIB_SOV_rifleman_w","LIB_SOV_rifleman_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_Scout_Motorized_Infantry_Squad
	[[[["LIB_SOV_scout_sergeant_w","LIB_Scout_m3_w","LIB_SOV_scout_smgunner_w","LIB_SOV_scout_smgunner_w","LIB_SOV_scout_mgunner_w","LIB_SOV_scout_sniper_w","LIB_SOV_assault_smgunner_w","LIB_SOV_assault_smgunner_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_Mechanized_Infantry_Squad
	[[[["LIB_SOV_sergeant_w","LIB_SOV_M3_Halftrack_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w","LIB_SOV_mgunner_w","LIB_SOV_medic_w","LIB_SOV_AT_grenadier_w","LIB_SOV_AT_grenadier_w","LIB_SOV_LC_rifleman_w","LIB_SOV_rifleman_w","LIB_SOV_rifleman_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.6],
	// LIB_SOV_JS2_43_Platoon
	[[[["LIB_JS2_43_w","LIB_JS2_43_w"],[[0,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
	// LIB_SOV_T34_76_Platoon
	[[[["LIB_T34_76_w","LIB_T34_76_w","LIB_T34_76_w","LIB_T34_76_w"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE"]]],0.3],
	// LIB_SOV_T34_85_Platoon
	[[[["LIB_T34_85_w","LIB_T34_85_w","LIB_T34_85_w","LIB_T34_85_w"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE"]]],0.4],
	// LIB_SOV_SU85_Platoon
	[[[["LIB_SU85_w","LIB_SU85_w","LIB_SU85_w"],[[0,10,0],[10,0,0],[20,0,0]],["LIEUTENANT","SERGEANT","PRIVATE"]]],0.3]
];
_arr append [
	// LIB_Motorized_Infantry_Squad
	[[[["LIB_SOV_sergeant_w","LIB_Zis5v_w","LIB_SOV_smgunner_w","LIB_SOV_smgunner_w","LIB_SOV_mgunner_w","LIB_SOV_medic_w","LIB_SOV_AT_grenadier_w","LIB_SOV_AT_grenadier_w","LIB_SOV_LC_rifleman_w","LIB_SOV_rifleman_w","LIB_SOV_rifleman_w","LIB_SOV_rifleman_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],

	[[[["LIB_Pe2_w","LIB_Pe2_w"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.1],

	[[[["LIB_Zis6_parm_w","LIB_Zis5v_fuel_w"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["LIB_Zis5v_med_w"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, east, "LIB_RKKA",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [-999,159], __exclude
	] call gosa_fnc_map_groups_add;
};


//-- LIB_WEHRMACHT, Вермахт
_arr = [
	//- Infantry, Пехота
	// LIB_GER_infantry_squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Infantry" >> "LIB_GER_infantry_squad"]],_rarity_InfSquad],
	// LIB_GER_AT_squad, Отделение противотанкистов
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Infantry" >> "LIB_GER_AT_squad"]],_rarity_InfTeam_AT],
	// LIB_GER_scout_squad, Отделение разведчиков
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Infantry" >> "LIB_GER_scout_squad"]],_rarity_reconSquad],
	// LIB_GER_sentry_squad_2, 2 Man Sentry
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Infantry" >> "LIB_GER_sentry_squad_2"]],_rarity_InfSentry/2],
	// LIB_GER_sentry_squad_3, 3 Man Sentry
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Infantry" >> "LIB_GER_sentry_squad_3"]],_rarity_InfSentry/2],
	// LIB_GER_sniper_team, Sniper Team
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Infantry" >> "LIB_GER_sniper_team"]],_rarity_SniperTeam],
	// LIB_GER_MG_team, Machine Gun Team
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Infantry" >> "LIB_GER_MG_team"]],_rarity_InfTeam_MG],
	//- Motorized, Моторизованная пехота
	// LIB_Motorized_Infantry_Squad, Отделение мотопехоты
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Motorized" >> "LIB_Motorized_Infantry_Squad"]],_rarity_MotInf_Team],
	//- Mechanized, Механизированная пехота
	// LIB_Mechanized_Infantry_Squad, Отделение механизированной пехоты
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Mechanized" >> "LIB_Mechanized_Infantry_Squad"]],_rarity_MechInfSquad],
	// LIB_Scout_Mechanized_Infantry_Squad, Механизированное отделение разведчиков
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Mechanized" >> "LIB_Scout_Mechanized_Infantry_Squad"]],_rarity_MechInfSquad*_rarity_reconSquad],
	//- Air, Авиация
	// LIB_GER_fw190f8_Group, Пара Fw 190 F-8
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Air" >> "LIB_GER_fw190f8_Group"]],_rarity_Plane/2],
	// LIB_GER_Ju87_Group, Пара Ju-87-D5
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Air" >> "LIB_GER_Ju87_Group"]],_rarity_Plane/2],
	//- Armored, Средние танки
	// LIB_GER_StuG_III_G_Platoon, Взвод САУ StuG III Ausf.G
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Armored" >> "LIB_GER_StuG_III_G_Platoon"]],_rarity_TankPlatoon/5],
	// LIB_GER_PzKpfwIV_H_Platoon, Взвод PzKpfw IV Ausf.H
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Armored" >> "LIB_GER_PzKpfwIV_H_Platoon"]],_rarity_TankPlatoon/5],
	// LIB_GER_PzKpfwV_Platoon, Взвод PzKpfw V Ausf.A
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Armored" >> "LIB_GER_PzKpfwV_Platoon"]],_rarity_TankPlatoon/5],
	// LIB_GER_PzKpfwVI_B_Platoon, Взвод PzKpfw VI Ausf.B
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Armored" >> "LIB_GER_PzKpfwVI_B_Platoon"]],_rarity_TankPlatoon/5],
	// LIB_GER_PzKpfwVI_E_Platoon, Взвод PzKpfw VI Ausf.E
	[[[configFile >> "CfgGroups" >> "West" >> "LIB_WEHRMACHT" >> "Armored" >> "LIB_GER_PzKpfwVI_E_Platoon"]],_rarity_TankPlatoon/5]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// Boat
	[[[["SG_sturmtrooper_unterofficer","SG_sturmtrooper_stggunner","SG_sturmtrooper_mgunner2","SG_sturmtrooper_ober_grenadier","B_Boat_Transport_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],
		["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE"],[[],[],[],[],["SG_sturmtrooper_rifleman"]]]
	],_rarity_bad]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "LIB_WEHRMACHT",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160,279], __exclude
	] call gosa_fnc_map_groups_add;
};
// LIB_WEHRMACHT_w
_arr = [
	// LIB_GER_infantry_squad
	[[[["LIB_GER_unterofficer_w","LIB_GER_mgunner_w","LIB_GER_medic_w","LIB_GER_scout_ober_rifleman_w","LIB_GER_ober_rifleman_w","LIB_GER_rifleman_w","LIB_GER_ober_grenadier_w","LIB_GER_LAT_Rifleman_w","LIB_GER_rifleman_w","LIB_GER_scout_rifleman_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_GER_AT_squad
	[[[["LIB_GER_unterofficer_w","LIB_GER_AT_soldier_w","LIB_GER_AT_soldier_w","LIB_GER_ober_grenadier_w","LIB_GER_LAT_Rifleman_w","LIB_GER_LAT_Rifleman_w","LIB_GER_AT_grenadier_w","LIB_GER_AT_grenadier_w","LIB_GER_AT_soldier_w","LIB_GER_AT_soldier_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// LIB_GER_scout_squad
	[[[["LIB_GER_scout_unterofficer_w","LIB_GER_scout_mgunner_w","LIB_GER_scout_sniper_w","LIB_GER_scout_ober_rifleman_w","LIB_GER_scout_smgunner_w","LIB_GER_scout_smgunner_w","LIB_GER_scout_smgunner_w","LIB_GER_scout_smgunner_w","LIB_GER_Scout_ober_grenadier_w","LIB_GER_scout_rifleman_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_Motorized_Infantry_Squad
	[[[["LIB_GER_unterofficer_w","LIB_OpelBlitz_Open_Y_Camo_w","LIB_GER_mgunner_w","LIB_GER_medic_w","LIB_GER_scout_ober_rifleman_w","LIB_GER_ober_rifleman_w","LIB_GER_rifleman_w","LIB_GER_AT_grenadier_w","LIB_GER_AT_grenadier_w","LIB_GER_rifleman_w","LIB_GER_scout_rifleman_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_Mechanized_Infantry_Squad
	[[[["LIB_GER_unterofficer_w","LIB_SdKfz251_w","LIB_GER_mgunner_w","LIB_GER_medic_w","LIB_GER_scout_ober_rifleman_w","LIB_GER_ober_rifleman_w","LIB_GER_rifleman_w","LIB_GER_AT_grenadier_w","LIB_GER_AT_grenadier_w","LIB_GER_rifleman_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_Scout_Mechanized_Infantry_Squad
	[[[["LIB_GER_scout_unterofficer_w","LIB_SdKfz251_w","LIB_GER_scout_mgunner_w","LIB_GER_scout_sniper_w","LIB_GER_scout_ober_rifleman_w","LIB_GER_scout_smgunner_w","LIB_GER_scout_smgunner_w","LIB_GER_scout_smgunner_w","LIB_GER_scout_rifleman_w","LIB_GER_scout_rifleman_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_GER_fw190f8_Group
	[[[["LIB_Fw190f8_w","LIB_Fw190f8_w"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.5],
	// LIB_GER_PzKpfwIV_H_Platoon
	[[[["LIB_PzKpfwIV_H_w","LIB_PzKpfwIV_H_w","LIB_PzKpfwIV_H_w","LIB_PzKpfwIV_H_w"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE"]]],0.25],
	// LIB_GER_PzKpfwV_Platoon
	[[[["LIB_PzKpfwV_w","LIB_PzKpfwV_w","LIB_PzKpfwV_w"],[[0,10,0],[10,0,0],[20,0,0]],["LIEUTENANT","SERGEANT","PRIVATE"]]],0.15],
	// LIB_GER_PzKpfwVI_B_Platoon
	[[[["LIB_PzKpfwVI_B_camo_w","LIB_PzKpfwVI_B_camo_w"],[[0,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05],
	// LIB_GER_PzKpfwVI_E_Platoon
	[[[["LIB_PzKpfwVI_E_w","LIB_PzKpfwVI_E_w","LIB_PzKpfwVI_E_w","LIB_PzKpfwVI_E_w"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.2],
	// LIB_GER_StuG_III_G_Platoon
	[[[["LIB_StuG_III_G_w","LIB_StuG_III_G_w","LIB_StuG_III_G_w","LIB_StuG_III_G_w"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE"]]],0.2]
];
// LIB_PANZERWAFFE_w
_arr append [
	// LIB_GER_StuG_III_G_Platoon
	[[[["LIB_StuG_III_G_w","LIB_StuG_III_G_w","LIB_StuG_III_G_w","LIB_StuG_III_G_w"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE"]]],0.2],
	// LIB_GER_PzKpfwIV_H_Platoon
	[[[["LIB_PzKpfwIV_H_w","LIB_PzKpfwIV_H_w","LIB_PzKpfwIV_H_w","LIB_PzKpfwIV_H_w"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE"]]],0.25],
	// LIB_GER_PzKpfwV_Platoon
	[[[["LIB_PzKpfwV_w","LIB_PzKpfwV_w","LIB_PzKpfwV_w"],[[0,10,0],[10,0,0],[20,0,0]],["LIEUTENANT","SERGEANT","PRIVATE"]]],0.15],
	// LIB_GER_PzKpfwVI_B_Platoon
	[[[["LIB_PzKpfwVI_B_camo_w","LIB_PzKpfwVI_B_camo_w"],[[0,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05],
	// LIB_GER_PzKpfwVI_E_Platoon
	[[[["LIB_PzKpfwVI_E_w","LIB_PzKpfwVI_E_w","LIB_PzKpfwVI_E_w","LIB_PzKpfwVI_E_w"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.2]
];
// LIB_LUFTWAFFE_w
_arr append [
	// LIB_GER_fw190f8_Group
	[[[["LIB_fw190f8_w","LIB_fw190f8_w"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05],
	// LIB_GER_Ju87_Group
	[[[["LIB_Ju87_w","LIB_Ju87_w"],[[0,30,0],[30,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05]
];
_arr append [
	[[[["LIB_OpelBlitz_Parm_w","LIB_OpelBlitz_Ammo_w","LIB_OpelBlitz_Fuel_w"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["LIB_OpelBlitz_Ambulance_w"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "LIB_WEHRMACHT",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [-999,159], __exclude
	] call gosa_fnc_map_groups_add;
};
// LIB_DAK
_arr = [
	// LIB_DAK_infantry_squad
	[[[["LIB_DAK_NCO","LIB_DAK_Soldier_3","LIB_DAK_medic","LIB_DAK_Soldier_2","LIB_DAK_grenadier","LIB_DAK_Soldier","LIB_DAK_AT_grenadier","LIB_DAK_Soldier","LIB_DAK_Soldier","LIB_DAK_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_DAK_AT_squad
	[[[["LIB_DAK_NCO_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_2","LIB_DAK_AT_grenadier","LIB_DAK_AT_grenadier","LIB_DAK_AT_grenadier","LIB_DAK_AT_grenadier","LIB_DAK_grenadier","LIB_DAK_Soldier","LIB_DAK_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// LIB_DAK_scout_squad
	[[[["LIB_DAK_Sentry","LIB_DAK_Sentry"],[[0,5,0],[3,0,0]],["SERGEANT","CORPORAL"]]],0.4],
	// LIB_Motorized_Infantry_Squad
	[[[["LIB_DAK_NCO","LIB_DAK_opelblitz_open_3","LIB_DAK_Soldier_3","LIB_DAK_medic","LIB_DAK_Soldier_2","LIB_DAK_Soldier","LIB_DAK_Soldier","LIB_DAK_AT_grenadier","LIB_DAK_AT_grenadier","LIB_DAK_Soldier","LIB_DAK_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_Mechanized_Infantry_Squad
	[[[["LIB_DAK_NCO","LIB_DAK_SdKfz251","LIB_DAK_Soldier_3","LIB_DAK_medic","LIB_DAK_Soldier_2","LIB_DAK_Soldier","LIB_DAK_Soldier","LIB_DAK_AT_grenadier","LIB_DAK_AT_grenadier","LIB_DAK_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_Scout_Mechanized_Infantry_Squad
	[[[["LIB_DAK_NCO_2","LIB_DAK_SdKfz251","LIB_DAK_Soldier_3","LIB_DAK_Sniper","LIB_DAK_Soldier_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier","LIB_DAK_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_GER_fw190f8_Group
	[[[["LIB_DAK_FW190F8","LIB_DAK_FW190F8"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.5],
	// LIB_GER_PzKpfwIV_H_Platoon
	[[[["LIB_DAK_PzKpfwIV_H","LIB_DAK_PzKpfwIV_H","LIB_DAK_PzKpfwIV_H","LIB_DAK_PzKpfwIV_H"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE"]]],0.25],
	// LIB_GER_PzKpfwVI_E_Platoon
	[[[["LIB_DAK_PzKpfwVI_E","LIB_DAK_PzKpfwVI_E"],[[0,10,0],[10,0,0]],["CAPTAIN","LIEUTENANT"]]],0.2]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, west, "LIB_WEHRMACHT",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [280,999], __exclude
	] call gosa_fnc_map_groups_add;
};


//-- LIB_US_ARMY, Армия США
_arr = [
	//- Air, Авиация
	// LIB_US_P47_Group, Группа P47 Тандерболт
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Air" >> "LIB_US_P47_Group"]],_rarity_Plane],
	//- Motorized, Моторизованная пехота
	// LIB_Motorized_Infantry_Squad, Отделение мотопехоты
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Motorized" >> "LIB_Motorized_Infantry_Squad"]],_rarity_MotInf_Team],
	// LIB_Scout_Motorized_Infantry_Squad, Моторизованное отделение разведчиков
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Motorized" >> "LIB_Scout_Motorized_Infantry_Squad"]],_rarity_MotInf_Team*_rarity_reconSquad/2],
	// LIB_US_jeep_scout, Моторизованное отделение разведчиков
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Motorized" >> "LIB_US_jeep_scout"]],_rarity_MotInf_Team*_rarity_reconSquad/2],
	//- Mechanized, Механизированная пехота
	// LIB_Mechanized_Infantry_Squad, Отделение механизированной пехоты
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Mechanized" >> "LIB_Mechanized_Infantry_Squad"]],_rarity_MechInfSquad],
	// LIB_M3A3_Platoon, Взвод Шерман M3A3
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Mechanized" >> "LIB_M3A3_Platoon"]],_rarity_MechInf_AT],
	// LIB_US_Greyhound_patrol, M8 Greyhound Patrol
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Mechanized" >> "LIB_US_Greyhound_patrol"]],_rarity_MotInf_HMGTeam],
	//- Armored, Средние танки
	// LIB_M4A3_75_Platoon, Взвод Шерман M4A3
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Armored" >> "LIB_M4A3_75_Platoon"]],_rarity_TankPlatoon/2],
	// LIB_M4A3_76_Platoon, Взвод Шерман M4A3 76
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Armored" >> "LIB_M4A3_76_Platoon"]],_rarity_TankPlatoon/2],
	//- Infantry, Пехота
	// LIB_US_Command_Section, Command Section
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Infantry" >> "LIB_US_Command_Section"]],_rarity_Command/2],
	// LIB_US_Command_Squad, Command Squad
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Infantry" >> "LIB_US_Command_Squad"]],_rarity_Command/2],
	// LIB_US_Infantry_Squad, Пехотное отделение
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Infantry" >> "LIB_US_Infantry_Squad"]],_rarity_InfSquad],
	// LIB_US_AT_Squad, Отделение противотанкистов
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Infantry" >> "LIB_US_AT_Squad"]],_rarity_InfTeam_AT],
	// LIB_US_Scout_Squad, Отделение разведчиков
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Infantry" >> "LIB_US_Scout_Squad"]],_rarity_ReconTeam],
	// LIB_US_Sentry_Squad_2, 2 Man Sentry
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Infantry" >> "LIB_US_Sentry_Squad_2"]],_rarity_InfSentry/2],
	// LIB_US_Sentry_Squad_3, 3 Man Sentry
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Infantry" >> "LIB_US_Sentry_Squad_3"]],_rarity_InfSentry/2],
	// LIB_US_Sniper_Team, Sniper Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Infantry" >> "LIB_US_Sniper_Team"]],_rarity_SniperTeam],
	// LIB_US_Machine_Gun_Team, Machine Gun Team
	[[[configFile >> "CfgGroups" >> "Indep" >> "LIB_US_ARMY" >> "Infantry" >> "LIB_US_Machine_Gun_Team"]],_rarity_InfTeam_MG]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr append [
	// Boat
	[[[["LIB_US_SMGunner","LIB_US_SMGunner","LIB_US_MGunner","LIB_US_Grenadier","I_Boat_Transport_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],
		["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE"],[[],[],[],[],["LIB_US_Rifleman"]]]
	],_rarity_bad]
];
_arr append [
	[[[["LIB_US_GMC_Parm","LIB_US_GMC_Ammo","LIB_US_GMC_Fuel"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],_rarity_bad],
	[[[["LIB_US_GMC_Ambulance"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],_rarity_bad]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "LIB_US_ARMY",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160,279], __exclude
	] call gosa_fnc_map_groups_add;
};
// LIB_US_ARMY_w
_arr = [
	// LIB_Motorized_Infantry_Squad
	[[[["LIB_US_smgunner_w","LIB_US_GMC_Open_w","LIB_US_mgunner_w","LIB_US_medic_w","LIB_US_Corporal_w","LIB_US_mgunner_w","LIB_US_FC_rifleman_w","LIB_US_FC_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_US_infantry_sentry_3
	[[[["LIB_US_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.4],
	// LIB_US_infantry_sentry_2
	[[[["LIB_US_smgunner_w","LIB_US_rifleman_w"],[[0,5,0],[3,0,0]],["SERGEANT","PRIVATE"]]],0.4],
	// LIB_US_infantry_squad
	[[[["LIB_US_smgunner_w","LIB_US_mgunner_w","LIB_US_medic_w","LIB_US_corporal_w","LIB_US_mgunner_w","LIB_US_FC_rifleman_w","LIB_US_FC_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_US_machine_gun_team
	[[[["LIB_US_smgunner_w","LIB_US_mgunner_w","LIB_US_mgunner_w","LIB_US_rifleman_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_US_AT_squad
	[[[["LIB_US_smgunner_w","LIB_US_AT_soldier_w","LIB_US_AT_soldier_w","LIB_US_AT_soldier_w","LIB_US_FC_rifleman_w","LIB_US_FC_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_US_sniper_team
	[[[["LIB_US_sniper_w","LIB_US_sniper_w"],[[0,5,0],[3,0,0]],["SERGEANT","PRIVATE"]]],0.4],
	// LIB_US_scout_squad
	[[[["LIB_US_smgunner_w","LIB_US_mgunner_w","LIB_US_sniper_w","LIB_US_medic_w","LIB_US_mgunner_w","LIB_US_FC_rifleman_w","LIB_US_FC_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w","LIB_US_rifleman_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_Mechanized_Infantry_Squad
	[[[["LIB_US_M3_Halftrack_w","LIB_US_Smgunner_w","LIB_US_Mgunner_w","LIB_US_Medic_w","LIB_US_Corporal_w","LIB_US_Mgunner_w","LIB_US_FC_rifleman_w","LIB_US_FC_rifleman_w","LIB_US_Rifleman_w","LIB_US_Rifleman_w","LIB_US_Rifleman_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_M4A3_75_Platoon
	[[[["LIB_M4A3_75_w","LIB_M4A3_75_w","LIB_M4A3_75_w","LIB_M4A3_75_w"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE"]]],0.3]
];
_arr append [
	[[[["LIB_US_GMC_Parm_w","LIB_US_GMC_Parm_w","LIB_US_GMC_Fuel_w"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["LIB_US_GMC_Ambulance_w"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "LIB_US_ARMY",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [-999,159], __exclude
	] call gosa_fnc_map_groups_add;
};
// LIB_NAC
_arr = [
	// LIB_US_NAC_motorized_infantry_squad
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_GMC_Open","LIB_US_NAC_mgunner","LIB_US_NAC_medic","LIB_US_NAC_FC_rifleman","LIB_US_NAC_mgunner","LIB_US_NAC_FC_rifleman","LIB_US_NAC_FC_rifleman","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_US_NAC_scout_motorized_infantry_squad
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_Scout_m3","LIB_US_NAC_mgunner","LIB_US_NAC_sniper","LIB_US_NAC_medic","LIB_US_NAC_mgunner","LIB_US_NAC_FC_rifleman","LIB_US_NAC_rifleman"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// LIB_US_NAC_command_squad
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_radioman","LIB_US_NAC_corporal","LIB_US_NAC_medic","LIB_US_NAC_FC_rifleman","LIB_US_NAC_FC_rifleman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_US_NAC_command_section
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_corporal","LIB_US_NAC_medic","LIB_US_NAC_radioman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.8],
	// LIB_US_NAC_infantry_squad
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_mgunner","LIB_US_NAC_medic","LIB_US_NAC_corporal","LIB_US_NAC_mgunner","LIB_US_NAC_grenadier","LIB_US_NAC_FC_rifleman","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_US_NAC_sentry_2
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_rifleman"],[[0,5,0],[3,0,0]],["SERGEANT","PRIVATE"]]],0.5],
	// LIB_US_NAC_sentry_3
	[[[["LIB_US_NAC_rifleman","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.5],
	// LIB_US_NAC_AT_squad
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_AT_soldier","LIB_US_NAC_AT_soldier","LIB_US_NAC_AT_soldier","LIB_US_NAC_FC_rifleman","LIB_US_NAC_FC_rifleman","LIB_US_NAC_grenadier","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_US_NAC_machine_gun_team
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_mgunner","LIB_US_NAC_mgunner","LIB_US_NAC_rifleman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// LIB_US_scout_squad
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_mgunner","LIB_US_NAC_sniper","LIB_US_NAC_medic","LIB_US_NAC_mgunner","LIB_US_NAC_FC_rifleman","LIB_US_NAC_FC_rifleman","LIB_US_NAC_grenadier","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
	// LIB_Mechanized_Infantry_Squad
	[[[["LIB_US_NAC_smgunner","LIB_US_NAC_M3_Halftrack","LIB_US_NAC_mgunner","LIB_US_NAC_medic","LIB_US_NAC_corporal","LIB_US_NAC_mgunner","LIB_US_NAC_FC_rifleman","LIB_US_NAC_FC_rifleman","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman","LIB_US_NAC_rifleman"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_US_NAC_M4A3_75_Platoon
	[[[["LIB_US_NAC_M4A3_75","LIB_US_NAC_M4A3_75","LIB_US_NAC_M4A3_75","LIB_US_NAC_M4A3_75"],[[0,10,0],[10,0,0],[20,0,0],[30,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE"]]],0.3]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "LIB_US_ARMY",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [280,999], __exclude
	] call gosa_fnc_map_groups_add;
};

// LIB_UK_ARMY
_arr = [
	// Boat
	[[[["LIB_UK_Sergeant","LIB_UK_Rifleman","LIB_UK_LanceCorporal","LIB_UK_Grenadier","I_Boat_Transport_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],
		["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE"],[[],[],[],[],["LIB_UK_Rifleman"]]]
	],0.1],

	// LIB_UK_machine_gun_team
	[[[["LIB_UK_Sergeant","LIB_UK_LanceCorporal","LIB_UK_Corporal","LIB_UK_Rifleman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_UK_infantry_squad
	[[[["LIB_UK_Sergeant","LIB_UK_LanceCorporal","LIB_UK_Corporal","LIB_UK_Corporal","LIB_UK_Grenadier","LIB_UK_Rifleman","LIB_UK_Rifleman","LIB_UK_Rifleman","LIB_UK_Rifleman","LIB_UK_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_UK_Sentry_Squad_3
	[[[["LIB_UK_Rifleman","LIB_UK_Rifleman","LIB_UK_Rifleman"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.6],
	// LIB_UK_Sentry_Squad_2
	[[[["LIB_UK_Sergeant","LIB_UK_Rifleman"],[[0,5,0],[3,0,0]],["SERGEANT","PRIVATE"]]],0.5],
	// LIB_UK_AT_squad
	[[[["LIB_UK_Sergeant","LIB_UK_AT_Soldier","LIB_UK_AT_Soldier","LIB_UK_AT_Soldier","LIB_UK_AT_Soldier","LIB_UK_Rifleman","LIB_UK_Rifleman","LIB_UK_Corporal","LIB_UK_Rifleman","LIB_UK_Rifleman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// LIB_Mechanized_Infantry_Squad
	[[[["LIB_UK_Sergeant","LIB_UniversalCarrier","LIB_UK_Rifleman","LIB_UK_LanceCorporal","LIB_UK_Corporal","LIB_UK_Corporal","LIB_UK_Grenadier","LIB_UK_Rifleman","LIB_UK_Rifleman","LIB_UK_Medic"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_Cromwell_Mk4_Platoon
	[[[["LIB_Cromwell_Mk4","LIB_Cromwell_Mk4"],[[0,10,0],[10,0,0]],["LIEUTENANT","SERGEANT"]]],0.3],
	// LIB_M4A4_FIREFLY_Platoon
	[[[["LIB_M4A4_FIREFLY","LIB_M4A4_FIREFLY"],[[0,10,0],[10,0,0]],["LIEUTENANT","SERGEANT"]]],0.3]
];
_arr append [
	[[[["LIB_Churchill_Mk7","LIB_Churchill_Mk7","LIB_Churchill_Mk7"],[[0,10,0],[10,0,0],[20,0,0]],["LIEUTENANT","SERGEANT","PRIVATE"]]],0.15]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "LIB_UK_ARMY",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [160,279], __exclude
	] call gosa_fnc_map_groups_add;
};
// LIB_UK_ARMY_w
_arr = [
	// LIB_UK_machine_gun_team_w
	[[[["LIB_UK_Sergeant_w","LIB_UK_LanceCorporal_w","LIB_UK_Corporal_w","LIB_UK_Rifleman_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_UK_infantry_squad_w
	[[[["LIB_UK_Sergeant_w","LIB_UK_LanceCorporal_w","LIB_UK_Corporal_w","LIB_UK_Corporal_w","LIB_UK_Grenadier_w","LIB_UK_Rifleman_w","LIB_UK_Rifleman_w","LIB_UK_Rifleman_w","LIB_UK_Rifleman_w","LIB_UK_Medic_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_UK_Sentry_Squad_3_w
	[[[["LIB_UK_Rifleman_w","LIB_UK_Rifleman_w","LIB_UK_Rifleman_w"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.6],
	// LIB_UK_Sentry_Squad_2_w
	[[[["LIB_UK_Sergeant_w","LIB_UK_Rifleman_w"],[[0,5,0],[3,0,0]],["SERGEANT","PRIVATE"]]],0.5],
	// LIB_UK_AT_squad_w
	[[[["LIB_UK_Sergeant_w","LIB_UK_AT_Soldier_w","LIB_UK_AT_Soldier","LIB_UK_AT_Soldier_w","LIB_UK_AT_Soldier_w","LIB_UK_Rifleman_w","LIB_UK_Rifleman_w","LIB_UK_Corporal_w","LIB_UK_Rifleman_w","LIB_UK_Rifleman_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// LIB_Mechanized_Infantry_Squad
	[[[["LIB_UniversalCarrier_w","LIB_UK_Sergeant_w","LIB_UK_Rifleman_w","LIB_UK_LanceCorporal_w","LIB_UK_Corporal_w","LIB_UK_Corporal_w","LIB_UK_Grenadier_w","LIB_UK_Rifleman_w","LIB_UK_Rifleman_w","LIB_UK_Rifleman_w","LIB_UK_Rifleman_w","LIB_UK_Medic_w"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_Cromwell_Mk4_Platoon
	[[[["LIB_Cromwell_Mk4_w","LIB_Cromwell_Mk4_w"],[[0,10,0],[10,0,0]],["LIEUTENANT","SERGEANT"]]],0.3]
];
_arr append [
	// LIB_UK_AB_infantry_squad_w
	[[
		[["LIB_C47_Skytrain"],[[0,0,0]],["LIEUTENANT"]],
		[["LIB_UK_Para_Sergeant_w","LIB_UK_Para_LanceCorporal_w","LIB_UK_Para_Corporal_w","LIB_UK_Para_Corporal_w","LIB_UK_Para_Grenadier_w","LIB_UK_Para_Rifleman_w","LIB_UK_Para_Rifleman_w","LIB_UK_Para_Rifleman_w","LIB_UK_Para_Rifleman_w","LIB_UK_Para_Medic_w"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "LIB_UK_ARMY",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [-999,159], __exclude
	] call gosa_fnc_map_groups_add;
};
// LIB_UK_DR
_arr = [
	// LIB_Motorized_Infantry_Squad
	[[[["LIB_UK_DR_Sergeant","LIB_AustinK5_DR_Open","LIB_UK_DR_Rifleman","LIB_UK_DR_LanceCorporal","LIB_UK_DR_Corporal","LIB_UK_DR_Corporal","LIB_UK_DR_Grenadier","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Medic"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_UK_DR_machine_gun_team
	[[[["LIB_UK_DR_Sergeant","LIB_UK_DR_LanceCorporal","LIB_UK_DR_Corporal","LIB_UK_DR_Rifleman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_UK_DR_infantry_squad
	[[[["LIB_UK_DR_Sergeant","LIB_UK_DR_LanceCorporal","LIB_UK_DR_Corporal","LIB_UK_DR_Corporal","LIB_UK_DR_Grenadier","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
	// LIB_UK_DR_Sentry_Squad_3
	[[[["LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.6],
	// LIB_UK_DR_Sentry_Squad_2
	[[[["LIB_UK_DR_Sergeant","LIB_UK_DR_Rifleman"],[[0,5,0],[3,0,0]],["SERGEANT","PRIVATE"]]],0.5],
	// LIB_UK_DR_AT_squad
	[[[["LIB_UK_DR_Sergeant","LIB_UK_DR_AT_Soldier","LIB_UK_DR_AT_Soldier","LIB_UK_DR_AT_Soldier","LIB_UK_DR_AT_Soldier","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Corporal","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// LIB_Mechanized_Infantry_Squad
	[[[["LIB_UK_DR_Sergeant","LIB_UniversalCarrier_desert","LIB_UK_DR_Rifleman","LIB_UK_DR_LanceCorporal","LIB_UK_DR_Corporal","LIB_UK_DR_Corporal","LIB_UK_DR_Grenadier","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Rifleman","LIB_UK_DR_Medic"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
	// LIB_Crusader_Mk3_desert_Platoon
	[[[["LIB_Crusader_Mk3_desert","LIB_Crusader_Mk3_desert"],[[0,10,0],[10,0,0]],["LIEUTENANT","SERGEANT"]]],0.3],
	// LIB_Crusader_Mk1AA_desert_Platoon
	[[[["LIB_Crusader_Mk1AA_desert","LIB_Crusader_Mk1AA_desert"],[[0,10,0],[10,0,0]],["LIEUTENANT","SERGEANT"]]],0.3],
	// LIB_UK_DR_M4A3_75_Platoon
	[[[["LIB_UK_DR_M4A3_75"],[[0,10,0]],["CAPTAIN"]]],0.3],
	// LIB_UK_Italy_M4A3_75_Platoon
	[[[["LIB_UK_Italy_M4A3_75"],[[0,10,0]],["LIEUTENANT"]]],0.3]
];
_date_rip = [_arr] call gosa_fnc_cfg_grp_getinfo;
for "_i" from 0 to (count (_date_rip select 1) -1) do {
	[_groups_map, resistance, "LIB_UK_ARMY",
		[_date_rip select 2 select _i, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		_date_rip select 1 select _i, [280,999], __exclude
	] call gosa_fnc_map_groups_add;
};
