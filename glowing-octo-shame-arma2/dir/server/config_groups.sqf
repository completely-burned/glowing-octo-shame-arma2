#define __A2OA__

/*
 * TODO: Разделить на классы, например день/ночь.
 * TODO: Нужна функция рекурсивно ищущая и меняющая
 * в массиве указатели в разные копии на указатели в одну "копию",
 * и последующим удалением других копий данных.
 * 
 *
 * Не рукомендуется забивать грузовики до отказа
 * иначе боты дольше тупят.
 * 
 * 	rankId
 * 		0 - Private
 * 		1 - Corporal
 * 		2 - Sergeant
 * 		3 - Lieutenant
 * 		4 - Captain
 * 		5 - Major
 * 		6 - Colonel
 * 
 */


private ["_west","_east","_guer","_woodland","_deserted","_tmp","_mod_acr",
	"_f_multi_bis_cz","_f_multi_bis_tk","_f_multi_bis_tk_gue","_shop","_landing",
	"_r0","_r1","_r2","_r3","_r4","_r5","_r6","_westN","_eastN","_guerN",
	"_s1","_s2","_mg","_mg2","_gl","_at","_westD","_eastD","_guerD","_copyRef",
	"_multiplier_MTP","_multiplier_DDPM","_multiplier_W","_cfgVeh","_b","_n",
	"_westPatrol","_eastPatrol","_guerPatrol","_IslandType","_t","_d",
	"_westAttack","_eastAttack","_guerAttack"];
_westPatrol=[];_eastPatrol=[];_guerPatrol=[];
_westAttack=[];_eastAttack=[];_guerAttack=[];
_west=[];_east=[];_guer=[];
// Ночь.
_westN=[];_eastN=[];_guerN=[];
// День.
_westD=[];_eastD=[];_guerD=[];
_r0 = 0;
_r1 = 1;
_r2 = 2;
_r3 = 3;
_r4 = 4;
_r5 = 5;
_r6 = 6;

// performance
_cfgVeh = LIB_cfgVeh;
_IslandType = gosa_IslandType;
_t = (_IslandType select 0);
_d = (_IslandType select 1);

_woodland=false; _deserted=false;
if(toLower worldname in ["zargabad", "takistan", "desert_e", "shapur_baf", "mountains_acr"])then{_deserted=true};
if(toLower worldname in ["chernarus", "utes", "fdf_isle1_a",  "woodland_acr","namalsk","bootcamp_acr"])then{_woodland=true};
_shop = missionNamespace getVariable "gosa_shop";
// Десант. 23,24,34
_landing = missionNamespace getVariable "gosa_landing";

_copyRef = availableVehicles;

// A2
if(LIB_a2Avail)then{

	// INS
	if(true)then{
		_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"INS");
		if((!_deserted && gosa_IslandType select 1 >= 1990 && _tmp == -1) or _tmp > 0)then{
			_mg2 = "INS_Soldier_AR";
			_mg = "INS_Soldier_MG";
			_gl = "INS_Soldier_GL";
			_at = "INS_Soldier_AT";
			_s2 = "INS_Soldier_2";
			_s1 = "INS_Soldier_1";
			_east=_east+[

				// INS_TankSection !=
				// звания изменены
				[[[["T72_INS","T72_INS"],[[0,10,0],[5,0,0]],[_r3,_r3]]],0.07],

				// INS_InfSquad !=
				// rarityGroup = 0.85; изменен из-за отряда с Ins_Soldier_Medic
				[[[["INS_Soldier_CO",
					_mg2,_gl,
					_at,_s2,
					_mg2,_s1,
					_s2],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					[_r2,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0,
					_r0]]],0.55],
				[[[["INS_Soldier_CO",
					_mg2,_gl,
					_at,_s2,
					_mg2,_s1,
					_s2,"Ins_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					[_r2,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0,
					_r0,_r0]]],0.30],
				// INS_InfSquad_Weapons !=
				// rarityGroup = 0.6; изменен из-за отряда с Ins_Soldier_Medic
				[[[["INS_Soldier_CO",
					_mg,_mg,
					_at,_at,
					_mg2,_mg2,
					_s2],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					[_r2,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0,
					_r0]]],0.4],
				[[[["INS_Soldier_CO",
					_mg,_mg,
					_at,_at,
					_mg2,_mg2,
					_s2,"Ins_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					[_r2,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0,
					_r0,_r0]]],0.2],
				// INS_InfSection_AT
				[[[[_at,_at,_s1],[[0,5,0],[3,0,0],[5,0,0]],
					[_r1,
					_r0,_r0]]],0.25],
				// INS_InfSection_AA
				[[[["INS_Soldier_AA","INS_Soldier_AA","INS_Soldier_AA"],[[0,5,0],[3,0,0],[5,0,0]],
					[_r1,_r0,_r0]]],0.1],
				// INS_SniperTeam !=
				// rarityGroup = 0.2; изменен из-за отряда с Ins_Soldier_Sab
				[[[["INS_Soldier_Sniper","INS_Soldier_Sniper",_s1],[[0,5,0],[3,0,0],[5,0,0]],
					[_r1,_r1,_r0]]],0.1],
				[[[["INS_Soldier_Sniper","INS_Soldier_Sniper","Ins_Soldier_Sab"],[[0,5,0],[3,0,0],[5,0,0]],
					[_r1,_r1,_r0]]],0.1],
				// INS_MilitiaSquad
				[[[["INS_Worker2",
					"INS_Woodlander3","INS_Villager3",
					"INS_Woodlander2","INS_Woodlander1",
					"INS_Villager4"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r2,
					_r1,_r1,
					_r0,_r0,
					_r0]]],0.5],

				// INS_MotInfSquad
				// rarityGroup = 0.25; изменен из-за отряда с Ural_INS
				[[[[	"INS_Soldier_CO",
						"UralOpen_INS",_mg,
						_at,_mg2,
						_s2,_gl,
						_s1,_mg,
						_at,_s1,
						_s1,_s2
					],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					[		_r2,
						_r2,_r1,
						_r1,_r1,
						_r1,_r0,
						_r0,_r0,
						_r0,_r0,
						_r0,_r0
					]]],0.20],
				[[[[	"INS_Soldier_CO",
						"Ural_INS",_mg,
						_at,_mg2,
						_s2,_gl,
						_s1,_mg,
						_at,_s1,
						_s1,_s2
					],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					[		_r2,
						_r2,_r1,
						_r1,_r1,
						_r1,_r0,
						_r0,_r0,
						_r0,_r0,
						_r0,_r0
					]]],0.05],

				// INS_MotInfSection
				[[[[_gl,
					"Offroad_DSHKM_INS","UAZ_SPG9_INS",
					"Pickup_PK_INS",_s1,
					_mg,_gl],[[0,5,0],[-5,0,0],[-5,-7,0],[-5,-14,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,
					_r1,_r1,
					_r1,_r0,
					_r0,_r0]]],0.4],

				// INS_MechInfSquad !=
				// звания изменены
				[[[["INS_Soldier_CO",
					"BMP2_INS",_mg,
					_at,_s2,
					_gl,_s1,
					_mg2],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					[_r3,
					_r3,_r1,
					_r1,_r1,
					_r1,_r0,
					_r0]]],0.25],

				// INS_MechInfSection
				[[[["INS_Soldier_CO",
					"BRDM2_INS","BRDM2_INS",
					_mg,_mg2,
					_gl,_s1,
					_at,_s2],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					[_r2,
					_r2,_r2,
					_r1,_r1,
					_r1,_r1,
					_r0,_r0]]],0.25],

				// INS_MechInfSection_AT
				[[[[_gl,
					"BRDM2_ATGM_INS","BRDM2_ATGM_INS",
					_at],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],
					[_r2,
					_r1,_r1,
					_r0]]],0.2],

				// TODO: нужно сбалансировать
				[[[["Ins_Soldier_AA","Ins_Soldier_AA","Ins_Soldier_AA","Ural_ZU23_INS"], [[10,10],[10,0],[0,10],[0,0]],
					[_r2,_r1,_r1,_r1]]],0.01],
				[[[[_gl,"UAZ_INS",_s1,_mg,_s1], [[0,0],[5,0],[0,0],[0,0],[0,0]],
					[_r1,_r1,_r0,_r0,_r0]]],0.01],
				[[[[_gl,"UAZ_MG_INS"], [[0,0],[5,0]],
					[_r1,_r0]]],0.01],
				[[[[_gl,"Ins_Soldier_Sapper",_at], [],
					[_r2,_r1,_r0]]],0.01],

				[[[["Su25_Ins"], [],[_r4]]],0.01],

				[[[["UralReammo_INS"], [],[_r0]]],0.01],
				[[[["UralRefuel_INS"], [],[_r0]]],0.01],
				[[[["UralRepair_INS"], [],[_r0],[["Ins_Soldier_Sapper"]]]],0.01],
				[[[["BMP2_Ambul_INS"], [],[_r0],[["Ins_Soldier_Medic"]]]],0.05],

				//StaticWeapon
				[[[["AGS_Ins"], [],[_r0]]],0.01],
				[[[["DSHKM_Ins"], [],[_r0]]],0.01],
				[[[["DSHkM_Mini_TriPod"], [],[_r0]]],0.01],
				[[[["ZU23_Ins"], [],[_r0]]],0.01],
				[[[["SearchLight_INS"], [],[_r0]]],0.01],
				[[[["SPG9_Ins"], [],[_r0]]],0.01]

			];

			if (_landing in [1,3,23,34]) then {
				_east=_east+[
					[[[["Mi17_Ins"],[],[_r4]]
						],0.03],
					[[[["Mi17_Ins"],[],[_r4]],
						[["INS_Soldier_CO",
						_mg2,_gl,
						_at,_s2,
						_mg2,_s1,
						_s2]],
						[["INS_Soldier_CO",
						_mg,_mg,
						_at,_at,
						_mg2,_mg2,
						_s2]]
						],0.02]
				];
			}else{
				_east=_east+[
					// INS_Mi8Squadron !=
					// rarityGroup = 0.05;
					[[[["Mi17_Ins"],[],[_r4]]],0.05]
				];
			};

			if(acex_ru_Avail)then{
				_east=_east+[
					[[[["INS_Soldier_CO",
						"ACE_BTR70_INS",_mg,
						_at,_s2,
						_gl,_s1,
						_mg2],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
						[_r2,
						_r2,_r1,
						_r1,_r1,
						_r1,_r0,
						_r0]]],0.25],
					/*
					// TODO: Исправить GUE_
					[[[["ACE_Mi24_D_INS"], [],[4]],[["GUE_Soldier_CO",_gl,_mg,_at,_mg2,_mg,_at,_s2]]],0.01],
					*/
					[[[["INS_Soldier_CO",
						"ACE_BMD_2_INS",_mg,
						_at,_s2,
						_gl,_s1,
						_mg2],[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,
						_r3,_r1,
						_r1,_r1,
						_r1,_r0,
						_r0]
					]],0.01],
					[[[["ZSU_INS","ACE_BRDM2_SA9_INS"], [[0,0],[10,0]],[4,3]]],0.01]
				];
			}else{
				_east=_east+[
					[[[["ZSU_INS"], [[0,0],[0,10]],[_r3,_r3]]],0.5]
				];
			};
		};
	};

	// CDF
	if(true)then{
		_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"CDF");
		if((!_deserted && gosa_IslandType select 1 >= 1990 && _tmp == -1) or _tmp > 0)then{
			_mg2 = "CDF_Soldier_AR";
			_mg = "CDF_Soldier_MG";
			_gl = "CDF_Soldier_GL";
			_at = "CDF_Soldier_RPG";
			_s2 = "CDF_Soldier_Marksman";
			_s1 = "CDF_Soldier";
			_west=_west+[
				// CDF_MotInfSquad !=
				// rarityGroup = 0.4; изменен из-за отряда с UralOpen_CDF
				[[[[	"CDF_Soldier_TL",
						"Ural_CDF",_mg,
						_at,_gl,
						_s1,_mg,
						_gl,_at,
						_s1,"CDF_Soldier_Medic"
					],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					[		_r3,
						_r2,_r2,
						_r1,_r1,
						_r1,_r1,
						_r0,_r0,
						_r0,_r0
				]]],0.3],
				[[[[	"CDF_Soldier_TL",
						"UralOpen_CDF",_mg,
						_at,_gl,
						_s1,_mg,
						_gl,_at,
						_s1,"CDF_Soldier_Medic"
					],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					[		_r3,
						_r2,_r2,
						_r1,_r1,
						_r1,_r1,
						_r0,_r0,
						_r0,_r0
				]]],0.1],
				// CDF_MotInfSection
				[[[[_gl,
					"UAZ_CDF",_at],[[0,5,0],[-5,0,0],[3,0,0]],
					[_r2,
					_r1,_r0]]],0.15],
				// CDF_MotInfSection_Weapons
				[[[["CDF_Soldier_TL",
					"UAZ_AGS30_CDF","UAZ_AGS30_CDF",
					_mg],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],
					[_r2,
					_r1,_r1,
					_r0]]],0.2],
				// CDF_MechInfSquad !=
				[[[["CDF_Soldier_TL",
					"BMP2_CDF",_mg,
					_mg,_s2,
					_at,_gl,
					_s1],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					[_r3,
					_r3,_r2,
					_r1,_r1,
					_r0,_r0,
					_r0]]],0.9],
				// CDF_MechReconSection
				[[[["CDF_Soldier_TL",
					"BRDM2_CDF",_mg,
					_at],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
					[_r2,
					_r2,_r2,
					_r1]]],0.5],
				// CDF_MechATSection
				[[[["CDF_Soldier_TL",
					"BRDM2_ATGM_CDF",_mg,
					_at],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
					[_r2,
					_r2,_r2,
					_r1]]],0.5],
				// CDF_TankPlatoon !=
				[[[["T72_CDF",
					"T72_CDF","T72_CDF"],[[0,10,0],[5,0,0],[10,0,0]],
					[_r4,
					_r3,_r3]]],0.25],
				// CDF_InfSquad
				[[[["CDF_Soldier_TL",
					_mg,_at,
					_gl,_s1,
					_mg,_gl,
					_at,_s1,
					"CDF_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
					[_r3,
					_r2,_r1,
					_r1,_r1,
					_r1,_r0,
					_r0,_r0,
					_r0]]],0.6],
				// CDF_InfSquad_Weapons
				[[[["CDF_Soldier_TL",
					_mg2,_mg,
					_mg,_at,
					_at,_gl,
					_s2],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],
					[_r3,
					_r2,_r1,
					_r1,_r1,
					_r1,_r0,
					_r0]]],0.6],
				// CDF_InfSection_AT
				[[[["CDF_Soldier_TL",
					_at,_at,
					_mg2],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,
					_r1,_r1,
					_r0]]],0.2],
				// CDF_InfSection_AA
				[[[["CDF_Soldier_TL",
					"CDF_Soldier_Strela","CDF_Soldier_Strela",
					_mg],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,
					_r1,_r1,
					_r0]]],0.1],
				// CDF_InfSection_MG
				[[[[_mg,
					_mg,_mg2,
					_at],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,
					_r1,_r1,
					_r0]]],0.1],
				// CDF_InfSection_Patrol
				[[[["CDF_Soldier_Militia",
					"CDF_Soldier_Militia","CDF_Soldier_Militia",
					"CDF_Soldier_Militia"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,
					_r1,_r0,
					_r0]]],0.3],
				// CDF_SniperTeam
				[[[["CDF_Soldier_Sniper","CDF_Soldier_Spotter"],[],[_r2,_r1]]],0.05],

				// TODO: нужно сбалансировать
				[[[["Ural_ZU23_CDF","CDF_Soldier_Strela","CDF_Soldier_Strela","CDF_Soldier_Strela"], [[10,10],[10,0],[0,10],[0,0]],
					[_r2,_r1,_r1,_r1]]],0.01],
				[[[[_gl,"CDF_Soldier_Engineer",_at], [],
					[_r2,_r1,_r0]]],0.01],
				[[[[_gl,"UAZ_MG_CDF"], [[0,0],[5,0]],
					[_r0,_r0]]],0.01],

				[[[["Su25_CDF"], [],[_r4]]],0.01],
				[[[["Pchela1T_CDF"], [],[_r4]]],0.01],

				[[[["UralReammo_CDF"], [],[_r0]]],0.01],
				[[[["UralRefuel_CDF"], [],[_r0]]],0.01],
				[[[["UralRepair_CDF"], [],[_r0],[["CDF_Soldier_Engineer"]]]],0.01],
				[[[["BMP2_Ambul_CDF"], [],[_r0],[["CDF_Soldier_Medic"]]]],0.05],

				//StaticWeapon
				[[[["DSHKM_CDF"],[],[_r0]]],0.01],
				[[[["DSHkM_Mini_TriPod_CDF"],[],[_r0]]],0.01],
				[[[["AGS_CDF"],[],[_r0]]],0.01],
				[[[["ZU23_CDF"],[],[_r0]]],0.01],
				[[[["SPG9_CDF"],[],[_r0]]],0.01],
				[[[["SearchLight_CDF"],[],[_r0]]],0.01]
			];

			if (_landing in [1,3,23,34]) then {
				_west=_west+[
					[[[["Mi24_D"],[],[_r4]],
						[["CDF_Soldier_TL",_mg2,_mg,_mg,_at,_at,_gl,_s2]]
						],0.05],
					[[[["Mi24_D","Mi24_D"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.05],
					[[[["Mi17_CDF"],[],[_r4]],
						[["CDF_Soldier_TL",_mg,_at,_gl,_s1,_mg,_gl,_at,_s1,"CDF_Soldier_Medic"]]
						],0.15],
					[[[["Mi17_CDF","Mi17_CDF"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.15]
				];
			} else {
				_west=_west+[
					// CDF_Mi24DSquadron !=
					// rarityGroup = 0.1;
					[[[["Mi24_D","Mi24_D"],[[0,15,0],[15,0,0]],[_r4,_r3]]],0.1],
					// CDF_Mi8Squadron
					// rarityGroup = 0.3;
					[[[["Mi17_CDF","Mi17_CDF"],[[0,15,0],[15,0,0]],[_r4,_r3]]],0.3]
				];
			};

			if(acex_ru_Avail)then{
				_west=_west+[
					[[[["CDF_Soldier_TL",
						"ACE_BTR70_CDF",_mg,
						_mg,_s2,
						_at,_gl,
						_s1],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
						[_r3,
						_r3,_r2,
						_r1,_r1,
						_r0,_r0,
						_r0]]],0.9],

					[[[["ACE_T72B_CDF",
						"ACE_T72B_CDF","ACE_T72B_CDF"],[[0,10,0],[7,0,0],[-7,0,0]],
						[_r4,
						_r3,_r3]]],0.25],
					[[[["CDF_Soldier_TL",
						_mg,_s2,
						_at,_gl,
						"ACE_BMD_1_CDF"],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[10,10]],
						[_r2,
						_r2,_r1,
						_r1,_r0,
						_r0,_r2]]],0.01],

					[[[["CDF_Soldier_TL",
						_mg,_mg,
						_s2,_at,
						_gl,_s1,
						"ACE_BMD_2_CDF"],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[10,10]],
						[_r2,
						_r2,_r1,
						_r1,_r0,
						_r0,_r0,
						_r2]]],0.01],

					[[[["ZSU_CDF","ACE_BRDM2_SA9_CDF"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01]
				];

				[[[["ACE_Mi24_V_CDF"], [],[_r4]]],0.01],
				[[[["ACE_Mi24_V_UPK23_CDF"], [],[_r4]]],0.01],
				if (_landing in [1,3,23,34]) then {
					_west=_west+[
						[[[["ACE_Mi24_V_CDF"], [],[_r4]],
							[["CDF_Soldier_TL",_mg2,_mg,_mg,_at,_at,_gl,_s2]]
							],0.01],
						[[[["ACE_Mi24_V_UPK23_CDF"], [],[_r4]],
							[["CDF_Soldier_TL",_mg2,_mg,_mg,_at,_at,_gl,_s2]]
							],0.01]
					];
				};
			}else{
				_west=_west+[
					[[[["ZSU_CDF"], [],[_r3,_r3]]],0.5]
				];
			};
		};
	};

	// GUE
	if(true)then{
		_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"GUE");
		if((!_deserted && gosa_IslandType select 1 >= 1990 && _tmp == -1) or _tmp > 0)then{
			_mg2 = "GUE_Soldier_AR";
			_mg = "GUE_Soldier_MG";
			_gl = "GUE_Soldier_GL";
			_at = "GUE_Soldier_AT";
			_s2 = "GUE_Soldier_2";
			_s1 = "GUE_Soldier_1";
			_guer=_guer+[
				// GUE_InfSquad !=
				// временно добавлен медик
				[[[["GUE_Soldier_CO",
					_gl,_mg2,
					_s1,"GUE_Soldier_3",
					_gl,_s2,
					"GUE_Soldier_Medic"],[],
					[_r2,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0,
					_r0]]],0.8],
				// GUE_InfSquad_Assault
				// временно добавлен медик
				[[[["GUE_Soldier_CO",
					_gl,_mg,
					_at,_mg2,
					_mg,_at,
					_s2,_s1,
					"GUE_Soldier_Medic"],[],
					[_r2,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0,
					_r0,_r0,
					_r0]]],0.6],
				// GUE_InfSquad_Weapons
				[[[[_s2,
					_mg,_at,
					_mg,_gl,
					_at],[],
					[_r2,
					_r1,_r1,
					_r0,_r0,
					_r0]]],0.9],
				// GUE_InfTeam_1 !=
				// rarityGroup = 1.0; изменен по неизвестной причине
				[[[[_s2,
					_mg,_at,
					_gl],[],
					[_r1,
					_r1,_r0,
					_r0]]],0.9],
				// GUE_InfTeam_2
				// rarityGroup = 1.0; изменен по неизвестной причине
				[[[[_s1,
					_mg2,_gl,
					_s2],[],
					[_r1,
					_r1,_r0,
					_r0]]],0.9],
				// GUE_InfTeam_AT
				[[[[_at,
					_at,_mg2],[],
					[_r1,
					_r1,_r0]]],0.8],
				// GUE_GrpInf_TeamAA
				[[[["GUE_Soldier_CO",
					"GUE_Soldier_AA","GUE_Soldier_AA",
					_mg2],[],
					[_r1,
					_r1,_r0,
					_r0]]],0.2],
				// GUE_GrpInf_TeamSniper
				[[[["GUE_Soldier_Sniper","GUE_Soldier_Scout"],[],
					[_r2,_r1]]],0.8],
				// GUE_MilitiaSquad
				[[[["GUE_Worker2",
					"GUE_Woodlander3","GUE_Villager3",
					"GUE_Woodlander2","GUE_Woodlander1",
					"GUE_Villager4"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r2,
					_r1,_r1,
					_r0,_r0,
					_r0]]],0.5],
				// GUE_MotInfSection
				[[[["GUE_Soldier_CO",
					"Offroad_DSHKM_Gue","Offroad_SPG9_Gue",
					"Pickup_PK_GUE",_mg,
					"GUE_Soldier_3","GUE_Soldier_Sniper",
					_mg2,_s2],[[0,5,0],[-5,0,0],[-5,-7,0],[-5,-14,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r2,
					_r1,_r1,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0]]],0.25],
				// GUE_MotInfSquad
				[[[["GUE_Soldier_CO",
					"V3S_GUE",_gl,
					_at,_s1,
					_mg2,_mg,
					_mg,_s2,
					_at],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					[_r2,
					_r1,_r1,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0,
					_r0]]],0.2],
				// GUE_MechInfSection
				[[[[_mg2,
					"BRDM2_GUE",_gl,
					_s1],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
					[_r1,
					_r1,_r0,
					_r0]]],0.1],

				// FIXME: Что с рангами?
				[[[["GUE_Soldier_CO",
					"BTR60_Gue_CP",_mg,
					_gl,"GUE_Soldier_3",
					_at,_at,
					_mg2,"GUE_Soldier_Sniper"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					[_r3,
					_r3,_r2,
					_r1,_r1,
					_r0,_r2,
					_r1,_r1]]],0.01],
				// GUE_MechInfSquad !=
				// звания изменены
				[[[["GUE_Soldier_CO",
					"BMP2_GUE",_mg,
					_gl,"GUE_Soldier_3",
					_mg2,"GUE_Soldier_Sniper",
					_at],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					[_r3,
					_r3,_r1,
					_r1,_r1,
					_r0,_r0,
					_r0]]],0.05],

				[[[["GUE_Soldier_CO",
					"BMP1_INS_CP",_mg,
					_gl,"GUE_Soldier_3",
					_mg2,"GUE_Soldier_Sniper",
					_at
					],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					[_r3,
					_r3,_r1,
					_r1,_r1,
					_r0,_r0,
					_r0]]],0.01],
				// GUE_TankSection !=
				// звания изменены
				[[[["T72_GUE","T72_GUE"],[[0,10,0],[5,0,0]],
					[_r3,_r3]]],0.01],

					// TODO: нужно сбалансировать
				[[[["Ural_ZU23_Gue","GUE_Soldier_AA","GUE_Soldier_AA","GUE_Soldier_AA"], [[10,0],[0,0],[0,0],[0,0]],
					[_r2,_r1,_r1,_r1]]],0.01],
				[[[["T34"], [[0,0],[5,0]],
					[_r3,_r3]]],0.01],
				[[[["ZSU_Gue_CP"], [[0,0],[5,0]],
					[_r3,_r3]]],0.01],

				[[[["WarfareReammoTruck_Gue"], [],[_r0]]],0.01],
				[[[["WarfareRepairTruck_Gue"], [],[_r0]]],0.01],

				//StaticWeapon
				[[[["DSHKM_Gue"],[],[_r0]]],0.01],
				[[[["ZU23_Gue"],[],[_r0]]],0.01],
				[[[["SearchLight_Gue"],[],[_r0]]],0.01],
				[[[["SPG9_Gue"],[],[_r0]]],0.01]

			];
			if(acex_ru_Avail)then{
				_guer=_guer+[
					[[[["GUE_Soldier_CO",
						"ACE_BTR70_GUE",_mg,
						_gl,"GUE_Soldier_3",
						_mg2,"GUE_Soldier_Sniper",
						_at],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
						[_r3,
						_r3,_r1,
						_r1,_r1,
						_r0,_r0,
						_r0]]],0.05]
				];
			}else{
				_guer=_guer+[
				];
			};
		};
	};

	// USMC
	// TODO: FRTeam другой камуфляж.
	_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"USMC");
	if(_tmp > 0 or (gosa_IslandType select 1 >= 1990 && _tmp == -1))then{
		_mg2 = "USMC_Soldier_AR";
		_mg = "USMC_Soldier_MG";
		_gl = "USMC_Soldier_LAT";
		_at = "USMC_Soldier_AT";
		_s2 = "USMC_Soldier_TL";
		_s1 = "USMC_Soldier";

		// Можно добавить за сторону игроков отряды которые плохо используются ии.
		// Маршруты не готовы поэтому false.
		if (false && west in gosa_friendlyside && _shop == 0) then {
			_west=_west+[
				[[[["MLRS","MLRS"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.01]
			];
		};

		//-- Юниты обычные.
		if(!_deserted or !acex_usnavy_Avail)then{
			_west=_west+[
				// USMC_InfSquad
				[[[["USMC_Soldier_SL",
					_s2,_mg2,
					_gl,_s1,
					_s2,_mg2,
					_gl,_s1,
					_s2,_mg2,
					_gl,_s1],[],
					[_r3,
					_r2,_r1,
					_r1,_r0,
					_r2,_r1,
					_r1,_r0,
					_r2,_r1,
					_r1,_r0]]],0.5],
				// USMC_FireTeam
				[[[[_s2,
					_mg2,_gl,
					_s1],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,
					_r1,_r1,
					_r0]]],0.05],
				// USMC_FireTeam_MG
				[[[[_s2,
					_mg,_mg2,
					_gl],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,
					_r1,_r1,
					_r0]]],0.1],
				// USMC_FireTeam_AT
				[[[[_s2,
					_mg2,_at,
					_gl],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,
					_r1,_r1,
					_r0]]],0.1],
				// USMC_FireTeam_Support
				[[[[_s2,
					_mg2,_gl,
					"USMC_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,
					_r1,_r1,
					_r1]]],0.05],
				// USMC_HeavyATTeam
				[[[["USMC_Soldier_HAT",_at,_gl],[[0,5,0],[3,0,0],[5,0,0]],
					[_r2,_r1,_r1]]],0.15],
				// USMC_SniperTeam
				[[[["USMC_SoldierS_Sniper","USMC_SoldierS_Spotter"],[[0,5,0],[3,0,0]],
					[_r2,_r2]]],0.05],

				// USMC_FRTeam
				[[[["FR_TL",
					"FR_AR","FR_GL",
					"FR_Marksman","FR_R",
					"FR_Corpsman"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r3,
					_r2,_r2,
					_r2,_r2,
					_r2]]],0.01],

				// USMC_MotInfSection !=
				[[[[_s2,
					"HMMWV_M2","HMMWV_Mk19",
					_mg2,_at,
					_mg2,_gl,
					_s1],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r2,
					_r1,_r1,
					_r1,_r0,
					_r0,_r1,
					_r1]]],0.2],
				// USMC_MotInfSection_AT
				[[[[_s2,
					"HMMWV_TOW","HMMWV_TOW",
					_mg2],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],
					[_r2,
					_r2,_r1,
					_r0]]],0.15],

				// USMC_MechInfSquad !=
				[[[["USMC_Soldier_SL",
					"AAV",_s2,
					_mg2,_gl,
					_s1,_s2,
					_mg2,_gl,
					_s1,_s2,
					_mg2,_gl,
					_s1],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],
					[_r3,
					_r3,_r2,
					_r1,_r1,
					_r0,_r2,
					_r1,_r1,
					_r0,_r2,
					_r1,_r1,
					_r0]]],0.9],
				// USMC_MechReconSection !=
				[[[[_s2,
					"LAV25",_mg,
					_mg2,_at,
					_gl,_s1],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r3,
					_r3,_r2,
					_r1,_r1,
					_r0,_r0]]],0.6],

				// USMC_AH1ZSquadron !=
				// rarityGroup = 0.3; изменен вероятно из-за звена UH1Y
				[[[["AH1Z","AH1Z"],[[0,15,0],[15,0,0]],
					[_r4,_r3]]],0.4],
				// USMC_MQ9Squadron
				[[[["MQ9PredatorB"],[[0,0,0]],[_r4]]],0.3],
				// USMC_F35Squadron
				[[[["F35B","F35B"],[[0,20,0],[20,0,0]],
					[_r4,_r3]]],0.6],
				// USMC_AV8BFighterSquadron
				[[[["AV8B2","AV8B2"],[[0,20,0],[20,0,0]],
					[_r4,_r3]]],0.3],
				// USMC_AV8BBomberSquadron
				[[[["AV8B","AV8B"],[[0,20,0],[20,0,0]],
					[_r4,_r3]]],0.5],

				// TODO: нужно сбалансировать
					[[[["HMMWV_Avenger"], [[0,5],[-5,0],[-5,-7],[3,0]],
						[_r2,_r2,_r1,_r0]]],0.8],
					[[[[_s2,"USMC_Soldier_AA","USMC_Soldier_AA"], [],
						[_r2,_r1,_r1]]],0.01],

					// LaserDesignator
					[[[["USMC_SoldierS","USMC_SoldierM_Marksman"], [],
						[_r2,_r2]]],0.01],

					[[[["USMC_SoldierS_Sniper","USMC_SoldierS_SniperH","USMC_SoldierS_Spotter"], [],
						[_r2,_r2,_r1]]],0.01],
					[[[["USMC_Soldier_GL","USMC_SoldierS_Engineer","USMC_Soldier2"], [],
						[_r2,_r1,_r0,_r0]]],0.01],
					[[[["FR_TL",
						"FR_AR","FR_GL",
						"FR_R","FR_AC",
						"FR_Sapper","FR_Marksman",
						"FR_Corpsman"], [],
						[_r3,
						_r2,_r2,
						_r2,_r2,
						_r2,_r2,
						_r2]]],0.01],
					[[[["FR_Assault_GL",
						"FR_Assault_GL","FR_Assault_R",
						"FR_Assault_R"], [],
						[_r3,_r3,_r3,_r2,_r2,_r2]]],0.01],
					// HMMWV_Armored и гранатометчики в одном отряде плохо сочитаются
					[[[[_s2,
						"HMMWV_Armored",_at,
						_gl], [[0,0],[5,0],[0,0],[0,0]],
						[_r2,
						_r0,_r1,
						_r1]]],0.01],

					// MTVR
					[[[["USMC_Soldier_SL",
						"MTVR",_s2,
						_mg2,_gl,
						_s1,_s2,
						_mg2,_gl,
						"USMC_Soldier_GL",_s2,
						_mg2,_gl], [[0,0],[5,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,
						_r0,_r2,
						_r1,_r1,
						_r0,_r2,
						_r1,_r1,
						_r0,_r2,
						_r1,_r1]]],0.01],

				[[[["AH64D"], [],[_r4]]],0.01],
				[[[["A10"], [[-10,0],[10,0]],
					[_r4,_r3]]],0.01],

				// TODO: нужно сбалансировать

				[[[["MtvrReammo"], [],[_r0]]],0.01],
				[[[["MtvrRefuel"], [],[_r0]]],0.01],
				[[[["MtvrRepair"], [],[_r0],[["USMC_SoldierS_Engineer"]]]],0.01],
				[[[["HMMWV_Ambulance"], [],[_r0],[["USMC_Soldier_Medic"]]]],0.05],

				//StaticWeapon
				[[[["M2StaticMG"],[],[_r0]]],0.01],
				[[[["M2HD_mini_TriPod"],[],[_r0]]],0.01],
				[[[["MK19_TriPod"],[],[_r0]]],0.01],
				[[[["Stinger_Pod"],[],[_r0]]],0.01],
				[[[["TOW_TriPod"],[],[_r0]]],0.01],
				[[[["SearchLight"],[],[_r0]]],0.01]
			];
			if (_landing in [1,4,24,34]) then {
				_west=_west+[
					[[[["Zodiac","USMC_Soldier_GL",_mg2,_gl,_s1],[[0,0],[5,0,0],[0,5,0],[-5,0,0],[0,-5,0]],
						[_r0,_r2,_r0,_r0,_r0]]
						],0.1],
					[[[["RHIB"],[],[_r2]],
						[["USMC_Soldier_SL",_s2,_s2,_mg,_mg2,_gl,_s1,_mg2,_gl,_s1]]
						],0.1],
					[[[["RHIB2Turret"],[],[_r2]],
						[[_s2,_mg2,_gl,_s1,_mg2,_gl,_s1]]
						],0.1]
				];
			} else {
				_west=_west+[
					[[[["RHIB"],[],[_r2]]],0.1],
					[[[["RHIB2Turret"],[],[_r2]]],0.1]
				];
			};
			if (_landing in [1,2,23,24]) then {
				_west=_west+[
					// USMC_MV22Squadron !=
					// rarityGroup = 0.5;
					[[[["MV22"],[],[_r4]],
						[["USMC_Soldier_SL",_s2,_mg2,_gl,_s1,_s2,_mg2,_gl,_s1,_s2,_mg2,_gl,_s1]]
						],0.25],
					[[[["C130J"],[],[_r4]],
						[["USMC_Soldier_SL",_s2,_mg2,_gl,_s1,_s2,_mg2,_gl,_s1,_s2,_mg2,_gl,_s1]]
						],0.25]
				];
			};
			if (_landing in [1,3,23,34]) then {
				_west=_west+[
					#ifdef __A2OA__
						[[[["MH60S"],[],[_r4]],
							[["USMC_Soldier_SL",_s2,_mg2,_gl,_s1,_s2,_mg2,_gl,_s1,_s2,_mg2,_gl,_s1]]
							],0.05],
					#endif
					[[[["UH1Y","UH1Y"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.2],
					[[[["UH1Y"],[],[_r4]],
						[[_s2,_mg,_mg2,_at,_gl,_s1],[],[_r3,_r2,_r1,_r1,_r0,_r0]]
						],0.2]
				];
			} else {
				_west=_west+[
					// FIXME: Медицинский вертолет вероятно нарушает маршруты ии.
					#ifdef __A2OA__
						[[[["MH60S","MH60S"],[[0,15,0],[15,0,0]],[_r4,_r3]]],0.05],
					#endif
					// USMC_UH1YSquadron !=
					// rarityGroup = 0.5; изменен вероятно из-за звена AH1Z
					[[[["UH1Y","UH1Y"],[[0,15,0],[15,0,0]],[_r4,_r3]]],0.4]
				];
			};
		};
		if(acex_usnavy_Avail)then{
			//-- Юниты ACE лес, в дополнение к обычным.
			if(!_deserted)then{
					_west=_west+[
						[[[[_s2,"ACE_Stryker_ICV_M2_SLAT",_s2,_mg2,_at,"USMC_Soldier_GL",_s2,_mg2,"USMC_Soldier_GL","USMC_SoldierM_Marksman"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
							[_r3,_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0],[[],["USMC_Soldier_Crew","USMC_Soldier_Crew"]]]],0.9],
						[[[[_s2,"ACE_Stryker_ICV_MK19_SLAT",_s2,"USMC_Soldier_GL",_mg2,_at,_s2,"USMC_Soldier_GL",_mg2,"USMC_SoldierM_Marksman"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
							[_r3,_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0],[[],["USMC_Soldier_Crew","USMC_Soldier_Crew"]]]],0.9],
						[[[["ACE_Stryker_MGS","ACE_Stryker_MGS","ACE_Stryker_MGS"],[[0,10,0],[5,0,0],[10,0,0]],
							[_r4,_r3,_r3],[["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"],["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"],["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"]]]],0.05],
						[[[["ACE_Stryker_TOW_Slat","ACE_Stryker_TOW_Slat"],[[0,10,0],[5,0,0],[10,0,0]],
							[_r4,_r3,_r3],[["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"],["USMC_Soldier_Crew","USMC_Soldier_Crew","USMC_Soldier_Crew"]]]],0.05],

						[[[["ACE_M1A1HC_TUSK","ACE_M1A1HC_TUSK","ACE_M1A1HC_TUSK","ACE_M1A1HC_TUSK"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
							[_r4,_r3,_r3,_r3]]],0.03],
						[[[["ACE_M1A1HC_TUSK_CSAMM","ACE_M1A1HC_TUSK_CSAMM"],[[0,10,0],[5,0,0]],
							[_r4,_r3]]],0.02],

						[[[["ACE_AH1W_TOW_W","ACE_AH1W_TOW_W"], [[0,0],[10,0]],
							[_r4,_r3]]],0.01],
						[[[["ACE_AH1W_TOW_TOW_W","ACE_AH1W_TOW_TOW_W"], [[0,0],[10,0]],
							[_r4,_r3]]],0.01],
						[[[["ACE_AH1W_AGM_W","ACE_AH1W_AGM_W"], [[0,0],[10,0]],
							[_r4,_r3]]],0.01],
						[[[["ACE_AH1Z_AGM_AGM_W"], [[0,0],[10,0]],
							[_r4,_r3]]],0.01],
						[[[["ACE_AH6J_DAGR_FLIR"], [[0,0],[10,0]],
							[_r4,_r3]]],0.01]
					];
			};
			//-- Юниты ACE пустыня.
			if(!_woodland)then{
				_west=_west+[
					[[[["ACE_USMC_Soldier_SL_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],
						[_r3,_r2,_r1,_r1,_r0,_r2,_r1,_r1,_r0,_r2,_r1,_r1,_r0]]],0.5],
					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
						[_r2,_r1,_r1,_r0]]],0.05],
					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_MG_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
						[_r2,_r1,_r1,_r0]]],0.1],
					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_AT_D","ACE_USMC_Soldier_LAT_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
						[_r2,_r1,_r1,_r0]]],0.1],
					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_Medic_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
						[_r2,_r1,_r1,_r1]]],0.05],
					[[[["ACE_USMC_Soldier_HAT_D","ACE_USMC_Soldier_AT_D","ACE_USMC_Soldier_LAT_D"],[[0,5,0],[3,0,0],[5,0,0]],
						[_r2,_r1,_r1]]],0.15],
					[[[["ACE_USMC_SoldierS_Sniper_D","ACE_USMC_SoldierS_Spotter_D"],[[0,5,0],[3,0,0]],
						[_r2,_r2]]],0.05],

					[[[["ACE_M1A1HC_TUSK_DESERT","ACE_M1A1HC_TUSK_DESERT","ACE_M1A1HC_TUSK_DESERT","ACE_M1A1HC_TUSK_DESERT"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
						[_r4,_r3,_r3,_r3]]],0.03],
					[[[["ACE_M1A1HC_TUSK_CSAMM_DESERT","ACE_M1A1HC_TUSK_CSAMM_DESERT"],[[0,10,0],[5,0,0]],
						[_r4,_r3]]],0.02],

					[[[["ACE_AH1W_TOW_D","ACE_AH1W_TOW_D"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],
					[[[["ACE_AH1W_TOW_TOW_D","ACE_AH1W_TOW_TOW_D"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],
					[[[["ACE_AH1W_AGM_D","ACE_AH1W_AGM_D"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],
					[[[["ACE_AH1Z_AGM_D","ACE_AH1Z_AGM_D"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],
					[[[["ACE_AH1Z_AGM_AGM_D"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],

					[[[["ACE_USMC_Soldier_SL_D","AAV","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"],
						[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],
						[_r3,_r3,_r2,_r1,_r1,_r0,_r2,_r1,_r1,_r0,_r2,_r1,_r1,_r0],
						[[],["ACE_USMC_Soldier_Crew_D","ACE_USMC_Soldier_Crew_D","ACE_USMC_Soldier_Crew_D"]]
					]],0.9],
					[[[["ACE_USMC_Soldier_TL_D","LAV25","ACE_USMC_Soldier_MG_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_AT_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
						[_r3,_r3,_r2,_r1,_r1,_r0,_r0],[[],["ACE_USMC_Soldier_Crew_D","ACE_USMC_Soldier_Crew_D","ACE_USMC_Soldier_Crew_D"]]]],0.6],

					[[[["F35B","F35B"],[[0,20,0],[20,0,0]],
						[_r4,_r3]]],0.6],
					[[[["AV8B2","AV8B2"],[[0,20,0],[20,0,0]],
						[_r4,_r3]]],0.3],
					[[[["AV8B","AV8B"],[[0,20,0],[20,0,0]],
						[_r4,_r3]]],0.5],

					[[[["ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AA_D","ACE_USMC_Soldier_AA_D"], [],
						[_r2,_r1,_r1]]],0.01],
					[[[["ACE_USMC_SoldierS_Spotter_D","ACE_USMC_SoldierM_Marksman_D"], [],
						[_r2,_r2]]],0.01],
					[[[["ACE_USMC_SoldierS_Sniper_D","ACE_USMC_SoldierS_SniperH_D","ACE_USMC_SoldierS_Spotter_D"], [],
						[_r2,_r2,_r1]]],0.01],
					[[[["ACE_USMC_Soldier_GL_D","ACE_USMC_SoldierS_Engineer_D","ACE_USMC_Soldier2_D"], [],
						[_r2,_r1,_r0,_r0]]],0.01]
				];
				if (_landing in [1,2,23,24]) then {
					_west=_west+[
						[[[["MV22"],[],[_r4]],
							[["ACE_USMC_Soldier_SL_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"]]
							],0.5],
						[[[["C130J"],[],[_r4]],
							[["ACE_USMC_Soldier_SL_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D","ACE_USMC_Soldier_TL_D","ACE_USMC_Soldier_AR_D","ACE_USMC_Soldier_LAT_D","ACE_USMC_Soldier_D"]]
							],0.1]
					];
				};
				if (_landing in [1,3,23,34]) then {
					_west=_west+[
						[[[["UH1Y"],[],[_r4]],
							[["ACE_USMC_Soldier_TL_D",
								"ACE_USMC_Soldier_MG_D","ACE_USMC_SoldierM_Marksman_D",
								"ACE_USMC_Soldier_GL_D","ACE_USMC_Soldier_LAT_D",
								"ACE_USMC_Soldier_D"],[],[_r3,_r2,_r1,_r1,_r0,_r0]]
							],0.4]
					];
				}else{
					_west=_west+[
						[[[["UH1Y","UH1Y"],[[0,15,0],[15,0,0]],[_r4,_r3]]],0.4]
					];
				};
			};
		}else{
				//-- Юниты обычные, у которых нет замены в ACE.
				_west=_west+[
					// USMC_TankPlatoon !=
					// звания изменены
					// rarityGroup = 0.5 изменен
					[[[["M1A2_TUSK_MG",
						"M1A2_TUSK_MG","M1A2_TUSK_MG",
						"M1A2_TUSK_MG"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
						[_r4,
						_r3,_r3,
						_r3]]],0.3],
					[[[["M1A2_TUSK_MG","M1A2_TUSK_MG"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
						[_r4,_r3,_r3,_r3]]],0.05],
					[[[["M1A1",
						"M1A1","M1A1",
						"M1A1"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
						[_r4,
						_r3,_r3,
						_r3]]],0.1],
					[[[["M1A1","M1A1"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
						[_r4,_r3,_r3,_r3]]],0.05]
				];
		};
	};

	// RU
	_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"RU");
	if(_tmp > 0 or (gosa_IslandType select 1 >= 1990 && _tmp == -1))then{
		_mg2 = "RU_Soldier_AR";
		_mg = "RU_Soldier_MG";
		_gl = "RU_Soldier_GL";
		_at = "RU_Soldier_AT";
		_s2 = "RU_Soldier_LAT";
		_s1 = "RU_Soldier";

		if (false && east in gosa_friendlyside && _shop == 0) then {
			_east=_east+[
				[[[["GRAD_RU","GRAD_RU"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.01]
			];
		};

		//-- Юниты обычные.
		if(	(!_deserted) or !acex_ru_Avail)then{
			_east=_east+[
				// RU_InfSquad
				[[[["RU_Soldier_SL",
					_mg,_at,
					_s2,_gl,
					"RU_Soldier_Marksman",_mg,
					_at,_mg2,
					_s2,_gl,
					_s1],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
					[_r3,
					_r2,_r2,
					_r1,_r1,
					_r1,_r1,
					_r1,_r0,
					_r0,_r0,
					_r0]]],0.7],
				// RU_InfSection
				[[[["RU_Soldier_TL",
					_mg2,_at,
					_gl,_s1],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					[_r2,
					_r1,_r1,
					_r0,_r0]]],0.2],
				// RU_InfSection_AT
				[[[["RU_Soldier_HAT",
					"RU_Soldier_HAT",_at,
					_at,_s1],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					[_r2,
					_r1,_r1,
					_r0,_r0]]],0.2],
				// RU_InfSection_AA
				[[[["RU_Soldier_AA","RU_Soldier_AA","RU_Soldier_AA"],[[0,5,0],[3,0,0],[5,0,0]],
					[_r2,_r1,_r1]]],0.1],
				// RU_InfSection_MG
				[[[["RU_Soldier_TL",
					_mg,_mg,
					_gl,_at],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					[_r2,
					_r1,_r1,
					_r0,_r0]]],0.2],
				// RU_SniperTeam
				[[[["RU_Soldier_Sniper","RU_Soldier_Spotter"],[[0,5,0],[3,0,0]],
					[_r2,_r2]]],0.05],

				// RU_MotInfSquad
				[[[["RU_Soldier_SL",
					"Kamaz",_mg,
					_at,_s2,
					_gl,"RU_Soldier_Marksman",
					_mg,_s2,
					_mg2,_at,
					_gl,_s1],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
					[_r3,
					_r2,_r2,
					_r2,_r1,
					_r1,_r1,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0]]],0.3],
				// RU_MotInfSection_Recon
				[[[["RU_Soldier_TL",
					"GAZ_Vodnik","GAZ_Vodnik_HMG",
					_mg,_at,
					_gl,"RU_Soldier_Marksman",
					_mg,_mg2,
					_s2,_s1,
					_s1,_s1],[[0,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
					[_r2,
					_r1,_r1,
					_r1,_r1,
					_r1,_r1,
					_r1,_r1,
					_r0,_r0,
					_r0,_r0]]],0.3],
				// RU_MotInfSection_Patrol !=
				[[[["RU_Soldier_TL","GAZ_Vodnik_HMG",_at],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
					[_r2,_r1,_r0,_r0]]],0.4],

				// RU_MechInfSquad_1 !=
				[[[["RU_Soldier_SL",
					"BMP3",_mg,
					_at,_s2,
					_gl],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					[_r3,
					_r3,_r2,
					_r1,_r1,
					_r0],[[],["RU_Soldier_Crew", "RU_Soldier_Crew", "RU_Soldier_Crew", _at, _mg]]]],0.75],
				// RU_MechInfSquad_2 !=
				[[[["RU_Soldier_SL",
					"BTR90",_mg,
					_mg,_at,
					_s2,_gl],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r3,
					_r3,_r2,
					_r1,_r1,
					_r0,_r0]]],0.9],

				// [[[["T90","T90","T90"],[[0,10,0],[5,0,0],[10,0,0]],[4,3,2]]],0.6],

				// RU_Ka52Squadron
				[[[["Ka52"],[],[_r4]]],0.1],
				// RU_Su34FighterSquadron !=
				[[[["Su34","Su34"],[[0,20,0],[20,0,0]],[_r4,_r3]]],0.15],
				[[[["Su34_CP","Su34_CP"],[[0,20,0],[20,0,0]],[_r4,_r3]]],0.05],
				// RU_Pchela1TSquadron
				[[[["Pchela1T"],[],[4]]],0.2],

				[[[["2S6M_Tunguska"], [[0,0]], [_r3]]],0.7],
				[[[["RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_Spotter"], [],
					[_r2,_r2,_r1]]],0.01],
				[[[[_gl,"RU_Soldier_Engineer","RU_Soldier2"], [],
					[_r2,_r1,_r0]]],0.01],
				[[[[_gl,_mg2,_at,"RU_Soldier_Medic"], [],
					[_r2,_r1,_r1,_r0]]],0.01],
				[[[["Su39"], [],[_r4]]],0.01],
				[[[["Su39_CP"], [],[_r4]]],0.01],
				[[[[_gl,"UAZ_AGS30_RU",_at,"UAZ_AGS30_RU"], [],
					[_r2,_r1,_r1,_r1]]],0.01],
				// [[[[_gl,"UAZ_RU",_mg2,_at], [],[2,1,0,0]]],0.01],

				[[[["PBX",_gl,_s2,_s1],[[0,0],[5,0,0],[0,5,0],[-5,0,0]],
					[_r0,_r2,_r0,_r0]]],0.1],

				[[[["KamazReammo"], [],[_r0]]],0.01],
				[[[["KamazRefuel"], [],[_r0]]],0.01],
				[[[["KamazRepair"], [],[_r0],[["RU_Soldier_Engineer"]]]],0.01],
				[[[["GAZ_Vodnik_MedEvac"], [],[_r0],[["RU_Soldier_Medic"]]]],0.05],

				//StaticWeapon
				[[[["AGS_RU"],[],[_r0]]],0.01],
				[[[["KORD_high"],[],[_r0]]],0.01],
				[[[["KORD"],[],[_r0]]],0.01],
				[[[["Igla_AA_pod_East"],[],[_r0]]],0.01],
				[[[["Metis"],[],[_r0]]],0.01],
				[[[["SearchLight_RUS"],[],[_r0]]],0.01]
			];
			if (_landing in [1,3,23,34]) then {
				_east=_east+[
					[[[["Mi24_V2","Mi24_V2"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.1],
					[[[["Mi24_V","Mi24_V"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.1],
					[[[["Mi24_P","Mi24_P"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.1],
					[[[["Mi17_Rockets_RU","Mi17_Rockets_RU"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.15],

					[[[["Mi24_V2"],[],[_r4]],
						[["RU_Soldier_SL",_mg,_mg,_at,_s2,_gl],[],[_r3,_r2,_r1,_r1,_r0,_r0]]
						],0.1],
					[[[["Mi24_V"],[],[_r4]],
						[["RU_Soldier_SL",_mg,_mg,_at,_s2,_gl],[],[_r3,_r2,_r1,_r1,_r0,_r0]]
						],0.1],
					[[[["Mi24_P"],[],[_r4]],
						[["RU_Soldier_SL",_mg,_mg,_at,_s2,_gl],[],[_r3,_r2,_r1,_r1,_r0,_r0]]
						],0.1],
					[[[["Mi17_Rockets_RU"],[],[_r4]],
						[["RU_Soldier_SL",_mg,_at,_s2,_gl,"RU_Soldier_Marksman",_mg,_at,_mg2,_s2,_gl,_s1]]
						],0.15]
				];
			}else{
				_east=_east+[
					[[[["Mi24_V2","Mi24_V2"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.2],
					// RU_Mi24VSquadron !=
					// rarityGroup = 0.3;
					[[[["Mi24_V","Mi24_V"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.2],
					// RU_Mi24PSquadron !=
					// rarityGroup = 0.3;
					[[[["Mi24_P","Mi24_P"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.2],
					// RU_Mi8Squadron !=
					// rarityGroup = 0.5;
					[[[["Mi17_Rockets_RU","Mi17_Rockets_RU"],[[0,15,0],[15,0,0]],[_r4,_r3]]
						],0.3]
				];
			};
		};
		//-- Юниты обычные, другой камуфляж.
		if(!_deserted)then{
			_east=_east+[
				// MVD_AssaultTeam !=
				[[[["MVD_Soldier_TL",
					"MVD_Soldier_MG","MVD_Soldier_AT",
					"MVD_Soldier_GL","MVD_Soldier_Sniper",
					"MVD_Soldier_Marksman","MVD_Soldier_GL",
					"MVD_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],
					[_r3,
					_r2,_r2,
					_r2,_r1,
					_r1,_r1,
					_r1]]],0.02]
			];
		};
		if(acex_ru_Avail)then{
			//-- Юниты ACE лес, в дополнение к обычным.
			if(!_deserted)then{
				_east=_east+[
					// [[[["ACE_SoldierE_HMG","ACE_SoldierE_HMGAG","ACE_SoldierE_HMGAB"],[[0,"+6",0],[-2,"+4",0],["+2","+4",0]],[2,1,0]]],0],
					// [[[["ACE_SoldierE_AGS","ACE_SoldierE_AGSAG","ACE_SoldierE_AGSAB"],[[0,"+6",0],[-2,"+4",0],["+2","+4",0]],[2,1,0]]],0],
					// [[[["ACE_SoldierE_KonkursG","ACE_SoldierE_KonkursAG"],[[0,"+6",0],[-2,"+4",0]],[2,1]]],0],
					[[[["ACE_T90A","ACE_T90A","ACE_T90A"],[[0,10,0],[7,0,0],[-7,0,0]],
						[_r4,_r3,_r3]]],0.25],
					[[[["ACE_T72BA_Base","ACE_T72BA_Base","ACE_T72BA_Base"],[[0,10,0],[7,0,0],[-7,0,0]],
						[_r4,_r3,_r3]]],0.25],
					[[[["ACE_T72B_Base","ACE_T72B_Base"],[[0,10,0],[7,0,0],[-7,0,0]],
						[_r4,_r3,_r3]]],0.25],
					[[[["RU_Soldier_SL","ACE_BTR70_RU",_mg,_mg,_at,_s2,_gl,"RU_Soldier_Marksman",_s1],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[11,0,0],[11,0,0]],
						[_r3,_r3,_r2,_r1,_r1,_r0,_r0,_r0,_r0]]],0.9],
					[[[["ACE_Ka50","ACE_Ka50"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],
					[[[["ACE_Mi24_V_UPK23_RU","ACE_Mi24_V_UPK23_RU"], [[0,0],[10,0]],
						[_r4,_r3]],[["RU_Soldier_SL",_mg,_at,_s2,_gl,"RU_Soldier_Marksman",_mg,_at,_mg2,_s2,_gl,_s1]]],0.01],
					[[[["ACE_Su27_CASP"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],
					[[[["ACE_Su30"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],
					[[[["ACE_Su34_MR"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],
					// [[[["ACE_RU_Soldier_RPOM","ACE_RU_Soldier_RPOM"], [[0,0],[10,0]],[4,3]]],0.01],
					[[[["RU_Soldier_SL","ACE_BMP2_RU",_mg,_mg,_at,_s2,_gl,"RU_Soldier_Marksman"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r0,_r0]
					]],0.01],
					[[[["RU_Soldier_SL","ACE_BMP2D_RU",_mg,_mg,_at,_s2,_gl,"RU_Soldier_Marksman"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r0,_r0]
					]],0.01],
					[[[["RU_Soldier_SL","ACE_BMD_2_RU",_mg,_mg,_at,_s2,_gl,"RU_Soldier_Marksman"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r0,_r0]
					]],0.01],
					[[[["RU_Soldier_SL","ACE_BMD_1P_RU",_mg,_at,_s2,_gl],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r1,_r1,_r0,_r0]
					]],0.01],
					[[[["RU_Soldier_SL","ACE_BMD_1_RU",_mg,_at,_s2,_gl],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r1,_r1,_r0,_r0]
					]],0.01],
					// [[[["ACE_ZSU_RU"], [[0,0],[10,0]],[4,3]]],0.01],
					[[[["RUS_Soldier_TL","RUS_Soldier_GL","RUS_Soldier_Marksman","RUS_Soldier3","RUS_Soldier1","RUS_Soldier2","ACE_RUS_Soldier_Medic"],[],
						[_r3,_r2,_r2,_r2,_r1,_r1,_r1]]],0.07]
				];
			};
			//-- Юниты ACE пустыня.
			#define __PILOT "ACE_RU_Soldier_Pilot_D"
			#define __CREW "ACE_RU_Soldier_Crew_D"
			if(!_woodland)then{
				_east=_east+[
					[[[["ACE_RU_Soldier_SL_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],
						[_r3,_r2,_r2,_r1,_r1,_r1,_r1,_r1,_r0,_r0,_r0,_r0]]],0.7],
					[[[["ACE_RU_Soldier_TL_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
						[_r2,_r1,_r1,_r0,_r0]]],0.2],
					[[[["ACE_RU_Soldier_HAT_D","ACE_RU_Soldier_HAT_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
						[_r2,_r1,_r1,_r0,_r0]]],0.2],
					[[[["ACE_RU_Soldier_AA_D","ACE_RU_Soldier_AA_D","ACE_RU_Soldier_AA_D"],[[0,5,0],[3,0,0],[5,0,0]],
						[_r2,_r1,_r1]]],0.1],
					[[[["ACE_RU_Soldier_TL_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
						[_r2,_r1,_r1,_r0,_r0]]],0.2],
					[[[["ACE_RU_Soldier_Sniper_D","ACE_RU_Soldier_Spotter_D"],[[0,5,0],[3,0,0]],
						[_r2,_r2]]],0.05],
					[[[["ACE_RU_Soldier_SL_D","ACE_Ural_RU_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
						[_r3,_r2,_r2,_r2,_r1,_r1,_r1,_r1,_r1,_r0,_r0,_r0,_r0]]],0.3],
					[[[["ACE_RU_Soldier_TL_D","ACE_UAZ_RU_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
						[_r2,_r1,_r0,_r0]]],0.4],
					[[[["ACE_RU_Soldier_TL_D","ACE_BRDM2_RU_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
						[_r2,_r2,_r2,_r1]]],0.5],
					[[[["ACE_RU_Soldier_TL_D","ACE_BRDM2_ATGM_RU_D","ACE_BRDM2_RU_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[-5,0,0],[-10,0,0],[3,0,0],[5,0,0]],
						[_r2,_r2,_r2,_r2,_r1]]],0.5],
					[[[["ACE_RU_Soldier_SL_D","ACE_BTR70_RU_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
						[_r3,_r3,_r2,_r1,_r1,_r0,_r0,_r0]]],0.9]
				];
				_east=_east+[
					[[[["ACE_RU_Soldier_SL_D","Kamaz","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
						[_r3,_r2,_r2,_r2,_r1,_r1,_r1,_r1,_r1,_r0,_r0,_r0,_r0],[[],["ACE_RU_Soldier_D"]]]
						],0.3],
					[[[["ACE_RU_Soldier_TL_D","GAZ_Vodnik","GAZ_Vodnik_HMG","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_D","ACE_RU_Soldier_D","ACE_RU_Soldier_D"],[[0,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
						[_r2,_r1,_r1,_r1,_r1,_r1,_r1,_r1,_r1,_r0,_r0,_r0,_r0],[[],["ACE_RU_Soldier_D","ACE_RU_Soldier_D","ACE_RU_Soldier_D"],["ACE_RU_Soldier_D","ACE_RU_Soldier_D"]]]
						],0.3],
					[[[["ACE_RU_Soldier_TL_D","GAZ_Vodnik_HMG","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
						[_r2,_r1,_r0,_r0],[[],["ACE_RU_Soldier_D","ACE_RU_Soldier_D"]]]
						],0.4],

					[[[["ACE_RU_Soldier_SL_D","BMP3","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
						[_r3,_r3,_r2,_r1,_r1,_r0],[[],[__CREW, __CREW, __CREW, "ACE_RU_Soldier_AT_D", "ACE_RU_Soldier_MG_D"]]]
						],0.75],
					[[[["ACE_RU_Soldier_SL_D","BTR90","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
						[_r3,_r3,_r2,_r1,_r1,_r0,_r0],[[],[__CREW, __CREW, __CREW]]]
						],0.9],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMP2_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r0,_r0],
						[[],[__CREW, __CREW, __CREW]]
					]],0.01],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMP2D_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r0,_r0],
						[[],[__CREW, __CREW, __CREW]]
					]],0.01],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMD_2_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r0,_r0],
						[[],[__CREW, __CREW, __CREW]]
					]],0.01],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMD_1P_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r1,_r1,_r0,_r0],
						[[],[__CREW, __CREW, "ACE_RU_Soldier_AT_D", "ACE_RU_Soldier_MG_D"]]
					]],0.01],
					[[[["ACE_RU_Soldier_SL_D","ACE_BMD_1_RU","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D"],
						[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r1,_r1,_r0,_r0],
						[[],[__CREW, __CREW, "ACE_RU_Soldier_AT_D", "ACE_RU_Soldier_MG_D"]]
					]],0.01],

					[[[["ACE_T90A","ACE_T90A","ACE_T90A"],[[0,10,0],[5,0,0],[10,0,0]],
						[_r4,_r3,_r3],[[__CREW,__CREW,__CREW],[__CREW,__CREW,__CREW],[__CREW,__CREW,__CREW]]]],0.6],
					[[[["ACE_T72BA_Base","ACE_T72BA_Base","ACE_T72BA_Base"],[[0,10,0],[7,0,0],[-7,0,0]],
						[_r4,_r3,_r3],[[__CREW,__CREW,__CREW],[__CREW,__CREW,__CREW],[__CREW,__CREW,__CREW]]]],0.25],

					[[[["ACE_Ka50","ACE_Ka50"], [[0,0],[10,0]],
						[_r4,_r3],[[__PILOT],[__PILOT]]]
						],0.01],
					[[[["Ka52"],[],[_r4],[[__PILOT,__PILOT]]]],0.1],
					[[[["ACE_Su34_Des","ACE_Su34_Des"],[[0,20,0],[20,0,0]],
						[_r4,_r3]]],0.2],
					[[[["Pchela1T"],[],[_r4]]],0.2],
					[[[["ACE_Su34_MR_Des"], [[0,0],[10,0]],
						[_r4,_r3]]],0.01],

					[[[["2S6M_Tunguska"], [], [_r3],[[__CREW, __CREW, __CREW]]]],0.6],
					[[[["ACE_RU_Soldier_Sniper_D","ACE_RU_Soldier_SniperH_D","ACE_RU_Soldier_Spotter_D"], [],
						[_r2,_r2,_r1]]],0.01],
					[[[["ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Engineer_D","ACE_RU_Soldier_LAT_D"], [],
						[_r2,_r1,_r0]]],0.01],
					[[[["ACE_RU_Soldier_GL_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_Medic_D"], [],
						[_r2,_r1,_r1,_r0]]],0.01],
					[[[["ACE_Su39"], [],[_r4]]],0.01]
					// [[[["ACE_RU_Soldier_GL_D","UAZ_AGS30_RU","ACE_RU_Soldier_AT_D","UAZ_AGS30_RU"], [],[2,1,1,1]]],0.01]
				];
				// TODO: Сбалансировать отряд для пустынной.
				#define __MI24SQUAD [["ACE_RU_Soldier_SL_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_D"],[],[_r3,_r2,_r1,_r1,_r0,_r0]]
				if (_landing in [1,3,23,34]) then {
					_east=_east+[
						// Mi24 всего 0.6, 0.6/8 = 0.075
						[[[["ACE_Mi24_V_UPK23_RU","ACE_Mi24_V_UPK23_RU"],[[0,15,0],[15,0,0]],[_r4,_r3],[[__PILOT,__PILOT],[__PILOT,__PILOT]]]
							],0.075],
						[[[["Mi24_V2","Mi24_V2"],[[0,15,0],[15,0,0]],[_r4,_r3],[[__PILOT,__PILOT],[__PILOT,__PILOT]]]
							],0.075],
						[[[["Mi24_V","Mi24_V"],[[0,15,0],[15,0,0]],[_r4,_r3],[[__PILOT,__PILOT],[__PILOT,__PILOT]]]
							],0.075],
						[[[["Mi24_P","Mi24_P"],[[0,15,0],[15,0,0]],[_r4,_r3],[[__PILOT,__PILOT],[__PILOT,__PILOT]]]
							],0.075],
						[[[["ACE_Mi24_V_UPK23_RU"],[],[_r4],[[__PILOT,__PILOT]]],__MI24SQUAD
							],0.075],
						[[[["Mi24_V2"],[],[_r4],[[__PILOT,__PILOT]]],__MI24SQUAD
							],0.075],
						[[[["Mi24_V"],[],[_r4],[[__PILOT,__PILOT]]],__MI24SQUAD
							],0.075],
						[[[["Mi24_P"],[],[_r4],[[__PILOT,__PILOT]]],__MI24SQUAD
							],0.075],

						// Mi17_Rockets_RU
						[[[["Mi17_Rockets_RU"],[],[_r4],[[__PILOT,__PILOT,__PILOT,__PILOT]]],
							[["ACE_RU_Soldier_SL_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_Marksman_D","ACE_RU_Soldier_MG_D","ACE_RU_Soldier_AT_D","ACE_RU_Soldier_AR_D","ACE_RU_Soldier_LAT_D","ACE_RU_Soldier_GL_D","ACE_RU_Soldier_D"],[],
							[_r3,_r2,_r2,_r1,_r1,_r1,_r1,_r1,_r0,_r0,_r0,_r0]]
							],0.15],
						[[[["Mi17_Rockets_RU","Mi17_Rockets_RU"],[[0,15,0],[15,0,0]],[_r4,_r3],[[__PILOT,__PILOT,__PILOT,__PILOT],[__PILOT,__PILOT,__PILOT,__PILOT]]]
							],0.15]
					];
				}else{
					_east=_east+[
						[[[["ACE_Mi24_V_UPK23_RU","ACE_Mi24_V_UPK23_RU"],[[0,15,0],[15,0,0]],[_r4,_r3],[[__PILOT,__PILOT],[__PILOT,__PILOT]]]
							],0.15],
						[[[["Mi24_V2","Mi24_V2"],[[0,15,0],[15,0,0]],[_r4,_r3],[[__PILOT,__PILOT],[__PILOT,__PILOT]]]
							],0.15],

						// RU_Mi24VSquadron !=
						// rarityGroup = 0.3;
						[[[["Mi24_V","Mi24_V"],[[0,15,0],[15,0,0]],[_r4,_r3],[[__PILOT,__PILOT],[__PILOT,__PILOT]]]
							],0.15],
						// RU_Mi24PSquadron !=
						// rarityGroup = 0.3;
						[[[["Mi24_P","Mi24_P"],[[0,15,0],[15,0,0]],[_r4,_r3],[[__PILOT,__PILOT],[__PILOT,__PILOT]]]
							],0.15],
						// RU_Mi8Squadron !=
						// rarityGroup = 0.5;
						[[[["Mi17_Rockets_RU","Mi17_Rockets_RU"],[[0,15,0],[15,0,0]],
							[_r4,_r3],[[__PILOT,__PILOT,__PILOT,__PILOT],[__PILOT,__PILOT,__PILOT,__PILOT]]]
							],0.3]
					];
				};
			};
		}else{
			//-- Юниты обычные, другой камуфляж.
			if(!_deserted)then{
				_east=_east+[
					// RUS_ReconTeam !=
					[[[["RUS_Soldier_TL",
						"RUS_Soldier_GL","RUS_Soldier_Marksman",
						"RUS_Soldier3","RUS_Soldier1",
						"RUS_Soldier2","RUS_Soldier_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
						[_r3,
						_r2,_r2,
						_r2,_r1,
						_r1,_r1]]],0.07]
				];
			};
			//-- Юниты обычные, у которых нет замены в ACE.
			_east=_east+[
				// RU_TankPlatoon !=
				[[[["T90","T90","T90"],[[0,10,0],[5,0,0],[10,0,0]],
					[_r4,_r3,_r3]]],0.6],
				[[[["T72_RU","T72_RU"], [[0,0],[10,0]],
					[_r4,_r3]]],0.01]
			];
		};
	};
};

#ifdef __A2OA__
// OA
if(LIB_ahAvail)then{

	// BIS_BAF
	_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"BIS_BAF");
	if(_tmp > 0 or (gosa_IslandType select 1 >= 1990 && _tmp == -1))then
	{
		// MTP используется отдельно пехотой и в качестве пасажиров техники D.
		// DDPM используется отдельно пехотой без техники.
		// W используется и пехотой и техникой совместно.

		// Множитель применяется не ко всем отрядам.
		_multiplier_MTP=0.5;
		if (gosa_IslandType select 0 > 200) then
		{
			_multiplier_DDPM=0.5;
			_multiplier_W=0;
		}else{
			_multiplier_DDPM=0;
			_multiplier_W=0.5;
		};

		// MTP используется отдельно пехотой и в качестве пасажиров техники D.
		#define __AR "BAF_Soldier_AR_MTP"
		#define __AAR "BAF_Soldier_AAR_MTP"
		#define __GL "BAF_Soldier_GL_MTP"
		#define __AT "BAF_Soldier_AT_MTP"
		#define __TL "BAF_Soldier_TL_MTP"
		#define __SL "BAF_Soldier_SL_MTP"
		#define __Marksman "BAF_Soldier_Marksman_MTP"
		#define _AAT "BAF_Soldier_AAT_MTP"

		_west=_west+[
			[[[[__SL,
				__TL,__GL,
				__AR,__Marksman,
				__GL,__AR,
				__AAR],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],
				[_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]]],
				0.5 * _multiplier_MTP],
			[[[[__TL,
				__GL,__AR,
				__Marksman],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
				[_r1,_r0,_r0,_r0]]],
				0.8 * _multiplier_MTP],
			[[[[__TL,
				"BAF_Soldier_FAC_MTP","BAF_Soldier_Medic_MTP",
				"BAF_Soldier_EN_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
				[_r1,_r0,_r0,_r0]]],
				0.2 * _multiplier_MTP],
			[[[[__TL,
				__GL,"BAF_Soldier_MG_MTP",
				"BAF_Soldier_AMG_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
				[_r1,_r0,_r0,_r0]]],
				0.2 * _multiplier_MTP],
			[[[[__TL,
				__GL,__AT,
				_AAT],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
				[_r1,_r0,_r0,_r0]]],
				0.1 * _multiplier_MTP],
			[[[[__AT,
				"BAF_Soldier_HAT_MTP","BAF_Soldier_AHAT_MTP",
				_AAT],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
				[_r1,_r1,_r0,_r0]]],
				0.05 * _multiplier_MTP]
		];

		if (gosa_IslandType select 0 > 200) then
		{

			_west=_west+[
				// Авиация.
					[[[["CH_47F_BAF"],[[0,0,0]],
						[_r4]],[[__SL,__TL,__GL,__AR,__Marksman,__GL,__AR,__AAR]]
						],0.3],
					[[[["AW159_Lynx_BAF"],[],
						[_r4]],[[__SL,__TL,__GL,__AR,__Marksman,__GL,__AR,__AAR]]
						],0.3],
					#define __VEH "BAF_Apache_AH1_D"
					[[[[__VEH,__VEH],[[0,20,0],[20,0,0]],
						[_r4,_r3]]],0.3],
					[[[["BAF_Merlin_HC3_D"],[],
						[_r4]],[[__SL,__TL,__GL,__AR,__Marksman,__GL,__AR,__AAR]]
						],0.3],

				#define __VEH "BAF_Jackal2_L2A1_D"
				[[[[__TL,
					__GL,__VEH],[[0,5,0],[3,0,0],[-5,0,0]],
					[_r2,_r0,_r0]]],
					0.3],
				[[[[__SL,
					__GL,__VEH,
					__TL,__GL,
					__VEH],[[0,5,0],[3,0,0],[-5,0,0],[5,0,0],[7,0,0],[-5,-10,0]],
					[_r2,_r0,_r0,_r2,_r0,_r0]]],
					0.1],
				// Offroad
				[[[[__SL,
					__TL,__GL,
					__GL,__AR,
					__AR,__Marksman,
					"BAF_Offroad_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[-5,0,0]],
					[_r2,_r1,_r0,_r0,_r0,_r0,_r0,_r0]]],
					0.5],

				// Бронетехника.
				#define __VEH "BAF_FV510_D"
				[[[[__VEH,__VEH,__VEH,__VEH],[[0,8,0],[8,0,0],[-8,0,0],[0,-8,0]],
					[_r4,_r3,_r3,_r3]]],
					0.05],
				[[[[__SL,
					__TL,__GL,
					__GL,__AR,
					__Marksman,__VEH],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],
					[_r3,_r1,_r0,_r0,_r0,_r0,_r3]]],
					0.3],
				[[[[__AT,
					__AT,"BAF_Soldier_HAT_MTP",
					_AAT,_AAT,
					"BAF_Soldier_AHAT_MTP",__VEH],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],
					[_r3,_r1,_r1,_r0,_r0,_r0,_r3]]],
					0.3],

				//StaticWeapon
				[[[["BAF_GMG_Tripod_D"], [],[_r0]]],0.01],
				[[[["BAF_GPMG_Minitripod_D"], [],[_r0]]],0.01],
				[[[["BAF_L2A1_Tripod_D"], [],[_r0]]],0.01],
				[[[["BAF_L2A1_Minitripod_D"], [],[_r0]]],0.01]
			];
		};

		// DDPM используется отдельно пехотой без техники.
		if (gosa_IslandType select 0 > 200) then
		{
			#define __AR "BAF_Soldier_AR_DDPM"
			#define __AAR "BAF_Soldier_AAR_DDPM"
			#define __GL "BAF_Soldier_GL_DDPM"
			#define __AT "BAF_Soldier_AT_DDPM"
			#define __TL "BAF_Soldier_TL_DDPM"
			#define __SL "BAF_Soldier_SL_DDPM"
			#define __Marksman "BAF_Soldier_Marksman_DDPM"
			#define _AAT "BAF_Soldier_AAT_DDPM"

			_west=_west+[
				// Пехота.
				[[[[__SL,
					__TL,__GL,
					__AR,__Marksman,
					__GL,__AR,
					__AAR],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],
					[_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]]],
					0.5 * _multiplier_DDPM],
				[[[[__TL,
					__GL,__AR,
					__Marksman],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r0,_r0,_r0]]],
					0.8 * _multiplier_DDPM],
				[[[[__TL,
					"BAF_Soldier_FAC_DDPM","BAF_Soldier_Medic_DDPM",
					"BAF_Soldier_EN_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r0,_r0,_r0]]],
					0.2 * _multiplier_DDPM],
				[[[[__TL,
					__GL,"BAF_Soldier_MG_DDPM",
					"BAF_Soldier_AMG_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r0,_r0,_r0]]],
					0.2 * _multiplier_DDPM],
				[[[[__TL,
					__GL,__AT,
					_AAT],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r0,_r0,_r0]]],
					0.1 * _multiplier_DDPM],
				[[[[__AT,
					"BAF_Soldier_HAT_DDPM","BAF_Soldier_AHAT_DDPM",
					_AAT],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r1,_r0,_r0]]],
					0.05 * _multiplier_DDPM]
			];
		}else{

			// W используется и пехотой и техникой совместно.
			#define __AR "BAF_Soldier_AR_W"
			#define __AAR "BAF_Soldier_AAR_W"
			#define __GL "BAF_Soldier_GL_W"
			#define __AT "BAF_Soldier_AT_W"
			#define __TL "BAF_Soldier_TL_W"
			#define __SL "BAF_Soldier_SL_W"
			#define __Marksman "BAF_Soldier_Marksman_W"
			#define _AAT "BAF_Soldier_AAT_W"

			_west=_west+[
				[[[[__SL,
					__TL,__GL,
					__AR,__Marksman,
					__GL,__AR,
					__AAR],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],
					[_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]]],
					0.5 * _multiplier_W],
				[[[[__TL,__GL,__AR,__Marksman],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r0,_r0,_r0]]],
					0.8 * _multiplier_W],
				[[[[__TL,"BAF_Soldier_FAC_W","BAF_Soldier_Medic_W","BAF_Soldier_EN_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r0,_r0,_r0]]],
					0.2 * _multiplier_W],
				[[[[__TL,__GL,"BAF_Soldier_MG_W","BAF_Soldier_AMG_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r0,_r0,_r0]]],
					0.2 * _multiplier_W],
				[[[[__TL,__GL,__AT,_AAT],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r0,_r0,_r0]]],
					0.1 * _multiplier_W],
				[[[[__AT,"BAF_Soldier_HAT_W","BAF_Soldier_AHAT_W",_AAT],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r1,_r0,_r0]]],
					0.05 * _multiplier_W],

				[[[[__SL,
					__TL,__GL,
					__GL,__AR,
					__AR,__Marksman,
					"BAF_Offroad_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[-5,0,0]],
					[_r2,_r1,_r0,_r0,_r0,_r0,_r0,_r0]]],
					0.5],

				#define __VEH "BAF_Jackal2_L2A1_W"
				[[[[__TL,
					__GL,__VEH],[[0,5,0],[3,0,0],[-5,0,0]],
					[_r2,_r0,_r0]]],
					0.3],
				[[[[__SL,
					__GL,__VEH,
					__TL,__GL,
					__VEH],[[0,5,0],[3,0,0],[-5,0,0],[5,0,0],[7,0,0],[-5,-10,0]],
					[_r2,_r0,_r0,_r2,_r0,_r0]]],
					0.1],

				#define __VEH "BAF_FV510_W"
				[[[[__SL,
					__TL,__GL,
					__GL,__AR,
					__Marksman,__VEH],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],
					[_r3,_r1,_r0,_r0,_r0,_r0,_r3]]],
					0.3],
				[[[[__AT,
					__AT,"BAF_Soldier_HAT_W",
					_AAT,_AAT,
					"BAF_Soldier_AHAT_W",__VEH],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],
					[_r3,_r1,_r1,_r0,_r0,_r0,_r3]]],
					0.3],
				[[[[__VEH,__VEH,__VEH,__VEH],[[0,8,0],[8,0,0],[-8,0,0],[0,-8,0]],
					[_r4,_r3,_r3,_r3]]],0.05],

				#define __Pilot "BAF_Pilot_W"
				[[[["CH_47F_BAF"],[],
					[_r4],[[__Pilot,__Pilot,__Pilot,__Pilot]]],[[__SL,__TL,__GL,__AR,__Marksman,__GL,__AR,__AAR]]
					],0.3],
				[[[["AW159_Lynx_BAF"],[],
					[_r4],[[__Pilot,__Pilot,__Pilot]]],[[__SL,__TL,__GL,__AR,__Marksman,__GL,__AR,__AAR]]
					],0.3],
				[[[["BAF_Merlin_HC3_D"],[],
					[_r4],[[__Pilot,__Pilot,__Pilot]]],[[__SL,__TL,__GL,__AR,__Marksman,__GL,__AR,__AAR]]
					],0.3],

				//StaticWeapon
				[[[["BAF_GMG_Tripod_W"], [],[_r0]]],0.01],
				[[[["BAF_L2A1_Minitripod_W"], [],[_r0]]],0.01],
				[[[["BAF_L2A1_Tripod_W"], [],[_r0]]],0.01],
				[[[["BAF_GPMG_Minitripod_W"], [],[_r0]]],0.01]
			];
		};

		// Снайперы.
		if (gosa_IslandType select 0 > 200) then
		{
			_west=_west+[
				[[[["BAF_Soldier_Sniper_MTP",
					"BAF_Soldier_SniperH_MTP","BAF_Soldier_spotter_MTP"],[[0,5,0],[3,0,0],[5,0,0]],
					[_r1,_r1,_r0]]],0.05]
			];
			_westN=_westN+[
				[[[["BAF_Soldier_SniperN_MTP",
					"BAF_Soldier_SniperN_MTP","BAF_Soldier_spotterN_MTP"],[[0,5,0],[3,0,0],[5,0,0]],
					[_r1,_r1,_r0]]],0.05]
			];
		}else{
			_west=_west+[
				[[[["BAF_Soldier_Sniper_W",
					"BAF_Soldier_SniperH_W","BAF_Soldier_spotter_W"],[[0,5,0],[3,0,0],[5,0,0]],
					[_r1,_r1,_r0]]],0.05]
			];
			_westN=_westN+[
				[[[["BAF_Soldier_SniperN_W",
					"BAF_Soldier_SniperN_W","BAF_Soldier_spotterN_W"],[[0,5,0],[3,0,0],[5,0,0]],
					[_r1,_r1,_r0]]],0.05]
			];
		};
	};

	// BIS_GER
	_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"BIS_GER");
	if(true)then{
		if((!_woodland && gosa_IslandType select 1 >= 1990 && _tmp == -1) or _tmp > 0)then{
			_west=_west+[
				[[[["GER_Soldier_TL_EP1","GER_Soldier_MG_EP1","GER_Soldier_EP1","GER_Soldier_Scout_EP1","GER_Soldier_EP1","GER_Soldier_Medic_EP1"],[],
				[_r2,_r1,_r1,_r1,_r0,_r0]]],0.01]
			];
		};
	};

	// BIS_US
	_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"BIS_US");
	if(true)then{
		if((!_woodland && gosa_IslandType select 1 >= 1990 && _tmp == -1) or _tmp > 0)then{
			if (false && west in gosa_friendlyside && _shop == 0) then {
				_west=_west+[
					[[[["M1129_MC_EP1","M1129_MC_EP1"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.01],
					[[[["MLRS_DES_EP1","MLRS_DES_EP1"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.01]
				];
			};

			_west=_west+[
				[[[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					[_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]]],0.5],
				[[[["US_Soldier_SL_EP1","US_Soldier_MG_EP1","US_Soldier_GL_EP1","US_Soldier_AMG_EP1","US_Soldier_MG_EP1","US_Soldier_GL_EP1","US_Soldier_AMG_EP1","US_Soldier_LAT_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],
					[_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0]]],0.5],
				[[[["US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_AAR_EP1"],[],
					[_r2,_r1,_r1,_r0]]],0.3],
				[[[["US_Soldier_TL_EP1","US_Soldier_MG_EP1","US_Soldier_GL_EP1","US_Soldier_AMG_EP1"],[],
					[_r2,_r1,_r1,_r0]]],0.1],
				[[[["US_Soldier_TL_EP1","US_Soldier_AT_EP1","US_Soldier_AT_EP1","US_Soldier_AAT_EP1"],[],
					[_r2,_r1,_r1,_r0]]],0.1],
				[[[["US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1","US_Soldier_Medic_EP1"],[],
					[_r2,_r1,_r1,_r0]]],0.1],
				[[[["US_Soldier_HAT_EP1","US_Soldier_HAT_EP1","US_Soldier_AHAT_EP1"],[],
					[_r2,_r1,_r1]]],0.1],
				[[[["US_Soldier_Sniper_EP1","US_Soldier_Sniper_EP1","US_Soldier_Spotter_EP1"],[],
					[_r2,_r2,_r1]]],0.05],
					// FIXME: Почему 0?
				[[[["US_Delta_Force_TL_EP1","US_Delta_Force_MG_EP1","US_Delta_Force_Assault_EP1","US_Delta_Force_Marksman_EP1"],[],
					[_r2,_r2,_r1,_r1]]],0],

				[[[["US_Soldier_SL_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_MK19_DES_EP1","US_Soldier_AT_EP1","US_Soldier_GL_EP1","US_Soldier_GL_EP1","US_Soldier_AAT_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					[_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0]]],0.2],
				[[[["US_Soldier_SL_EP1","HMMWV_TOW_DES_EP1","HMMWV_TOW_DES_EP1","US_Soldier_AR_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],
					[_r2,_r1,_r1,_r0]]],0.15],
				// [[[["US_Delta_Force_TL_EP1","ATV_US_EP1","ATV_US_EP1","US_Delta_Force_Assault_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],[2,1,1,1]]],0],
				// FIXME: Почему 0?
				[[[["US_Delta_Force_TL_EP1","HMMWV_M998A2_SOV_DES_EP1","US_Delta_Force_Assault_EP1","US_Delta_Force_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],
					[_r2,_r1,_r1,_r1]]],0],
				[[[["US_Soldier_TL_EP1","M2A3_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_GL_EP1","US_Soldier_AT_EP1","US_Soldier_LAT_EP1"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r3,_r3,_r2,_r1,_r1,_r1,_r0]]],0.6],

				[[[["A10_US_EP1","A10_US_EP1"],[[0,20,0],[20,0,0]],
					[_r4,_r3]]],0.3],
				// FIXME: Почему один?
				[[[["AH64D_EP1"],[[0,0,0]],[_r4]]],0.3],
				[[[["AH6J_EP1","AH6J_EP1"],[[0,15,0],[15,0,0]],
					[_r4,_r3]]],0.3],
				[[[["AH6X_EP1"],[[0,0,0]],[_r4]]],0.1],
				[[[["MQ9PredatorB_US_EP1"],[[0,0,0]],[_r4]]],0.3],

				[[[["HMMWV_Avenger_DES_EP1"], [[0,0]],[_r2]]],0.8],
				[[[["US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1","US_Soldier_Engineer_EP1"], [],
					[_r2,_r1,_r1,_r0]]],0.01],
				// [[[["M1129_MC_EP1"], [],[]]],0.01],
				[[[["M1135_ATGMV_EP1","M1135_ATGMV_EP1"], [[0,0],[10,0]],
					[_r3,_r3]]],0.01],
				[[[["US_Soldier_TL_EP1","M6_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_GL_EP1","US_Soldier_AT_EP1","US_Soldier_LAT_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
					[_r3,_r3,_r2,_r1,_r1,_r1,_r0]]],0.01],
				[[[["US_Soldier_TL_EP1","M2A2_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_GL_EP1","US_Soldier_AT_EP1","US_Soldier_LAT_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
					[_r3,_r3,_r2,_r1,_r1,_r1,_r0]]],0.01],
				// [[[["US_Soldier_TL_EP1","HMMWV_DES_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1"], [[0,0],[5,0],[0,0],[0,0]],[2,0,1,1]]],0.01],
				// [[[["US_Soldier_TL_EP1","HMMWV_M1035_DES_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1"], [[0,0],[5,0],[0,0],[0,0]],[2,0,1,1]]],0.01],
				// [[[["HMMWV_Terminal_EP1","US_Soldier_Engineer_EP1"], [[0,0],[5,0]],[1,0]]],0.01],
				[[[["US_Soldier_TL_EP1","HMMWV_M998_crows_M2_DES_EP1","US_Soldier_AR_EP1"], [[0,0],[5,0],[0,0]],
					[_r2,_r0,_r1]]],0.01],
				[[[["US_Soldier_TL_EP1","HMMWV_M998_crows_MK19_DES_EP1","US_Soldier_AR_EP1"], [[0,0],[5,0],[0,0]],
					[_r2,_r0,_r1]]],0.01],
				[[[["US_Soldier_SL_EP1","MTVR_DES_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"],
					[[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
					[_r3,_r0,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]
				]],0.01],

				[[[["MtvrReammo_DES_EP1"], [],[_r0]]],0.01],
				[[[["MtvrRefuel_DES_EP1"], [],[_r0]]],0.01],
				[[[["MtvrRepair_DES_EP1"], [],[_r0],[["US_Soldier_Engineer_EP1"]]]],0.01],
				[[[["HMMWV_Ambulance_DES_EP1"], [],[_r0],[["US_Soldier_Medic_EP1"]]]],0.01],
				[[[["M1133_MEV_EP1"], [],[_r0],[["US_Soldier_Medic_EP1"]]]],0.01],

				//StaticWeapon
				[[[["M2StaticMG_US_EP1"],[],[_r0]]],0.01],
				[[[["M2HD_mini_TriPod_US_EP1"],[],[_r0]]],0.01],
				[[[["MK19_TriPod_US_EP1"],[],[_r0]]],0.01],
				[[[["Stinger_Pod_US_EP1"],[],[_r0]]],0.01],
				[[[["TOW_TriPod_US_EP1"],[],[_r0]]],0.01],
				[[[["SearchLight_US_EP1"],[],[_r0]]],0.01]
			];

			if (_landing in [1,2,23,24]) then {
				// US_C130JFlight
				// rarityGroup = 0.3;
				[[[["C130J_US_EP1"],[],[_r4]],
					[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"]]
					],0.3]
			};
			if (_landing in [1,3,23,34]) then {
				// US_MH6JFlight
				// rarityGroup = 0.3;
				[[[["MH6J_EP1"],[],[_r4]],
					[["US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_AAR_EP1"]]
					],0.3],

				[[[["CH_47F_EP1"],[],[_r4]]
					],0.15],
				[[[["CH_47F_EP1"],[],[_r4]],
					[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"]]
					],0.15],

				[[[["UH60M_EP1","UH60M_EP1"],[[0,15,0],[15,0,0]],[_r4,_r3]]
					],0.15],
				[[[["UH60M_EP1"],[],[_r4]],
					[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1"]]
					],0.15]
			}else{
				// US_CH47FFlight
				// rarityGroup = 0.3;
				[[[["CH_47F_EP1"],[],[_r4]]
					],0.3],
				// US_UH60MFlight
				// rarityGroup = 0.3;
				[[[["UH60M_EP1","UH60M_EP1"],[[0,15,0],[15,0,0]],[_r4,_r3]]
					],0.3]
			};

			if(acex_usnavy_Avail)then{
				_west=_west+[
					// [[[["ACE_US_Soldier_M224_G","ACE_US_Soldier_M224_AG","ACE_US_Soldier_M224_AB","ACE_US_Soldier_M224_AB"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],[2,1,1,0]]],0.3],
					// [[[["ACE_US_Soldier_M252_G","ACE_US_Soldier_M252_AG","ACE_US_Soldier_M252_AB","ACE_US_Soldier_M252_AB"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],[2,1,1,0]]],0.3],
					[[[["US_Soldier_SL_EP1","ACE_Stryker_ICV_M2_SLAT","US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_GL_EP1","US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]]
						],0.9],
					[[[["US_Soldier_SL_EP1","ACE_Stryker_ICV_MK19_SLAT","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]]
						],0.9],
					// [[[["US_Soldier_TL_EP1","ACE_Stryker_RV","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1","US_Soldier_LAT_EP1"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],[3,2,2,1,1,1]]],0.6],
					[[[["ACE_Stryker_MGS","ACE_Stryker_MGS","ACE_Stryker_MGS"],[[0,10,0],[5,0,0],[10,0,0]],
						[_r4,_r3,_r3]]],0.05],
					[[[["ACE_Stryker_TOW_Slat","ACE_Stryker_TOW_Slat"],[[0,10,0],[5,0,0],[10,0,0]],
						[_r4,_r3,_r3]]],0.05],
					[[[["ACE_M1A1HA_TUSK_DESERT","ACE_M1A1HA_TUSK_DESERT","ACE_M1A1HA_TUSK_DESERT","ACE_M1A1HA_TUSK_DESERT"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
						[_r4,_r3,_r3,_r3]]],0.05],
					[[[["ACE_M1A1HA_TUSK_DESERT","ACE_M1A1HA_TUSK_DESERT"],[[0,10,0],[5,0,0]],
						[_r4,_r3]]],0.05],
					[[[["ACE_M1A1HA_TUSK_CSAMM_DESERT","ACE_M1A1HA_TUSK_CSAMM_DESERT"],[[0,10,0],[5,0,0]],
						[_r4,_r3]]],0.05],
					[[[["US_Soldier_SL_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AAR_EP1","US_Soldier_AT_EP1","US_Soldier_AAT_EP1","US_Soldier_Medic_EP1","ACE_Truck5tMG"],
						[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[10,0]],
						[_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0,_r0,_r0,_r0,_r0]
					]],0.02]
				];
			}else{
				_west=_west+[
					[[[["US_Soldier_SL_EP1","M1126_ICV_M2_EP1","US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_GL_EP1","US_Soldier_TL_EP1","US_Soldier_AR_EP1","US_Soldier_GL_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]]],0.9],
					[[[["US_Soldier_SL_EP1","M1126_ICV_mk19_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_TL_EP1","US_Soldier_GL_EP1","US_Soldier_AR_EP1","US_Soldier_Marksman_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
						[_r3,_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]]],0.9],
					[[[["M1128_MGS_EP1","M1128_MGS_EP1","M1128_MGS_EP1"],[[0,10,0],[5,0,0],[10,0,0]],
						[_r4,_r3,_r3]]],0.05],
					[[[["M1135_ATGMV_EP1","M1135_ATGMV_EP1"],[[0,10,0],[5,0,0],[10,0,0]],
						[_r4,_r3,_r3]]],0.05],
					[[[["M1A2_US_TUSK_MG_EP1","M1A2_US_TUSK_MG_EP1","M1A2_US_TUSK_MG_EP1","M1A2_US_TUSK_MG_EP1"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
						[_r4,_r3,_r3,_r3]]],0.05],
					[[[["M1A1_US_DES_EP1","M1A1_US_DES_EP1","M1A1_US_DES_EP1","M1A1_US_DES_EP1"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
						[_r4,_r3,_r3,_r3]]],0.05],
					[[[["M1A2_US_TUSK_MG_EP1","M1A2_US_TUSK_MG_EP1"],[[0,10,0],[5,0,0]],
						[_r4,_r3]]],0.05]
				];
			};
		// }else{
			// if(acex_usnavy_Avail)then{
				// _west=_west+[
					// [[[["ACE_M1A1HA_TUSK","ACE_M1A1HA_TUSK","ACE_M1A1HA_TUSK","ACE_M1A1HA_TUSK"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],[4,3,3,3]]],0.05],
					// [[[["ACE_M1A1HA_TUSK","ACE_M1A1HA_TUSK"],[[0,10,0],[5,0,0]],[4,3]]],0.05],
					// [[[["ACE_M1A1HA_TUSK_CSAMM","ACE_M1A1HA_TUSK_CSAMM"],[[0,10,0],[5,0,0]],[4,3]]],0.05]
				// ];
			// };
		};
	};

	// BIS_TK_INS
	_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"BIS_TK_INS");
	if(true)then{
		if((!_woodland && gosa_IslandType select 1 >= 1990 && _tmp == -1) or _tmp > 0)then{
			_east=_east+[
				[[[["TK_INS_Soldier_TL_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_4_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
					[_r2,_r1,_r1,_r1,_r1,_r1,_r1,_r1,_r0,_r0]]],0.7],
				[[[["TK_INS_Soldier_2_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_4_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					[_r1,_r1,_r0,_r0,_r0]]],0.2],
				[[[["TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AA_EP1"],[[0,5,0],[3,0,0],[5,0,0]],
					[_r2,_r2,_r2]]],0.2],
				[[[["TK_INS_Soldier_TL_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,_r2,_r1,_r1]]],0.2],
				[[[["TK_INS_Soldier_TL_EP1","LandRover_SPG9_TK_INS_EP1","LandRover_MG_TK_INS_EP1","TK_INS_Soldier_AT_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],
					[_r2,_r2,_r1,_r1]]],0.5],
				[[[["TK_INS_Soldier_TL_EP1","V3S_TK_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0]],
					[_r2,_r1,_r1,_r1,_r1,_r1,_r1,_r1,_r1,_r1,_r0],[[],["TK_INS_Soldier_EP1"]]]
					],0.1],
				[[[["TK_INS_Soldier_TL_EP1","BTR40_MG_TK_INS_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					[_r2,_r1,_r1,_r1,_r1,_r1,_r1]]],0.3],

				//StaticWeapon
				[[[["AGS_TK_INS_EP1"], [],[_r0]]],0.01],
				[[[["DSHKM_TK_INS_EP1"], [],[_r0]]],0.01],
				[[[["DSHkM_Mini_TriPod_TK_INS_EP1"], [],[_r0]]],0.01],
				[[[["ZU23_TK_INS_EP1"], [],[_r0]]],0.01],
				[[[["SearchLight_TK_INS_EP1"], [],[_r0]]],0.01],
				[[[["SPG9_TK_INS_EP1"], [],[_r0]]],0.01]
			];
		};
	};

	// BIS_TK
	_f_multi_bis_tk = missionNamespace getVariable ("gosa_faction_multiplier_"+"BIS_TK");
	if(_f_multi_bis_tk > 0 or (gosa_IslandType select 1 >= 1990 && _f_multi_bis_tk == -1))then{
		if (false && east in gosa_friendlyside && _shop == 0) then {
			_west=_west+[
				[[[["GRAD_TK_EP1","GRAD_TK_EP1"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.01]
			];
		};

		_east=_east+[
			[[[["T72_TK_EP1","T72_TK_EP1","T72_TK_EP1"],[[0,10,0],[5,0,0],[10,0,0]],
				[_r4,_r3,_r3]]],0.05],
			[[[["T55_TK_EP1","T55_TK_EP1","T55_TK_EP1"],[[0,10,0],[5,0,0],[10,0,0]],
				[_r4,_r3,_r3]]],0.05],
			[[[["T34_TK_EP1","T34_TK_EP1","T34_TK_EP1"],[[0,10,0],[5,0,0],[10,0,0]],
				[_r4,_r3,_r3]]],0.05],

			[[[["L39_TK_EP1"],[],[_r3]]],0.01],
			[[[["Su25_TK_EP1","Su25_TK_EP1"],[[0,20,0],[20,0,0]],
				[_r4,_r3]]],0.3],

			// [[[["ACE_TK_Soldier_2B14_G","ACE_TK_Soldier_2B14_AG","ACE_TK_Soldier_2B14_AB","ACE_TK_Soldier_2B14_AB"],[],[1,1,0,0]]],0.2],
			// [[[["ACE_TK_Soldier_KonkursG","ACE_TK_Soldier_KonkursAG"],[[0,"+6",0],[-2,"+4",0]],[2,1]]],0],
			[[[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
				[_r3,_r2,_r1,_r1,_r1,_r1,_r0,_r0,_r0]]],0.7],
			[[[["TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1","TK_Soldier_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
				[_r1,_r1,_r0,_r0]]],0.2],
			[[[["TK_Soldier_HAT_EP1","TK_Soldier_HAT_EP1","TK_Soldier_AT_EP1","TK_Soldier_AT_EP1","TK_Soldier_AAT_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
				[_r2,_r1,_r1,_r1,_r0]]],0.2],
			[[[["TK_Soldier_AA_EP1","TK_Soldier_AA_EP1","TK_Soldier_AA_EP1"],[[0,5,0],[3,0,0],[5,0,0]],
				[_r3,_r2,_r2]]],0.2],
			[[[["TK_Soldier_MG_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AMG_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
				[_r1,_r1,_r1,_r0,_r0]]],0.2],
			[[[["TK_Soldier_SniperH_EP1","TK_Soldier_Spotter_EP1"],[[0,5,0],[3,0,0]],
				[_r2,_r2]]],0.05],

			[[[["TK_Soldier_SL_EP1","V3S_Open_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AMG_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
				[_r2,_r1,_r1,_r1,_r1,_r1,_r1,_r1,_r0,_r0]]],0.3],
			[[[["TK_Soldier_SL_EP1","UAZ_MG_TK_EP1","UAZ_AGS30_TK_EP1","TK_Soldier_AT_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],
				[_r2,_r1,_r1,_r1]]],0.3],
			[[[["TK_Soldier_GL_EP1","UAZ_Unarmed_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_EP1"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0]],
				[_r2,_r1,_r1,_r0]]],0.4],

			[[[["TK_Soldier_SL_EP1","BMP2_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AAT_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],
				[_r3,_r3,_r1,_r1,_r1,_r1,_r0,_r0]]],0.7],
			[[[["TK_Soldier_SL_EP1","BTR60_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_LAT_EP1","TK_Soldier_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
				[_r3,_r3,_r2,_r1,_r1,_r0,_r2,_r1,_r1]]],0.9],
			// [[[["TK_Special_Forces_TL_EP1","ACE_BTR70_TK","TK_Special_Forces_MG_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],[3,2,2,2,2,1,1,1,1]]],0],
			[[[["TK_Soldier_SL_EP1","BRDM2_TK_EP1","BRDM2_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_AR_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
				[_r2,_r2,_r2,_r1,_r1,_r1,_r0,_r0]]],0.7],
			[[[["BRDM2_ATGM_TK_EP1","BRDM2_ATGM_TK_EP1"],[[0,10,0],[5,0,0]],
				[_r2,_r2]]],0.7],

			[[[["Ural_ZU23_TK_EP1","TK_Soldier_AA_EP1","TK_Soldier_AA_EP1","TK_Soldier_AA_EP1"], [[10,0],[0,0],[0,10],[0,0]],
				[_r2,_r1,_r1,_r1]]],0.01],
			[[[["TK_Soldier_SL_EP1","M113_TK_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1"], [[0,0],[5,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
				[_r3,_r3,_r2,_r1,_r1,_r1,_r1,_r0,_r0,_r0]]],0.01],
			[[[["TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1","TK_Soldier_Engineer_EP1"], [],
				[_r2,_r1,_r1,_r0]]],0.01],

			[[[["UralReammo_TK_EP1"], [],[_r0]]],0.01],
			[[[["UralRefuel_TK_EP1"], [],[_r0]]],0.01],
			[[[["UralRepair_TK_EP1"], [],[_r0],[["TK_Soldier_Engineer_EP1"]]]],0.01],
			[[[["M113Ambul_TK_EP1"], [],[_r0],[["TK_Soldier_Medic_EP1"]]]],0.01],

			//StaticWeapon
			[[[["AGS_TK_EP1"], [],[_r0]]],0.01],
			[[[["ZU23_TK_EP1"], [],[_r0]]],0.01],
			[[[["KORD_high_TK_EP1"], [],[_r0]]],0.01],
			[[[["KORD_TK_EP1"], [],[_r0]]],0.01],
			[[[["Igla_AA_pod_TK_EP1"], [],[_r0]]],0.01],
			[[[["Metis_TK_EP1"], [],[_r0]]],0.01],
			[[[["SearchLight_TK_EP1"], [],[_r0]]],0.01]

		];

		if (_landing in [1,2,23,24]) then {
			// TK_An2Flight
			// rarityGroup = 0.3;
			[[[["An2_TK_EP1"],[],[_r4]],
				[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1"]]
				],0.3]
		};
		if (_landing in [1,3,23,34]) then {
			_east=_east+[
				[[[["UH1H_TK_EP1","UH1H_TK_EP1"],[[0,15,0],[15,0,0]],[_r4,_r3]]
					],0.15],
				[[[["UH1H_TK_EP1"],[],[_r4]],
					[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1"]]
					],0.15],

				[[[["Mi24_D_TK_EP1"],[],[_r4]]
					],0.15],
				[[[["Mi24_D_TK_EP1"],[],[_r4]],
					[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1"]]
					],0.15],

				[[[["Mi17_TK_EP1","Mi17_TK_EP1"],[[0,15,0],[15,0,0]],[_r4,_r3]]
					],0.15],
				[[[["Mi17_TK_EP1"],[],[_r4]],
					[["TK_Soldier_SL_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1"]]
					],0.15]
			];
		}else{
			_east=_east+[
				// TK_UH1HFlight
				// rarityGroup = 0.3;
				[[[["UH1H_TK_EP1","UH1H_TK_EP1"],[[0,15,0],[15,0,0]],[_r4,_r3]]
					],0.3],
				// TK_Mi24_DFlight
				// rarityGroup = 0.3;
				[[[["Mi24_D_TK_EP1"],[],[_r4]]
					],0.3],
				// TK_Mi_17Flight
				// rarityGroup = 0.3;
				[[[["Mi17_TK_EP1","Mi17_TK_EP1"],[[0,15,0],[15,0,0]],[_r4,_r3]]
					],0.3]
			];
		};


		if(!_woodland)then{
			_east=_east+[
				[[[["TK_Special_Forces_TL_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Special_Forces_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					[_r3,_r2,_r2,_r2,_r1,_r1,_r1]]],0.5]
			];
		};
		if(acex_ru_Avail)then{
			_east=_east+[
				[[[["TK_Soldier_SL_EP1","ACE_BTR70_TK","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_LAT_EP1","TK_Soldier_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					[_r3,_r3,_r2,_r1,_r1,_r0,_r2,_r1,_r1]]],0.9],
				[[[["ZSU_TK_EP1","ACE_BRDM2_SA9_TK"], [[0,0],[10,0]],
					[_r4,_r3]]],0.01]
			];
		}else{
			_east=_east+[
				[[[["ZSU_TK_EP1"], [[0,0],[0,10]],
					[_r3,_r3]]],0.5]
			];
		};
	};

	// BIS_UN
	_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"BIS_UN");
	if(true)then{
		if((!_woodland && gosa_IslandType select 1 >= 1990 && _tmp == -1) or _tmp > 0)then{
			_guer=_guer+[
				[[[["UN_CDF_Soldier_Guard_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,_r1,_r1,_r1]]],0.5],
				[[[["UN_CDF_Soldier_Guard_EP1","UAZ_Unarmed_UN_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_MG_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],
					[_r2,_r1,_r1,_r1]]],0.6],
				[[[["UN_CDF_Soldier_SL_EP1","BMP2_UN_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],
					[_r3,_r3,_r1,_r1,_r1,_r1,_r0,_r0]]],0.5],
				[[[["UN_CDF_Soldier_SL_EP1","M113_UN_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_EP1"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r3,_r3,_r1,_r1,_r1,_r0,_r0]]],0.5],

				[[[["M113Ambul_UN_EP1"], [],[_r0],[["TK_Soldier_Medic_EP1"]]]],0.01],

				//StaticWeapon
				[[[["AGS_UN_EP1"],[],[_r0]]],0.01],
				[[[["KORD_high_UN_EP1"],[],[_r0]]],0.01],
				[[[["KORD_UN_EP1"],[],[_r0]]],0.01],
				[[[["SearchLight_UN_EP1"],[],[_r0]]],0.01]
			];
			if (_landing in [1,3,23,34]) then {
				_guer=_guer+[
					[[[["Mi17_UN_CDF_EP1"],[],[_r4]],
						[["UN_CDF_Soldier_Guard_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1"]]
						],0.1]
				];
			}else{
				_guer=_guer+[
					[[[["Mi17_UN_CDF_EP1"],[],[_r4]]
						],0.1]
				];
			};
			if(acex_ru_Avail)then{
				_guer=_guer+[
					[[[["UN_CDF_Soldier_SL_EP1","ACE_BTR70_UN","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_MG_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_EP1"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
						[_r3,_r3,_r1,_r1,_r1,_r0,_r0,_r0]]],0.5]
				];
			};
		};
	};

	// BIS_TK_GUE
	_f_multi_bis_tk_gue = missionNamespace getVariable ("gosa_faction_multiplier_"+"BIS_TK_GUE");
	if(true)then{
		if((!_woodland && gosa_IslandType select 1 >= 1990 && _f_multi_bis_tk_gue == -1) or _f_multi_bis_tk_gue > 0)then{
			_guer=_guer+[
				[[[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_5_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_5_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
					[_r2,_r1,_r1,_r1,_r1,_r1,_r0,_r0,_r0,_r0]]],0.7],
				[[[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_4_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r2,_r1,_r1,_r1,_r1,_r0]]],0.5],
				[[[["TK_GUE_Soldier_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_2_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r1,_r1,_r0,_r0]]],0.2],
				[[[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AAT_EP1"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					[_r2,_r1,_r1,_r0]]],0.2],
				[[[["TK_GUE_Soldier_AA_EP1","TK_GUE_Soldier_AA_EP1","TK_GUE_Soldier_AA_EP1"],[[0,5,0],[3,0,0],[5,0,0]],
					[_r2,_r1,_r1]]],0.2],
				[[[["TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1"],[[0,5,0],[3,0,0]],
					[_r2,_r2]]],0.05],
				[[[["TK_GUE_Soldier_TL_EP1","Offroad_DSHKM_TK_GUE_EP1","Offroad_SPG9_TK_GUE_EP1","Pickup_PK_TK_GUE_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[-5,-14,0],[5,0,0],[7,0,0]],
					[_r2,_r1,_r1,_r1,_r1,_r0]]],0.5],
				[[[["TK_GUE_Soldier_TL_EP1","V3S_TK_GUE_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_3_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0],[25,0,0],[27,0,0]],
					[_r2,_r1,_r1,_r1,_r1,_r1,_r1,_r0,_r0,_r0,_r0,_r0,_r0,_r0]]
					],0.5],
				[[[["TK_GUE_Soldier_TL_EP1","BTR40_MG_TK_GUE_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_2_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					[_r2,_r2,_r1,_r1,_r1,_r0,_r0]]],0.5],
				[[[["TK_GUE_Soldier_4_EP1","BRDM2_TK_GUE_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_AT_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],
					[_r2,_r1,_r1,_r1]]],0.5],
				[[[["TK_GUE_Soldier_TL_EP1","BTR40_MG_TK_GUE_EP1","BTR40_MG_TK_GUE_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
					[_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0,_r0]]],0.5],
				[[[["T55_TK_GUE_EP1","T55_TK_GUE_EP1"],[[0,10,0],[5,0,0]],[_r4,_r3]]],0.02],
				[[[["T34_TK_GUE_EP1","T34_TK_GUE_EP1"],[[0,10,0],[5,0,0]],[_r4,_r3]]],0.01],
				[[[["TK_GUE_Soldier_TL_EP1","BTR40_TK_GUE_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_2_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
					[_r3,_r2,_r1,_r1,_r1,_r1,_r0,_r0]]],0.01],

				[[[["V3S_Reammo_TK_GUE_EP1"], [],[_r0]]],0.01],
				[[[["V3S_Refuel_TK_GUE_EP1"], [],[_r0]]],0.01],
				[[[["V3S_Repair_TK_GUE_EP1"], [],[_r0]]],0.01],

				//StaticWeapon
				[[[["AGS_TK_GUE_EP1"],[],[_r0]]],0.01],
				[[[["DSHKM_TK_GUE_EP1"],[],[_r0]]],0.01],
				[[[["DSHkM_Mini_TriPod_TK_GUE_EP1"],[],[_r0]]],0.01],
				[[[["ZU23_TK_GUE_EP1"],[],[_r0]]],0.01],
				[[[["SearchLight_TK_GUE_EP1"],[],[_r0]]],0.01],
				[[[["SPG9_TK_GUE_EP1"],[],[_r0]]],0.01]

			];
			if (_landing in [1,3,23,34]) then {
				_guer=_guer+[
					[[[["UH1H_TK_GUE_EP1"],[],[_r4]]
						],0.15],
					[[[["UH1H_TK_GUE_EP1"],[],[_r4]],
						[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_4_EP1"]]
						],0.15]
				];
			}else{
				_guer=_guer+[
					[[[["UH1H_TK_GUE_EP1"],[],[_r4]]
						],0.3]
				];
			};
		};
	};

	// PMC_BAF
	_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"PMC_BAF");
	if(_tmp > 0 or (gosa_IslandType select 1 >= 1990 && _tmp == -1))then{
		_guer=_guer+[
			[[[["Soldier_TL_PMC",
				"M113_PMC","Soldier_Sniper_KSVK_PMC",
				"Soldier_AT_PMC","Soldier_MG_PMC",
				"Soldier_MG_PKM_PMC","Soldier_GL_PMC",
				"Soldier_GL_M16A2_PMC","Soldier_PMC",
				"Soldier_PMC"], [[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
				[_r3,
				_r3,_r2,
				_r1,_r1,
				_r1,_r1,
				_r0,_r0,
				_r0]]],0.01],
			// [[[["Soldier_TL_PMC","Soldier_Bodyguard_AA12_PMC","Soldier_Bodyguard_M4_PMC"],[[0,5,0],[3,0,0],[5,0,0]],[3,1,1]]],0.5],
			[[[["Soldier_GL_PMC","Soldier_GL_M16A2_PMC","Soldier_M4A3_PMC","Soldier_M4A3_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
				[_r1,_r1,_r0,_r0]]],0.5],
			[[[["Soldier_TL_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_MG_PMC","Soldier_GL_PMC","Soldier_M4A3_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
				[_r3,_r2,_r2,_r1,_r1,_r0]]],0.5],
			[[[["Soldier_TL_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_MG_PMC","Soldier_MG_PKM_PMC","Soldier_GL_PMC","Soldier_GL_M16A2_PMC","Soldier_M4A3_PMC","Soldier_PMC","Soldier_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
				[_r3,_r2,_r2,_r2,_r1,_r1,_r1,_r0,_r0,_r0]]],0.5],
			[[[["Soldier_TL_PMC","Soldier_Sniper_KSVK_PMC","Soldier_AT_PMC","Soldier_MG_PMC","Soldier_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
				[_r3,_r2,_r2,_r1,_r0]]],0.5],
			[[[["Soldier_GL_M16A2_PMC","Soldier_GL_PMC","Soldier_Engineer_PMC","Soldier_Medic_PMC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
				[_r2,_r1,_r1,_r2]]],0.5],
			// [[[["Soldier_Bodyguard_M4_PMC","SUV_PMC","Soldier_Bodyguard_AA12_PMC"],[[3,5,0],[-5,0,0],[5,0,0]],[2,1,1]]],0.4],
			// [[[["Soldier_TL_PMC","SUV_PMC","SUV_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_Bodyguard_AA12_PMC","Soldier_GL_PMC","Soldier_M4A3_PMC"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],[3,2,2,2,1,1,0,0]]],0.3],
			[[[["Soldier_TL_PMC","ArmoredSUV_PMC","ArmoredSUV_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_MG_PKM_PMC","Soldier_GL_PMC","Soldier_GL_PMC"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
				[_r3,_r2,_r2,_r2,_r1,_r1,_r0,_r0]]],0.2],
			[[[["Ka137_MG_PMC"], [],[_r3]]],0.01],
			[[[["Soldier_AA_PMC","Soldier_AA_PMC"], [],[_r1,_r0]]],0.2]
			// [[[["TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_EP1","TK_Soldier_Engineer_EP1"], [],[2,1,1,0]]],0.01]
		];
		if (_landing in [1,3,23,34]) then {
			_guer=_guer+[
				[[[["Ka60_GL_PMC"],[],[_r3]]
					],0.05],
				[[[["Ka60_GL_PMC"],[],[_r3]],
					[["Soldier_TL_PMC","Soldier_Sniper_PMC","Soldier_AT_PMC","Soldier_MG_PMC","Soldier_MG_PKM_PMC","Soldier_GL_PMC","Soldier_GL_M16A2_PMC","Soldier_M4A3_PMC"]]
					],0.05]
			];
		}else{
			_guer=_guer+[
				[[[["Ka60_GL_PMC"],[],[_r3]]
					],0.1]
			];
		};
	};

	// ACR
	_mod_acr = (configName(configFile >> "CfgMods" >> "ACR") != "");
	_f_multi_bis_cz = missionNamespace getVariable ("gosa_faction_multiplier_"+"BIS_CZ");
	if(true)then{
		if(_f_multi_bis_cz > 0 or (gosa_IslandType select 1 >= 1990 && _f_multi_bis_cz == -1))then{
			//-- Юниты обычные (пустыня).
				// Если стандартные настройки и карта пустыня.
				// Если включено и нет ACR лес.
			if(!_woodland or (_f_multi_bis_cz > 0 && !_mod_acr))then{
				_west=_west+[
					[[[["CZ_Special_Forces_TL_DES_EP1","CZ_Special_Forces_MG_DES_EP1","CZ_Special_Forces_GL_DES_EP1","CZ_Special_Forces_DES_EP1","CZ_Special_Forces_DES_EP1","CZ_Special_Forces_Scout_DES_EP1"],[],
						[_r3,_r2,_r2,_r1,_r1,_r1]]],0.1],
					[[[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1"],[],
						[_r3,_r2,_r1,_r1]]],0.5],

					[[[["CZ_Soldier_SL_DES_EP1","LandRover_CZ_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_DES_EP1"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],
						[_r2,_r2,_r1,_r1]]],0.6],
					// FIXME: 0?
					[[[["CZ_Special_Forces_TL_DES_EP1","LandRover_Special_CZ_EP1","CZ_Special_Forces_GL_DES_EP1"],[[3,5,0],[-5,0,0],[5,0,0]],
						[_r2,_r2,_r1]]],0],
					[[[["CZ_Special_Forces_TL_DES_EP1","ATV_CZ_EP1","ATV_CZ_EP1","CZ_Special_Forces_Scout_DES_EP1"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],
						[_r2,_r1,_r1,_r1]]],0],

					//StaticWeapon
					[[[["AGS_CZ_EP1"], [],[_r0]]],0.01],
					[[[["DSHKM_CZ_EP1"], [],[_r0]]],0.01]
				];
				if (_landing in [1,3,23,34]) then {
					_west=_west+[
						[[[["Mi171Sh_CZ_EP1","Mi171Sh_CZ_EP1"],[[0,15,0],[15,0,0]],[_r4,_r3]]
							],0.15],
						[[[["Mi171Sh_CZ_EP1"],[],[_r4,_r3]],
							[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1","CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1"]]
							],0.15],
						[[[["Mi171Sh_rockets_CZ_EP1"],[],[_r4]]
							],0.15],
						[[[["Mi171Sh_rockets_CZ_EP1"],[],[_r4]],
							[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1","CZ_Soldier_SL_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_AT_DES_EP1","CZ_Soldier_AMG_DES_EP1"]]
							],0.15]
					];
				}else{
					_west=_west+[
						// ACR_Mi171ShFlight
						// rarityGroup = 0.3;
						[[[["Mi171Sh_CZ_EP1","Mi171Sh_CZ_EP1"],[[0,15,0],[15,0,0]],[_r4,_r3]]
							],0.3],
						// ACR_Mi171Sh_RocketsFlight
						// rarityGroup = 0.3;
						[[[["Mi171Sh_rockets_CZ_EP1"],[],[_r4]]
							],0.3]
					];
				};
			};
		};
	};

};

// ACR
if(_mod_acr)then{
	if(_f_multi_bis_cz > 0 or (gosa_IslandType select 1 >= 1990 && _f_multi_bis_cz == -1))then{
		if(_deserted)then{
			_west=_west+[
				[[[["Mi24_D_CZ_ACR"], [],
					[_r4]],[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"]]
					],0.01],
				[[[["Mi171Sh_CZ_EP1"], [],
					[_r4]],[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"]]
					],0.01],
				[[[["Mi171Sh_rockets_CZ_EP1"], [],
					[_r4]],[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"]]
					],0.01],

				[[[["CZ_Soldier_SL_DES_EP1","CZ_Soldier_805g_Dst_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"],[],
					[_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0]]],0.5],

				[[[["CZ_Soldier_SL_DES_EP1","BMP2_Des_ACR","CZ_Soldier_MG_DES_EP1","CZ_Sharpshooter_DES_ACR","CZ_Soldier_RPG_Dst_ACR","CZ_Soldier_RPG_Ass_Dst_ACR","CZ_Soldier_medik_DES_EP1"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r3,_r3,_r2,_r1,_r1,_r0,_r0]]],0.6],
				[[[["CZ_Soldier_805g_Dst_ACR","Dingo_DST_ACR","CZ_Soldier_MG2_Dst_ACR","CZ_Soldier805_DES_ACR","CZ_Soldier_RPG_Dst_ACR"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					[_r3,_r2,_r2,_r1,_r1,_r0]]],0.4],

				[[[["T810Reammo_Des_ACR"], [],[_r0]]],0.01],
				[[[["T810Refuel_Des_ACR"], [],[_r0]]],0.01],
				[[[["T810Repair_Des_ACR"], [],[_r0],[["CZ_Soldier_Engineer_Dst_ACR"]]]],0.01],
				[[[["HMMWV_Ambulance_CZ_DES_EP1"], [],[_r0],[["CZ_Soldier_medik_DES_EP1"]]]],0.01],
				[[[["LandRover_Ambulance_Des_ACR"], [],[_r0],[["CZ_Soldier_medik_DES_EP1"]]]],0.01],
				//StaticWeapon
				[[[["Rbs70_ACR"], [],[_r0]]],0.01]

			];
			if(_f_multi_bis_tk_gue > 0 or _f_multi_bis_tk_gue == -1)then{
				_guer=_guer+[
					[[[["TK_GUE_Soldier_TL_EP1","BVP1_TK_GUE_ACR","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_2_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
						[_r3,_r3,_r1,_r1,_r1,_r1,_r0,_r0]]],0.01]
				];
			};
		}else{
			_west=_west+[
				[[[["Mi24_D_CZ_ACR"], [],
					[_r4]],[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_805g_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"]]
					],0.01],
				[[[["Mi171Sh_CZ_EP1"], [],
					[_r4]],[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_805g_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"]]
					],0.01],
				[[[["Mi171Sh_rockets_CZ_EP1"], [],
					[_r4]],[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_805g_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"]]
					],0.01],

				[[[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_805g_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[],
					[_r3,_r2,_r2,_r1,_r1,_r1,_r0,_r0]]],0.5],
				[[[["CZ_Soldier_Leader_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Soldier_Engineer_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[],
					[_r3,_r2,_r1,_r1,_r0,_r0]]],0.5],

				[[[["CZ_Soldier_Leader_Wdl_ACR",
					"BMP2_ACR","CZ_Soldier_MG_Wdl_ACR",
					"CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR",
					"CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
					[_r3,
					_r3,_r2,
					_r1,_r1,
					_r0,_r0]]],0.01],
				[[[["CZ_Soldier_Leader_Wdl_ACR","Pandur2_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[15,0,0]],
					[_r3,_r3,_r2,_r1,_r1,_r1,_r0,_r0]]],0.9],
				[[[["CZ_Soldier_805g_Wdl_ACR","Dingo_WDL_ACR","CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],
					[_r3,_r2,_r2,_r1,_r1,_r0]]],0.6],

				[[[["T72_ACR","T72_ACR"], [[0,0],[10,0]],[_r4,_r3]]],0.01],

				[[[["CZ_Soldier_Leader_Wdl_ACR",
					"T810A_MG_ACR","CZ_Soldier_805g_Wdl_ACR",
					"CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR",
					"CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR",
					"CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[],
					[_r3,
					_r0,_r2,
					_r2,_r1,
					_r1,_r1,
					_r0,_r0]]],0.01],
				[[[["CZ_Soldier_Leader_Wdl_ACR",
					"T810_ACR","CZ_Soldier_805g_Wdl_ACR",
					"CZ_Soldier_MG2_Wdl_ACR","CZ_Soldier_805_Wdl_ACR",
					"CZ_Sharpshooter_Wdl_ACR","CZ_Soldier_RPG_Wdl_ACR",
					"CZ_Soldier_RPG_Ass_Wdl_ACR","CZ_Soldier_Medic_Wdl_ACR"],[],
					[_r3,
					_r0,_r2,
					_r2,_r1,
					_r1,_r1,
					_r0,_r0]]],0.01],

				[[[["T810Reammo_ACR"], [],[_r0]]],0.01],
				[[[["T810Refuel_ACR"], [],[_r0]]],0.01],
				[[[["T810Repair_ACR"], [],[_r0],[["CZ_Soldier_Engineer_Wdl_ACR"]]]],0.01],
				[[[["LandRover_Ambulance_ACR"], [],[_r0],[["CZ_Soldier_Medic_Wdl_ACR"]]]],0.01]
			];
		};
		_west=_west+[
			[[[["L159_ACR","L159_ACR"], [[0,0],[15,0]],[_r4,_r3]]],0.01],
			[[[["L39_2_ACR"], [],[_r3]]],0.01]
		];
		if(_f_multi_bis_tk > 0 or _f_multi_bis_tk == -1)then{
			_east=_east+[
				[[[["TK_Soldier_SL_EP1","BVP1_TK_ACR","TK_Soldier_MG_EP1","TK_Soldier_GL_EP1","TK_Soldier_AT_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AAT_EP1"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
					[_r3,_r3,_r1,_r1,_r1,_r1,_r0,_r0]]],0.01]
			];
		};
	};
};

// dir\server\
#include "config_groups_OFrP.sqf"
#include "config_groups_vme_pla.sqf"

_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"unfinished");
if(_tmp > 0 or (gosa_IslandType select 1 >= 1990 && _tmp == -1))then{
// BWMod
if((configName(LIB_cfgVeh >> "BWMod_SquadLeaderG") != "") && true)then{
	if(_deserted)then{
		_west=_west+[
			[[[["BWMod_UH1D"], [],
				[_r3]],[["BWMod_SquadLeaderG_Desert","BWMod_RiflemanG_Desert","BWMod_RiflemanG_Desert","BWMod_MedicG_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_ATSoldierG_Desert","BWMod_AASoldierG_Desert"]]
				],0.02],
			[[[["BWMod_SquadLeaderG_Desert","BWMod_RiflemanG_Desert","BWMod_RiflemanG_Desert","BWMod_MedicG_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_ATSoldierG_Desert","BWMod_AASoldierG_Desert"],[],
				[_r3,_r1,_r1,_r1,_r1,_r1,_r1,_r1]]],0.4],
			[[[["BWMod_SquadLeaderG_Desert","BWMod_RiflemanG_Desert","BWMod_MedicG_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_ATSoldierG_Desert","BWMod_Marder_1A5_Desert"],[[0,0,0],[4,0,0],[6,0,0],[0,-2,0],[2,-2,0],[4,-2,0],[-2,-1,0]],
				[_r3,_r1,_r1,_r1,_r1,_r1,_r1]]],0.4],
			[[[["BWMod_Leopard_2A6_Desert","BWMod_Leopard_2A6_Desert","BWMod_Leopard_2A6_Desert","BWMod_Leopard_2A6_Desert"],[[0,0,0],[5,0,0],[10,0,0],[15,0,0]],
				[_r4,_r3,_r3,_r3]]],0.35],
			[[[["BWMod_Wiesel2_Ozelot_Desert"], [],[_r3]]],0.02],
			[[[["BWMod_SquadLeaderG_Desert","BWMod_Fuchs_ArmoredTurret_Desert","BWMod_RiflemanG_Desert","BWMod_RiflemanG_Desert","BWMod_MedicG_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_MGunnerG_MG4_Desert","BWMod_ATSoldierG_Desert","BWMod_AASoldierG_Desert"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
				[_r3,_r3,_r1,_r1,_r1,_r1,_r1,_r1,_r1]]],0.3]
		];
	}else{
		_west=_west+[
			[[[["BWMod_UH1D"], [],
				[_r3]],[["BWMod_SquadLeaderG","BWMod_RiflemanG","BWMod_RiflemanG","BWMod_MedicG","BWMod_MGunnerG_MG4","BWMod_MGunnerG_MG4","BWMod_ATSoldierG","BWMod_AASoldierG"]]
				],0.02],
			[[[["BWMod_SquadLeaderG","BWMod_RiflemanG","BWMod_RiflemanG","BWMod_MedicG","BWMod_MGunnerG_MG4","BWMod_MGunnerG_MG4","BWMod_ATSoldierG","BWMod_AASoldierG"],[],
				[_r3,_r1,_r1,_r1,_r1,_r1,_r1,_r1]]],0.4],
			[[[["BWMod_SquadLeaderG","BWMod_RiflemanG","BWMod_MedicG","BWMod_MGunnerG_MG4","BWMod_MGunnerG_MG4","BWMod_ATSoldierG","BWMod_Marder_1A5"],[[0,0,0],[4,0,0],[6,0,0],[0,-2,0],[2,-2,0],[4,-2,0],[-2,-1,0]],
				[_r3,_r1,_r1,_r1,_r1,_r1,_r1]]],0.4],
			[[[["BWMod_Leopard_2A6","BWMod_Leopard_2A6","BWMod_Leopard_2A6","BWMod_Leopard_2A6"],[[0,0,0],[5,0,0],[10,0,0],[15,0,0]],
				[_r4,_r3,_r3,_r3]]],0.35],
			[[[["BWMod_Wiesel2_Ozelot"], [],[_r3]]],0.02],
			[[[["BWMod_SquadLeaderG","BWMod_Fuchs_ArmoredTurret","BWMod_RiflemanG","BWMod_RiflemanG","BWMod_MedicG","BWMod_MGunnerG_MG4","BWMod_MGunnerG_MG4","BWMod_ATSoldierG","BWMod_AASoldierG"], [[0,0],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],
				[_r3,_r3,_r1,_r1,_r1,_r1,_r1,_r1,_r1]]],0.3]
		];
	};
};

// sfp
if(configName(LIB_cfgVeh >> "sfp_m90w_squadleader_ak5_m203") != "")then{
	if(!_deserted)then{
		_west=_west+[
			[[[["sfp_m90w_teamleader_ak5_m203","sfp_m90w_mg_ksp58","sfp_m90w_automaticrifleman_ksp90","sfp_m90w_at_grg","sfp_m90w_rifleman_pskott","sfp_m90w_rifleman_ak5","sfp_strf90c"], [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[10,0]],
				[_r3,_r1,_r1,_r1,_r1,_r0,_r3]]],0.4],
			[[[["sfp_m90w_sniper_psg90","sfp_m90w_rifleman_spotter"], [],
				[_r2,_r2]]],0.01],
			[[[["sfp_m90w_squadleader_ak5_m203","sfp_m90w_automaticrifleman_ksp90","sfp_m90w_mg_ksp58","sfp_m90w_at_grg","sfp_m90w_rifleman_pskott","sfp_m90w_rifleman_ak5","sfp_m90w_rifleman_ak5","sfp_m90w_marksman_ak5c","sfp_m90w_medic_ak5"], [],
				[_r3,_r1,_r1,_r1,_r1,_r1,_r1,_r1,_r1]]],0.4]
		];
	};
	if(!_woodland)then{
		_west=_west+[
			[[[["sfp_m90d_squadleader_ak5_m203","sfp_m90d_rifleman_ak5","sfp_m90d_rifleman_ak5","sfp_m90d_mg_ksp58","sfp_m90d_automaticrifleman_ksp90","sfp_m90d_at_grg","sfp_m90d_at_grg","sfp_m90d_marksman_ak5c","sfp_m90d_medic_ak5"],[],
				[_r3,_r1,_r1,_r1,_r1,_r1,_r1,_r1,_r1]]],0.4]
		];
	};
};

// ACEX_PLA
if(configName(LIB_cfgVeh >> "PLA_Soldier_SL") != "")then{
	_guer=_guer+[
		[[[["PLA_Soldier_SL","PLA_Soldier_GL","PLA_Soldier_AR","PLA_Soldier","PLA_Soldier_LAT","PLA_Soldier_Medic","PLA_Soldier","PLA_Soldier_TL","PLA_Soldier_MG"],[],
			[_r2,_r1,_r1,_r0,_r0,_r0,_r0,_r2,_r1]]],0.8],
		[[[["PLA_Soldier_TL","PLA_Soldier_GL","PLA_Soldier_MG","PLA_Soldier_LAT","PLA_Soldier_AR","PLA_Soldier_MG","PLA_Soldier_AT","PLA_Soldier_Sniper","PLA_Soldier"],[],
			[_r2,_r1,_r1,_r0,_r0,_r0,_r0,_r0,_r0]]],0.6],
		[[[["PLA_Soldier_GL","PLA_Soldier_MG","PLA_Soldier_AT","PLA_Soldier_MG","PLA_Soldier_Sniper","PLA_Soldier_LAT"],[],
			[_r2,_r1,_r1,_r0,_r0,_r0]]],0.9],
		[[[["PLA_Soldier_TL","PLA_Soldier_MG","PLA_Soldier_AT","PLA_Soldier_GL"],[],
			[_r1,_r1,_r0,_r0]]],0.9],
		[[[["PLA_Soldier_TL","PLA_Soldier_AR","PLA_Soldier_GL","PLA_Soldier_LAT"],[],
			[_r1,_r1,_r0,_r0]]],0.9],
		[[[["PLA_Soldier_TL","PLA_Soldier_AT","PLA_Soldier_MG","PLA_Soldier_HAT"],[],
			[_r1,_r1,_r0,_r0]]],0.8],
		[[[["PLA_Soldier_TL","PLA_Soldier_AA","PLA_Soldier_AA","PLA_Soldier_AR"],[],
			[_r1,_r1,_r0,_r0]]],0.2],
		[[[["PLA_SoldierS_Spotter","PLA_SoldierS_Sniper"],[],
			[_r2,_r1]]],0.8],
		[[[["PLA_Soldier2","PLA_SoldierM_Marksman","PLA_Soldier_Sniper","PLA_Soldier_AA","PLA_Soldier_HAT","PLA_SoldierS_SniperH"],[],
			[_r2,_r1,_r1,_r0,_r0,_r0]]],0.5],

		[[[["PLA_Soldier_SL","BW_MG","BW_MG","BW_MG","PLA_Soldier_MG","PLA_Soldier_Medic","PLA_Soldier_Sniper","PLA_Soldier_AR","PLA_Soldier_Sniper"],[[0,5,0],[-5,0,0],[-5,-7,0],[-5,-14,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
			[_r2,_r1,_r1,_r1,_r1,_r0,_r0,_r0,_r0]]],0.25],
		[[[["PLA_Soldier_SL","DF_Base","PLA_Soldier_GL","PLA_Soldier","PLA_Soldier_LAT","PLA_Soldier_AR","PLA_Soldier_MG","PLA_Soldier_MG","PLA_Soldier","PLA_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
			[_r2,_r1,_r1,_r1,_r1,_r0,_r0,_r0,_r0,_r0]]],0.2],
		[[[["PLA_Soldier_AR","ZSL92","PLA_Soldier_GL","PLA_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],
			[_r1,_r1,_r0,_r0]]],0.1],
		[[[["PLA_Soldier_SL","ZSL92G","PLA_Soldier_MG","PLA_Soldier_GL","PLA_Soldier","PLA_Soldier_AR","PLA_Soldier_Sniper","PLA_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
			[_r2,_r1,_r1,_r1,_r1,_r0,_r0,_r0]]],0.05],
		[[[["PLA_Soldier_SL","ZSL92C","PLA_Soldier_MG","PLA_Soldier_GL","PLA_Soldier","PLA_Soldier_AR","PLA_Soldier_Sniper","PLA_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
			[_r2,_r1,_r1,_r1,_r1,_r0,_r0,_r0]]],0.05],

		[[[["fromz_ztz99","fromz_ztz99","fromz_ztz99","fromz_ztz99"],[[0,10,0],[5,0,0],[5,10,0],[5,20,0]],
			[_r2,_r1,_r2,_r1]]],0.01],

		[[[["oh2_z9a"],[],
			[_r2]],[["PLA_Soldier_GL","PLA_Soldier_MG","PLA_Soldier_AT","PLA_Soldier_MG","PLA_Soldier_Sniper","PLA_Soldier_LAT"]]
			],0.1],
		[[[["oh2_z9w"],[],[_r2]]],0.1]
	];
};

// @NC
if(configName(LIB_cfgVeh >> "nac_soldier_leader") != "")then{
	_guer=_guer+[
		[[[["nac_soldier_leader","nac_soldier_er7_att","nac_soldier_er7","nac_soldier_mg","nac_soldier_sniper2","nac_soldier_LAT","nac_soldier_gl","nac_soldier_medik","nac_soldier_2"
			], [],[_r3,_r2,_r2,_r2,_r2,_r1,_r1,_r1,_r1]]],0.3]
	];
};
}; // unfinished

// @fdf_mod
if(configName(LIB_cfgVeh >> "FDF_M05_FRDF_NCO") != "")then{
	_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"FDF");
	if ((_tmp == -1 && (gosa_IslandType select 0) >= 150 && (gosa_IslandType select 0) < 250)
		or _tmp > 0) then
	{
		if ((gosa_IslandType select 1 >= 1990 && _tmp == -1) or _tmp > 0) then {
			#define __FDF_M05_Jaeger_Squad [[[["FDF_M05_Jaeger_NCO","FDF_M05_Jaeger_MG","FDF_M05_Jaeger_MG_Asst","FDF_M05_Jaeger_AT","FDF_M05_Jaeger_AT","FDF_M05_Jaeger","FDF_M05_Jaeger_Asst_Squad_Leader"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL"]]],0.7]
			_guer=_guer+[
				// FDF_M05_Jaeger_Plt_HQ_Team"
				[[[["FDF_M05_Jaeger_Officer",
					"FDF_M05_Jaeger_NCO","FDF_M05_Jaeger_Medic",
					"FDF_M05_Jaeger"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE"]]
					],0.7],
				// FDF_M05_Jaeger_Squad"
				__FDF_M05_Jaeger_Squad,
				// FDF_M05_Jaeger_AT_Team"
				[[[["FDF_M05_Jaeger_HeavyAT","FDF_M05_Jaeger_HeavyAT","FDF_M05_Jaeger_HeavyAT"],[[0,5,0],[3,0,0],[5,0,0]],
					["CORPORAL","PRIVATE","PRIVATE"]]
					],0.7],

				// FDF_M05_Sniper_Team"
				[[[["FDF_Sniper","FDF_Spotter"],[[0,5,0],[3,0,0]],
					["CORPORAL","PRIVATE"]]
					],0.7],

				// FDF_M05_RDF_Plt_HQ_Team"
				[[[["FDF_M05_FRDF_Officer",
					"FDF_M05_FRDF_NCO","FDF_M05_FRDF_Medic",
					"FDF_M05_FRDF_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE"]]
					],0.7],
				// FDF_M05_RDF_Squad"
				[[[["FDF_M05_FRDF_NCO",
					"FDF_M05_FRDF_MG","FDF_M05_FRDF_MG_Asst",
					"FDF_M05_FRDF_Soldier_AT","FDF_M05_FRDF_Soldier_AT",
					"FDF_M05_FRDF_Soldier","FDF_M05_FRDF_Asst_Squad_Leader"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					["SERGEANT",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE","CORPORAL"]]
					],0.7],
				// FDF_M05_RDF_AT_team"
				[[[["FDF_M05_FRDF_Soldier_HeavyAT",
					"FDF_M05_FRDF_Soldier_HeavyAT","FDF_M05_FRDF_Soldier_HeavyAT"],[[0,5,0],[3,0,0],[5,0,0]],
					["CORPORAL","PRIVATE","PRIVATE"]]
					],0.7],

				// FDF_SJ_Assault_Team"
				[[[["FDF_SJ_Assault",
					"FDF_SJ_Breach","FDF_SJ_Assault",
					"FDF_SJ_Assault"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
					],0.7],
				// FDF_SJ_M05_Team"
				[[[["FDF_SJ_M05","FDF_SJ_M05","FDF_SJ_M05","FDF_SJ_M05"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],
					["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
					],0.7],

				// FDF_AMV_M05_Jaeger_Squad"
				[[[["FDF_M05_Jaeger_NCO",
					"FDF_AMV_M2","FDF_M05_Jaeger_MG",
					"FDF_M05_Jaeger_MG_Asst","FDF_M05_Jaeger_AT",
					"FDF_M05_Jaeger_AT","FDF_M05_Jaeger",
					"FDF_M05_Jaeger_Asst_Squad_Leader"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					["SERGEANT",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"CORPORAL"],[],0]
					],0.7],
				// FDF_AMV_M05_RDF_Squad"
				[[[["FDF_M05_FRDF_NCO",
					"FDF_AMV_M2","FDF_M05_FRDF_MG",
					"FDF_M05_FRDF_MG_Asst","FDF_M05_FRDF_Soldier_AT",
					"FDF_M05_FRDF_Soldier_AT","FDF_M05_FRDF_Soldier",
					"FDF_M05_FRDF_Asst_Squad_Leader"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					["SERGEANT",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"CORPORAL"],[],0]
					],0.7],
				// FDF_IFV_M05_Jaeger_Squad"
				[[[["FDF_M05_Jaeger_NCO",
					"FDF_BMP2","FDF_M05_Jaeger_MG",
					"FDF_M05_Jaeger_MG_Asst","FDF_M05_Jaeger_HeavyAT",
					"FDF_M05_Jaeger_HeavyAT","FDF_M05_Jaeger_Marksman",
					"FDF_M05_Jaeger_Asst_Squad_Leader"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],
					["SERGEANT",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"PRIVATE","PRIVATE",
					"CORPORAL"],[],0]
					],0.7],

				// FDF_Leopard2A4_Platoon
				[[[["FDF_leopard2a4","FDF_leopard2a4","FDF_leopard2a4","FDF_leopard2a4"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],
					["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT"]]
					],0.05],
				// FDF_T72M1_Platoon
				[[[["FDF_T72M1","FDF_T72M1","FDF_T72M1"],[[0,10,0],[5,0,0],[10,0,0]],
					["LIEUTENANT","SERGEANT","SERGEANT"]]
					],0.05],

				[[[["FDF_F18C","FDF_F18C"],[[0,20,0],[20,0,0]],[_r4,_r3]]
					],0.01],
				[[[["FDF_NH90_MG3"],[],[_r4]]
					],0.01]
			];
			if (_landing in [1,3,23,34]) then {
				_guer=_guer+[
					[[[["FDF_NH90"],[],[_r4]], __FDF_M05_Jaeger_Squad
						],0.01]
				];
			};
		};
	};
};

// @I44
// TODO: Баланс.
// [I44] US
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"I44_A");
if ((gosa_IslandType select 1 < 1950 && _tmp == -1) or _tmp > 0) then {
	if (gosa_IslandType select 0 >= 150) then {
		// [I44] US
		_west=_west+[
			// I44_A_PltnHQ
			[[[["I44_Man_A_Army_CO_M1Carbine","I44_Man_A_Army_NCO_M1A1Thompson","I44_Man_A_Army_M1918A2","I44_Man_A_Army_M1Garand","I44_Man_A_Army_RTO_M1Carbine"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r3,_r2,_r1,_r0,_r0]]],0.01],
			// I44_A_Assault
			[[[["I44_Man_A_Army_NCO_M1A1Thompson","I44_Man_A_Army_M3Greasegun","I44_Man_A_Army_M1Garand_M7","I44_Man_A_Army_M1Carbine","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1A1Thompson","I44_Man_A_Army_M1A1Thompson"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_BAR
			[[[["I44_Man_A_Army_NCO_M1A1Thompson","I44_Man_A_Army_M1918A2","I44_Man_A_Army_M1Carbine","I44_Man_A_Army_M1Garand_M7","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1918A2","I44_Man_A_Army_M1Garand"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Rifle
			[[[["I44_Man_A_Army_NCO_M1Carbine","I44_Man_A_Army_M1Garand_M7","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1A1Thompson","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1903A3"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Recon
			[[[["I44_Man_A_Army_NCO_M1A1Thompson","I44_Man_A_Army_M1Carbine","I44_Man_A_Army_M1A1Thompson","I44_Man_A_Army_M1A1Thompson"],[[0,2,0],[0,0,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_A_Bazooka
			[[[["I44_Man_A_Army_M1Carbine","I44_Man_A_Army_M1A1Bazooka","I44_Man_A_Army_ATCrew_M3"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_A_MG
			[[[["I44_Man_A_Army_M1Carbine","I44_Man_A_Army_M1919A4","I44_Man_A_Army_MGCrew_AG"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_A_Engr
			[[[["I44_Man_A_Army_NCO_M1A1Thompson","I44_Man_A_Army_Engr_M37DemoKit","I44_Man_A_Army_Engr_M1Mine"],[[0,2,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0]]],0.01],
			// I44_A_Army_Ranger_PltnHQ
			[[[["I44_Man_A_Army_Ranger_CO_M1Carbine","I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Man_A_Army_Ranger_M1918A2","I44_Man_A_Army_Ranger_M1Garand","I44_Man_A_Army_Ranger_RTO_M1Carbine"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r3,_r2,_r1,_r0,_r0]]],0.01],
			// I44_A_Army_Ranger_Assault
			[[[["I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Man_A_Army_Ranger_M3Greasegun","I44_Man_A_Army_Ranger_M1Garand_M7","I44_Man_A_Army_Ranger_M1Carbine","I44_Man_A_Army_Ranger_M1Garand","I44_Man_A_Army_Ranger_M1A1Thompson","I44_Man_A_Army_Ranger_M1A1Thompson"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Ranger_BAR
			[[[["I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Man_A_Army_Ranger_M1918A2","I44_Man_A_Army_Ranger_M1Carbine","I44_Man_A_Army_Ranger_M1Garand_M7","I44_Man_A_Army_Ranger_M1Garand","I44_Man_A_Army_Ranger_M1918A2","I44_Man_A_Army_Ranger_M1Garand"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Ranger_Rifle
			[[[["I44_Man_A_Army_Ranger_NCO_M1Carbine","I44_Man_A_Army_Ranger_M1Garand_M7","I44_Man_A_Army_Ranger_M1Garand","I44_Man_A_Army_Ranger_M1A1Thompson","I44_Man_A_Army_Ranger_M1Garand","I44_Man_A_Army_Ranger_M1Garand","I44_Man_A_Army_Ranger_M1903A3"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Ranger_Recon
			[[[["I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Man_A_Army_Ranger_M1Carbine","I44_Man_A_Army_Ranger_M1A1Thompson","I44_Man_A_Army_Ranger_M1A1Thompson"],[[0,2,0],[0,0,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Ranger_MG
			[[[["I44_Man_A_Army_Ranger_M1Carbine","I44_Man_A_Army_Ranger_M1919A4","I44_Man_A_Army_Ranger_MGCrew_AG"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_A_Army_Ranger_Bazooka
			[[[["I44_Man_A_Army_Ranger_M1Carbine","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_ATCrew_M3"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_A_Army_Ranger_Engr
			[[[["I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Man_A_Army_Ranger_Engr_M37DemoKit","I44_Man_A_Army_Ranger_Engr_M1Mine"],[[0,2,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0]]],0.01],
			// I44_A_Army_AB_PltnHQ
			[[[["I44_Man_A_Army_AB_CO_M1A1Carbine","I44_Man_A_Army_AB_NCO_M1A1Thompson","I44_Man_A_Army_AB_M1918A2","I44_Man_A_Army_AB_M1Garand","I44_Man_A_Army_AB_RTO_M1A1Carbine"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r3,_r2,_r1,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Assault
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson","I44_Man_A_Army_AB_M3Greasegun","I44_Man_A_Army_AB_M1Garand_M7","I44_Man_A_Army_AB_M1A1Carbine","I44_Man_A_Army_AB_M1Garand","I44_Man_A_Army_AB_M1A1Thompson","I44_Man_A_Army_AB_M1A1Thompson"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_AB_BAR
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson","I44_Man_A_Army_AB_M1918A2","I44_Man_A_Army_AB_M1A1Carbine","I44_Man_A_Army_AB_M1Garand_M7","I44_Man_A_Army_AB_M1Garand","I44_Man_A_Army_AB_M1918A2","I44_Man_A_Army_AB_M1Garand"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Rifle
			[[[["I44_Man_A_Army_AB_NCO_M1A1Carbine","I44_Man_A_Army_AB_M1Garand_M7","I44_Man_A_Army_AB_M1Garand","I44_Man_A_Army_AB_M1A1Thompson","I44_Man_A_Army_AB_M1Garand","I44_Man_A_Army_AB_M1Garand","I44_Man_A_Army_AB_M1903A3"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Recon
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson","I44_Man_A_Army_AB_M1A1Carbine","I44_Man_A_Army_AB_M1A1Thompson","I44_Man_A_Army_AB_M1A1Thompson"],[[0,2,0],[0,0,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Bazooka
			[[[["I44_Man_A_Army_AB_M1A1Carbine","I44_Man_A_Army_AB_M1A1Bazooka","I44_Man_A_Army_AB_ATCrew_M3"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_A_Army_AB_MG
			[[[["I44_Man_A_Army_AB_M1A1Carbine","I44_Man_A_Army_AB_M1919A4","I44_Man_A_Army_AB_MGCrew_AG"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Engr
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson","I44_Man_A_Army_AB_Engr_M37DemoKit","I44_Man_A_Army_AB_Engr_M1Mine"],[[0,2,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0]]],0.01],
			// I44_A_Army_Veh_Motorized
			[[[["I44_Man_A_Army_NCO_M1Carbine","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1Garand_M7","I44_Man_A_Army_M1A1Thompson","I44_Man_A_Army_M1Garand","I44_Car_A_WillysMB_M1919_Army","I44_Truck_A_GMC_CCKW_Open_Army"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Veh_Motorized_AT
			[[[["I44_Man_A_Army_NCO_M1Carbine","I44_Man_A_Army_ATCrew_M3","I44_Man_A_Army_M1A1Bazooka","I44_Man_A_Army_ATCrew_M3","I44_Man_A_Army_M1A1Bazooka","I44_Man_A_Army_M1Garand","I44_Car_A_WillysMB_M1919_Army","I44_Truck_A_GMC_CCKW_Open_Army"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Veh_Mechanized
			[[[["I44_Man_A_Army_NCO_M1Carbine","I44_Man_A_Army_M1Garand_M7","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1A1Thompson","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1Garand","I44_Man_A_Army_M1903A3","I44_HT_A_M3A1_Army"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Veh_Recon
			[[[["I44_Man_A_Army_NCO_M1A1Thompson","I44_Man_A_Army_M1Carbine","I44_Man_A_Army_M1A1Thompson","I44_Man_A_Army_M1A1Thompson","I44_HT_A_M3_Army"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r2,_r1,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Veh_Tank
			[[[["I44_Veh_A_Army_M4A3_76_Sherman_Army","I44_Veh_A_Army_M4A3_Sherman_Army","I44_Veh_A_Army_M4A3_Sherman_Army","I44_Veh_A_Army_M4A3_Sherman_Army"],[[0,2,0],[0,0,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Veh_Tank_Recon
			[[[["I44_Tank_A_M5A1_Stuart_Army","I44_Tank_A_M3A3_Stuart_Army","I44_Tank_A_M3A3_Stuart_Army","I44_ACar_A_M8_Greyhound_Army"],[[0,2,0],[2,0,0],[-2,0,0],[-2,0,0]],[_r1,_r0,_r0,_r0]]],0.01],
			// I44_A_USAAF_Veh_B17
			[[[["I44_Plane_A_B17_AAF","I44_Plane_A_B17_AAF","I44_Plane_A_B17_AAF","I44_Plane_A_B17_AAF"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r2,_r1,_r0]]],0.01],
			// I44_A_USAAF_Veh_P38
			[[[["I44_Plane_A_P38_AAF","I44_Plane_A_P38_M64_AAF","I44_Plane_A_P38_M64_AAF","I44_Plane_A_P38_HVAR_AAF"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r2,_r1,_r0]]],0.01],
			// I44_A_USAAF_Veh_P47
			[[[["I44_P47","I44_P47","I44_P47","I44_P47"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r1,_r0,_r0]]],0.01],
			// I44_A_USAAF_Veh_P47A
			[[[["I44_P47A","I44_P47A","I44_P47A","I44_P47A"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_A_USAAF_Veh_P51
			[[[["I44_Plane_A_P51D_AAF","I44_Plane_A_P51D_250lb_AAF","I44_Plane_A_P51D_250lb_AAF","I44_Plane_A_P51D_HVAR_AAF"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r2,_r1,_r0]]],0.01]
		];
	} else {
		// [I44] US Зима
		_west=_west+[
			// I44_A_Army_AB_PltnHQ_Winter
			[[[["I44_Man_A_Army_AB_CO_M1A1Carbine_Winter","I44_Man_A_Army_AB_NCO_M1A1Thompson_Winter","I44_Man_A_Army_AB_M1918A2_Winter","I44_Man_A_Army_AB_M1Garand_Winter","I44_Man_A_Army_AB_RTO_M1A1Carbine_Winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r3,_r2,_r1,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Assault_Winter
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson_Winter","I44_Man_A_Army_AB_M3Greasegun_Winter","I44_Man_A_Army_AB_M1Garand_M7_Winter","I44_Man_A_Army_AB_M1A1Carbine_Winter","I44_Man_A_Army_AB_M1Garand_Winter","I44_Man_A_Army_AB_M1A1Thompson_Winter","I44_Man_A_Army_AB_M1A1Thompson_Winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_AB_BAR_Winter
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson_Winter","I44_Man_A_Army_AB_M1918A2_Winter","I44_Man_A_Army_AB_M1A1Carbine_Winter","I44_Man_A_Army_AB_M1Garand_M7_Winter","I44_Man_A_Army_AB_M1Garand_Winter","I44_Man_A_Army_AB_M1918A2_Winter","I44_Man_A_Army_AB_M1Garand_Winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Rifle_Winter
			[[[["I44_Man_A_Army_AB_NCO_M1A1Carbine_Winter","I44_Man_A_Army_AB_M1Garand_M7_Winter","I44_Man_A_Army_AB_M1Garand_Winter","I44_Man_A_Army_AB_M1A1Thompson_Winter","I44_Man_A_Army_AB_M1Garand_Winter","I44_Man_A_Army_AB_M1Garand_Winter","I44_Man_A_Army_AB_M1903A3_Winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Recon_Winter
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson_Winter","I44_Man_A_Army_AB_M1A1Carbine_Winter","I44_Man_A_Army_AB_M1A1Thompson_Winter","I44_Man_A_Army_AB_M1A1Thompson_Winter"],[[0,2,0],[0,0,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Bazooka_Winter
			[[[["I44_Man_A_Army_AB_M1A1Carbine_Winter","I44_Man_A_Army_AB_M1A1Bazooka_Winter","I44_Man_A_Army_AB_ATCrew_M3_Winter"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_A_Army_AB_MG_Winter
			[[[["I44_Man_A_Army_AB_M1A1Carbine_Winter","I44_Man_A_Army_AB_M1919A4_Winter","I44_Man_A_Army_AB_MGCrew_AG_Winter"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_A_Army_AB_Engr_Winter
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson_Winter","I44_Man_A_Army_AB_Engr_M37DemoKit_Winter","I44_Man_A_Army_AB_Engr_M1Mine_Winter"],[[0,2,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0]]],0.01],
			// I44_A_Army_Veh_Motorized_Winter
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson_Winter","I44_Man_A_Army_AB_M1918A2_Winter","I44_Man_A_Army_AB_M1A1Carbine_Winter","I44_Man_A_Army_AB_M1Garand_M7_Winter","I44_Man_A_Army_AB_M1Garand_Winter","I44_Man_A_Army_AB_M1918A2_Winter","I44_Car_A_WillysMB_M1919_Army","I44_Truck_A_GMC_CCKW_Open_Army"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Veh_Motorized_AT_Winter
			[[[["I44_Man_A_Army_AB_NCO_M1A1Thompson_Winter","I44_Man_A_Army_AB_M1918A2_Winter","I44_Man_A_Army_AB_M1A1Bazooka_Winter","I44_Man_A_Army_AB_ATCrew_M3_Winter","I44_Man_A_Army_AB_M1A1Bazooka_Winter","I44_Man_A_Army_AB_ATCrew_M3_Winter","I44_Car_A_WillysMB_M1919_Army","I44_Truck_A_GMC_CCKW_Open_Army"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_A_Army_Veh_Tank_Winter
			[[[["I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army_w","I44_Veh_A_Army_M4A3_76_Sherman_Army_w","I44_Veh_A_Army_M4A3_76_Sherman_Army_w","I44_Veh_A_Army_M4A3_76_Sherman_Army_w"],[[0,2,0],[0,0,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0,_r0]]],0.01]
		];
	};
};

// [I44] British
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"I44_B");
if ((gosa_IslandType select 1 < 1950 && _tmp == -1) or _tmp > 0) then {
	if (gosa_IslandType select 0 >= 150) then {
		// [I44] British
		_west=_west+[
			// I44_B_PltnHQ
			[[[["I44_Man_B_Army_CO_StenMk5","I44_Man_B_Army_NCO_StenMk5","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_StenMk2"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0]],[_r3,_r2,_r1,_r0]]],0.01],
			// I44_B_BrenSection
			[[[["I44_Man_B_Army_NCO_StenMk5","I44_Man_B_Army_BrenMk1","I44_Man_B_Army_StenMk5","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_BrenMk1","I44_Man_B_Army_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_RecceSection
			[[[["I44_Man_B_Army_NCO_StenMk5","I44_Man_B_Army_BrenMk1","I44_Man_B_Army_StenMk2","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_PIAT","I44_Man_B_Army_Engr_GrenadeNo75","I44_Man_B_Army_StenMk2"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Rifle
			[[[["I44_Man_B_Army_NCO_StenMk5","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_StenMk2","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_Engr_GrenadeNo75","I44_Man_B_Army_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Recon
			[[[["I44_Man_B_Army_StenMk5","I44_Man_B_Army_StenMk5","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_StenMk2"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_B_Bren
			[[[["I44_Man_B_Army_StenMk5","I44_Man_B_Army_BrenMk1","I44_Man_B_Army_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_B_PIAT
			[[[["I44_Man_B_Army_StenMk2","I44_Man_B_Army_PIAT","I44_Man_B_Army_Engr_GrenadeNo75"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_B_Engr
			[[[["I44_Man_B_Army_NCO_StenMk5","I44_Man_B_Army_Engr_GrenadeNo75","I44_Man_B_Army_Sapper_M37"],[[0,2,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0]]],0.01],
			// I44_B_AB_PltnHQ
			[[[["I44_Man_B_Army_AB_CO_StenMk5","I44_Man_B_Army_AB_NCO_StenMk5","I44_Man_B_Army_AB_RTO","I44_Man_B_Army_AB_StenMk2"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0]],[_r3,_r2,_r1,_r0]]],0.01],
			// I44_B_AB_BrenSection
			[[[["I44_Man_B_Army_AB_NCO_StenMk5","I44_Man_B_Army_AB_BrenMk1","I44_Man_B_Army_AB_StenMk5","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_BrenMk1","I44_Man_B_Army_AB_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_AB_RecceSection
			[[[["I44_Man_B_Army_AB_NCO_StenMk5","I44_Man_B_Army_AB_BrenMk1","I44_Man_B_Army_AB_StenMk2","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_PIAT","I44_Man_B_Army_AB_Engr_GrenadeNo75","I44_Man_B_Army_AB_StenMk2"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_AB_Rifle
			[[[["I44_Man_B_Army_AB_NCO_StenMk5","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_StenMk2","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_Engr_GrenadeNo75","I44_Man_B_Army_AB_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_AB_Recon
			[[[["I44_Man_B_Army_AB_NCO_SMLENo4Mk1","I44_Man_B_Army_AB_StenMk5","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_StenMk2"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_B_AB_Bren
			[[[["I44_Man_B_Army_AB_StenMk5","I44_Man_B_Army_AB_BrenMk1","I44_Man_B_Army_AB_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_B_AB_PIAT
			[[[["I44_Man_B_Army_AB_StenMk2","I44_Man_B_Army_AB_PIAT","I44_Man_B_Army_AB_ATCrew_SMLEdNo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_B_AB_Engr
			[[[["I44_Man_B_Army_AB_NCO_StenMk5","I44_Man_B_Army_AB_Engr_GrenadeNo75","I44_Man_B_Army_AB_Sapper_M37"],[[0,2,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0]]],0.01],
			// I44_B_Comm_PltnHQ
			[[[["I44_Man_B_Army_Commando_CO_StenMk2S","I44_Man_B_Army_Commando_NCO_StenMk2S","I44_Man_B_Army_Commando_RTO","I44_Man_B_Army_Commando_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0]],[_r3,_r2,_r1,_r0]]],0.01],
			// I44_B_Comm_BrenSection
			[[[["I44_Man_B_Army_Commando_NCO_StenMk2S","I44_Man_B_Army_Commando_BrenMk1","I44_Man_B_Army_Commando_StenMk5","I44_Man_B_Army_Commando_SMLENo4Mk1","I44_Man_B_Army_Commando_BrenMk1","I44_Man_B_Army_Commando_SMLENo4Mk1","I44_Man_B_Army_Commando_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Comm_RecceSection
			[[[["I44_Man_B_Army_Commando_BrenMk1","I44_Man_B_Army_Commando_StenMk5","I44_Man_B_Army_Commando_SMLENo4Mk1","I44_Man_B_Army_Commando_Engr_GrenadeNo75","I44_Man_B_Army_PIAT","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Comm_Rifle
			[[[["I44_Man_B_Army_Commando_NCO_StenMk2S","I44_Man_B_Army_Commando_SMLENo4Mk1","I44_Man_B_Army_Commando_StenMk2","I44_Man_B_Army_Commando_SMLENo4Mk1","I44_Man_B_Army_Commando_Engr_GrenadeNo75","I44_Man_B_Army_Commando_SMLENo4Mk1","I44_Man_B_Army_Commando_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Comm_Recon
			[[[["I44_Man_B_Army_Commando_NCO_StenMk2S","I44_Man_B_Army_Commando_DeLisle","I44_Man_B_Army_Commando_DeLisle","I44_Man_B_Army_Commando_StenMk2S"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_B_Comm_Bren
			[[[["I44_Man_B_Army_Commando_StenMk5","I44_Man_B_Army_Commando_BrenMk1","I44_Man_B_Army_Commando_SMLENo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_B_Comm_PIAT
			[[[["I44_Man_B_Army_Commando_StenMk2","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_Engr_GrenadeNo75"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_B_Comm_Engr
			[[[["I44_Man_B_Army_Commando_NCO_StenMk2S","I44_Man_B_Army_Commando_Engr_GrenadeNo75","I44_Man_B_Army_Commando_Sapper_M37"],[[0,2,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0]]],0.01],
			// I44_B_Army_Veh_Motorized
			[[[["I44_Man_B_Army_AB_NCO_StenMk5","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_StenMk2","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_Engr_GrenadeNo75","I44_Car_B_WillysAB_VGO_Army","I44_Car_B_WillysAB_Army"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Army_Veh_Motorized_AT
			[[[["I44_Man_B_Army_AB_NCO_StenMk5","I44_Man_B_Army_AB_BrenMk1","I44_Man_B_Army_AB_StenMk2","I44_Man_B_Army_AB_SMLENo4Mk1","I44_Man_B_Army_AB_PIAT","I44_Man_B_Army_AB_Engr_GrenadeNo75","I44_Car_B_WillysAB_VGO_Army","I44_Car_B_WillysAB_Army"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Army_Veh_Mechanized
			[[[["I44_Man_B_Army_NCO_StenMk5","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_StenMk2","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_Engr_GrenadeNo75","I44_Man_B_Army_SMLENo4Mk1","I44_Tank_B_Army_UC"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Army_Veh_Recon
			[[[["I44_Man_B_Army_StenMk5","I44_Man_B_Army_StenMk5","I44_Man_B_Army_SMLENo4Mk1","I44_Man_B_Army_StenMk2","I44_Tank_B_Army_UC"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r2,_r1,_r0,_r0,_r0]]],0.01],
			// I44_B_Army_Veh_Tank
			[[[["I44_Tank_B_ShermanVC_Army","I44_Tank_B_ShermanIV_Army","I44_Tank_B_ShermanIV_Army","I44_Tank_B_ShermanIV_Army"],[[0,2,0],[0,0,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_B_Army_Veh_Tank_Recon
			[[[["I44_Veh_B_Army_MKIV_Churchill","I44_Veh_B_Army_MKIV_Churchill","I44_Tank_B_Cromwell_Army","I44_Tank_B_Cromwell_Army"],[[0,2,0],[2,0,0],[-2,0,0],[-2,0,0]],[_r1,_r0,_r0,_r0]]],0.01],
			// I44_B_RAF_Veh_HH
			[[[["I44_Plane_B_HHmkIIa_RAF","I44_Plane_B_HHmkIIa_M57_RAF","I44_Plane_B_HHmkIIa_M57_RAF","I44_Plane_B_HHmkIIa_HVAR_RAF"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r2,_r1,_r0]]],0.01],
			// I44_B_RAF_Veh_HT
			[[[["I44_Plane_B_TyphoonMk1A_RAF","I44_Plane_B_TyphoonMk1A_RAF","I44_Plane_B_TyphoonMk1A_RP3_RAF","I44_Plane_B_TyphoonMk1A_RP3_RAF"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r2,_r1,_r0]]],0.01],
			// I44_B_RAF_Veh_SS
			[[[["I44_Plane_B_SpitfireMk1a_RAF","I44_Plane_B_SpitfireMk1a_RAF","I44_Plane_B_SpitfireMk1a_RAF","I44_Plane_B_SpitfireMk1a_RAF"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r1,_r0,_r0]]],0.01]
		];
	} else {
		// [I44] British Зима
		_west=_west+[
			// I44_B_Comm_PltnHQ_Winter
			[[[["I44_Man_B_Army_Commando_CO_StenMk2S_winter","I44_Man_B_Army_Commando_NCO_StenMk2S_winter","I44_Man_B_Army_Commando_RTO_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0]],[_r3,_r2,_r1,_r0]]],0.01],
			// I44_B_Comm_BrenSection_Winter
			[[[["I44_Man_B_Army_Commando_NCO_StenMk2S_winter","I44_Man_B_Army_Commando_BrenMk1_winter","I44_Man_B_Army_Commando_StenMk5_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter","I44_Man_B_Army_Commando_BrenMk1_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Comm_RecceSection_Winter
			[[[["I44_Man_B_Army_Commando_BrenMk1_winter","I44_Man_B_Army_Commando_StenMk5_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter","I44_Man_B_Army_Commando_Engr_GrenadeNo75_winter","I44_Man_B_Army_Commando_PIAT_winter","I44_Man_B_Army_Commando_PIAT_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Comm_Rifle_Winter
			[[[["I44_Man_B_Army_Commando_NCO_StenMk2S_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter","I44_Man_B_Army_Commando_StenMk2_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter","I44_Man_B_Army_Commando_Engr_GrenadeNo75_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_B_Comm_Recon_Winter
			[[[["I44_Man_B_Army_Commando_NCO_StenMk2S_winter","I44_Man_B_Army_Commando_DeLisle_winter","I44_Man_B_Army_Commando_DeLisle_winter","I44_Man_B_Army_Commando_StenMk2S_winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_B_Comm_Bren_Winter
			[[[["I44_Man_B_Army_Commando_StenMk5_winter","I44_Man_B_Army_Commando_BrenMk1_winter","I44_Man_B_Army_Commando_SMLENo4Mk1_winter"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_B_Comm_PIAT_Winter
			[[[["I44_Man_B_Army_Commando_StenMk2_winter","I44_Man_B_Army_Commando_PIAT_winter","I44_Man_B_Army_Commando_Engr_GrenadeNo75_winter"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_B_Comm_Engr_Winter
			[[[["I44_Man_B_Army_Commando_NCO_StenMk2S_winter","I44_Man_B_Army_Commando_Engr_GrenadeNo75_winter","I44_Man_B_Army_Commando_Sapper_M37_winter"],[[0,2,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0]]],0.01]
		];
	};
};

// [I44] German
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"I44_G");
if ((gosa_IslandType select 1 < 1950 && _tmp == -1) or _tmp > 0) then {
	if (gosa_IslandType select 0 >= 150) then {
		// [I44] German
		_east=_east+[
			// I44_G_Zugfuehrergruppe
			[[[["I44_Man_G_WH_CO_MP40","I44_Man_G_WH_NCO_MP40","I44_Man_G_WH_MG34","I44_Man_G_WH_MP40","I44_Man_G_WH_RTO"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r3,_r2,_r1,_r0,_r0]]],0.01],
			// I44_G_Sturmgrenadiere
			[[[["I44_Man_G_WH_NCO_MP40","I44_Man_G_WH_MG42","I44_Man_G_WH_MP40","I44_Man_G_WH_MP40","I44_Man_G_WH_G43","I44_Man_G_WH_K98k_PzF60","I44_Man_G_WH_K98k_GGrGer"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r1,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_Grenadiere
			[[[["I44_Man_G_WH_NCO_MP40","I44_Man_G_WH_MP40","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_K98k","I44_Man_G_WH_K98k_PzF60","I44_Man_G_WH_K98k"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_Schuetzen
			[[[["I44_Man_G_WH_NCO_MP40","I44_Man_G_WH_K98k","I44_Man_G_WH_MP40","I44_Man_G_WH_K98k","I44_Man_G_WH_K98k","I44_Man_G_WH_K98k_PzF60","I44_Man_G_WH_K98k"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_Aufklaerer
			[[[["I44_Man_G_WH_NCO_MP40","I44_Man_G_WH_MP40","I44_Man_G_WH_K98k","I44_Man_G_WH_K98k_PzF60","I44_Man_G_WH_MP40"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r2,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_Panzerjaeger
			[[[["I44_Man_G_WH_RPzB54","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_K98k_PzF60"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_MG42
			[[[["I44_Man_G_WH_MP40","I44_Man_G_WH_MG42","I44_Man_G_WH_MGCrew_AG"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_Pioniere
			[[[["I44_Man_G_WH_MP40","I44_Man_G_WH_Engr_GbLadung3kg","I44_Man_G_WH_Engr_TMi42"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_Army_Veh_Motorized
			[[[["I44_Man_G_WH_NCO_MP40","I44_Man_G_WH_MG42","I44_Man_G_WH_MP40","I44_Man_G_WH_MP40","I44_Man_G_WH_G43","I44_Man_G_WH_K98k_PzF60","I44_motorcycle_G_BMWR75_S","I44_Truck_G_Kfz305_Open_WH"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_Army_Veh_Motorized_AT
			[[[["I44_Man_G_WH_NCO_MP40","I44_Man_G_WH_MG42","I44_Man_G_WH_RPzB54","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_ATCrew_G43","I44_motorcycle_G_BMWR75_S","I44_Truck_G_Kfz305_Open_WH"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_Army_Veh_Mechanized
			[[[["I44_Man_G_WH_NCO_MP40","I44_Man_G_WH_K98k","I44_Man_G_WH_MP40","I44_Man_G_WH_K98k","I44_Man_G_WH_K98k","I44_Man_G_WH_K98k_PzF60","I44_Man_G_WH_K98k","I44_HT_G_SdKfz251_1D_WH"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_Army_Veh_Recon
			[[[["I44_Man_G_WH_NCO_MP40","I44_Man_G_WH_MP40","I44_Man_G_WH_K98k","I44_Man_G_WH_K98k_PzF60","I44_HT_G_SdKfz251_22_WH"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r2,_r1,_r0,_r0,_r0]]],0.01],
			// I44_G_Army_Veh_Tank
			[[[["I44_Tank_G_PzKpfwVI_B_WH","I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH","I44_Tank_G_PzKpfwIV_G_Skirt_WH","I44_Tank_G_PzKpfwIV_G_WH"],[[0,2,0],[0,0,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_G_Army_Veh_Tank_Recon
			[[[["I44_ACar_G_SdKfz234_1_WH","I44_ACar_G_SdKfz234_2_WH","I44_ACar_G_SdKfz234_3_WH","I44_ACar_G_SdKfz234_4_WH"],[[0,2,0],[2,0,0],[-2,0,0],[-2,0,0]],[_r1,_r0,_r0,_r0]]],0.01],
			// I44_G_FJ_Zugfuehrergruppe
			[[[["I44_Man_G_WL_FJ_CO_MP40","I44_Man_G_WL_FJ_NCO_MP40","I44_Man_G_WL_FJ_MG34","I44_Man_G_WL_FJ_FG42","I44_Man_G_WL_FJ_RTO"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r3,_r2,_r1,_r0,_r0]]],0.01],
			// I44_G_FJ_Sturmgrenadiere
			[[[["I44_Man_G_WL_FJ_NCO_MP40","I44_Man_G_WL_FJ_FG42","I44_Man_G_WL_FJ_MP40","I44_Man_G_WL_FJ_MP40","I44_Man_G_WL_FJ_G43","I44_Man_G_WL_FJ_K98k_PzF60","I44_Man_G_WL_FJ_K98k_GGrGer"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r1,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_FJ_Grenadiere
			[[[["I44_Man_G_WL_FJ_NCO_MP40","I44_Man_G_WL_FJ_MP40","I44_Man_G_WL_FJ_K98k_GGrGer","I44_Man_G_WL_FJ_K98k_GGrGer","I44_Man_G_WL_FJ_K98k","I44_Man_G_WL_FJ_K98k_PzF60","I44_Man_G_WL_FJ_K98k"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_FJ_Schuetzen
			[[[["I44_Man_G_WL_FJ_NCO_MP40","I44_Man_G_WL_FJ_K98k","I44_Man_G_WL_FJ_MP40","I44_Man_G_WL_FJ_K98k","I44_Man_G_WL_FJ_K98k","I44_Man_G_WL_FJ_K98k_PzF60","I44_Man_G_WL_FJ_K98k"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_FJ_Aufklaerer
			[[[["I44_Man_G_WL_FJ_NCO_MP40","I44_Man_G_WL_FJ_MP40","I44_Man_G_WL_FJ_K98k","I44_Man_G_WL_FJ_K98k_PzF60","I44_Man_G_WL_FJ_MP40"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r2,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_FJ_Panzerjaeger
			[[[["I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_ATCrew_G43","I44_Man_G_WL_FJ_K98k_PzF60"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_FJ_MG42
			[[[["I44_Man_G_WL_FJ_FG42","I44_Man_G_WL_FJ_MG42","I44_Man_G_WL_FJ_MGCrew_AG"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_FJ_Pioniere
			[[[["I44_Man_G_WL_FJ_MP40","I44_Man_G_WL_FJ_Engr_GbLadung3kg","I44_Man_G_WL_FJ_Engr_TMi42"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_WL_Veh_Veh_BF109E
			[[[["I44_Plane_G_Bf109E4_WL","I44_Plane_G_Bf109E4_WL","I44_Plane_G_Bf109E4_WL","I44_Plane_G_Bf109E4_WL"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r2,_r1,_r0]]],0.01],
			// I44_G_WL_Veh_Veh_BF109F
			[[[["I44_Plane_G_Bf109F2_WL","I44_Plane_G_Bf109F2_SC250_WL","I44_Plane_G_Bf109F2_SC250_WL","I44_Plane_G_Bf109F2_SC50_WL"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r2,_r1,_r0]]],0.01],
			// I44_G_WL_Veh_Veh_BF109G
			[[[["I44_Plane_G_Bf109G6_WL","I44_Plane_G_Bf109G6_WL","I44_Plane_G_Bf109G6_SC250_WL","I44_Plane_G_Bf109G6_SC250_WL"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r1,_r0,_r0]]],0.01],
			// I44_G_WL_Veh_Veh_JU87
			[[[["I44_Plane_G_Ju87_WL","I44_Plane_G_Ju87_B_WL","I44_Plane_G_Ju87_SC50_WL","I44_Plane_G_Ju87_SC250_WL"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r0,_r0,_r0]]],0.01],
			// I44_G_WL_Veh_Veh_ME262
			[[[["I44_Plane_G_Me262_WL","I44_Plane_G_Me262_WL","I44_Plane_G_Me262_WL","I44_Plane_G_Me262_WL"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r2,_r1,_r0]]],0.01],
			// I44_G_WL_Veh_Veh_ME262A
			[[[["I44_Plane_G_Me262A_WL","I44_Plane_G_Me262A_WL","I44_Plane_G_Me262A_WL","I44_Plane_G_Me262A_WL"],[[0,10,0],[10,0,0],[-10,0,0],[20,0,0]],[_r2,_r2,_r1,_r0]]],0.01],
			// I44_G_SS_Zugfuehrergruppe
			[[[["I44_Man_G_SS_CO_MP40","I44_Man_G_SS_NCO_MP40","I44_Man_G_SS_MG34","I44_Man_G_SS_MP40","I44_Man_G_SS_RTO"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r3,_r2,_r1,_r0,_r0]]],0.01],
			// I44_G_SS_Sturmgrenadiere
			[[[["I44_Man_G_SS_NCO_MP40","I44_Man_G_SS_MG42","I44_Man_G_SS_MP40","I44_Man_G_SS_MP40","I44_Man_G_SS_G43","I44_Man_G_SS_K98k_PzF60","I44_Man_G_SS_K98k_GGrGer"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r1,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Grenadiere
			[[[["I44_Man_G_SS_NCO_MP40","I44_Man_G_SS_MP40","I44_Man_G_SS_K98k_GGrGer","I44_Man_G_SS_K98k_GGrGer","I44_Man_G_SS_K98k","I44_Man_G_SS_K98k_PzF60","I44_Man_G_SS_K98k"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Schuetzen
			[[[["I44_Man_G_SS_NCO_MP40","I44_Man_G_SS_K98k","I44_Man_G_SS_MP40","I44_Man_G_SS_K98k","I44_Man_G_SS_K98k","I44_Man_G_SS_K98k_PzF60","I44_Man_G_SS_K98k"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Aufklaerer
			[[[["I44_Man_G_SS_NCO_MP40","I44_Man_G_SS_MP40","I44_Man_G_SS_K98k","I44_Man_G_SS_K98k_PzF60","I44_Man_G_SS_MP40"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r2,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Panzerjaeger
			[[[["I44_Man_G_SS_RPzB54","I44_Man_G_SS_ATCrew_G43","I44_Man_G_SS_K98k_PzF60"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_SS_MG42
			[[[["I44_Man_G_SS_MP40","I44_Man_G_SS_MG42","I44_Man_G_SS_MGCrew_AG"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_SS_Pioniere
			[[[["I44_Man_G_SS_MP40","I44_Man_G_SS_Engr_GbLadung3kg","I44_Man_G_SS_Engr_TMi42"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01]
		];
	} else {
		_east=_east+[
			// I44_G_SS_Zugfuehrergruppe_Winter
			[[[["I44_Man_G_SS_CO_MP40_Winter","I44_Man_G_SS_NCO_MP40_Winter","I44_Man_G_SS_MG34_Winter","I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_RTO_Winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r3,_r2,_r1,_r0,_r0]]],0.01],
			// I44_G_SS_Sturmgrenadiere_Winter
			[[[["I44_Man_G_SS_NCO_MP40_Winter","I44_Man_G_SS_MG42_Winter","I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_G43_Winter","I44_Man_G_SS_K98k_PzF60_Winter","I44_Man_G_SS_K98k_GGrGer_Winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r1,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Grenadiere_Winter
			[[[["I44_Man_G_SS_NCO_MP40_Winter","I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_K98k_GGrGer_Winter","I44_Man_G_SS_K98k_GGrGer_Winter","I44_Man_G_SS_K98k_Winter","I44_Man_G_SS_K98k_PzF60_Winter","I44_Man_G_SS_K98k_Winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Schuetzen_Winter
			[[[["I44_Man_G_SS_NCO_MP40_Winter","I44_Man_G_SS_K98k_Winter","I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_K98k_Winter","I44_Man_G_SS_K98k_Winter","I44_Man_G_SS_K98k_PzF60_Winter","I44_Man_G_SS_K98k_Winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Aufklaerer_Winter
			[[[["I44_Man_G_SS_NCO_MP40_Winter","I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_K98k_Winter","I44_Man_G_SS_K98k_PzF60_Winter","I44_Man_G_SS_MP40_Winter"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r2,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Panzerjaeger_Winter
			[[[["I44_Man_G_SS_RPzB54_Winter","I44_Man_G_SS_ATCrew_G43_Winter","I44_Man_G_SS_K98k_PzF60_Winter"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_SS_MG42_Winter
			[[[["I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_MG42_Winter","I44_Man_G_SS_MGCrew_AG_Winter"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_SS_Pioniere_Winter
			[[[["I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_Engr_GbLadung3kg_Winter","I44_Man_G_SS_Engr_TMi42_Winter"],[[0,2,0],[2,0,0],[-2,0,0]],[_r1,_r0,_r0]]],0.01],
			// I44_G_SS_Veh_Motorized_Winter
			[[[["I44_Man_G_SS_NCO_MP40_Winter","I44_Man_G_SS_MG42_Winter","I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_G43_Winter","I44_Man_G_SS_K98k_PzF60_Winter","I44_motorcycle_G_BMWR75_S","I44_Truck_G_Kfz305_Open_WH"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Veh_Motorized_AT_Winter
			[[[["I44_Man_G_SS_NCO_MP40_Winter","I44_Man_G_SS_MG42_Winter","I44_Man_G_SS_RPzB54_Winter","I44_Man_G_SS_ATCrew_G43_Winter","I44_Man_G_SS_RPzB54_Winter","I44_Man_G_SS_ATCrew_G43_Winter","I44_motorcycle_G_BMWR75_S","I44_Truck_G_Kfz305_Open_WH"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Veh_Mechanized_Winter
			[[[["I44_Man_G_SS_NCO_MP40_Winter","I44_Man_G_SS_K98k_Winter","I44_Man_G_SS_MP40_Winter","I44_Man_G_SS_K98k_Winter","I44_Man_G_SS_K98k_Winter","I44_Man_G_SS_K98k_PzF60_Winter","I44_Man_G_SS_K98k_Winter","I44_HT_G_SdKfz251_1D_SS_W"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[10,0,0],[-10,0,0]],[_r2,_r2,_r1,_r0,_r0,_r0,_r0,_r0]]],0.01],
			// I44_G_SS_Veh_Tank_Winter
			[[[["I44_Tank_G_PzKpfwVI_B_SS_Winter","I44_Tank_G_PzKpfwVI_E_Late_AAMG_SS_Winter","I44_Tank_G_PzKpfwVI_E_Late_SS_Winter","I44_Tank_G_JaPz38_T_SS_Winter"],[[0,2,0],[0,0,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0,_r0]]],0.01]
		];
	};
};

// [I44] Resistance
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"I44_R");
if ((gosa_IslandType select 1 < 1950 && _tmp == -1) or _tmp > 0) then {
		// [I44] Resistance
		_guer=_guer+[
			// I44_R_Leaders
			[[[["I44_Man_R_F_CO_P08","I44_Man_R_F_P38","I44_Man_R_F_P08"],[[0,2,0],[2,0,0],[-2,0,0]],[_r3,_r2,_r0]]],0.01],
			// I44_R_Fighters
			[[[["I44_Man_R_F_P38","I44_Man_R_F_StenMk2","I44_Man_R_F_MP40","I44_Man_R_F_M37Ithaca","I44_Man_R_F_K98k","I44_Man_R_F_K98k","I44_Man_R_F_LeeEnfieldNo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0],[6,0,0],[-6,0,0]],[_r2,_r1,_r1,_r0,_r0,_r0,_r0]]],0.01],
			// I44_R_Ambush
			[[[["I44_Man_R_F_P38","I44_Man_R_F_LeeEnfieldNo4Mk1","I44_Man_R_F_StenMk2","I44_Man_R_F_BrenMk1","I44_Man_R_F_LeeEnfieldNo4Mk1"],[[0,2,0],[2,0,0],[-2,0,0],[4,0,0],[-4,0,0]],[_r2,_r0,_r0,_r0,_r0]]],0.01],
			// I44_R_Sniper
			[[[["I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T","I44_Man_R_F_P08"],[[0,2,0],[2,0,0]],[_r1,_r0]]],0.01],
			// I44_R_Demo
			[[[["I44_Man_R_F_P08","I44_Man_R_F_Engr_TNT","I44_Man_R_F_Engr_TNT"],[[0,2,0],[2,0,0],[-2,0,0]],[_r2,_r0,_r0]]],0.01]
		];
};

/*
для тестирования групп
_west=[
];
_east=[
];
_guer=[
];
*/
#endif

_eastN = [_eastN, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
_westN = [_westN, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
_guerN = [_guerN, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
_east = [_east, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
_west = [_west, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
_guer = [_guer, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;

gosa_Groups_Night = [];
gosa_Groups_Night set [0, _eastN call gosa_fnc_arrSorting_confGroups];
gosa_Groups_Night set [1, _westN call gosa_fnc_arrSorting_confGroups];
gosa_Groups_Night set [2, _guerN call gosa_fnc_arrSorting_confGroups];

gosa_Groups_common = [];
gosa_Groups_common set [0, _east call gosa_fnc_arrSorting_confGroups];
gosa_Groups_common set [1, _west call gosa_fnc_arrSorting_confGroups];
gosa_Groups_common set [2, _guer call gosa_fnc_arrSorting_confGroups];

// Для совместимости с устаревшим кодом.
AllGroupsEast = (gosa_Groups_common select 0);
AllGroupsWest = (gosa_Groups_common select 1);
AllGroupsGuer = (gosa_Groups_common select 2);

diag_log format ["Log: [config_groups.sqf] end %1", time];
