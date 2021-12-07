#define __A2OA__

/*
Не рукомендуется забивать грузовики до отказа
иначе боты дольше тупят.
*/


private ["_west","_east","_guer","_woodland","_deserted"];
private ["_westPatrol","_eastPatrol","_guerPatrol"];
private ["_westAttack","_eastAttack","_guerAttack"];
_westPatrol=[];_eastPatrol=[];_guerPatrol=[];
_westAttack=[];_eastAttack=[];_guerAttack=[];
_west=[];_east=[];_guer=[];

_woodland=false; _deserted=false;
if(toLower worldname in ["zargabad", "takistan", "desert_e", "shapur_baf", "mountains_acr"])then{_deserted=true};
if(toLower worldname in ["chernarus", "utes", "fdf_isle1_a",  "woodland_acr","namalsk","bootcamp_acr"])then{_woodland=true};

// A2
if(LIB_a2Avail)then{

	// INS // CDF // GUE
	if(true)then{
		if(!_deserted)then{
			_east=_east+[

				// INS_TankSection !=
				// звания изменены
				[[[["T72_INS","T72_INS"],[[0,10,0],[5,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.07],

				// INS_Mi8Squadron !=
				[[[["Mi17_Ins"],[],["CAPTAIN"]],[["INS_Soldier_CO","INS_Soldier_AR","INS_Soldier_GL","INS_Soldier_AT","INS_Soldier_2","INS_Soldier_AR","INS_Soldier_1","INS_Soldier_2"]],[["INS_Soldier_CO","INS_Soldier_MG","INS_Soldier_MG","INS_Soldier_AT","INS_Soldier_AT","INS_Soldier_AR","INS_Soldier_AR","INS_Soldier_2"]]],0.05],

				// INS_InfSquad !=
				// временно добавлен медик
				[[[["INS_Soldier_CO",
					"INS_Soldier_AR","INS_Soldier_GL",
					"INS_Soldier_AT","INS_Soldier_2",
					"INS_Soldier_AR","INS_Soldier_1",
					"INS_Soldier_2","Ins_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE"]]],0.85],
				// INS_InfSquad_Weapons !=
				// временно добавлен медик
				[[[["INS_Soldier_CO",
					"INS_Soldier_MG","INS_Soldier_MG",
					"INS_Soldier_AT","INS_Soldier_AT",
					"INS_Soldier_AR","INS_Soldier_AR",
					"INS_Soldier_2","Ins_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE"]]],0.6],
				// INS_InfSection_AT
				[[[["INS_Soldier_AT","INS_Soldier_AT","INS_Soldier_1"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","PRIVATE","PRIVATE"]]],0.25],
				// INS_InfSection_AA
				[[[["INS_Soldier_AA","INS_Soldier_AA","INS_Soldier_AA"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","PRIVATE","PRIVATE"]]],0.1],
				// INS_SniperTeam !=
				// rarityGroup = 0.2; изменен из-за отряда с Ins_Soldier_Sab
				[[[["INS_Soldier_Sniper","INS_Soldier_Sniper","INS_Soldier_1"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.1],
				[[[["INS_Soldier_Sniper","INS_Soldier_Sniper","Ins_Soldier_Sab"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.1],
				// INS_MilitiaSquad
				[[[["INS_Worker2",
					"INS_Woodlander3","INS_Villager3",
					"INS_Woodlander2","INS_Woodlander1",
					"INS_Villager4"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE"]]],0.5],

				// INS_MotInfSquad
				// rarityGroup = 0.25; изменен из-за отряда с Ural_INS
				[[[[	"INS_Soldier_CO",
						"UralOpen_INS","INS_Soldier_MG",
						"INS_Soldier_AT","INS_Soldier_AR",
						"INS_Soldier_2","INS_Soldier_GL",
						"INS_Soldier_1","INS_Soldier_MG",
						"INS_Soldier_AT","INS_Soldier_1",
						"INS_Soldier_1","INS_Soldier_2"
					],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					[		"SERGEANT",
						"SERGEANT","CORPORAL",
						"CORPORAL","CORPORAL",
						"CORPORAL","PRIVATE",
						"PRIVATE","PRIVATE",
						"PRIVATE","PRIVATE",
						"PRIVATE","PRIVATE"
					]]],0.20],
				[[[[	"INS_Soldier_CO",
						"Ural_INS","INS_Soldier_MG",
						"INS_Soldier_AT","INS_Soldier_AR",
						"INS_Soldier_2","INS_Soldier_GL",
						"INS_Soldier_1","INS_Soldier_MG",
						"INS_Soldier_AT","INS_Soldier_1",
						"INS_Soldier_1","INS_Soldier_2"
					],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					[		"SERGEANT",
						"SERGEANT","CORPORAL",
						"CORPORAL","CORPORAL",
						"CORPORAL","PRIVATE",
						"PRIVATE","PRIVATE",
						"PRIVATE","PRIVATE",
						"PRIVATE","PRIVATE"
					]]],0.05],
				// INS_MotInfSection
				[[[["INS_Soldier_GL",
					"Offroad_DSHKM_INS","UAZ_SPG9_INS",
					"Pickup_PK_INS","INS_Soldier_1",
					"INS_Soldier_MG","INS_Soldier_GL"],[[0,5,0],[-5,0,0],[-5,-7,0],[-5,-14,0],[3,0,0],[5,0,0],[7,0,0]],
					["CORPORAL",
					"CORPORAL","CORPORAL",
					"CORPORAL","PRIVATE",
					"PRIVATE","PRIVATE"]]],0.4],

				// INS_MechInfSquad !=
				// звания изменены
				[[[["INS_Soldier_CO",
					"BMP2_INS","INS_Soldier_MG",
					"INS_Soldier_AT","INS_Soldier_2",
					"INS_Soldier_GL","INS_Soldier_1",
					"INS_Soldier_AR"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					["LIEUTENANT",
					"LIEUTENANT","CORPORAL",
					"CORPORAL","CORPORAL",
					"CORPORAL","PRIVATE",
					"PRIVATE"]]],0.25],
				// INS_MechInfSection
				[[[["INS_Soldier_CO",
					"BRDM2_INS","BRDM2_INS",
					"INS_Soldier_MG","INS_Soldier_AR",
					"INS_Soldier_GL","INS_Soldier_1",
					"INS_Soldier_AT","INS_Soldier_2"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					["SERGEANT",
					"SERGEANT","SERGEANT",
					"CORPORAL","CORPORAL",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE"]]],0.25],
				// INS_MechInfSection_AT
				[[[["INS_Soldier_GL",
					"BRDM2_ATGM_INS","BRDM2_ATGM_INS",
					"INS_Soldier_AT"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE"]]],0.2],

				[[[["Ins_Soldier_AA","Ins_Soldier_AA","Ins_Soldier_AA","Ural_ZU23_INS"], [[10,10],[10,0],[0,10],[0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.01],
				[[[["Su25_Ins"], [],["CAPTAIN"]]],0.01],
				[[[["INS_Soldier_GL","UAZ_INS","INS_Soldier_1","INS_Soldier_MG","INS_Soldier_1"], [[0,0],[5,0],[0,0],[0,0],[0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
				[[[["INS_Soldier_GL","UAZ_MG_INS"], [[0,0],[5,0]],["CORPORAL","PRIVATE"]]],0.01],
				[[[["INS_Soldier_GL","Ins_Soldier_Sapper","INS_Soldier_AT"], [],["SERGEANT","CORPORAL","PRIVATE"]]],0.01],

				[[[["UralReammo_INS"], [],["PRIVATE"]]],0.01],
				[[[["UralRefuel_INS"], [],["PRIVATE"]]],0.01],
				[[[["UralRepair_INS"], [],["PRIVATE"],[["Ins_Soldier_Sapper"]]]],0.01],
				[[[["BMP2_Ambul_INS"], [],["PRIVATE"],[["Ins_Soldier_Medic"]]]],0.05],

				//StaticWeapon
				[[[["AGS_Ins"], [],["PRIVATE"]]],0.01],
				[[[["DSHKM_Ins"], [],["PRIVATE"]]],0.01],
				[[[["DSHkM_Mini_TriPod"], [],["PRIVATE"]]],0.01],
				[[[["ZU23_Ins"], [],["PRIVATE"]]],0.01],
				[[[["SearchLight_INS"], [],["PRIVATE"]]],0.01],
				[[[["SPG9_Ins"], [],["PRIVATE"]]],0.01]

			];
			_west=_west+[
				// CDF_MotInfSquad !=
				// rarityGroup = 0.4; изменен из-за отряда с UralOpen_CDF
				[[[[	"CDF_Soldier_TL",
						"Ural_CDF","CDF_Soldier_MG",
						"CDF_Soldier_RPG","CDF_Soldier_GL",
						"CDF_Soldier","CDF_Soldier_MG",
						"CDF_Soldier_GL","CDF_Soldier_RPG",
						"CDF_Soldier","CDF_Soldier_Medic"
					],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					[		"LIEUTENANT",
						"SERGEANT","SERGEANT",
						"CORPORAL",	"CORPORAL",
						"CORPORAL","CORPORAL",
						"PRIVATE","PRIVATE",
						"PRIVATE","PRIVATE"
				]]],0.3],
				[[[[	"CDF_Soldier_TL",
						"UralOpen_CDF","CDF_Soldier_MG",
						"CDF_Soldier_RPG","CDF_Soldier_GL",
						"CDF_Soldier","CDF_Soldier_MG",
						"CDF_Soldier_GL","CDF_Soldier_RPG",
						"CDF_Soldier","CDF_Soldier_Medic"
					],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					[		"LIEUTENANT",
						"SERGEANT","SERGEANT",
						"CORPORAL",	"CORPORAL",
						"CORPORAL","CORPORAL",
						"PRIVATE","PRIVATE",
						"PRIVATE","PRIVATE"
				]]],0.1],
				// CDF_MotInfSection
				[[[["CDF_Soldier_GL","UAZ_CDF","CDF_Soldier_RPG"],[[0,5,0],[-5,0,0],[3,0,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.15],
				// CDF_MotInfSection_Weapons
				[[[["CDF_Soldier_TL","UAZ_AGS30_CDF","UAZ_AGS30_CDF","CDF_Soldier_MG"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
				// CDF_MechInfSquad !=
				[[[["CDF_Soldier_TL","BMP2_CDF","CDF_Soldier_MG","CDF_Soldier_MG","CDF_Soldier_Marksman","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
				// CDF_MechReconSection
				[[[["CDF_Soldier_TL","BRDM2_CDF","CDF_Soldier_MG","CDF_Soldier_RPG"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
				// CDF_MechATSection
				[[[["CDF_Soldier_TL","BRDM2_ATGM_CDF","CDF_Soldier_MG","CDF_Soldier_RPG"],
					[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
					["SERGEANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
				// CDF_TankPlatoon !=
				[[[["T72_CDF","T72_CDF","T72_CDF"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.25],
				// CDF_Mi24DSquadron !=
				[[[["Mi24_D","Mi24_D"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]],[["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier_Marksman"]],[["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier_Marksman"]]],0.1],
				// CDF_Mi8Squadron
				[[[["Mi17_CDF","Mi17_CDF"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
				[[[["Mi17_CDF"],[],["CAPTAIN"]],[["CDF_Soldier_TL","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier","CDF_Soldier_MG","CDF_Soldier_GL","CDF_Soldier_RPG","CDF_Soldier","CDF_Soldier_Medic"]]],0.3],
				// CDF_InfSquad
				[[[["CDF_Soldier_TL","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier","CDF_Soldier_MG","CDF_Soldier_GL","CDF_Soldier_RPG","CDF_Soldier","CDF_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
				// CDF_InfSquad_Weapons
				[[[["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier_Marksman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.6],
				// CDF_InfSection_AT
				[[[["CDF_Soldier_TL","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_AR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
				// CDF_InfSection_AA
				[[[["CDF_Soldier_TL","CDF_Soldier_Strela","CDF_Soldier_Strela","CDF_Soldier_MG"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
				// CDF_InfSection_MG
				[[[["CDF_Soldier_MG","CDF_Soldier_MG","CDF_Soldier_AR","CDF_Soldier_RPG"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
				// CDF_InfSection_Patrol
				[[[["CDF_Soldier_Militia","CDF_Soldier_Militia","CDF_Soldier_Militia","CDF_Soldier_Militia"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
				// CDF_SniperTeam
				[[[["CDF_Soldier_Sniper","CDF_Soldier_Spotter"],[],["SERGEANT","CORPORAL"]]],0.05],
				[[[["Ural_ZU23_CDF","CDF_Soldier_Strela","CDF_Soldier_Strela","CDF_Soldier_Strela"], [[10,10],[10,0],[0,10],[0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.01],
				[[[["CDF_Soldier_GL","CDF_Soldier_Engineer","CDF_Soldier_RPG"], [],["SERGEANT","CORPORAL","PRIVATE"]]],0.01],
				[[[["CDF_Soldier_GL","UAZ_MG_CDF"], [[0,0],[5,0]],["PRIVATE","PRIVATE"]]],0.01],
				[[[["Su25_CDF"], [],["CAPTAIN"]]],0.01],
				[[[["Pchela1T_CDF"], [],["CAPTAIN"]]],0.01],

				[[[["UralReammo_CDF"], [],["PRIVATE"]]],0.01],
				[[[["UralRefuel_CDF"], [],["PRIVATE"]]],0.01],
				[[[["UralRepair_CDF"], [],["PRIVATE"],[["CDF_Soldier_Engineer"]]]],0.01],
				[[[["BMP2_Ambul_CDF"], [],["PRIVATE"],[["CDF_Soldier_Medic"]]]],0.05],

				//StaticWeapon
				[[[["DSHKM_CDF"],[],["PRIVATE"]]],0.01],
				[[[["DSHkM_Mini_TriPod_CDF"],[],["PRIVATE"]]],0.01],
				[[[["AGS_CDF"],[],["PRIVATE"]]],0.01],
				[[[["ZU23_CDF"],[],["PRIVATE"]]],0.01],
				[[[["SPG9_CDF"],[],["PRIVATE"]]],0.01],
				[[[["SearchLight_CDF"],[],["PRIVATE"]]],0.01]
			];
			_guer=_guer+[
				// GUE_InfSquad !=
				// временно добавлен медик
				[[[["GUE_Soldier_CO",
					"GUE_Soldier_GL","GUE_Soldier_AR",
					"GUE_Soldier_1","GUE_Soldier_3",
					"GUE_Soldier_GL","GUE_Soldier_2",
					"GUE_Soldier_Medic"],[],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE"]]],0.8],
				// GUE_InfSquad_Assault
				// временно добавлен медик
				[[[["GUE_Soldier_CO",
					"GUE_Soldier_GL","GUE_Soldier_MG",
					"GUE_Soldier_AT","GUE_Soldier_AR",
					"GUE_Soldier_MG","GUE_Soldier_AT",
					"GUE_Soldier_2","GUE_Soldier_1",
					"GUE_Soldier_Medic"],[],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE"]]],0.6],
				// GUE_InfSquad_Weapons
				[[[["GUE_Soldier_2",
					"GUE_Soldier_MG","GUE_Soldier_AT",
					"GUE_Soldier_MG","GUE_Soldier_GL",
					"GUE_Soldier_AT"],[],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE"]]],0.9],
				// GUE_InfTeam_1 !=
				// rarityGroup = 1.0; изменен по неизвестной причине
				[[[["GUE_Soldier_2",
					"GUE_Soldier_MG","GUE_Soldier_AT",
					"GUE_Soldier_GL"],[],
					["CORPORAL",
					"CORPORAL","PRIVATE",
					"PRIVATE"]]],0.9],
				// GUE_InfTeam_2
				// rarityGroup = 1.0; изменен по неизвестной причине
				[[[["GUE_Soldier_1",
					"GUE_Soldier_AR","GUE_Soldier_GL",
					"GUE_Soldier_2"],[],
					["CORPORAL",
					"CORPORAL","PRIVATE",
					"PRIVATE"]]],0.9],
				// GUE_InfTeam_AT
				[[[["GUE_Soldier_AT",
					"GUE_Soldier_AT","GUE_Soldier_AR"],[],
					["CORPORAL",
					"CORPORAL","PRIVATE"]]],0.8],
				// GUE_GrpInf_TeamAA
				[[[["GUE_Soldier_CO",
					"GUE_Soldier_AA","GUE_Soldier_AA",
					"GUE_Soldier_AR"],[],
					["CORPORAL",
					"CORPORAL","PRIVATE",
					"PRIVATE"]]],0.2],
				// GUE_GrpInf_TeamSniper
				[[[["GUE_Soldier_Sniper","GUE_Soldier_Scout"],[],["SERGEANT","CORPORAL"]]],0.8],
				// GUE_MilitiaSquad
				[[[["GUE_Worker2",
					"GUE_Woodlander3","GUE_Villager3",
					"GUE_Woodlander2","GUE_Woodlander1",
					"GUE_Villager4"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE"]]],0.5],
				// GUE_MotInfSection
				[[[["GUE_Soldier_CO",
					"Offroad_DSHKM_Gue","Offroad_SPG9_Gue",
					"Pickup_PK_GUE","GUE_Soldier_MG",
					"GUE_Soldier_3","GUE_Soldier_Sniper",
					"GUE_Soldier_AR","GUE_Soldier_2"],[[0,5,0],[-5,0,0],[-5,-7,0],[-5,-14,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE"]]],0.25],
				// GUE_MotInfSquad
				[[[["GUE_Soldier_CO",
					"V3S_GUE","GUE_Soldier_GL",
					"GUE_Soldier_AT","GUE_Soldier_1",
					"GUE_Soldier_AR","GUE_Soldier_MG",
					"GUE_Soldier_MG","GUE_Soldier_2",
					"GUE_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE"]]],0.2],
				[[[["GUE_Soldier_AR","BRDM2_GUE","GUE_Soldier_GL","GUE_Soldier_1"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
				[[[["GUE_Soldier_CO",
				"BTR60_Gue_CP","GUE_Soldier_MG",
				"GUE_Soldier_GL","GUE_Soldier_3",
				"GUE_Soldier_AT","GUE_Soldier_AT",
				"GUE_Soldier_AR","GUE_Soldier_Sniper"
				],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL"]]],0.01],
				[[[["GUE_Soldier_CO","BMP2_GUE","GUE_Soldier_MG","GUE_Soldier_GL","GUE_Soldier_3","GUE_Soldier_AR","GUE_Soldier_Sniper","GUE_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.05],
				[[[["GUE_Soldier_CO",
				"BMP1_INS_CP","GUE_Soldier_MG",
				"GUE_Soldier_GL","GUE_Soldier_3",
				"GUE_Soldier_AR","GUE_Soldier_Sniper",
				"GUE_Soldier_AT"
				],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
				[[[["T72_GUE","T72_GUE"],[[0,10,0],[5,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.01],
				[[[["Ural_ZU23_Gue","GUE_Soldier_AA","GUE_Soldier_AA","GUE_Soldier_AA"], [[10,0],[0,0],[0,0],[0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.01],
				[[[["T34"], [[0,0],[5,0]],["LIEUTENANT","LIEUTENANT"]]],0.01],
				[[[["ZSU_Gue_CP"], [[0,0],[5,0]],["LIEUTENANT","LIEUTENANT"]]],0.01],

				[[[["WarfareReammoTruck_Gue"], [],["PRIVATE"]]],0.01],
				[[[["WarfareRepairTruck_Gue"], [],["PRIVATE"]]],0.01],

				//StaticWeapon
				[[[["DSHKM_Gue"],[],["PRIVATE"]]],0.01],
				[[[["ZU23_Gue"],[],["PRIVATE"]]],0.01],
				[[[["SearchLight_Gue"],[],["PRIVATE"]]],0.01],
				[[[["SPG9_Gue"],[],["PRIVATE"]]],0.01]

			];
			if(acex_ru_Avail)then{
				_east=_east+[
					[[[["INS_Soldier_CO","ACE_BTR70_INS","INS_Soldier_MG","INS_Soldier_AT","INS_Soldier_2","INS_Soldier_GL","INS_Soldier_1","INS_Soldier_AR"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.25],
					[[[["ACE_Mi24_D_INS"], [],["CAPTAIN"]],[["GUE_Soldier_CO","GUE_Soldier_GL","GUE_Soldier_MG","GUE_Soldier_AT","GUE_Soldier_AR","GUE_Soldier_MG","GUE_Soldier_AT","GUE_Soldier_2"]]],0.01],
					[[[["INS_Soldier_CO","ACE_BMD_2_INS","INS_Soldier_MG","INS_Soldier_AT","INS_Soldier_2","INS_Soldier_GL","INS_Soldier_1","INS_Soldier_AR"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]
					]],0.01],
					[[[["ZSU_INS","ACE_BRDM2_SA9_INS"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01]
				];
				_west=_west+[
					[[[["CDF_Soldier_TL","ACE_BTR70_CDF","CDF_Soldier_MG","CDF_Soldier_MG","CDF_Soldier_Marksman","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
					[[[["ACE_T72B_CDF","ACE_T72B_CDF","ACE_T72B_CDF"],[[0,10,0],[7,0,0],[-7,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.25],
					[[[["ACE_Mi24_V_CDF"], [],["CAPTAIN"]],[["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier_Marksman"]]],0.01],
					[[[["ACE_Mi24_V_UPK23_CDF"], [],["CAPTAIN"]],[["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier_Marksman"]]],0.01],
					[[[["CDF_Soldier_TL","CDF_Soldier_MG","CDF_Soldier_Marksman","CDF_Soldier_RPG","CDF_Soldier_GL","ACE_BMD_1_CDF"],
						[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[10,10]],
						["SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","SERGEANT"]
					]],0.01],
					[[[["CDF_Soldier_TL","CDF_Soldier_MG","CDF_Soldier_MG","CDF_Soldier_Marksman","CDF_Soldier_RPG","CDF_Soldier_GL","CDF_Soldier","ACE_BMD_2_CDF"],
						[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[10,10]],
						["SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","SERGEANT"]
					]],0.01],
					[[[["ZSU_CDF","ACE_BRDM2_SA9_CDF"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01]
				];
				_guer=_guer+[
					[[[["GUE_Soldier_CO","ACE_BTR70_GUE","GUE_Soldier_MG","GUE_Soldier_GL","GUE_Soldier_3","GUE_Soldier_AR","GUE_Soldier_Sniper","GUE_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.05]
				];
			}else{
				_east=_east+[
					[[[["ZSU_INS"], [[0,0],[0,10]],["LIEUTENANT","LIEUTENANT"]]],0.5]
				];
				_west=_west+[
					[[[["ZSU_CDF"], [],["LIEUTENANT","LIEUTENANT"]]],0.5]
				];
				_guer=_guer+[
				];
			};
		};
	};

		// USMC
	if(true)then{
		if(!_deserted or !acex_usnavy_Avail)then{
			_west=_west+[
				// USMC_InfSquad
				[[[["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"],
					[],
					["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]
				]],0.5],
				// USMC_FireTeam
				[[[["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.05],
				// USMC_FireTeam_MG
				[[[["USMC_Soldier_TL","USMC_Soldier_MG","USMC_Soldier_AR","USMC_Soldier_LAT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
				// USMC_FireTeam_AT
				[[[["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_LAT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
				// USMC_FireTeam_Support
				[[[["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.05],
				// USMC_HeavyATTeam
				[[[["USMC_Soldier_HAT","USMC_Soldier_AT","USMC_Soldier_LAT"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.15],
				// USMC_SniperTeam
				[[[["USMC_SoldierS_Sniper","USMC_SoldierS_Spotter"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],

				// USMC_FRTeam
				[[[["FR_TL","FR_AR","FR_GL","FR_Marksman","FR_R","FR_Corpsman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.01],

				// USMC_MotInfSection !=
				[[[["USMC_Soldier_TL","HMMWV_M2","HMMWV_Mk19","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","CORPORAL","CORPORAL"]]],0.2],
				// USMC_MotInfSection_AT
				[[[["USMC_Soldier_TL","HMMWV_TOW","HMMWV_TOW","USMC_Soldier_AR"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.15],

				// USMC_MechInfSquad !=
				[[[["USMC_Soldier_SL","AAV","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"],
					[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],
					["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]
				]],0.9],
				// USMC_MechReconSection !=
				[[[["USMC_Soldier_TL","LAV25","USMC_Soldier_MG","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_LAT","USMC_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.6],

				// USMC_AH1ZSquadron !=
				[[[["AH1Z","AH1Z"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.4],
				// USMC_UH1YSquadron !=
				[[[["UH1Y","UH1Y"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]],[["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_Medic"]]],0.4],
				// USMC_MV22Squadron !=
				[[[["MV22"],[],["CAPTAIN"]],[["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"]]],0.5],
				// USMC_MQ9Squadron
				[[[["MQ9PredatorB"],[[0,0,0]],["CAPTAIN"]]],0.3],
				// USMC_F35Squadron
				[[[["F35B","F35B"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.6],
				// USMC_AV8BFighterSquadron
				[[[["AV8B2","AV8B2"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
				// USMC_AV8BBomberSquadron
				[[[["AV8B","AV8B"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.5],
				// [[[["MH60S"],[],["CAPTAIN"]],[["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"]]],0.1],
				[[[["C130J"],[],["CAPTAIN"]],[["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"]]],0.1],

				[[[["HMMWV_Avenger"], [[0,5],[-5,0],[-5,-7],[3,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.8],
				[[[["USMC_Soldier_TL","USMC_Soldier_AA","USMC_Soldier_AA"], [],["SERGEANT","CORPORAL","CORPORAL"]]],0.01],
				[[[["USMC_SoldierS","USMC_SoldierM_Marksman"], [],["SERGEANT","SERGEANT"]]],0.01],
				[[[["USMC_SoldierS_Sniper","USMC_SoldierS_SniperH","USMC_SoldierS_Spotter"], [],["SERGEANT","SERGEANT","CORPORAL"]]],0.01],
				[[[["USMC_Soldier_GL","USMC_SoldierS_Engineer","USMC_Soldier2"], [],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.01],
				[[[["FR_TL","FR_AR","FR_GL","FR_R","FR_AC","FR_Sapper","FR_Marksman","FR_Corpsman"], [],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.01],
				[[[["FR_Assault_GL","FR_Assault_GL","FR_Assault_R","FR_Assault_R"], [],["LIEUTENANT","LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","SERGEANT"]]],0.01],
				[[[["USMC_Soldier_TL","HMMWV_Armored","USMC_Soldier_AT","USMC_Soldier_LAT"], [[0,0],[5,0],[0,0],[0,0]],["SERGEANT","PRIVATE","CORPORAL","CORPORAL"]]],0.01],
				[[[["USMC_Soldier_SL","MTVR","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier_GL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT"], [[0,0],[5,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],["LIEUTENANT","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL"]]],0.01],
				[[[["AH64D"], [],["CAPTAIN"]]],0.01],
				[[[["M1A1","M1A1"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
				[[[["A10"], [[-10,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],

				[[[["Zodiac","USMC_Soldier_GL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"],[[0,0],[5,0,0],[0,5,0],[-5,0,0],[0,-5,0]],["PRIVATE","SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
				[[[["RHIB"],[[0,0]],["SERGEANT"]],[["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_TL","USMC_Soldier_MG","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"]]],0.1],
				[[[["RHIB2Turret"],[[0,0]],["SERGEANT"]],[["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier"]]],0.1],

				[[[["MtvrReammo"], [],["PRIVATE"]]],0.01],
				[[[["MtvrRefuel"], [],["PRIVATE"]]],0.01],
				[[[["MtvrRepair"], [],["PRIVATE"],[["USMC_SoldierS_Engineer"]]]],0.01],
				[[[["HMMWV_Ambulance"], [],["PRIVATE"],[["USMC_Soldier_Medic"]]]],0.05],

				//StaticWeapon
				[[[["M2StaticMG"],[],["PRIVATE"]]],0.01],
				[[[["M2HD_mini_TriPod"],[],["PRIVATE"]]],0.01],
				[[[["MK19_TriPod"],[],["PRIVATE"]]],0.01],
				[[[["Stinger_Pod"],[],["PRIVATE"]]],0.01],
				[[[["TOW_TriPod"],[],["PRIVATE"]]],0.01],
				[[[["SearchLight"],[],["PRIVATE"]]],0.01]
			];
		};
		if(acex_usnavy_Avail)then{
			if(!_deserted)then{
					_west=_west+[
						[[[["USMC_Soldier_TL","ACE_Stryker_ICV_M2_SLAT","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_GL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_GL","USMC_SoldierM_Marksman"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[[],["USMC_Soldier_Crew","USMC_Soldier_Crew"]]]],0.9],
						[[[["USMC_Soldier_TL","ACE_Stryker_ICV_MK19_SLAT","USMC_Soldier_TL","USMC_Soldier_GL","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_TL","USMC_Soldier_GL","USMC_Soldier_AR","USMC_SoldierM_Marksman"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[[],["USMC_Soldier_Crew","USMC_Soldier_Crew"]]]],0.9],
						[[[["ACE_Stryker_MGS","ACE_Stryker_MGS","ACE_Stryker_MGS"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"],[["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"],["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"],["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"]]]],0.05],
						[[[["ACE_Stryker_TOW_Slat","ACE_Stryker_TOW_Slat"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"],[["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"],["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"]]]],0.05],

						[[[["ACE_M1A1HC_TUSK","ACE_M1A1HC_TUSK","ACE_M1A1HC_TUSK","ACE_M1A1HC_TUSK"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.03],
						[[[["ACE_M1A1HC_TUSK_CSAMM","ACE_M1A1HC_TUSK_CSAMM"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.02],

						[[[["ACE_AH1W_TOW_W","ACE_AH1W_TOW_W"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
						[[[["ACE_AH1W_TOW_TOW_W","ACE_AH1W_TOW_TOW_W"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
						[[[["ACE_AH1W_AGM_W","ACE_AH1W_AGM_W"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
						[[[["ACE_AH1Z_AGM_AGM_W"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
						[[[["ACE_AH6J_DAGR_FLIR"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01]
					];
			};
			if(!_woodland)then{
				_west=_west+[
					[[[["ACE_USMC_Soldier_SL_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.05],
					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_MG_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_AT_D","ACE_USMC_Soldier_LAT_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_Medic_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.05],
					[[[["ACE_USMC_Soldier_HAT_D","ACE_USMC_Soldier_AT_D","ACE_USMC_Soldier_LAT_D"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.15],
					[[[["ACE_USMC_SoldierS_Sniper_D","ACE_USMC_SoldierS_Spotter_D"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],

					[[[["ACE_M1A1HC_TUSK_DESERT","ACE_M1A1HC_TUSK_DESERT","ACE_M1A1HC_TUSK_DESERT","ACE_M1A1HC_TUSK_DESERT"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.03],
					[[[["ACE_M1A1HC_TUSK_CSAMM_DESERT","ACE_M1A1HC_TUSK_CSAMM_DESERT"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.02],

					[[[["ACE_AH1W_TOW_D","ACE_AH1W_TOW_D"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					[[[["ACE_AH1W_TOW_TOW_D","ACE_AH1W_TOW_TOW_D"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					[[[["ACE_AH1W_AGM_D","ACE_AH1W_AGM_D"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					[[[["ACE_AH1Z_AGM_D","ACE_AH1Z_AGM_D"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					[[[["ACE_AH1Z_AGM_AGM_D"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],

					[[[["ACE_USMC_Soldier_SL_D","AAV","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"],
						[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],
						["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE"],
						[[],["ACE_USMC_Soldier_Crew_D","ACE_USMC_Soldier_Crew_D","ACE_USMC_Soldier_Crew_D"]]
					]],0.9],
					[[[["ACE_USMC_Soldier_TL_D","LAV25","ACE_USMC_Soldier_MG_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_AT_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[[],["ACE_USMC_Soldier_Crew_D","ACE_USMC_Soldier_Crew_D","ACE_USMC_Soldier_Crew_D"]]]],0.6],

					[[[["MV22"],[],["CAPTAIN"]],[["ACE_USMC_Soldier_SL_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"]]],0.5],
					[[[["C130J"],[],["CAPTAIN"]],[["ACE_USMC_Soldier_SL_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"]]],0.1],
					[[[["UH1Y","UH1Y"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]],[["ACE_USMC_Soldier_SL_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D"]]],0.4],
					[[[["F35B","F35B"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.6],
					[[[["AV8B2","AV8B2"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
					[[[["AV8B","AV8B"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.5],

					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AA_D","ACE_USMC_Soldier_AA_D"], [],["SERGEANT","CORPORAL","CORPORAL"]]],0.01],
					[[[["ACE_USMC_SoldierS_Spotter_D","ACE_USMC_SoldierM_Marksman_D"], [],["SERGEANT","SERGEANT"]]],0.01],
					[[[["ACE_USMC_SoldierS_Sniper_D","ACE_USMC_SoldierS_SniperH_D","ACE_USMC_SoldierS_Spotter_D"], [],["SERGEANT","SERGEANT","CORPORAL"]]],0.01],
					[[[["ACE_USMC_Soldier_GL_D","ACE_USMC_SoldierS_Engineer_D","ACE_USMC_Soldier2_D"], [],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.01]
				];
			};
		}else{
				_west=_west+[
					// USMC_TankPlatoon !=
					[[[["M1A2_TUSK_MG","M1A2_TUSK_MG","M1A2_TUSK_MG","M1A2_TUSK_MG"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5]
				];
		};
	};

		// RU
	if(true)then{
		if(	(!_deserted) or !acex_ru_Avail)then{
			_east=_east+[
				// RU_InfSquad
				[[[["RU_Soldier_SL",
					"RU_Soldier_MG","RU_Soldier_AT",
					"RU_Soldier_LAT","RU_Soldier_GL",
					"RU_Soldier_Marksman","RU_Soldier_MG",
					"RU_Soldier_AT","RU_Soldier_AR",
					"RU_Soldier_LAT","RU_Soldier_GL",
					"RU_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					["LIEUTENANT",
					"SERGEANT","SERGEANT",
					"CORPORAL","CORPORAL",
					"CORPORAL","CORPORAL",
					"CORPORAL","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE"]]],0.7],
				// RU_InfSection
				[[[["RU_Soldier_TL",
					"RU_Soldier_AR","RU_Soldier_AT",
					"RU_Soldier_GL","RU_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE"]]],0.2],
				// RU_InfSection_AT
				[[[["RU_Soldier_HAT",
					"RU_Soldier_HAT","RU_Soldier_AT",
					"RU_Soldier_AT","RU_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE"]]],0.2],
				// RU_InfSection_AA
				[[[["RU_Soldier_AA","RU_Soldier_AA","RU_Soldier_AA"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1],
				// RU_InfSection_MG
				[[[["RU_Soldier_TL",
					"RU_Soldier_MG","RU_Soldier_MG",
					"RU_Soldier_GL","RU_Soldier_AT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE"]]],0.2],
				// RU_SniperTeam
				[[[["RU_Soldier_Sniper","RU_Soldier_Spotter"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],

				// RU_MotInfSquad
				[[[["RU_Soldier_SL",
					"Kamaz","RU_Soldier_MG",
					"RU_Soldier_AT","RU_Soldier_LAT",
					"RU_Soldier_GL","RU_Soldier_Marksman",
					"RU_Soldier_MG","RU_Soldier_LAT",
					"RU_Soldier_AR","RU_Soldier_AT",
					"RU_Soldier_GL","RU_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
					["LIEUTENANT",
					"SERGEANT","SERGEANT",
					"SERGEANT","CORPORAL",
					"CORPORAL","CORPORAL",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE"]]],0.3],
				// RU_MotInfSection_Recon
				[[[["RU_Soldier_TL",
					"GAZ_Vodnik","GAZ_Vodnik_HMG",
					"RU_Soldier_MG","RU_Soldier_AT",
					"RU_Soldier_GL","RU_Soldier_Marksman",
					"RU_Soldier_MG","RU_Soldier_AR",
					"RU_Soldier_LAT","RU_Soldier",
					"RU_Soldier","RU_Soldier"],[[0,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
					["SERGEANT",
					"CORPORAL","CORPORAL",
					"CORPORAL","CORPORAL",
					"CORPORAL","CORPORAL",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE"]]],0.3],
				// RU_MotInfSection_Patrol !=
				[[[["RU_Soldier_TL","GAZ_Vodnik_HMG","RU_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],

				// RU_MechInfSquad_1 !=
				[[[["RU_Soldier_SL",
					"BMP3","RU_Soldier_MG",
					"RU_Soldier_AT","RU_Soldier_LAT",
					"RU_Soldier_GL"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					["LIEUTENANT",
					"LIEUTENANT","SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE"],[[],["RU_Soldier_Crew", "RU_Soldier_Crew", "RU_Soldier_Crew", "RU_Soldier_AT", "RU_Soldier_MG"]]]],0.75],
				// RU_MechInfSquad_2 !=
				[[[["RU_Soldier_SL",
					"BTR90","RU_Soldier_MG",
					"RU_Soldier_MG","RU_Soldier_AT",
					"RU_Soldier_LAT","RU_Soldier_GL"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					["LIEUTENANT",
					"LIEUTENANT","SERGEANT",
					"CORPORAL","CORPORAL",
					"PRIVATE","PRIVATE"]]],0.9],

				// [[[["T90","T90","T90"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT"]]],0.6],

				// RU_Mi24VSquadron !=
				[[[["Mi24_V","Mi24_V"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]],[["RU_Soldier_SL","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_Marksman","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_AR","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier","RU_Soldier2","RU_Soldier_Medic"]]],0.2],
				[[[["Mi24_V2","Mi24_V2"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]],[["RU_Soldier_SL","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_Marksman","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_AR","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier","RU_Soldier2","RU_Soldier_Medic"]]],0.2],
				// RU_Mi24PSquadron !=
				[[[["Mi24_P","Mi24_P"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]],[["RU_Soldier_SL","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_Marksman","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_AR","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier","RU_Soldier2","RU_Soldier_Medic"]]],0.2],
				// RU_Ka52Squadron
				[[[["Ka52"],[],["CAPTAIN"]]],0.1],
				// RU_Mi8Squadron !=
				[[[["Mi17_Rockets_RU","Mi17_Rockets_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
				[[[["Mi17_Rockets_RU"],[],["CAPTAIN"]],[["RU_Soldier_SL","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_Marksman","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_AR","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier"]]],0.3],
				// RU_Su34FighterSquadron !=
				[[[["Su34","Su34"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.15],
				[[[["Su34_CP","Su34_CP"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05],
				// RU_Pchela1TSquadron
				[[[["Pchela1T"],[],["CAPTAIN"]]],0.2],

				[[[["2S6M_Tunguska"], [[0,0]], ["LIEUTENANT"]]],0.7],
				[[[["RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_Spotter"], [],["SERGEANT","SERGEANT","CORPORAL"]]],0.01],
				[[[["RU_Soldier_GL","RU_Soldier_Engineer","RU_Soldier2"], [],["SERGEANT","CORPORAL","PRIVATE"]]],0.01],
				[[[["RU_Soldier_GL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_Medic"], [],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.01],
				[[[["Su39"], [],["CAPTAIN"]]],0.01],
				[[[["Su39_CP"], [],["CAPTAIN"]]],0.01],
				[[[["RU_Soldier_GL","UAZ_AGS30_RU","RU_Soldier_AT","UAZ_AGS30_RU"], [],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.01],
				// [[[["RU_Soldier_GL","UAZ_RU","RU_Soldier_AR","RU_Soldier_AT"], [],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.01],

				[[[["PBX","RU_Soldier_GL","RU_Soldier_LAT","RU_Soldier"],[[0,0],[5,0,0],[0,5,0],[-5,0,0]],["PRIVATE","SERGEANT","PRIVATE","PRIVATE"]]],0.1],

				[[[["KamazReammo"], [],["PRIVATE"]]],0.01],
				[[[["KamazRefuel"], [],["PRIVATE"]]],0.01],
				[[[["KamazRepair"], [],["PRIVATE"],[["RU_Soldier_Engineer"]]]],0.01],
				[[[["GAZ_Vodnik_MedEvac"], [],["PRIVATE"],[["RU_Soldier_Medic"]]]],0.05],

				//StaticWeapon
				[[[["AGS_RU"],[],["PRIVATE"]]],0.01],
				[[[["KORD_high"],[],["PRIVATE"]]],0.01],
				[[[["KORD"],[],["PRIVATE"]]],0.01],
				[[[["Igla_AA_pod_East"],[],["PRIVATE"]]],0.01],
				[[[["Metis"],[],["PRIVATE"]]],0.01],
				[[[["SearchLight_RUS"],[],["PRIVATE"]]],0.01]
			];
		};
		if(!_deserted)then{
			_east=_east+[
				// MVD_AssaultTeam !=
				[[[["MVD_Soldier_TL",
					"MVD_Soldier_MG","MVD_Soldier_AT",
					"MVD_Soldier_GL","MVD_Soldier_Sniper",
					"MVD_Soldier_Marksman","MVD_Soldier_GL",
					"MVD_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],
					["LIEUTENANT",
					"SERGEANT","SERGEANT",
					"SERGEANT","CORPORAL",
					"CORPORAL","CORPORAL",
					"CORPORAL"]]],0.02]
			];
		};
		if(acex_ru_Avail)then{
			if(!_deserted)then{
				_east=_east+[
					// [[[["ACE_SoldierE_HMG","ACE_SoldierE_HMGAG","ACE_SoldierE_HMGAB"],[[0,"+6",0],[-2,"+4",0],["+2","+4",0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
					// [[[["ACE_SoldierE_AGS","ACE_SoldierE_AGSAG","ACE_SoldierE_AGSAB"],[[0,"+6",0],[-2,"+4",0],["+2","+4",0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
					// [[[["ACE_SoldierE_KonkursG","ACE_SoldierE_KonkursAG"],[[0,"+6",0],[-2,"+4",0]],["SERGEANT","CORPORAL"]]],0],
					[[[["ACE_T90A","ACE_T90A","ACE_T90A"],[[0,10,0],[7,0,0],[-7,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.25],
					[[[["ACE_T72BA_Base","ACE_T72BA_Base","ACE_T72BA_Base"],[[0,10,0],[7,0,0],[-7,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.25],
					[[[["ACE_T72B_Base","ACE_T72B_Base"],[[0,10,0],[7,0,0],[-7,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.25],
					[[[["RU_Soldier_SL","ACE_BTR70_RU","RU_Soldier_MG","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_Marksman","RU_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[11,0,0],[11,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
					[[[["ACE_Ka50","ACE_Ka50"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					[[[["ACE_Mi24_V_UPK23_RU","ACE_Mi24_V_UPK23_RU"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]],[["RU_Soldier_SL","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_Marksman","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_AR","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier"]]],0.01],
					[[[["ACE_Su27_CASP"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					[[[["ACE_Su30"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					[[[["ACE_Su34_MR"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					// [[[["ACE_RU_Soldier_RPOM","ACE_RU_Soldier_RPOM"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					[[[["RU_Soldier_SL","ACE_BMP2_RU","RU_Soldier_MG","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_Marksman"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]
					]],0.01],
					[[[["RU_Soldier_SL","ACE_BMP2D_RU","RU_Soldier_MG","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_Marksman"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]
					]],0.01],
					[[[["RU_Soldier_SL","ACE_BMD_2_RU","RU_Soldier_MG","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_Marksman"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]
					]],0.01],
					[[[["RU_Soldier_SL","ACE_BMD_1P_RU","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]
					]],0.01],
					[[[["RU_Soldier_SL","ACE_BMD_1_RU","RU_Soldier_MG","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]
					]],0.01],
					// [[[["ACE_ZSU_RU"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
					[[[["RUS_Soldier_TL","RUS_Soldier_GL","RUS_Soldier_Marksman","RUS_Soldier3","RUS_Soldier1","RUS_Soldier2","ACE_RUS_Soldier_Medic"],[],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.07]
				];
			};
			if(!_woodland)then{
				_east=_east+[
					[[[["ACE_RU_Soldier_SL_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
					[[[["ACE_RU_Soldier_TL_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
					[[[["ACE_RU_Soldier_HAT_D","ACE_RU_Soldier_HAT_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
					[[[["ACE_RU_Soldier_AA_D","ACE_RU_Soldier_AA_D","ACE_RU_Soldier_AA_D"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1],
					[[[["ACE_RU_Soldier_TL_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
					[[[["ACE_RU_Soldier_Sniper_D","ACE_RU_Soldier_Spotter_D"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
					[[[["ACE_RU_Soldier_SL_D","ACE_Ural_RU_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.3],
					[[[["ACE_RU_Soldier_TL_D","ACE_UAZ_RU_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
					[[[["ACE_RU_Soldier_TL_D","ACE_BRDM2_RU_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
					[[[["ACE_RU_Soldier_TL_D","ACE_BRDM2_ATGM_RU_D","ACE_BRDM2_RU_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[-5,0,0],[-10,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
					[[[["ACE_RU_Soldier_SL_D","ACE_BTR70_RU_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9]
				];
				_east=_east+[
					[[[["ACE_RU_Soldier_SL_D","Kamaz","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[[],["ACE_RU_Soldier_D"]]]],0.3],
					[[[["ACE_RU_Soldier_TL_D","GAZ_Vodnik","GAZ_Vodnik_HMG","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_D","ACE_RU_Soldier_D","ACE_RU_Soldier_D"],[[0,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[[],["ACE_RU_Soldier_D","ACE_RU_Soldier_D","ACE_RU_Soldier_D"],["ACE_RU_Soldier_D","ACE_RU_Soldier_D"]]]],0.3],
					[[[["ACE_RU_Soldier_TL_D","GAZ_Vodnik_HMG","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[[],["ACE_RU_Soldier_D","ACE_RU_Soldier_D"]]]],0.4],

					[[[["ACE_RU_Soldier_SL_D","BMP3","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE"],[[],["ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_AT_D", "ACE_RU_Soldier_MG_D"]]]],0.75],
					[[[["ACE_RU_Soldier_SL_D","BTR90","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[[],["ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D"]]]],0.9],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMP2_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],
						[[],["ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D"]]
					]],0.01],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMP2D_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],
						[[],["ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D"]]
					]],0.01],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMD_2_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],
						[[],["ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D"]]
					]],0.01],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMD_1P_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],
						[[],["ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_AT_D", "ACE_RU_Soldier_MG_D"]]
					]],0.01],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMD_1_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0]],
						["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],
						[[],["ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_AT_D", "ACE_RU_Soldier_MG_D"]]
					]],0.01],

					[[[["ACE_T90A","ACE_T90A","ACE_T90A"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"],[["ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D"],["ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D"],["ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D"]]]],0.6],
					[[[["ACE_T72BA_Base","ACE_T72BA_Base","ACE_T72BA_Base"],[[0,10,0],[7,0,0],[-7,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"],[["ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D"],["ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D"],["ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D","ACE_RU_Soldier_Crew_D"]]]],0.25],

					[[[["Mi24_V","Mi24_V"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"],[["ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D"],["ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D"]]]],0.4],
					[[[["Mi24_P","Mi24_P"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"],[["ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D"],["ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D"]]]],0.3],
					[[[["ACE_Ka50","ACE_Ka50"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"],[["ACE_RU_Soldier_Pilot_D"],["ACE_RU_Soldier_Pilot_D"]]]],0.01],
					[[[["ACE_Mi24_V_UPK23_RU","ACE_Mi24_V_UPK23_RU"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"],[["ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D"],["ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D"]]]],0.01],
					[[[["Ka52"],[],["CAPTAIN"],[["ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D"]]]],0.1],
					[[[["Mi17_Rockets_RU","Mi17_Rockets_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"],[["ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D"],["ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D","ACE_RU_Soldier_Pilot_D"]]]],0.3],
					[[[["ACE_Su34_Des","ACE_Su34_Des"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.2],
					[[[["Pchela1T"],[],["CAPTAIN"]]],0.2],
					[[[["ACE_Su34_MR_Des"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],

					[[[["2S6M_Tunguska"], [], ["LIEUTENANT"],[["ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D", "ACE_RU_Soldier_Crew_D"]]]],0.6],
					[[[["ACE_RU_Soldier_Sniper_D","ACE_RU_Soldier_SniperH_D","ACE_RU_Soldier_Spotter_D"], [],["SERGEANT","SERGEANT","CORPORAL"]]],0.01],
					[[[["ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Engineer_D","ACE_RU_Soldier_LAT_D"], [],["SERGEANT","CORPORAL","PRIVATE"]]],0.01],
					[[[["ACE_RU_Soldier_GL_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_Medic_D"], [],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.01],
					[[[["ACE_Su39"], [],["CAPTAIN"]]],0.01]
					// [[[["ACE_RU_Soldier_GL_D","UAZ_AGS30_RU","ACE_RU_Soldier_AT_D","UAZ_AGS30_RU"], [],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.01]
				];
			};
		}else{
			if(!_deserted)then{
				_east=_east+[
					// RUS_ReconTeam !=
					[[[["RUS_Soldier_TL",
						"RUS_Soldier_GL","RUS_Soldier_Marksman",
						"RUS_Soldier3","RUS_Soldier1",
						"RUS_Soldier2","RUS_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
						["LIEUTENANT",
						"SERGEANT","SERGEANT",
						"SERGEANT","CORPORAL",
						"CORPORAL","CORPORAL"]]],0.07]
				];
			};
			_east=_east+[
				// RU_TankPlatoon !=
				[[[["T90","T90","T90"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.6],
				[[[["T72_RU","T72_RU"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01]
			];
		};
	};
};

#ifdef __A2OA__
// OA
if(LIB_ahAvail)then{

	// BIS_BAF
if(true)then{
	if((!_woodland) && (_deserted))then{
		_west=_west+[
			[[[["BAF_Soldier_SL_DDPM","BAF_Soldier_TL_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AR_DDPM","BAF_Soldier_Marksman_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AR_DDPM","BAF_Soldier_AAR_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["BAF_Soldier_TL_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AR_DDPM","BAF_Soldier_Marksman_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
			[[[["BAF_Soldier_TL_DDPM","BAF_Soldier_FAC_DDPM","BAF_Soldier_Medic_DDPM","BAF_Soldier_EN_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			[[[["BAF_Soldier_TL_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_MG_DDPM","BAF_Soldier_AMG_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			[[[["BAF_Soldier_TL_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AT_DDPM","BAF_Soldier_AAT_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
			[[[["BAF_Soldier_AT_DDPM","BAF_Soldier_HAT_DDPM","BAF_Soldier_AHAT_DDPM","BAF_Soldier_AAT_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.05],

			[[[["BAF_FV510_D","BAF_FV510_D","BAF_FV510_D","BAF_FV510_D"],[[0,8,0],[8,0,0],[-8,0,0],[0,-8,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.05],

			[[[["CH_47F_BAF"],[[0,0,0]],["CAPTAIN"]],[["BAF_Soldier_SL_DDPM","BAF_Soldier_TL_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AR_DDPM","BAF_Soldier_Marksman_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AR_DDPM","BAF_Soldier_AAR_DDPM"]]],0.3],
			[[[["AW159_Lynx_BAF"],[],["CAPTAIN"]],[["BAF_Soldier_SL_DDPM","BAF_Soldier_TL_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AR_DDPM","BAF_Soldier_Marksman_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AR_DDPM","BAF_Soldier_AAR_DDPM"]]],0.3],
			[[[["BAF_Apache_AH1_D","BAF_Apache_AH1_D"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			[[[["BAF_Merlin_HC3_D"],[],["CAPTAIN"]],[["BAF_Soldier_SL_DDPM","BAF_Soldier_TL_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AR_DDPM","BAF_Soldier_Marksman_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_AR_DDPM","BAF_Soldier_AAR_DDPM"]]],0.3],

			[[[["BAF_Soldier_TL_MTP","BAF_Soldier_GL_MTP","BAF_Jackal2_L2A1_D"],[[0,5,0],[3,0,0],[-5,0,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.3],
			[[[["BAF_Soldier_SL_MTP","BAF_Soldier_GL_MTP","BAF_Jackal2_L2A1_D",	"BAF_Soldier_TL_MTP","BAF_Soldier_GL_MTP","BAF_Jackal2_L2A1_D"],[[0,5,0],[3,0,0],[-5,0,0],[5,0,0],[7,0,0],[-5,-10,0]],[
					"SERGEANT","PRIVATE","PRIVATE",							"SERGEANT","PRIVATE","PRIVATE"]]],0.1],
			[[[["BAF_Soldier_SL_MTP","BAF_Soldier_TL_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_AR_MTP","BAF_Soldier_AR_MTP","BAF_Soldier_Marksman_MTP","BAF_Offroad_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[-5,0,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],

			[[[["BAF_Soldier_SL_MTP","BAF_Soldier_TL_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_AR_MTP","BAF_Soldier_Marksman_MTP","BAF_FV510_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],["LIEUTENANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","LIEUTENANT"]]],0.3],
			[[[["BAF_Soldier_AT_MTP","BAF_Soldier_AT_MTP","BAF_Soldier_HAT_MTP","BAF_Soldier_AAT_MTP","BAF_Soldier_AAT_MTP","BAF_Soldier_AHAT_MTP","BAF_FV510_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],["LIEUTENANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","LIEUTENANT"]]],0.3],

			//StaticWeapon
			[[[["BAF_GMG_Tripod_D"], [],["PRIVATE"]]],0.01],
			[[[["BAF_GPMG_Minitripod_D"], [],["PRIVATE"]]],0.01],
			[[[["BAF_L2A1_Tripod_D"], [],["PRIVATE"]]],0.01],
			[[[["BAF_L2A1_Minitripod_D"], [],["PRIVATE"]]],0.01]
		];
	};
	if(!_woodland)then{
		_west=_west+[
			[[[["BAF_Soldier_Sniper_MTP","BAF_Soldier_SniperH_MTP","BAF_Soldier_spotter_MTP"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.05],
			[[[["BAF_Soldier_SniperN_MTP","BAF_Soldier_SniperN_MTP","BAF_Soldier_spotterN_MTP"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.05]
		];
	};
	if((_woodland) && (!_deserted))then{
		_west=_west+[
		[[[["BAF_Soldier_SL_W","BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_Marksman_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_AAR_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_Marksman_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
		[[[["BAF_Soldier_TL_W","BAF_Soldier_FAC_W","BAF_Soldier_Medic_W","BAF_Soldier_EN_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
		[[[["BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Soldier_MG_W","BAF_Soldier_AMG_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
		[[[["BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Soldier_AT_W","BAF_Soldier_AAT_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
		[[[["BAF_Soldier_AT_W","BAF_Soldier_HAT_W","BAF_Soldier_AHAT_W","BAF_Soldier_AAT_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.05],

		[[[["BAF_Soldier_Sniper_W","BAF_Soldier_SniperH_W","BAF_Soldier_spotter_W"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.05],
		[[[["BAF_Soldier_SniperN_W","BAF_Soldier_SniperN_W","BAF_Soldier_spotterN_W"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.05],

		[[[["BAF_Soldier_SL_W","BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_AR_W","BAF_Soldier_Marksman_W","BAF_Offroad_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[-5,0,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Jackal2_L2A1_W"],[[0,5,0],[3,0,0],[-5,0,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.3],
		[[[["BAF_Soldier_SL_W","BAF_Soldier_GL_W","BAF_Jackal2_L2A1_W",	"BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Jackal2_L2A1_W"],[[0,5,0],[3,0,0],[-5,0,0],[5,0,0],[7,0,0],[-5,-10,0]],[
				"SERGEANT","PRIVATE","PRIVATE",							"SERGEANT","PRIVATE","PRIVATE"]]],0.1],
		[[[["BAF_Soldier_SL_W","BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_Marksman_W","BAF_FV510_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],["LIEUTENANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","LIEUTENANT"]]],0.3],
		[[[["BAF_Soldier_AT_W","BAF_Soldier_AT_W","BAF_Soldier_HAT_W","BAF_Soldier_AAT_W","BAF_Soldier_AAT_W","BAF_Soldier_AHAT_W","BAF_FV510_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],["LIEUTENANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","LIEUTENANT"]]],0.3],

		[[[["CH_47F_BAF"],[],["CAPTAIN"],[["BAF_Pilot_W","BAF_Pilot_W","BAF_Pilot_W","BAF_Pilot_W"]]],[["BAF_Soldier_SL_W","BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_Marksman_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_AAR_W"]]],0.3],
		[[[["AW159_Lynx_BAF"],[],["CAPTAIN"],[["BAF_Pilot_W","BAF_Pilot_W","BAF_Pilot_W"]]],[["BAF_Soldier_SL_W","BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_Marksman_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_AAR_W"]]],0.3],
		[[[["BAF_Merlin_HC3_D"],[],["CAPTAIN"],[["BAF_Pilot_W","BAF_Pilot_W","BAF_Pilot_W"]]],[["BAF_Soldier_SL_W","BAF_Soldier_TL_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_Marksman_W","BAF_Soldier_GL_W","BAF_Soldier_AR_W","BAF_Soldier_AAR_W"]]],0.3],

		[[[["BAF_FV510_W","BAF_FV510_W","BAF_FV510_W","BAF_FV510_W"],[[0,8,0],[8,0,0],[-8,0,0],[0,-8,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.05],

		//StaticWeapon
		[[[["BAF_GMG_Tripod_W"], [],["PRIVATE"]]],0.01],
		[[[["BAF_L2A1_Minitripod_W"], [],["PRIVATE"]]],0.01],
		[[[["BAF_L2A1_Tripod_W"], [],["PRIVATE"]]],0.01],
		[[[["BAF_GPMG_Minitripod_W"], [],["PRIVATE"]]],0.01]
		];
	};
	if((!_woodland) && (!_deserted))then{
		_west=_west+[
			[[[["BAF_Soldier_SL_MTP","BAF_Soldier_TL_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_AR_MTP","BAF_Soldier_Marksman_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_AR_MTP","BAF_Soldier_AAR_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["BAF_Soldier_TL_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_AR_MTP","BAF_Soldier_Marksman_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
			[[[["BAF_Soldier_TL_MTP","BAF_Soldier_FAC_MTP","BAF_Soldier_Medic_MTP","BAF_Soldier_EN_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			[[[["BAF_Soldier_TL_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_MG_MTP","BAF_Soldier_AMG_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			[[[["BAF_Soldier_TL_MTP","BAF_Soldier_GL_MTP","BAF_Soldier_AT_MTP","BAF_Soldier_AAT_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
			[[[["BAF_Soldier_AT_MTP","BAF_Soldier_HAT_MTP","BAF_Soldier_AHAT_MTP","BAF_Soldier_AAT_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.05]
		];
	};
};

	// BIS_GER
if(true)then{
	if(!_woodland)then{
		_west=_west+[
			[[[["GER_Soldier_TL_EP1","GER_Soldier_MG_EP1","GER_Soldier_EP1","GER_Soldier_Scout_EP1","GER_Soldier_EP1","GER_Soldier_Medic_EP1"],[],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0]
		];
	};
};

	// BIS_US
if(true)then{
	if(!_woodland)then{
		_west=_west+[
			[[[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["US_Soldier_SL_EP1","US_Soldier_MG_EP1","US_Soldier_GL_EP1","US_Soldier_AMG_EP1","US_Soldier_MG_EP1","US_Soldier_GL_EP1","US_Soldier_AMG_EP1","US_Soldier_LAT_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_AAR_EP1"],[],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.3],
			[[[["US_Soldier_TL_EP1","US_Soldier_MG_EP1","US_Soldier_GL_EP1","US_Soldier_AMG_EP1"],[],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			[[[["US_Soldier_TL_EP1","US_Soldier_AT_EP1","US_Soldier_AT_EP1","US_Soldier_AAT_EP1"],[],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			[[[["US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1","US_Soldier_Medic_EP1"],[],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			[[[["US_Soldier_HAT_EP1","US_Soldier_HAT_EP1","US_Soldier_AHAT_EP1"],[],["SERGEANT","CORPORAL","CORPORAL"]]],0.1],
			[[[["US_Soldier_Sniper_EP1","US_Soldier_Sniper_EP1","US_Soldier_Spotter_EP1"],[],["SERGEANT","SERGEANT","CORPORAL"]]],0.05],
			[[[["US_Delta_Force_TL_EP1","US_Delta_Force_MG_EP1","US_Delta_Force_Assault_EP1","US_Delta_Force_Marksman_EP1"],[],["SERGEANT","SERGEANT","CORPORAL","CORPORAL"]]],0],

			[[[["US_Soldier_SL_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_MK19_DES_EP1","US_Soldier_AT_EP1","US_Soldier_GL_EP1","US_Soldier_GL_EP1","US_Soldier_AAT_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			[[[["US_Soldier_SL_EP1","HMMWV_TOW_DES_EP1","HMMWV_TOW_DES_EP1","US_Soldier_AR_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.15],
			// [[[["US_Delta_Force_TL_EP1","ATV_US_EP1","ATV_US_EP1","US_Delta_Force_Assault_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0],
			[[[["US_Delta_Force_TL_EP1","HMMWV_M998A2_SOV_DES_EP1","US_Delta_Force_Assault_EP1","US_Delta_Force_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0],
			[[[["US_Soldier_TL_EP1","M2A3_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_GL_EP1","US_Soldier_AT_EP1","US_Soldier_LAT_EP1"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.6],

			[[[["A10_US_EP1","A10_US_EP1"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			[[[["AH64D_EP1"],[[0,0,0]],["CAPTAIN"]]],0.3],
			[[[["AH6J_EP1","AH6J_EP1"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			[[[["AH6X_EP1"],[[0,0,0]],["CAPTAIN"]]],0.1],
			[[[["MH6J_EP1"],[[0,0,0]],["CAPTAIN"]],[["US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_AAR_EP1"]]],0.1],
			[[[["C130J_US_EP1"],[[0,0,0]],["CAPTAIN"]],[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"]]],0.3],
			[[[["CH_47F_EP1"],[[0,0,0]],["CAPTAIN"]],[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"]]],0.3],
			[[[["MQ9PredatorB_US_EP1"],[[0,0,0]],["CAPTAIN"]]],0.3],
			[[[["UH60M_EP1","UH60M_EP1"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			[[[["UH60M_EP1"],[],["CAPTAIN"]],[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"]]],0.3],

			[[[["HMMWV_Avenger_DES_EP1"], [[0,0]],["SERGEANT"]]],0.8],
			[[[["US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1","US_Soldier_Engineer_EP1"], [],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.01],
			// [[[["M1129_MC_EP1"], [],[]]],0.01],
			[[[["M1135_ATGMV_EP1","M1135_ATGMV_EP1"], [[0,0],[10,0]],["LIEUTENANT","LIEUTENANT"]]],0.01],
			[[[["US_Soldier_TL_EP1","M6_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_GL_EP1","US_Soldier_AT_EP1","US_Soldier_LAT_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.01],
			[[[["US_Soldier_TL_EP1","M2A2_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_GL_EP1","US_Soldier_AT_EP1","US_Soldier_LAT_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.01],
			// [[[["US_Soldier_TL_EP1","HMMWV_DES_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1"], [[0,0],[5,0],[0,0],[0,0]],["SERGEANT","PRIVATE","CORPORAL","CORPORAL"]]],0.01],
			// [[[["US_Soldier_TL_EP1","HMMWV_M1035_DES_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1"], [[0,0],[5,0],[0,0],[0,0]],["SERGEANT","PRIVATE","CORPORAL","CORPORAL"]]],0.01],
			// [[[["HMMWV_Terminal_EP1","US_Soldier_Engineer_EP1"], [[0,0],[5,0]],["CORPORAL","PRIVATE"]]],0.01],
			[[[["US_Soldier_TL_EP1","HMMWV_M998_crows_M2_DES_EP1","US_Soldier_AR_EP1"], [[0,0],[5,0],[0,0]],["SERGEANT","PRIVATE","CORPORAL"]]],0.01],
			[[[["US_Soldier_TL_EP1","HMMWV_M998_crows_MK19_DES_EP1","US_Soldier_AR_EP1"], [[0,0],[5,0],[0,0]],["SERGEANT","PRIVATE","CORPORAL"]]],0.01],
			[[[["US_Soldier_SL_EP1","MTVR_DES_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"],
				[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
				["LIEUTENANT","PRIVATE","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]
			]],0.01],

			[[[["MtvrReammo_DES_EP1"], [],["PRIVATE"]]],0.01],
			[[[["MtvrRefuel_DES_EP1"], [],["PRIVATE"]]],0.01],
			[[[["MtvrRepair_DES_EP1"], [],["PRIVATE"],[["US_Soldier_Engineer_EP1"]]]],0.01],
			[[[["HMMWV_Ambulance_DES_EP1"], [],["PRIVATE"],[["US_Soldier_Medic_EP1"]]]],0.01],
			[[[["M1133_MEV_EP1"], [],["PRIVATE"],[["US_Soldier_Medic_EP1"]]]],0.01],

			//StaticWeapon
			[[[["M2StaticMG_US_EP1"],[],["PRIVATE"]]],0.01],
			[[[["M2HD_mini_TriPod_US_EP1"],[],["PRIVATE"]]],0.01],
			[[[["MK19_TriPod_US_EP1"],[],["PRIVATE"]]],0.01],
			[[[["Stinger_Pod_US_EP1"],[],["PRIVATE"]]],0.01],
			[[[["TOW_TriPod_US_EP1"],[],["PRIVATE"]]],0.01],
			[[[["SearchLight_US_EP1"],[],["PRIVATE"]]],0.01]
		];

		if(acex_usnavy_Avail)then{
			_west=_west+[
				// [[[["ACE_US_Soldier_M224_G","ACE_US_Soldier_M224_AG","ACE_US_Soldier_M224_AB","ACE_US_Soldier_M224_AB"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.3],
				// [[[["ACE_US_Soldier_M252_G","ACE_US_Soldier_M252_AG","ACE_US_Soldier_M252_AB","ACE_US_Soldier_M252_AB"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.3],
				[[[["US_Soldier_SL_EP1","ACE_Stryker_ICV_M2_SLAT","US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_GL_EP1","US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
				[[[["US_Soldier_SL_EP1","ACE_Stryker_ICV_MK19_SLAT","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
				// [[[["US_Soldier_TL_EP1","ACE_Stryker_RV","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1","US_Soldier_LAT_EP1"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.6],
				[[[["ACE_Stryker_MGS","ACE_Stryker_MGS","ACE_Stryker_MGS"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
				[[[["ACE_Stryker_TOW_Slat","ACE_Stryker_TOW_Slat"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
				[[[["ACE_M1A1HA_TUSK_DESERT","ACE_M1A1HA_TUSK_DESERT","ACE_M1A1HA_TUSK_DESERT","ACE_M1A1HA_TUSK_DESERT"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.05],
				[[[["ACE_M1A1HA_TUSK_DESERT","ACE_M1A1HA_TUSK_DESERT"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05],
				[[[["ACE_M1A1HA_TUSK_CSAMM_DESERT","ACE_M1A1HA_TUSK_CSAMM_DESERT"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05],
				[[[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1","US_Soldier_AT_EP1","US_Soldier_AAT_EP1","US_Soldier_Medic_EP1","ACE_Truck5tMG"],
					[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[10,0]],
					["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
				]],0.02]
			];
		}else{
			_west=_west+[
				[[[["US_Soldier_SL_EP1","M1126_ICV_M2_EP1","US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_GL_EP1","US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
				[[[["US_Soldier_SL_EP1","M1126_ICV_mk19_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
				[[[["M1128_MGS_EP1","M1128_MGS_EP1","M1128_MGS_EP1"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
				[[[["M1135_ATGMV_EP1","M1135_ATGMV_EP1"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
				[[[["M1A2_US_TUSK_MG_EP1","M1A2_US_TUSK_MG_EP1","M1A2_US_TUSK_MG_EP1","M1A2_US_TUSK_MG_EP1"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.05],
				[[[["M1A1_US_DES_EP1","M1A1_US_DES_EP1","M1A1_US_DES_EP1","M1A1_US_DES_EP1"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.05],
				[[[["M1A2_US_TUSK_MG_EP1","M1A2_US_TUSK_MG_EP1"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05]
			];
		};
	// }else{
		// if(acex_usnavy_Avail)then{
			// _west=_west+[
				// [[[["ACE_M1A1HA_TUSK","ACE_M1A1HA_TUSK","ACE_M1A1HA_TUSK","ACE_M1A1HA_TUSK"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.05],
				// [[[["ACE_M1A1HA_TUSK","ACE_M1A1HA_TUSK"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05],
				// [[[["ACE_M1A1HA_TUSK_CSAMM","ACE_M1A1HA_TUSK_CSAMM"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05]
			// ];
		// };
	};
};

	// BIS_TK_INS
if(true)then{
	if(!_woodland)then{
		_east=_east+[
			[[[["TK_INS_Soldier_TL_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_4_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.7],
			[[[["TK_INS_Soldier_2_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_4_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			[[[["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AA_EP1"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.2],
			[[[["TK_INS_Soldier_TL_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL"]]],0.2],
			[[[["TK_INS_Soldier_TL_EP1","LandRover_SPG9_TK_INS_EP1","LandRover_MG_TK_INS_EP1","TK_INS_Soldier_AT_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL"]]],0.5],
			[[[["TK_INS_Soldier_TL_EP1","V3S_TK_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE"],[[],["TK_INS_Soldier_EP1"]]]],0.1],
			[[[["TK_INS_Soldier_TL_EP1","BTR40_MG_TK_INS_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.3],

			//StaticWeapon
			[[[["AGS_TK_INS_EP1"], [],["PRIVATE"]]],0.01],
			[[[["DSHKM_TK_INS_EP1"], [],["PRIVATE"]]],0.01],
			[[[["DSHkM_Mini_TriPod_TK_INS_EP1"], [],["PRIVATE"]]],0.01],
			[[[["ZU23_TK_INS_EP1"], [],["PRIVATE"]]],0.01],
			[[[["SearchLight_TK_INS_EP1"], [],["PRIVATE"]]],0.01],
			[[[["SPG9_TK_INS_EP1"], [],["PRIVATE"]]],0.01]
		];
	};
};

	// BIS_TK
if(true)then{
	_east=_east+[
		[[[["T72_TK_EP1","T72_TK_EP1","T72_TK_EP1"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
		[[[["T55_TK_EP1","T55_TK_EP1","T55_TK_EP1"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
		[[[["T34_TK_EP1","T34_TK_EP1","T34_TK_EP1"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],

		[[[["L39_TK_EP1"],[],["LIEUTENANT"]]],0.01],
		[[[["An2_TK_EP1"],[],["CAPTAIN"]],[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1"]]],0.3],
		[[[["Mi24_D_TK_EP1"],[[0,0,0]],["CAPTAIN"]],[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1"]]],0.3],
		[[[["Mi17_TK_EP1","Mi17_TK_EP1"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		[[[["Mi17_TK_EP1"],[],["CAPTAIN"]],[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1"]]],0.3],
		[[[["Su25_TK_EP1","Su25_TK_EP1"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		[[[["UH1H_TK_EP1","UH1H_TK_EP1"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]],[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1","TK_Soldier_EP1"]]],0.3],

		// [[[["ACE_TK_Soldier_2B14_G","ACE_TK_Soldier_2B14_AG","ACE_TK_Soldier_2B14_AB","ACE_TK_Soldier_2B14_AB"],[],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
		// [[[["ACE_TK_Soldier_KonkursG","ACE_TK_Soldier_KonkursAG"],[[0,"+6",0],[-2,"+4",0]],["SERGEANT","CORPORAL"]]],0],
		[[[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
		[[[["TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1","TK_Soldier_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
		[[[["TK_Soldier_HAT_EP1","TK_Soldier_HAT_EP1","TK_Soldier_AT_EP1","TK_Soldier_AT_EP1","TK_Soldier_AAT_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
		[[[["TK_Soldier_AA_EP1","TK_Soldier_AA_EP1","TK_Soldier_AA_EP1"],[[0,5,0],[3,0,0],[5,0,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.2],
		[[[["TK_Soldier_MG_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AMG_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
		[[[["TK_Soldier_SniperH_EP1","TK_Soldier_Spotter_EP1"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],

		[[[["TK_Soldier_SL_EP1","V3S_Open_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AMG_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
		[[[["TK_Soldier_SL_EP1","UAZ_MG_TK_EP1","UAZ_AGS30_TK_EP1","TK_Soldier_AT_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.3],
		[[[["TK_Soldier_GL_EP1","UAZ_Unarmed_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_EP1"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.4],

		[[[["TK_Soldier_SL_EP1","BMP2_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AAT_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.7],
		[[[["TK_Soldier_SL_EP1","BTR60_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_LAT_EP1","TK_Soldier_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL"]]],0.9],
		// [[[["TK_Special_Forces_TL_EP1","ACE_BTR70_TK","TK_Special_Forces_MG_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0],
		[[[["TK_Soldier_SL_EP1","BRDM2_TK_EP1","BRDM2_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_AR_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.7],
		[[[["BRDM2_ATGM_TK_EP1","BRDM2_ATGM_TK_EP1"],[[0,10,0],[5,0,0]],["SERGEANT","SERGEANT"]]],0.7],

		[[[["Ural_ZU23_TK_EP1","TK_Soldier_AA_EP1","TK_Soldier_AA_EP1","TK_Soldier_AA_EP1"], [[10,0],[0,0],[0,10],[0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.01],
		[[[["TK_Soldier_SL_EP1","M113_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1"], [[0,0],[5,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
		[[[["TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1","TK_Soldier_Engineer_EP1"], [],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.01],

		[[[["UralReammo_TK_EP1"], [],["PRIVATE"]]],0.01],
		[[[["UralRefuel_TK_EP1"], [],["PRIVATE"]]],0.01],
		[[[["UralRepair_TK_EP1"], [],["PRIVATE"],[["TK_Soldier_Engineer_EP1"]]]],0.01],
		[[[["M113Ambul_TK_EP1"], [],["PRIVATE"],[["TK_Soldier_Medic_EP1"]]]],0.01],

		//StaticWeapon
		[[[["AGS_TK_EP1"], [],["PRIVATE"]]],0.01],
		[[[["ZU23_TK_EP1"], [],["PRIVATE"]]],0.01],
		[[[["KORD_high_TK_EP1"], [],["PRIVATE"]]],0.01],
		[[[["KORD_TK_EP1"], [],["PRIVATE"]]],0.01],
		[[[["Igla_AA_pod_TK_EP1"], [],["PRIVATE"]]],0.01],
		[[[["Metis_TK_EP1"], [],["PRIVATE"]]],0.01],
		[[[["SearchLight_TK_EP1"], [],["PRIVATE"]]],0.01]

	];
	if(!_woodland)then{
		_east=_east+[
			[[[["TK_Special_Forces_TL_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
		];
	};
	if(acex_ru_Avail)then{
		_east=_east+[
			[[[["TK_Soldier_SL_EP1","ACE_BTR70_TK","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_LAT_EP1","TK_Soldier_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL"]]],0.9],
			[[[["ZSU_TK_EP1","ACE_BRDM2_SA9_TK"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01]
		];
	}else{
		_east=_east+[
			[[[["ZSU_TK_EP1"], [[0,0],[0,10]],["LIEUTENANT","LIEUTENANT"]]],0.5]
		];
	};
};

	// BIS_UN
if(true)then{
	if(!_woodland)then{
		_guer=_guer+[
			[[[["UN_CDF_Soldier_Guard_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
			[[[["UN_CDF_Soldier_Guard_EP1","UAZ_Unarmed_UN_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_MG_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.6],
			[[[["UN_CDF_Soldier_SL_EP1","BMP2_UN_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["UN_CDF_Soldier_SL_EP1","M113_UN_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_EP1"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["Mi17_UN_CDF_EP1"],[],["CAPTAIN"]],[["UN_CDF_Soldier_Guard_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1"]]],0.1],

			[[[["M113Ambul_UN_EP1"], [],["PRIVATE"],[["TK_Soldier_Medic_EP1"]]]],0.01],

			//StaticWeapon
			[[[["AGS_UN_EP1"],[],["PRIVATE"]]],0.01],
			[[[["KORD_high_UN_EP1"],[],["PRIVATE"]]],0.01],
			[[[["KORD_UN_EP1"],[],["PRIVATE"]]],0.01],
			[[[["SearchLight_UN_EP1"],[],["PRIVATE"]]],0.01]
		];
		if(acex_ru_Avail)then{
			_guer=_guer+[
				[[[["UN_CDF_Soldier_SL_EP1","ACE_BTR70_UN","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_EP1"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5]
			];
		};
	};
};

	// BIS_TK_GUE
if(true)then{
	if(!_woodland)then{
		_guer=_guer+[
			[[[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_5_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_5_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
			[[[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_4_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			[[[["TK_GUE_Soldier_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_2_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			[[[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AAT_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
			[[[["TK_GUE_Soldier_AA_EP1","TK_GUE_Soldier_AA_EP1","TK_GUE_Soldier_AA_EP1"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.2],
			[[[["TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
			[[[["TK_GUE_Soldier_TL_EP1","Offroad_DSHKM_TK_GUE_EP1","Offroad_SPG9_TK_GUE_EP1","Pickup_PK_TK_GUE_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[-5,-14,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			[[[["TK_GUE_Soldier_TL_EP1","V3S_TK_GUE_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_3_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0],[25,0,0],[27,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["TK_GUE_Soldier_TL_EP1","BTR40_MG_TK_GUE_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_2_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["TK_GUE_Soldier_4_EP1","BRDM2_TK_GUE_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_AT_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
			[[[["TK_GUE_Soldier_TL_EP1","BTR40_MG_TK_GUE_EP1","BTR40_MG_TK_GUE_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["T55_TK_GUE_EP1","T55_TK_GUE_EP1"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.02],
			[[[["T34_TK_GUE_EP1","T34_TK_GUE_EP1"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
			[[[["UH1H_TK_GUE_EP1"],[],["CAPTAIN"]],[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_4_EP1"]]],0.3],
			[[[["TK_GUE_Soldier_TL_EP1","BTR40_TK_GUE_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_2_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.01],

			[[[["V3S_Reammo_TK_GUE_EP1"], [],["PRIVATE"]]],0.01],
			[[[["V3S_Refuel_TK_GUE_EP1"], [],["PRIVATE"]]],0.01],
			[[[["V3S_Repair_TK_GUE_EP1"], [],["PRIVATE"]]],0.01],

			//StaticWeapon
			[[[["AGS_TK_GUE_EP1"],[],["PRIVATE"]]],0.01],
			[[[["DSHKM_TK_GUE_EP1"],[],["PRIVATE"]]],0.01],
			[[[["DSHkM_Mini_TriPod_TK_GUE_EP1"],[],["PRIVATE"]]],0.01],
			[[[["ZU23_TK_GUE_EP1"],[],["PRIVATE"]]],0.01],
			[[[["SearchLight_TK_GUE_EP1"],[],["PRIVATE"]]],0.01],
			[[[["SPG9_TK_GUE_EP1"],[],["PRIVATE"]]],0.01]

		];
	};
};

	// PMC_BAF
if(true)then{
	_guer=_guer+[
		// [[[["Soldier_TL_PMC","Soldier_Bodyguard_AA12_PMC","Soldier_Bodyguard_M4_PMC"],[[0,5,0],[3,0,0],[5,0,0]],["LIEUTENANT","CORPORAL","CORPORAL"]]],0.5],
		[[[["Soldier_GL_PMC","Soldier_GL_M16A2_PMC","Soldier_M4A3_PMC","Soldier_M4A3_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
		[[[["Soldier_TL_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_MG_PMC","Soldier_GL_PMC","Soldier_M4A3_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
		[[[["Soldier_TL_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_MG_PMC","Soldier_MG_PKM_PMC","Soldier_GL_PMC","Soldier_GL_M16A2_PMC","Soldier_M4A3_PMC","Soldier_PMC","Soldier_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["Soldier_TL_PMC","Soldier_Sniper_KSVK_PMC","Soldier_AT_PMC","Soldier_MG_PMC","Soldier_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
		[[[["Soldier_GL_M16A2_PMC","Soldier_GL_PMC","Soldier_Engineer_PMC","Soldier_Medic_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","SERGEANT"]]],0.5],
		// [[[["Soldier_Bodyguard_M4_PMC","SUV_PMC","Soldier_Bodyguard_AA12_PMC"],[[3,5,0],[-5,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.4],
		// [[[["Soldier_TL_PMC","SUV_PMC","SUV_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_Bodyguard_AA12_PMC","Soldier_GL_PMC","Soldier_M4A3_PMC"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
		[[[["Soldier_TL_PMC","ArmoredSUV_PMC","ArmoredSUV_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_MG_PKM_PMC","Soldier_GL_PMC","Soldier_GL_PMC"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
		[[[["Ka60_GL_PMC"], [],["LIEUTENANT"]],[["Soldier_TL_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_MG_PMC","Soldier_MG_PKM_PMC","Soldier_GL_PMC","Soldier_GL_M16A2_PMC","Soldier_M4A3_PMC"]]],0.1],
		[[[["Ka137_MG_PMC"], [],["LIEUTENANT"]]],0.01],
		[[[["Soldier_AA_PMC","Soldier_AA_PMC"], [],["CORPORAL","PRIVATE"]]],0.2]
		// [[[["TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1","TK_Soldier_Engineer_EP1"], [],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.01]
	];
};

	// ACR
if(true)then{
	if(!_woodland)then{
		_west=_west+[
			[[[["CZ_Special_Forces_TL_DES_EP1","CZ_Special_Forces_MG_DES_EP1","CZ_Special_Forces_GL_DES_EP1","CZ_Special_Forces_DES_EP1","CZ_Special_Forces_DES_EP1","CZ_Special_Forces_Scout_DES_EP1"],[],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.1],
			[[[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1"],[],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL"]]],0.5],

			[[[["CZ_Soldier_SL_DES_EP1","LandRover_CZ_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_DES_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL"]]],0.6],
			[[[["CZ_Special_Forces_TL_DES_EP1","LandRover_Special_CZ_EP1","CZ_Special_Forces_GL_DES_EP1"],[[3,5,0],[-5,0,0],[5,0,0]],["SERGEANT","SERGEANT","CORPORAL"]]],0],
			[[[["CZ_Special_Forces_TL_DES_EP1","ATV_CZ_EP1","ATV_CZ_EP1","CZ_Special_Forces_Scout_DES_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0],

			[[[["Mi171Sh_CZ_EP1","Mi171Sh_CZ_EP1"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			[[[["Mi171Sh_CZ_EP1"],[],["CAPTAIN","LIEUTENANT"]],[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1","CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1"]]],0.3],
			[[[["Mi171Sh_rockets_CZ_EP1"],[],["CAPTAIN"]],[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1","CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1"]]],0.3],

			//StaticWeapon
			[[[["AGS_CZ_EP1"], [],["PRIVATE"]]],0.01],
			[[[["DSHKM_CZ_EP1"], [],["PRIVATE"]]],0.01]
		];
	};
};

};

// ACR
if(configName(configFile >> "CfgMods" >> "ACR") != "")then{
	if(_deserted)then{
		_west=_west+[
			[[[["Mi24_D_CZ_ACR"], [],["CAPTAIN"]],[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"]]],0.01],
			[[[["Mi171Sh_CZ_EP1"], [],["CAPTAIN"]],[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"]]],0.01],
			[[[["Mi171Sh_rockets_CZ_EP1"], [],["CAPTAIN"]],[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"]]],0.01],

			[[[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"],[],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],

			[[[["CZ_Soldier_SL_DES_EP1","BMP2_Des_ACR","CZ_Soldier_MG_DES_EP1","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.6],
			[[[["CZ_Soldier_805g_Dst_ACR","Dingo_DST_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Soldier_RPG_Dst_ACR"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.4],

			[[[["T810Reammo_Des_ACR"], [],["PRIVATE"]]],0.01],
			[[[["T810Refuel_Des_ACR"], [],["PRIVATE"]]],0.01],
			[[[["T810Repair_Des_ACR"], [],["PRIVATE"],[["CZ_Soldier_Engineer_Dst_ACR"]]]],0.01],
			[[[["HMMWV_Ambulance_CZ_DES_EP1"], [],["PRIVATE"],[["CZ_Soldier_medik_DES_EP1"]]]],0.01],
			[[[["LandRover_Ambulance_Des_ACR"], [],["PRIVATE"],[["CZ_Soldier_medik_DES_EP1"]]]],0.01],
			//StaticWeapon
			[[[["Rbs70_ACR"], [],["PRIVATE"]]],0.01]

		];
		_guer=_guer+[
			[[[["TK_GUE_Soldier_TL_EP1","BVP1_TK_GUE_ACR","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_2_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.01]
		];
	}else{
		_west=_west+[
			[[[["Mi24_D_CZ_ACR"], [],["CAPTAIN"]],[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_805g_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"]]],0.01],
			[[[["Mi171Sh_CZ_EP1"], [],["CAPTAIN"]],[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_805g_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"]]],0.01],
			[[[["Mi171Sh_rockets_CZ_EP1"], [],["CAPTAIN"]],[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_805g_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"]]],0.01],

			[[[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_805g_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Soldier_Engineer_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],

			[[[["CZ_Soldier_Leader_Wdl_ACR","Pandur2_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.9],
			[[[["CZ_Soldier_805g_Wdl_ACR","Dingo_WDL_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.6],

			[[[["T72_ACR","T72_ACR"], [[0,0],[10,0]],["CAPTAIN","LIEUTENANT"]]],0.01],

			[[[["CZ_Soldier_Leader_Wdl_ACR",
				"T810A_MG_ACR","CZ_Soldier_805g_Wdl_ACR",
				"CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR",
				"CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR",
				"CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[],
				["LIEUTENANT",
				"PRIVATE","SERGEANT",
				"SERGEANT","CORPORAL",
				"CORPORAL","CORPORAL",
				"PRIVATE","PRIVATE"]]],0.01],
			[[[["CZ_Soldier_Leader_Wdl_ACR",
				"T810_ACR","CZ_Soldier_805g_Wdl_ACR",
				"CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR",
				"CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR",
				"CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[],
				["LIEUTENANT",
				"PRIVATE","SERGEANT",
				"SERGEANT","CORPORAL",
				"CORPORAL","CORPORAL",
				"PRIVATE","PRIVATE"]]],0.01],

			[[[["T810Reammo_ACR"], [],["PRIVATE"]]],0.01],
			[[[["T810Refuel_ACR"], [],["PRIVATE"]]],0.01],
			[[[["T810Repair_ACR"], [],["PRIVATE"],[["CZ_Soldier_Engineer_Wdl_ACR"]]]],0.01],
			[[[["LandRover_Ambulance_ACR"], [],["PRIVATE"],[["CZ_Soldier_Medic_Wdl_ACR"]]]],0.01]

		];
	};
	_west=_west+[
		[[[["L159_ACR","L159_ACR"], [[0,0],[15,0]],["CAPTAIN","LIEUTENANT"]]],0.01],
		[[[["L39_2_ACR"], [],["LIEUTENANT"]]],0.01]
	];
	_east=_east+[
		[[[["TK_Soldier_SL_EP1","BVP1_TK_ACR","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AAT_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.01]
	];
};

// BWMod
if((configName(LIB_cfgVeh >> "BWMod_SquadLeaderG") != "") && true)then{
	if(_deserted)then{
		_west=_west+[
			[[[["BWMod_UH1D"], [],["LIEUTENANT"]],[["BWMod_SquadLeaderG_Desert","BWMod_RiflemanG_Desert","BWMod_RiflemanG_Desert","BWMod_MedicG_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_ATSoldierG_Desert","BWMod_AASoldierG_Desert"]]],0.02],
			[[[["BWMod_SquadLeaderG_Desert","BWMod_RiflemanG_Desert","BWMod_RiflemanG_Desert","BWMod_MedicG_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_ATSoldierG_Desert","BWMod_AASoldierG_Desert"],[],["LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.4],
			[[[["BWMod_SquadLeaderG_Desert","BWMod_RiflemanG_Desert","BWMod_MedicG_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_ATSoldierG_Desert","BWMod_Marder_1A5_Desert"],[[0,0,0],[4,0,0],[6,0,0],[0,-2,0],[2,-2,0],[4,-2,0],[-2,-1,0]],["LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.4],
			[[[["BWMod_Leopard_2A6_Desert","BWMod_Leopard_2A6_Desert","BWMod_Leopard_2A6_Desert","BWMod_Leopard_2A6_Desert"],[[0,0,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.35],
			[[[["BWMod_Wiesel2_Ozelot_Desert"], [],["LIEUTENANT"]]],0.02],
			[[[["BWMod_SquadLeaderG_Desert","BWMod_Fuchs_ArmoredTurret_Desert","BWMod_RiflemanG_Desert","BWMod_RiflemanG_Desert","BWMod_MedicG_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_ATSoldierG_Desert","BWMod_AASoldierG_Desert"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.3]
		];
	}else{
		_west=_west+[
			[[[["BWMod_UH1D"], [],["LIEUTENANT"]],[["BWMod_SquadLeaderG","BWMod_RiflemanG","BWMod_RiflemanG","BWMod_MedicG","BWMod_MGunnerG_MG4","BWMod_MGunnerG_MG4","BWMod_ATSoldierG","BWMod_AASoldierG"]]],0.02],
			[[[["BWMod_SquadLeaderG","BWMod_RiflemanG","BWMod_RiflemanG","BWMod_MedicG","BWMod_MGunnerG_MG4","BWMod_MGunnerG_MG4","BWMod_ATSoldierG","BWMod_AASoldierG"],[],["LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.4],
			[[[["BWMod_SquadLeaderG","BWMod_RiflemanG","BWMod_MedicG","BWMod_MGunnerG_MG4","BWMod_MGunnerG_MG4","BWMod_ATSoldierG","BWMod_Marder_1A5"],[[0,0,0],[4,0,0],[6,0,0],[0,-2,0],[2,-2,0],[4,-2,0],[-2,-1,0]],["LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.4],
			[[[["BWMod_Leopard_2A6","BWMod_Leopard_2A6","BWMod_Leopard_2A6","BWMod_Leopard_2A6"],[[0,0,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.35],
			[[[["BWMod_Wiesel2_Ozelot"], [],["LIEUTENANT"]]],0.02],
			[[[["BWMod_SquadLeaderG","BWMod_Fuchs_ArmoredTurret","BWMod_RiflemanG","BWMod_RiflemanG","BWMod_MedicG","BWMod_MGunnerG_MG4","BWMod_MGunnerG_MG4","BWMod_ATSoldierG","BWMod_AASoldierG"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],["LIEUTENANT","LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.3]
		];
	};
};

// sfp
if(configName(LIB_cfgVeh >> "sfp_m90w_squadleader_ak5_m203") != "")then{
	if(!_deserted)then{
		_west=_west+[
			[[[["sfp_m90w_teamleader_ak5_m203","sfp_m90w_mg_ksp58","sfp_m90w_automaticrifleman_ksp90","sfp_m90w_at_grg","sfp_m90w_rifleman_pskott","sfp_m90w_rifleman_ak5","sfp_strf90c"], [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[10,0]],["LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","LIEUTENANT"]]],0.4],
			[[[["sfp_m90w_sniper_psg90","sfp_m90w_rifleman_spotter"], [],["SERGEANT","SERGEANT"]]],0.01],
			[[[["sfp_m90w_squadleader_ak5_m203","sfp_m90w_automaticrifleman_ksp90","sfp_m90w_mg_ksp58","sfp_m90w_at_grg","sfp_m90w_rifleman_pskott","sfp_m90w_rifleman_ak5","sfp_m90w_rifleman_ak5","sfp_m90w_marksman_ak5c","sfp_m90w_medic_ak5"], [],
			["LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.4]
		];
	};
	if(!_woodland)then{
		_west=_west+[
			[[[["sfp_m90d_squadleader_ak5_m203","sfp_m90d_rifleman_ak5","sfp_m90d_rifleman_ak5","sfp_m90d_mg_ksp58","sfp_m90d_automaticrifleman_ksp90","sfp_m90d_at_grg","sfp_m90d_at_grg","sfp_m90d_marksman_ak5c","sfp_m90d_medic_ak5"],[],
			["LIEUTENANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.4]
		];
	};
};

// OFrP
if(configName(LIB_cfgVeh >> "OFrP_Soldier_Inf_TeamLeader") != "")then{
	_west=_west+[
		[[[["OFrP_Tiger_HAD_CE","OFrP_Tiger_HAD_CE"],[[0,15,0],[15,0,0]],["Captain","Lieutenant"]]],0.2],
		[[[["OFrP_Tiger_HAP_CE","OFrP_Tiger_HAP_CE"],[[0,15,0],[15,0,0]],["Captain","Lieutenant"]]],0.02],
		[[[["OFrP_Rafale_B1","OFrP_Rafale_B1"],[[0,20,0],[20,0,0]],["Captain","Lieutenant"]]],0.05],
		[[[["OFrP_Rafale_M3","OFrP_Rafale_M3"],[[0,20,0],[20,0,0]],["Captain","Lieutenant"]]],0.05],
		[[[["OFrP_Mirage_5","OFrP_Mirage_5"],[[0,20,0],[20,0,0]],["Captain","Lieutenant"]]],0.05],

		[[[["OFrP_TE_Integral_Inf1","OFrP_Spotter_Integral_Inf1"],[[0,5,0],[3,0,0]],["Sergeant","SERGEANT"]]],0.05]
	];
	if(!_deserted)then{
		_west=_west+[
			[[[["OFrP_Caracal"],[],["Lieutenant"]],[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_SniperFRF2","OFrP_Soldier_Inf","OFrP_Soldier_Inf_Radio","OFrP_Soldier_Inf","OFrP_Soldier_Inf_ABL","OFrP_Soldier_Inf_ERYX","OFrP_Soldier_Inf_Medic"]]],0.1],
			[[[["OFrP_Puma_CE_Pirate"],[],["Lieutenant"]]],0.1],

			[[[["OFrP_Soldier_CoS_TeamLeader","OFrP_Soldier_CoS_Medic","OFrP_Soldier_CoS_Minimi","OFrP_Soldier_CoS_Grenadier","OFrP_Soldier_COS_Radio","OFrP_Soldier_CoS"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[-3,0,0],[-5,0,0]],["Lieutenant","Sergeant","Sergeant","Corporal","Corporal","Corporal"]]],0.01],
			[[[["OFrP_Soldier_CoS_TeamLeader","OFrP_Soldier_CoS_Medic","OFrP_Soldier_CoS_Laser","OFrP_Soldier_COS_SniperFRF2","OFrP_Soldier_CoS"],[[0,5,0],[-3.5,0,0],[-1.5,0,0],[1.5,0,0],[3.5,0,0]],["Lieutenant","Sergeant","Sergeant","Corporal","Corporal"]]],0.01],

			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_PVP_ANF1","OFrP_PVP_WASP","OFrP_Soldier_Inf_Grenadier"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],["Sergeant","Sergeant","Corporal","Corporal"]]],0.05],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_PVP_WASP_MILAN","OFrP_PVP_WASP_MILAN","OFrP_Soldier_Inf_Grenadier"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],["Sergeant","Sergeant","Corporal","Corporal"]]],0.05],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_VAB_TOP127","OFrP_Soldier_Inf","OFrP_Soldier_Inf_SniperFRF2","OFrP_Soldier_Inf_ABL","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_Medic","OFrP_Soldier_Inf_Grenadier"],[[0,5,0],[-3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["Lieutenant","Sergeant","Private","Corporal","Corporal","Corporal","Private","Sergeant","Sergeant"]]],0.05],

			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_Scout","OFrP_Soldier_Inf_Radio","OFrP_Soldier_Inf_SniperFRF2","OFrP_Soldier_Inf_SniperFRF2"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal"]]],0.1],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_Medic","OFrP_Soldier_Inf_Grenadier","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_ABL","OFrP_Soldier_Inf","OFrP_Soldier_Inf_ABL"],[],["Lieutenant","Sergeant","Sergeant","Corporal","Corporal","Private","Private"]]],0.05],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_SniperFRF2","OFrP_Soldier_Inf","OFrP_Soldier_Inf_Radio","OFrP_Soldier_Inf","OFrP_Soldier_Inf_ABL","OFrP_Soldier_Inf_ERYX","OFrP_Soldier_Inf_Medic"],[],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE","Corporal","Private","CORPORAL","CORPORAL","SERGEANT"]]],0.05],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_ERYX","OFrP_Soldier_Inf_ERYX","OFrP_Soldier_Inf_LRAC89","OFrP_Soldier_Inf_LRAC89"],[],["SERGEANT","Sergeant","Corporal","Corporal","Corporal"]]],0.05],

			[[[["OFrP_Leclerc","OFrP_Leclerc","OFrP_Leclerc"],[[0,5,0],[5,0,0],[9,0,0]],["Captain","Lieutenant","Sergeant"]]],0.1],
			[[[["OFrP_AMX30B2","OFrP_AMX30B2","OFrP_AMX30B2","OFrP_AMX30B2"],[[0,5,0],[5,0,0],[9,0,0],[13,0,0]],["Captain","Lieutenant","Lieutenant","Sergeant"]]],0.1],
			[[[["OFrP_10RC","OFrP_10RC","OFrP_10RC"],[[0,5,0],[5,0,0],[9,0,0]],["Captain","Lieutenant","Sergeant"]]],0.1],
			[[[["OFrP_10RCR","OFrP_10RCR","OFrP_10RCR"],[[0,5,0],[5,0,0],[9,0,0]],["Captain","Lieutenant","Sergeant"]]],0.1]
		];
	};
	if(!_woodland)then{
		_west=_west+[
			[[[["OFrP_Caracal"],[],["Lieutenant"]],[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_Grenadier","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_Radio","OFrP_Soldier_Inf_DE_ABL","OFrP_Soldier_Inf_DE_ERYX","OFrP_Soldier_Inf_DE_Medic"]]],0.1],
			[[[["OFrP_Puma_DE_Pirate"],[],["Lieutenant"]]],0.1],

			[[[["OFrP_Soldier_CoS_DE_TeamLeader","OFrP_Soldier_CoS_DE_Medic","OFrP_Soldier_CoS_DE_Maximi","OFrP_Soldier_CoS_DE_Grenadier","OFrP_Soldier_COS_DE_Radio","OFrP_Soldier_CoS_DE"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[-3,0,0],[-5,0,0]],["Lieutenant","Sergeant","Sergeant","Corporal","Corporal","Corporal"]]],0.01],
			[[[["OFrP_Soldier_CoS_DE_TeamLeader","OFrP_Soldier_CoS_DE_Medic","OFrP_Soldier_CoS_DE_Laser","OFrP_Soldier_COS_DE_SniperHK417","OFrP_Soldier_CoS_DE"],[[0,5,0],[-3.5,0,0],[-1.5,0,0],[1.5,0,0],[3.5,0,0]],["Lieutenant","Sergeant","Sergeant","Corporal","Corporal"]]],0.01],

			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_VBL_ANF1_desert","OFrP_VBL_127_desert","OFrP_Soldier_Inf_DE_Grenadier"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],["Sergeant","Sergeant","Corporal","Corporal"]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_VAB_127_desert","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_LRAC89","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_Medic","OFrP_Soldier_Inf_DE_Grenadier"],[[0,5,0],[-3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["Lieutenant","Sergeant","Private","Corporal","Corporal","Private","Corporal","Sergeant","Sergeant"]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_VBCI_vci_desert","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_ABL","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_Medic","OFrP_Soldier_Inf_DE_Grenadier"],[[0,5,0],[-3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["Lieutenant","Sergeant","Private","Corporal","Corporal","Corporal","Private","Sergeant","Sergeant"]]],0.1],

			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_Scout","OFrP_Soldier_Inf_DE_Radio","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_SniperFRF2"],[],["Captain","Lieutenant","Sergeant","Corporal","Corporal"]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_Medic","OFrP_Soldier_Inf_DE_Grenadier","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_ABL","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_LRAC89"],[],["Lieutenant","Sergeant","Sergeant","Corporal","Corporal","Private","Private"]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_Grenadier","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_Radio","OFrP_Soldier_Inf_DE_ABL","OFrP_Soldier_Inf_DE_ERYX","OFrP_Soldier_Inf_DE_Medic"],[],["Lieutenant","Sergeant","Sergeant","Sergeant","Private","Corporal","Private","Corporal","Corporal"]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_ERYX","OFrP_Soldier_Inf_DE_ERYX","OFrP_Soldier_Inf_DE_LRAC89","OFrP_Soldier_Inf_DE_LRAC89"],[],["Sergeant","Sergeant","Corporal","Corporal","Corporal"]]],0.1],

			[[[["OFrP_Leclerc_desert","OFrP_Leclerc_desert","OFrP_Leclerc_desert"],[[0,5,0],[5,0,0],[9,0,0]],["Captain","Lieutenant","Sergeant"]]],0.1],
			[[[["OFrP_10RC_desert","OFrP_10RC_desert","OFrP_10RC_desert"],[[0,5,0],[5,0,0],[9,0,0]],["Captain","Lieutenant","Sergeant"]]],0.1],
			[[[["OFrP_10RCR_desert","OFrP_10RCR_desert","OFrP_10RCR_desert"],[[0,5,0],[5,0,0],[9,0,0]],["Captain","Lieutenant","Sergeant"]]],0.1]
		];
	};
};

// ACEX_PLA
if(configName(LIB_cfgVeh >> "PLA_Soldier_SL") != "")then{
	_guer=_guer+[
		[[[["PLA_Soldier_SL","PLA_Soldier_GL","PLA_Soldier_AR","PLA_Soldier","PLA_Soldier_LAT","PLA_Soldier_Medic","PLA_Soldier","PLA_Soldier_TL","PLA_Soldier_MG"],[],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","SERGEANT","CORPORAL"]]],0.8],
		[[[["PLA_Soldier_TL","PLA_Soldier_GL","PLA_Soldier_MG","PLA_Soldier_LAT","PLA_Soldier_AR","PLA_Soldier_MG","PLA_Soldier_AT","PLA_Soldier_Sniper","PLA_Soldier"],[],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
		[[[["PLA_Soldier_GL","PLA_Soldier_MG","PLA_Soldier_AT","PLA_Soldier_MG","PLA_Soldier_Sniper","PLA_Soldier_LAT"],[],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
		[[[["PLA_Soldier_TL","PLA_Soldier_MG","PLA_Soldier_AT","PLA_Soldier_GL"],[],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.9],
		[[[["PLA_Soldier_TL","PLA_Soldier_AR","PLA_Soldier_GL","PLA_Soldier_LAT"],[],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.9],
		[[[["PLA_Soldier_TL","PLA_Soldier_AT","PLA_Soldier_MG","PLA_Soldier_HAT"],[],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.8],
		[[[["PLA_Soldier_TL","PLA_Soldier_AA","PLA_Soldier_AA","PLA_Soldier_AR"],[],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
		[[[["PLA_SoldierS_Spotter","PLA_SoldierS_Sniper"],[],["SERGEANT","CORPORAL"]]],0.8],
		[[[["PLA_Soldier2","PLA_SoldierM_Marksman","PLA_Soldier_Sniper","PLA_Soldier_AA","PLA_Soldier_HAT","PLA_SoldierS_SniperH"],[],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],

		[[[["PLA_Soldier_SL","BW_MG","BW_MG","BW_MG","PLA_Soldier_MG","PLA_Soldier_Medic","PLA_Soldier_Sniper","PLA_Soldier_AR","PLA_Soldier_Sniper"],[[0,5,0],[-5,0,0],[-5,-7,0],[-5,-14,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.25],
		[[[["PLA_Soldier_SL","DF_Base","PLA_Soldier_GL","PLA_Soldier","PLA_Soldier_LAT","PLA_Soldier_AR","PLA_Soldier_MG","PLA_Soldier_MG","PLA_Soldier","PLA_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
		[[[["PLA_Soldier_AR","ZSL92","PLA_Soldier_GL","PLA_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
		[[[["PLA_Soldier_SL","ZSL92G","PLA_Soldier_MG","PLA_Soldier_GL","PLA_Soldier","PLA_Soldier_AR","PLA_Soldier_Sniper","PLA_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.05],
		[[[["PLA_Soldier_SL","ZSL92C","PLA_Soldier_MG","PLA_Soldier_GL","PLA_Soldier","PLA_Soldier_AR","PLA_Soldier_Sniper","PLA_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.05],

		[[[["fromz_ztz99","fromz_ztz99","fromz_ztz99","fromz_ztz99"],[[0,10,0],[5,0,0],[5,10,0],[5,20,0]],["SERGEANT","CORPORAL","SERGEANT","CORPORAL"]]],0.01],

		[[[["oh2_z9a"],[],["SERGEANT"]],[["PLA_Soldier_GL","PLA_Soldier_MG","PLA_Soldier_AT","PLA_Soldier_MG","PLA_Soldier_Sniper","PLA_Soldier_LAT"]]],0.1],
		[[[["oh2_z9w"],[],["SERGEANT"]]],0.1]
	];
};

// @NC
if(configName(LIB_cfgVeh >> "nac_soldier_leader") != "")then{
	_guer=_guer+[
		[[[["nac_soldier_leader","nac_soldier_er7_att","nac_soldier_er7","nac_soldier_mg","nac_soldier_sniper2","nac_soldier_LAT","nac_soldier_gl","nac_soldier_medik","nac_soldier_2"
			], [],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.3]
	];
};

// @fdf_mod
if(configName(LIB_cfgVeh >> "FDF_M05_FRDF_NCO") != "")then{
	_guer=_guer+[
		[[[["FDF_M05_FRDF_NCO","FDF_M05_FRDF_MG","FDF_M05_FRDF_MG_Asst","FDF_M05_FRDF_Soldier_AT","FDF_M05_FRDF_Soldier_AT","FDF_M05_FRDF_Soldier","FDF_M05_FRDF_Asst_Squad_Leader"],
			[],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL"]]],0.3],
		[[[["FDF_M05_FRDF_Soldier_HeavyAT","FDF_M05_FRDF_Soldier_HeavyAT","FDF_M05_FRDF_Soldier_HeavyAT"],
			[],["CORPORAL","PRIVATE","PRIVATE"]]],0.2],
		[[[["FDF_Sniper","FDF_Spotter"],
			[],["CORPORAL","PRIVATE"]]],0.05],
		[[[["FDF_SJ_M05","FDF_SJ_M05","FDF_SJ_M05","FDF_SJ_M05"],
			[],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.02],
		[[[["FDF_M05_FRDF_NCO","FDF_AMV_M2","FDF_M05_FRDF_MG","FDF_M05_FRDF_MG_Asst","FDF_M05_FRDF_Soldier_AT","FDF_M05_FRDF_Soldier_AT","FDF_M05_FRDF_Soldier","FDF_M05_FRDF_Asst_Squad_Leader"],
			[[0,0],[5,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
			["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL"]]],0.3],
		[[[["FDF_M05_Jaeger_NCO","FDF_BMP2","FDF_M05_Jaeger_MG","FDF_M05_Jaeger_MG_Asst","FDF_M05_Jaeger_HeavyAT","FDF_M05_Jaeger_HeavyAT","FDF_M05_Jaeger_Marksman","FDF_M05_Jaeger_Asst_Squad_Leader"],
			[[0,0],[5,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
			["LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL"]]],0.3],
		[[[["FDF_leopard2a4","FDF_leopard2a4","FDF_leopard2a4","FDF_leopard2a4"],
			[[0,0],[5,0],[0,5],[5,5]],
			["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.2],
		[[[["FDF_T72M1","FDF_T72M1","FDF_T72M1"],
			[[0,0],[5,0],[0,5]],
			["LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.2],
		[[[["FDF_NH90_MG3"],
			[],
			["LIEUTENANT"]],[["FDF_M05_FRDF_NCO","FDF_M05_FRDF_MG","FDF_M05_FRDF_MG_Asst","FDF_M05_FRDF_Soldier_AT","FDF_M05_FRDF_Soldier_AT","FDF_M05_FRDF_Soldier","FDF_M05_FRDF_Asst_Squad_Leader"]]],0.1]
	];
};

/* для тестирования групп
_west=[
];
_east=[
];
_guer=[
];
*/
#endif

AllGroupsWest=_west;
AllGroupsEast=_east;
AllGroupsGuer=_guer;

diag_log format ["Log: [config_groups.sqf] west %1", count AllGroupsWest];
diag_log format ["Log: [config_groups.sqf] east %1", count AllGroupsEast];
diag_log format ["Log: [config_groups.sqf] guer %1", count AllGroupsGuer];
diag_log format ["Log: [config_groups.sqf] end %1", time];
