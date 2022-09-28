/*
Не рекомендуется забивать грузовики до отказа
иначе боты дольше тупят.
Оригинальные отряды лучше не изменять,
они хорошо сбалансированы.

	rankId
		0 - Private
		1 - Corporal
		2 - Sergeant
		3 - Lieutenant
		4 - Captain
		5 - Major
		6 - Colonel

*/

// define ранга.
#include "..\include\ranks.hpp"

private ["_west","_east","_guer","_woodland","_deserted"];
_west=[];_east=[];_guer=[];

_woodland=false; _deserted=false;
if(toLower worldname in ["altis","vr"])then{_deserted=true};
if(toLower worldname in ["tanoa"])then{_woodland=true};

// A3

// B_

if(!_woodland && _deserted)then{
	_west=_west+[
		[[[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_soldier_SL_F","B_soldier_AR_F","B_soldier_GL_F","B_soldier_M_F","B_soldier_AT_F","B_soldier_AAT_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_Soldier_TL_F","B_Soldier_AR_F","B_soldier_GL_F","B_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_Soldier_TL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_Soldier_TL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_soldier_GL_F","B_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_Soldier_SL_F","B_soldier_AR_F","B_HeavyGunner_F","B_soldier_AAR_F","B_soldier_M_F","B_Sharpshooter_F","B_soldier_LAT_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_soldier_SL_F","B_G_soldier_TL_F","B_G_soldier_F","B_G_soldier_LAT_F","B_G_Soldier_M_F","B_G_soldier_AR_F","B_G_Soldier_A_F","B_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_soldier_SL_F","B_G_soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_soldier_LAT_F","B_G_soldier_LAT_F","B_G_soldier_A_F","B_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_TL_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_GL_F","B_G_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_M_F","B_G_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_G_Sharpshooter_F","B_G_Soldier_M_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_SL_F","B_G_Sharpshooter_F","B_G_Soldier_AR_F","B_G_Soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// разведка
		[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_LAT_F","B_recon_JTAC_F","B_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_recon_M_F","B_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_F","B_recon_LAT_F","B_recon_JTAC_F","B_recon_exp_F","B_Recon_Sharpshooter_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_sniper_F","B_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		// водолазы
		[[[["B_diver_TL_F","B_diver_exp_F","B_diver_F","B_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
		// корабль
		// Маршруты неисправны.
		//[[[["B_Boat_Transport_01_F","B_Soldier_AR_F","B_soldier_GL_F","B_soldier_LAT_F","B_soldier_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[["B_Soldier_TL_F"]]]],0.5],
		//[[[["B_diver_TL_F","B_diver_exp_F","B_diver_F","B_diver_F","B_SDV_01_F","B_SDV_01_F"],[[-5,-5,0],[10,-10,0],[-10,-10,0],[0,-10,0],[5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// колесный
		[[[["B_soldier_AR_F","B_soldier_LAT_F","B_MRAP_01_gmg_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_soldier_AR_F","B_soldier_LAT_F","B_MRAP_01_hmg_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F","B_MRAP_01_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F","B_MRAP_01_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_Truck_01_transport_F",
				"B_soldier_SL_F","B_soldier_F",
				"B_soldier_LAT_F","B_soldier_M_F",
				"B_soldier_TL_F","B_soldier_AR_F",
				"B_soldier_A_F","B_medic_F",
				"B_soldier_SL_F","B_soldier_F",
				"B_soldier_LAT_F","B_soldier_M_F",
				"B_soldier_TL_F","B_soldier_AR_F",
				"B_soldier_A_F","B_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],
			["SERGEANT",
				"SERGEANT","PRIVATE",
				"CORPORAL","PRIVATE",
				"SERGEANT","CORPORAL",
				"PRIVATE","PRIVATE",
				"SERGEANT","PRIVATE",
				"CORPORAL","PRIVATE",
				"SERGEANT","CORPORAL",
				"PRIVATE","PRIVATE"]]
			],0.5],
		[[[["B_soldier_SL_F","B_soldier_SL_F","B_soldier_TL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F","B_soldier_F","B_Truck_01_covered_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0],[-5,-16,0],[0,0,0]],["CAPTAIN","CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_LSV_01_unarmed_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_soldier_AR_F","B_soldier_LAT_F""B_LSV_01_armed_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F","B_G_medic_F","B_G_Soldier_F","B_G_Offroad_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"],[[0,0,0],[10,-10,0],[-10,-10,0]],["PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// бтр
		[[[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F","B_APC_Wheeled_01_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_repair_F","B_engineer_F","B_medic_F","B_soldier_AR_F","B_soldier_exp_F","B_soldier_A_F","B_APC_Wheeled_01_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		// гусеничный
		[[[["B_soldier_SL_F","B_soldier_AR_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F","B_soldier_AAT_F","B_soldier_AAT_F","B_APC_Tracked_01_rcws_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_soldier_SL_F","B_soldier_AR_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F","B_soldier_AAA_F","B_soldier_AAA_F","B_APC_Tracked_01_aa_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// Экипаж покидает тс.
		//[[[["B_APC_Tracked_01_CRV_F"],[[0,0,0]],["SERGEANT"]]],0.5],
		// танки
		[[[["B_MBT_01_cannon_F","B_MBT_01_cannon_F","B_MBT_01_cannon_F","B_MBT_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_MBT_01_cannon_F","B_APC_Tracked_01_aa_F","B_MBT_01_cannon_F","B_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_MBT_01_cannon_F","B_MBT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_MBT_01_TUSK_F","B_MBT_01_TUSK_F","B_MBT_01_TUSK_F","B_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_MBT_01_TUSK_F","B_APC_Tracked_01_aa_F","B_MBT_01_TUSK_F","B_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_MBT_01_TUSK_F","B_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		// артиллерия
		/*
		[[[["B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_MBT_01_mlrs_F","B_MBT_01_mlrs_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		*/
		// авиация
		[[
			[["B_T_VTOL_01_infantry_F"],[[0,0,0]],["LIEUTENANT"]],
			[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		[[
			[["B_Heli_Transport_03_F"],[[0,0,0]],["LIEUTENANT"]],
			[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		// поддержка
		[[[["B_Truck_01_medical_F"],[],["PRIVATE"],[["B_medic_F"]]]],0.02],
		[[[["B_Truck_01_Repair_F"],[],["PRIVATE"],[["B_engineer_F"]]]],0.02],
		[[[["B_Truck_01_fuel_F"],[],["PRIVATE"]]],0.01],
		[[[["B_Truck_01_ammo_F"],[],["PRIVATE"]]],0.02],
		[[[["B_G_Offroad_01_repair_F"],[],["PRIVATE"],[["B_G_engineer_F"]]]],0.01],
		[[[["B_G_Van_01_fuel_F"],[],["PRIVATE"]]],0.01]
		// турели
		/*
		[[[["B_GMG_01_F"],[],["PRIVATE"]]],0.1],
		[[[["B_HMG_01_A_F"],[],["PRIVATE"]]],0.1],
		[[[["B_HMG_01_high_F"],[],["PRIVATE"]]],0.1],
		[[[["B_static_AA_F"],[],["PRIVATE"]]],0.1],
		[[[["B_static_AT_F"],[],["PRIVATE"]]],0.1],
		[[[["B_HMG_01_F"],[],["PRIVATE"]]],0.1],
		[[[["B_GMG_01_A_F"],[],["PRIVATE"]]],0.1],
		[[[["B_GMG_01_high_F"],[],["PRIVATE"]]],0.1],
		[[[["B_Mortar_01_F"],[],["PRIVATE"]]],0.05],
		[[[["B_G_Mortar_01_F"],[],["PRIVATE"]]],0.05]
		*/
	];
};
if(true)then{
	_west=_west+[
		// беспилотники
		/*
		[[[["B_UAV_01_F"],[],["CORPORAL"]]],0.5],
		[[[["B_UAV_02_F"],[],["CORPORAL"]]],0.5],
		[[[["B_UAV_02_CAS_F"],[],["CORPORAL"]]],0.5],
		[[[["B_T_UAV_03_dynamicLoadout_F"],[],["LIEUTENANT"]]],0.5],
		[[[["B_UGV_01_rcws_F"],[],["CORPORAL"]]],0.5],
		*/
		// авиация
		[[[["B_T_VTOL_01_armed_F"],[],["LIEUTENANT"]]],0.5],
		[[[["B_Plane_CAS_01_F","B_Plane_CAS_01_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["B_Heli_Light_01_armed_F","B_Heli_Light_01_armed_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["B_Heli_Attack_01_F","B_Heli_Attack_01_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["B_Heli_Transport_03_F","B_Heli_Transport_03_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_Heli_Transport_01_F","B_Heli_Transport_01_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.5]
	];
};

// O_

	// OPF_F orig
	/*
	_east=_east+[
		// OIA_GuardSquad
		[[[["O_soldierU_SL_F",
			"O_soldierU_F","O_soldierU_LAT_F",
			"O_soldierU_M_F","O_soldierU_TL_F",
			"O_soldierU_AR_F","O_soldierU_A_F",
			"O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["SERGEANT",
			"PRIVATE","CORPORAL",
			"PRIVATE","SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_GuardTeam
		[[[["O_soldierU_TL_F",
			"O_soldierU_AR_F","O_soldierU_GL_F",
			"O_soldierU_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_GuardSentry
		[[[["O_soldierU_GL_F","O_soldierU_F"],[[0,0,0],[5,-5,0]],
			["CORPORAL","PRIVATE"]]],0],
		// OI_support_CLS
		[[[["O_soldier_TL_F",
			"O_soldier_AR_F","O_medic_F",
			"O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OI_support_EOD
		[[[["O_soldier_TL_F",
			"O_engineer_F","O_soldier_exp_F",
			"O_soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OI_support_ENG
		[[[["O_soldier_TL_F",
			"O_engineer_F","O_engineer_F",
			"O_soldier_repair_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OI_recon_EOD
		[[[["O_recon_TL_F",
			"O_recon_exp_F","O_recon_exp_F",
			"O_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OI_support_MG
		[[[["O_soldier_TL_F",
			"O_support_MG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0],
		// OI_support_GMG
		[[[["O_soldier_TL_F",
			"O_support_GMG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0],
		// OI_support_Mort
		[[[["O_soldier_TL_F",
			"O_support_Mort_F","O_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0],
		// OIA_MotInf_Team
		[[[["O_MRAP_02_GMG_F",
			"O_soldier_AR_F","O_soldier_AT_F"],[[0,0,0],[-5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0],
		// OIA_MotInf_AT
		[[[["O_MRAP_02_F",
			"O_soldier_AT_F","O_soldier_AT_F",
			"O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_MotInf_AA
		[[[["O_MRAP_02_F",
			"O_soldier_AA_F","O_soldier_AA_F",
			"O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_MotInf_MGTeam
		[[[["O_MRAP_02_F",
			"O_soldier_TL_F","O_support_MG_F",
			"O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE"]]],0],
		// OIA_MotInf_GMGTeam
		[[[["O_MRAP_02_F",
			"O_soldier_TL_F","O_support_GMG_F",
			"O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE"]]],0],
		// OIA_MotInf_MortTeam
		[[[["O_MRAP_02_F",
			"O_soldier_TL_F","O_support_Mort_F",
			"O_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE"]]],0],
		// OIA_MotInf_Reinforce
		[[[["O_Truck_03_transport_F",
			"O_soldier_SL_F","O_soldier_F",
			"O_soldier_LAT_F","O_soldier_M_F",
			"O_soldier_TL_F","O_soldier_AR_F",
			"O_soldier_A_F","O_medic_F",
			"O_soldier_TL_F","O_soldier_AR_F",
			"O_soldier_GL_F","O_soldier_LAT_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0]],
			["SERGEANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"]]],0],
		// O_MotInf_ReconViperTeam
		[[[["O_LSV_02_unarmed_viper_F",
			"O_V_Soldier_TL_hex_F","O_V_Soldier_JTAC_hex_F",
			"O_V_Soldier_M_hex_F","O_V_Soldier_Exp_hex_F",
			"O_V_Soldier_LAT_hex_F","O_V_Soldier_Medic_hex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"PRIVATE","PRIVATE"]]],0],
		// O_MotInf_AssaultViperTeam
		[[[["O_LSV_02_armed_viper_F",
			"O_V_Soldier_TL_hex_F","O_V_Soldier_JTAC_hex_F",
			"O_V_Soldier_M_hex_F","O_V_Soldier_Exp_hex_F",
			"O_V_Soldier_LAT_hex_F","O_V_Soldier_Medic_hex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"PRIVATE","PRIVATE"]]],0],
		// OIA_MechInfSquad
		[[[["O_APC_Wheeled_02_rcws_v2_F",
			"O_soldier_SL_F","O_soldier_F",
			"O_soldier_LAT_F","O_soldier_M_F",
			"O_soldier_TL_F","O_soldier_AR_F",
			"O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"]]],0],
		// OIA_MechInf_AT
		[[[["O_APC_Tracked_02_cannon_F",
			"O_soldier_SL_F","O_soldier_AR_F",
			"O_soldier_AT_F","O_soldier_AT_F",
			"O_soldier_AT_F","O_soldier_AAT_F",
			"O_soldier_AAT_F","O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"]]],0],
		// OIA_MechInf_AA
		[[[["O_APC_Tracked_02_cannon_F",
			"O_soldier_SL_F","O_soldier_AR_F",
			"O_soldier_AA_F","O_soldier_AA_F",
			"O_soldier_AA_F","O_soldier_AAA_F",
			"O_soldier_AAA_F","O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"]]],0],
		// OIA_MechInf_Support
		[[[["O_APC_Wheeled_02_rcws_v2_F",
			"O_soldier_SL_F","O_soldier_TL_F",
			"O_soldier_repair_F","O_engineer_F",
			"O_medic_F","O_soldier_AR_F",
			"O_soldier_exp_F","O_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE","CORPORAL",
			"PRIVATE","PRIVATE"]]],0],
		// OIA_TankPlatoon
		[[[["O_MBT_02_cannon_F",
			"O_MBT_02_cannon_F","O_MBT_02_cannon_F",
			"O_MBT_02_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL"]]],0],
		// OIA_TankPlatoon_AA
		[[[["O_MBT_02_cannon_F",
			"O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F",
			"O_APC_Tracked_02_AA_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL"]]],0],
		// OIA_TankSection
		[[[["O_MBT_02_cannon_F","O_MBT_02_cannon_F"],[[0,0,0],[10,-10,0]],
			["LIEUTENANT","SERGEANT"]]],0],
		// OIA_SPGPlatoon_Scorcher
		[[[["O_MBT_02_arty_F",
			"O_MBT_02_arty_F","O_MBT_02_arty_F",
			"O_MBT_02_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL"]]],0],
		// OIA_SPGSection_Scorcher
		[[[["O_MBT_02_arty_F","O_MBT_02_arty_F"],[[0,0,0],[10,-10,0]],
			["LIEUTENANT","SERGEANT"]]],0],
		// O_TankSection_Heavy
		[[[["O_MBT_04_cannon_F","O_MBT_04_cannon_F"],[[0,0,0],[10,-10,0]],
			["LIEUTENANT","SERGEANT"]]],0],
		// O_TankPlatoon_Heavy
		[[[["O_MBT_04_command_F",
			"O_MBT_04_cannon_F","O_MBT_04_cannon_F",
			"O_MBT_04_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL"]]],0],
		// OIA_InfSquad
		[[[["O_soldier_SL_F",
			"O_soldier_F","O_soldier_LAT_F",
			"O_soldier_M_F","O_soldier_TL_F",
			"O_soldier_AR_F","O_soldier_A_F",
			"O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["SERGEANT",
			"PRIVATE","CORPORAL",
			"PRIVATE","SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_InfSquad_Weapons
		[[[["O_soldier_SL_F",
			"O_soldier_AR_F","O_soldier_GL_F",
			"O_soldier_M_F","O_soldier_AT_F",
			"O_soldier_AAT_F","O_soldier_A_F",
			"O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["SERGEANT",
			"PRIVATE","CORPORAL",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_InfTeam
		[[[["O_soldier_TL_F",
			"O_soldier_AR_F","O_soldier_GL_F",
			"O_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_InfTeam_AT
		[[[["O_soldier_TL_F",
			"O_soldier_AT_F","O_soldier_AT_F",
			"O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_InfTeam_AA
		[[[["O_soldier_TL_F",
			"O_soldier_AA_F","O_soldier_AA_F",
			"O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_InfSentry
		[[[["O_soldier_GL_F","O_soldier_F"],[[0,0,0],[5,-2,0]],
			["CORPORAL","PRIVATE"]]],0],
		// OI_reconTeam
		[[[["O_recon_TL_F",
			"O_recon_M_F","O_recon_medic_F",
			"O_recon_LAT_F","O_recon_JTAC_F",
			"O_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OI_reconPatrol
		[[[["O_recon_TL_F",
			"O_recon_M_F","O_recon_medic_F",
			"O_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OI_reconSentry
		[[[["O_recon_M_F","O_recon_F"],[[0,0,0],[5,-5,0]],
			["CORPORAL","PRIVATE"]]],0],
		// OI_SniperTeam
		[[[["O_sniper_F","O_spotter_F"],[[0,0,0],[5,-5,0]],
			["CORPORAL","PRIVATE"]]],0],
		// OIA_InfAssault
		[[[["O_Soldier_SL_F",
			"O_Soldier_AR_F","O_HeavyGunner_F",
			"O_Soldier_AAR_F","O_soldier_M_F",
			"O_Sharpshooter_F","O_Soldier_LAT_F",
			"O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["SERGEANT",
			"PRIVATE","CORPORAL",
			"PRIVATE","PRIVATE",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OIA_ReconSquad
		[[[["O_recon_TL_F",
			"O_recon_M_F","O_recon_medic_F",
			"O_recon_F","O_recon_LAT_F",
			"O_recon_JTAC_F","O_recon_exp_F",
			"O_Pathfinder_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE","PRIVATE",
			"PRIVATE","PRIVATE",
			"CORPORAL"]]],0],
		// O_InfTeam_AT_Heavy
		[[[["O_soldier_TL_F",
			"O_soldier_HAT_F","O_soldier_HAT_F",
			"O_soldier_AHAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OI_diverTeam
		[[[["O_diver_TL_F",
			"O_diver_exp_F","O_diver_F",
			"O_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0],
		// OI_diverTeam_Boat
		[[[["O_diver_TL_F",
			"O_diver_exp_F","O_diver_F",
			"O_diver_F","O_Boat_Transport_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE","PRIVATE"]]],0],
		// OI_diverTeam_SDV
		[[[["O_diver_TL_F",
			"O_diver_exp_F","O_diver_F",
			"O_diver_F","O_SDV_01_F",
			"O_SDV_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE","PRIVATE",
			"PRIVATE"]]],0],
		// OI_SmallTeam_UAV
		[[[["O_soldier_TL_F",
			"O_soldier_UAV_F","O_UAV_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0],
		// OI_ReconTeam_UGV
		[[[["O_soldier_TL_F",
			"O_soldier_UAV_F","O_UGV_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0],
		// OI_AttackTeam_UGV
		[[[["O_soldier_TL_F",
			"O_soldier_UAV_F","O_UGV_01_rcws_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0],
		// OI_ReconTeam_UAV
		[[[["O_soldier_TL_F",
			"O_soldier_UAV_F","O_UAV_02_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0],
		// OI_AttackTeam_UAV
		[[[["O_soldier_TL_F",
			"O_soldier_UAV_F","O_UAV_02_CAS_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0],
		// OI_ViperTeam
		[[[["O_V_Soldier_TL_hex_F",
			"O_V_Soldier_JTAC_hex_F","O_V_Soldier_M_hex_F",
			"O_V_Soldier_Exp_hex_F","O_V_Soldier_LAT_hex_F",
			"O_V_Soldier_Medic_hex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE","PRIVATE",
			"PRIVATE"]]],0]
	];
	*/

if(!_woodland && _deserted)then{
	_east=_east+[
		// пехота
		[[[["O_soldierU_SL_F","O_soldierU_TL_F","O_soldierU_F","O_soldierU_LAT_F","O_soldierU_M_F","O_soldierU_AR_F","O_soldierU_A_F","O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldierU_TL_F","O_soldierU_AR_F","O_soldierU_GL_F","O_soldierU_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldierU_GL_F","O_soldierU_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_SL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_M_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_TL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_TL_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_TL_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_GL_F","O_soldier_F"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["O_Soldier_SL_F","O_Soldier_AR_F","O_HeavyGunner_F","O_Soldier_AAR_F","O_soldier_M_F","O_Sharpshooter_F","O_Soldier_LAT_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// разведка
		[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_LAT_F","O_recon_JTAC_F","O_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_recon_M_F","O_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_F","O_recon_LAT_F","O_recon_JTAC_F","O_recon_exp_F","O_Pathfinder_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_sniper_F","O_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		// водолазы
		[[[["O_diver_TL_F","O_diver_exp_F","O_diver_F","O_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
		// корабль
		// Маршруты неисправны.
		//[[[["O_Boat_Transport_01_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[["O_soldier_TL_F"]]]],0.5],
		//[[[["O_diver_TL_F","O_diver_exp_F","O_diver_F","O_diver_F","O_SDV_01_F","O_SDV_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// колесный
		[[[["O_soldier_TL_F","O_soldier_AR_F","O_soldier_AT_F","O_MRAP_02_GMG_F"],[[-5,-5,0],[-5,-5,0],[5,5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_TL_F","O_soldier_AR_F","O_soldier_AT_F","O_MRAP_02_hmg_F"],[[-5,-5,0],[-5,-5,0],[5,5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_TL_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F","O_MRAP_02_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[5,5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_TL_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F","O_MRAP_02_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[5,5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_F","O_Truck_03_transport_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[0,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_F","O_Truck_03_covered_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[0,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_F","O_soldier_F","O_soldier_F","O_medic_F","O_Truck_02_transport_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[0,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_F","O_soldier_F","O_soldier_F","O_medic_F","O_Truck_02_covered_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[0,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_LSV_02_unarmed_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_AR_F","O_soldier_LAT_F""O_LSV_02_armed_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F","O_G_medic_F","O_G_Soldier_F","O_G_Offroad_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F"],[[0,0,0],[10,-10,0],[-10,-10,0]],["PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// бтр
		[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_APC_Wheeled_02_rcws_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_repair_F","O_engineer_F","O_medic_F","O_soldier_AR_F","O_soldier_exp_F","O_soldier_A_F","O_APC_Wheeled_02_rcws_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// гусеничный
		[[[["O_soldier_SL_F","O_soldier_AR_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_AAT_F","O_soldier_AAT_F","O_APC_Tracked_02_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_soldier_SL_F","O_soldier_AR_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F","O_soldier_AAA_F","O_soldier_AAA_F","O_APC_Tracked_02_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// танки
		[[[["O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_MBT_02_cannon_F","O_MBT_02_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_MBT_04_command_F","O_MBT_04_cannon_F","O_MBT_04_cannon_F","O_MBT_04_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_MBT_04_command_F","O_MBT_04_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		// артиллерия
		/*
		[[[["O_MBT_02_arty_F","O_MBT_02_arty_F","O_MBT_02_arty_F","O_MBT_02_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_MBT_02_arty_F","O_MBT_02_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		*/
		// авиация
		[[
			[["O_Heli_Transport_04_covered_F"],[[0,0,0]],["LIEUTENANT"]],
			[["O_soldierU_SL_F","O_soldierU_TL_F","O_soldierU_F","O_soldierU_LAT_F","O_soldierU_M_F","O_soldierU_AR_F","O_soldierU_A_F","O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		[[
			[["O_T_VTOL_02_infantry_dynamicLoadout_F"],[[0,0,0]],["LIEUTENANT"]],
			[["O_soldierU_SL_F","O_soldierU_TL_F","O_soldierU_F","O_soldierU_LAT_F","O_soldierU_M_F","O_soldierU_AR_F","O_soldierU_A_F","O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		// поддержка
		[[[["O_Truck_03_medical_F"],[],["PRIVATE"],[["O_medic_F"]]]],0.01],
		[[[["O_Truck_03_repair_F"],[],["PRIVATE"],[["O_engineer_F"]]]],0.01],
		[[[["O_Truck_03_fuel_F"],[],["PRIVATE"]]],0.01],
		[[[["O_Truck_03_ammo_F"],[],["PRIVATE"]]],0.02],
		[[[["O_Truck_02_medical_F"],[],["PRIVATE"],[["O_medic_F"]]]],0.01],
		[[[["O_Truck_02_box_F"],[],["PRIVATE"],[["O_engineer_F"]]]],0.01],
		// [[[["O_Truck_02_Ammo_F"],[],["PRIVATE"]]],0.5],
		[[[["O_Truck_02_fuel_F"],[],["PRIVATE"]]],0.01],
		[[[["O_G_Offroad_01_repair_F"],[],["PRIVATE"],[["O_G_engineer_F"]]]],0.01],
		[[[["O_G_Van_01_fuel_F"],[],["PRIVATE"]]],0.01]
		// турели
		/*
		[[[["O_GMG_01_F"],[],["PRIVATE"]]],0.1],
		[[[["O_HMG_01_A_F"],[],["PRIVATE"]]],0.1],
		[[[["O_HMG_01_high_F"],[],["PRIVATE"]]],0.1],
		[[[["O_static_AA_F"],[],["PRIVATE"]]],0.1],
		[[[["O_static_AT_F"],[],["PRIVATE"]]],0.1],
		[[[["O_HMG_01_F"],[],["PRIVATE"]]],0.1],
		[[[["O_GMG_01_A_F"],[],["PRIVATE"]]],0.1],
		[[[["O_GMG_01_high_F"],[],["PRIVATE"]]],0.1],
		[[[["O_Mortar_01_F"],[],["PRIVATE"]]],0.05],
		[[[["O_G_Mortar_01_F"],[],["PRIVATE"]]],0.05]
		*/
	];
};
if(true)then{
	_east=_east+[
		// беспилотники
		/*
		[[[["O_UAV_01_F"],[],["CORPORAL"]]],0.5],
		[[[["O_UAV_02_F"],[],["CORPORAL"]]],0.5],
		[[[["O_UAV_02_CAS_F"],[],["CORPORAL"]]],0.5],
		[[[["O_T_UAV_04_CAS_F"],[],["LIEUTENANT"]]],0.5],
		[[[["O_UGV_01_rcws_F"],[],["CORPORAL"]]],0.5],
		*/
		// авиация
		[[[["O_Heli_Attack_02_black_F","O_Heli_Attack_02_black_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["O_Heli_Light_02_F","O_Heli_Light_02_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["O_Plane_CAS_02_F","O_Plane_CAS_02_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
	];
};

// I_
if(true)then{
	_guer=_guer+[
		// пехота
		[[[["I_soldier_SL_F","I_soldier_TL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_soldier_SL_F","I_soldier_AR_F","I_soldier_GL_F","I_soldier_M_F","I_soldier_AT_F","I_soldier_AAT_F","I_soldier_A_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_GL_F","I_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_Soldier_TL_F","I_Soldier_AT_F","I_Soldier_AT_F","I_Soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_Soldier_TL_F","I_Soldier_AA_F","I_Soldier_AA_F","I_Soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_Soldier_GL_F","I_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		// разведка
		[[[["I_Sniper_F","I_Spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		// водолазы
		[[[["I_diver_TL_F","I_diver_exp_F","I_diver_F","I_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
		// корабль
		// Маршруты неисправны.
		//[[[["I_Boat_Transport_01_F","I_Soldier_AR_F","I_Soldier_GL_F","I_soldier_LAT_F","I_soldier_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[["I_Soldier_TL_F"]]]],0.5],
		//[[[["I_diver_TL_F","I_diver_exp_F","I_diver_F","I_diver_F","I_SDV_01_F","I_SDV_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// колесный
		[[[["I_Soldier_AR_F","I_MRAP_03_gmg_F"],[[5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE"]]],0.5],
		[[[["I_Soldier_LAT_F","I_MRAP_03_hmg_F"],[[5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE"]]],0.5],
		[[[["I_Soldier_AT_F","I_Soldier_AAT_F","I_MRAP_03_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_Soldier_AA_F","I_Soldier_AAA_F","I_MRAP_03_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_soldier_SL_F","I_soldier_SL_F","I_soldier_TL_F","I_soldier_TL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F","I_Truck_02_transport_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0],[0,0,0]],["CAPTAIN","CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_soldier_SL_F","I_soldier_SL_F","I_soldier_TL_F","I_soldier_TL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F","I_Truck_02_covered_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0],[0,0,0]],["CAPTAIN","CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// бтр
		[[[["I_soldier_SL_F","I_soldier_TL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F","I_APC_Wheeled_03_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_soldier_SL_F","I_soldier_TL_F","I_soldier_repair_F","I_engineer_F","I_medic_F","I_soldier_AR_F","I_soldier_exp_F","I_soldier_A_F","I_APC_Wheeled_03_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// гусеничный
		[[[["I_soldier_SL_F","I_soldier_AT_F","I_soldier_AT_F","I_soldier_AT_F","I_soldier_AAT_F","I_soldier_AAT_F","I_soldier_AAT_F","I_APC_tracked_03_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_soldier_SL_F","I_soldier_AA_F","I_soldier_AA_F","I_soldier_AA_F","I_soldier_AAT_F","I_soldier_AAA_F","I_soldier_AAA_F","I_APC_tracked_03_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// танки
		[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_MBT_03_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[0,-15,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["I_LT_01_cannon_F","I_LT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["I_LT_01_scout_F","I_LT_01_AA_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["I_LT_01_AT_F","I_LT_01_AT_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["I_LT_01_AA_F","I_LT_01_AA_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		// беспилотники
		/*
		[[[["I_UAV_01_F"],[],["PRIVATE"]]],0.5],
		[[[["I_UAV_02_F"],[],["PRIVATE"]]],0.5],
		[[[["I_UAV_02_CAS_F"],[],["PRIVATE"]]],0.5],
		[[[["I_UGV_01_rcws_F"],[],["PRIVATE"]]],0.5],
		*/
		// авиация
		[[
			[["I_Heli_light_03_dynamicLoadout_F"],[[0,0,0]],["LIEUTENANT"]],
			[["I_Soldier_SL_F","I_Soldier_AR_F","I_Soldier_M_F","I_Soldier_AT_F","I_Soldier_AAT_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		[[[["I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_CAS_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["I_Heli_light_03_F","I_Heli_light_03_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		// артиллерия
		/*
		[[[["I_Truck_02_MRL_F","I_Truck_02_MRL_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		*/
		// поддержка
		[[[["I_Truck_02_medical_F"],[],["PRIVATE"],[["I_medic_F"]]]],0.02],
		[[[["I_Truck_02_box_F"],[],["PRIVATE"],[["I_engineer_F"]]]],0.02],
		[[[["I_Truck_02_fuel_F"],[],["PRIVATE"]]],0.01],
		[[[["I_Truck_02_ammo_F"],[],["PRIVATE"]]],0.02],
		[[[["I_G_Offroad_01_repair_F"],[],["PRIVATE"],[["I_engineer_F"]]]],0.01],
		[[[["I_G_Van_01_fuel_F"],[],["PRIVATE"]]],0.01]
		// турели
		/*
		[[[["I_GMG_01_F"],[],["PRIVATE"]]],0.1],
		[[[["I_HMG_01_A_F"],[],["PRIVATE"]]],0.1],
		[[[["I_HMG_01_high_F"],[],["PRIVATE"]]],0.1],
		[[[["I_static_AA_F"],[],["PRIVATE"]]],0.1],
		[[[["I_static_AT_F"],[],["PRIVATE"]]],0.1],
		[[[["I_HMG_01_F"],[],["PRIVATE"]]],0.1],
		[[[["I_GMG_01_A_F"],[],["PRIVATE"]]],0.1],
		[[[["I_GMG_01_high_F"],[],["PRIVATE"]]],0.1],
		[[[["I_Mortar_01_F"],[],["PRIVATE"]]],0.05],
		[[[["I_G_Mortar_01_F"],[],["PRIVATE"]]],0.05]
		*/
	];
};


// B_T_
if(_woodland && !_deserted)then{
	_west=_west+[
		// пехота
		[[[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_GL_F","B_T_soldier_M_F","B_T_soldier_AT_F","B_T_soldier_AAT_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_soldier_GL_F","B_T_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_TL_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_TL_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_GL_F","B_T_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		// разведка
		[[[["B_T_recon_TL_F","B_T_recon_M_F","B_T_recon_medic_F","B_T_recon_LAT_F","B_T_recon_JTAC_F","B_T_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_recon_TL_F","B_T_recon_M_F","B_T_recon_medic_F","B_T_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_recon_M_F","B_T_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_T_sniper_F","B_T_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_Exp_tna_F","B_CTRG_Soldier_AR_tna_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_LAT_tna_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_tna_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		// водолазы
		[[[["B_T_diver_TL_F","B_T_diver_exp_F","B_T_diver_F","B_T_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
		// корабль
		// Маршруты неисправны.
		/*
		[[[["B_T_Boat_Transport_01_F","B_T_soldier_AR_F","B_T_soldier_GL_F","B_T_soldier_LAT_F","B_T_soldier_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[["B_T_soldier_TL_F"]]]],0.5],
		//[[[["B_T_diver_TL_F","B_T_diver_exp_F","B_T_diver_F","B_T_diver_F","B_SDV_01_F","B_SDV_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[
			[["B_T_Boat_Armed_01_minigun_F"],[[0,0,0]],["LIEUTENANT"]],
			[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		*/
		// колесный
		[[[["B_T_soldier_AR_F","B_T_soldier_LAT_F","B_T_MRAP_01_gmg_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_AR_F","B_T_soldier_LAT_F","B_T_MRAP_01_hmg_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AAT_F","B_T_MRAP_01_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AAA_F","B_T_MRAP_01_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_SL_F","B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F","B_T_soldier_F","B_T_Truck_01_transport_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0],[-5,-16,0],[0,0,0]],["CAPTAIN","CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_SL_F","B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F","B_T_soldier_F","B_T_Truck_01_covered_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0],[-5,-16,0],[0,0,0]],["CAPTAIN","CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_LSV_01_unarmed_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[0,0,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_AR_F","B_T_soldier_LAT_F""B_T_LSV_01_armed_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_Exp_tna_F","B_T_LSV_01_unarmed_CTRG_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_LAT_tna_F","B_T_LSV_01_armed_CTRG_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// бтр
		[[[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F","B_T_APC_Wheeled_01_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_repair_F","B_T_engineer_F","B_T_medic_F","B_T_soldier_AR_F","B_T_soldier_exp_F","B_T_soldier_A_F","B_T_APC_Wheeled_01_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		// гусеничный
		[[[["B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AAT_F","B_T_soldier_AAT_F","B_T_soldier_AAT_F","B_T_APC_Tracked_01_rcws_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AAA_F","B_T_soldier_AAA_F","B_T_soldier_AAA_F","B_T_APC_Tracked_01_aa_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// Экипаж покидает тс.
		//[[[["B_T_APC_Tracked_01_CRV_F"],[[0,0,0]],["SERGEANT"]]],0.5],
		// танки
		[[[["B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_MBT_01_cannon_F","B_T_APC_Tracked_01_aa_F","B_T_MBT_01_cannon_F","B_T_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_MBT_01_TUSK_F","B_T_MBT_01_TUSK_F","B_T_MBT_01_TUSK_F","B_T_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_MBT_01_TUSK_F","B_T_APC_Tracked_01_aa_F","B_T_MBT_01_TUSK_F","B_T_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_MBT_01_TUSK_F","B_T_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		// артиллерия
		/*
		[[[["B_T_MBT_01_arty_F","B_T_MBT_01_arty_F","B_T_MBT_01_arty_F","B_T_MBT_01_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_MBT_01_arty_F","B_T_MBT_01_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_T_MBT_01_mlrs_F","B_T_MBT_01_mlrs_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		*/
		// поддержка
		[[[["B_T_Truck_01_medical_F"],[],["PRIVATE"],[["B_T_Medic_F"]]]],0.02],
		[[[["B_T_Truck_01_Repair_F"],[],["PRIVATE"],[["B_T_Engineer_F"]]]],0.02],
		[[[["B_T_Truck_01_fuel_F"],[],["PRIVATE"]]],0.01],
		[[[["B_T_Truck_01_ammo_F"],[],["PRIVATE"]]],0.02],
		// беспилотники
		// авиация
		[[
			[["B_T_VTOL_01_infantry_F"],[[0,0,0]],["LIEUTENANT"]],
			[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		[[
			[["B_CTRG_Heli_Transport_01_tropic_F"],[[0,0,0]],["LIEUTENANT"]],
			[["B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_Exp_tna_F","B_CTRG_Soldier_AR_tna_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5]
		// турели
		/*
		[[[["B_T_GMG_01_F"],[],["PRIVATE"]]],0.1],
		[[[["B_T_Static_AA_F"],[],["PRIVATE"]]],0.1],
		[[[["B_T_Static_AT_F"],[],["PRIVATE"]]],0.1],
		[[[["B_T_HMG_01_F"],[],["PRIVATE"]]],0.1],
		[[[["B_T_Mortar_01_F"],[],["PRIVATE"]]],0.05]
		*/
	];
};

// O_T_
if(_woodland && !_deserted)then{
	_east=_east+[
		// пехота
		[[[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_SL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_M_F","O_T_soldier_AT_F","O_T_soldier_AAT_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_TL_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_TL_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_GL_F","O_T_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		// разведка
		[[[["O_V_Soldier_TL_hex_F","O_V_Soldier_JTAC_hex_F","O_V_Soldier_M_hex_F","O_V_Soldier_Exp_hex_F","O_V_Soldier_LAT_hex_F","O_V_Soldier_Medic_hex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_recon_TL_F","O_T_recon_M_F","O_T_recon_medic_F","O_T_recon_LAT_F","O_T_recon_JTAC_F","O_T_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_recon_TL_F","O_T_recon_M_F","O_T_recon_medic_F","O_T_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_recon_M_F","O_T_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["O_T_sniper_F","O_T_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		// водолазы
		[[[["O_T_diver_TL_F","O_T_diver_exp_F","O_T_diver_F","O_T_diver_F"],[],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
		// корабль
		// Маршруты неисправны.
		/*
		[[[["O_T_Boat_Transport_01_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_LAT_F","O_T_soldier_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[["O_T_soldier_TL_F"]]]],0.5],
		//[[[["O_T_diver_TL_F","O_T_diver_exp_F","O_T_diver_F","O_T_diver_F","O_SDV_01_F","O_SDV_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[
			[["O_T_Boat_Armed_01_hmg_F"],[[0,0,0]],["LIEUTENANT"]],
			[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		*/
		// колесный
		[[[["O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_AT_F","O_T_MRAP_02_gmg_ghex_F"],[[5,-5,0],[-5,-5,0],[5,5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_AT_F","O_T_MRAP_02_hmg_ghex_F"],[[5,-5,0],[-5,-5,0],[5,5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_TL_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AAT_F","O_T_MRAP_02_ghex_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[5,5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_TL_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AAA_F","O_T_MRAP_02_ghex_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[5,5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_LAT_F","O_T_soldier_F","O_T_Truck_03_transport_ghex_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[0,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_LAT_F","O_T_soldier_F","O_T_Truck_03_covered_ghex_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[0,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F","O_T_LSV_02_unarmed_viper_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F","O_T_LSV_02_armed_viper_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// бтр
		[[[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F","O_T_APC_Wheeled_02_rcws_ghex_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_repair_F","O_T_engineer_F","O_T_medic_F","O_T_soldier_AR_F","O_T_soldier_exp_F","O_T_soldier_A_F","O_T_APC_Wheeled_02_rcws_ghex_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-2,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// гусеничный
		[[[["O_T_soldier_SL_F","O_T_soldier_AR_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AAT_F","O_T_soldier_AAT_F","O_T_soldier_AAT_F","O_T_APC_Tracked_02_cannon_ghex_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_T_soldier_SL_F","O_T_soldier_AR_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AAA_F","O_T_soldier_AAA_F","O_T_soldier_AAA_F","O_T_APC_Tracked_02_AA_ghex_F"],[[5,-5,0],[-5,-5,0],[10,-20,0],[-10,-20,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		// танки
		[[[["O_T_MBT_02_cannon_ghex_F","O_T_MBT_02_cannon_ghex_F","O_T_MBT_02_cannon_ghex_F","O_T_MBT_02_cannon_ghex_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_T_MBT_02_cannon_ghex_F","O_T_APC_Tracked_02_AA_ghex_F","O_T_MBT_02_cannon_ghex_F","O_T_APC_Tracked_02_AA_ghex_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_T_MBT_02_cannon_ghex_F","O_T_MBT_02_cannon_ghex_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_T_MBT_04_command_F","O_T_MBT_04_cannon_F","O_T_MBT_04_cannon_F","O_T_MBT_04_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_T_MBT_04_command_F","O_T_MBT_04_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		// артиллерия
		/*
		[[[["O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		*/
		// поддержка
		[[[["O_T_Truck_03_medical_ghex_F"],[],["PRIVATE"],[["O_T_Medic_F"]]]],0.02],
		[[[["O_T_Truck_03_repair_ghex_F"],[],["PRIVATE"],[["O_T_Engineer_F"]]]],0.02],
		[[[["O_T_Truck_03_fuel_ghex_F"],[],["PRIVATE"]]],0.01],
		[[[["O_T_Truck_03_ammo_ghex_F"],[],["PRIVATE"]]],0.02],
		// беспилотники
		// авиация
		[[
			[["O_Heli_Transport_04_bench_F"],[[0,0,0]],["LIEUTENANT"]],
			[["O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F","O_V_Soldier_ghex_F","O_V_Soldier_ghex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		[[
			[["O_Heli_Transport_04_covered_F"],[[0,0,0]],["LIEUTENANT"]],
			[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5],
		[[
			[["O_T_VTOL_02_infantry_dynamicLoadout_F"],[[0,0,0]],["LIEUTENANT"]],
			[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5]
	];
};

// I_C_
if(_woodland && !_deserted)then{
	_guer=_guer+[
		// пехота
		[[[["I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_3_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
		[[[["I_C_Soldier_Para_6_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
		[[[["I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_3_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_1_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
		[[[["I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_8_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.5],
		[[[["I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_8_F","I_C_Soldier_Bandit_1_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5]
	];
	if(toLower worldname in ["tanoa"])then{
		_guer=_guer+[
			// колесный
			[[[["I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Offroad_02_unarmed_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.05]
		];
	}else{
		_guer=_guer+[
			// колесный
			[[[["I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Offroad_02_unarmed_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5]
			// [[[["I_C_Soldier_Para_6_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_3_F","I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F","I_C_Offroad_02_unarmed_F"],[[15,0,0],[0,15,0],[15,15,0],[-15,0,0],[0,-15,0],[0,10,0],[10,0,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		];
	};
};

// жандармерия
_west=_west+[
	[[[["B_GEN_Commander_F","B_GEN_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.01],
	[[[["B_GEN_Offroad_01_gen_F","B_GEN_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.01]
];

// laws of war
/*
_west=_west+[
	[[[["B_UAV_06_F"],[],["PRIVATE"]]],0.5],
	[[[["B_UAV_06_medical_F"],[],["PRIVATE"]]],0.5]
];
*/
_west=_west+[
	[[[["B_GEN_Commander_F",
		"B_GEN_Soldier_F","B_GEN_Soldier_F",
		"B_GEN_Van_02_vehicle_F"],[[0,2.5],[0,-2.5],[2.5,0],[0,0]],
		["LIEUTENANT",
		"PRIVATE","PRIVATE",
		"PRIVATE"]]],0.01]
];
// laws of war
/*
_east=_east+[
	[[[["O_UAV_06_F"],[],["PRIVATE"]]],0.5],
	[[[["O_UAV_06_medical_F"],[],["PRIVATE"]]],0.5]
];
*/
// laws of war
/*
_guer=_guer+[
	[[[["I_UAV_06_F"],[],["PRIVATE"]]],0.5],
	[[[["I_UAV_06_medical_F"],[],["PRIVATE"]]],0.5]
];
*/

// jets
_west=_west+[
	//[[[["B_UAV_05_F"],[],["PRIVATE"]]],0.5],
	[[[["B_Plane_Fighter_01_F","B_Plane_Fighter_01_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["B_Plane_Fighter_01_Stealth_F","B_Plane_Fighter_01_Stealth_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
	//[[[["B_Radar_System_01_F","B_SAM_System_03_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
];
// jets
_east=_east+[
	[[[["O_Plane_Fighter_02_F","O_Plane_Fighter_02_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["O_Plane_Fighter_02_Stealth_F","O_Plane_Fighter_02_Stealth_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
	//[[[["O_Radar_System_02_F","O_SAM_System_04_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
];
// jets
_guer=_guer+[
	[[[["I_Plane_Fighter_04_F","I_Plane_Fighter_04_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
];

// дистанционный целеуказатель
/*
_west=_west+[
	[[[["B_Static_Designator_01_F"],[],["PRIVATE"]]],0.5]
];
_east=_east+[
	[[[["O_Static_Designator_02_F"],[],["PRIVATE"]]],0.5]
];
*/

// RHS
_east=_east+[
	// пехота
	[[[["rhs_msv_sergeant","rhs_msv_efreitor","rhs_msv_grenadier_rpg","rhs_msv_strelok_rpg_assist","rhs_msv_machinegunner","rhs_msv_LAT","rhs_msv_strelok_rpg_assist","rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_medic"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[5,5,0],[5,10,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["rhs_msv_junior_sergeant","rhs_msv_aa","rhs_msv_aa","rhs_msv_aa","rhs_msv_rifleman"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["rhs_msv_junior_sergeant","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_LAT","rhs_msv_rifleman"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// колесный
	[[[
		["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_efreitor","rhs_msv_grenadier",
		"rhs_msv_machinegunner","rhs_msv_arifleman","rhs_msv_marksman",
		"rhs_msv_at","rhs_msv_grenadier_rpg",
		"rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_machinegunner_assistant","rhs_msv_strelok_rpg_assist","rhs_msv_medic","RHS_Ural_MSV_01"],
		[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[5,2,0],[0,0,0]],
		["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
	]],0.5],
	[[[
		["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_efreitor","rhs_msv_grenadier",
		"rhs_msv_machinegunner","rhs_msv_arifleman","rhs_msv_marksman","rhs_msv_marksman",
		"rhs_msv_at","rhs_msv_grenadier_rpg",
		"rhs_msv_rifleman","rhs_msv_strelok_rpg_assist","rhs_msv_machinegunner_assistant","rhs_gaz66_msv"],
		[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,-6,0],[-5,-4,0],[-5,-2,0],[-5,0,0],[5,2,0],[0,0,0]],
		["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
	]],0.5],
	// бтр
	[[[
		["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_efreitor","rhs_msv_grenadier",
		"rhs_btr70_msv",
		"rhs_msv_machinegunner","rhs_msv_arifleman","rhs_msv_marksman",
		"rhs_msv_at","rhs_msv_grenadier_rpg","rhs_msv_aa",
		"rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_machinegunner_assistant","rhs_msv_strelok_rpg_assist","rhs_msv_engineer","rhs_msv_medic"],
		[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[5,2,0],[-5,2,0],[5,4,0],[0,0,0]],
		["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
	]],0.5],
	[[[
		["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_efreitor","rhs_msv_grenadier",
		"rhs_btr80a_msv",
		"rhs_msv_machinegunner","rhs_msv_arifleman","rhs_msv_marksman","rhs_msv_marksman",
		"rhs_msv_at","rhs_msv_grenadier_rpg","rhs_msv_aa",
		"rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_machinegunner_assistant","rhs_msv_strelok_rpg_assist",
		"rhs_msv_engineer","rhs_msv_medic"],
		[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[5,2,0],[-5,2,0],[5,4,0],[-5,4,0],[0,0,0]],
		["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
	]],0.5],
	[[[
		["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_efreitor","rhs_msv_grenadier",
		"rhs_btr80_msv",
		"rhs_msv_machinegunner","rhs_msv_arifleman","rhs_msv_marksman","rhs_msv_marksman",
		"rhs_msv_at","rhs_msv_grenadier_rpg","rhs_msv_aa",
		"rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_machinegunner_assistant","rhs_msv_strelok_rpg_assist",
		"rhs_msv_engineer","rhs_msv_medic"],
		[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[5,2,0],[-5,2,0],[5,4,0],[-5,4,0],[0,0,0]],
		["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
	]],0.5],
	// гусеничный
	[[[
		["rhs_msv_sergeant","rhs_msv_junior_sergeant",
		"rhs_bmp3m_msv",
		"rhs_msv_machinegunner","rhs_msv_arifleman","rhs_msv_marksman",
		"rhs_msv_at","rhs_msv_grenadier_rpg","rhs_msv_strelok_rpg_assist","rhs_msv_engineer"],
		[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[0,0,0]],
		["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
	]],0.5],
	[[[
		["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_efreitor","rhs_msv_grenadier",
		"rhs_bmp2_msv",
		"rhs_msv_machinegunner","rhs_msv_arifleman","rhs_msv_arifleman","rhs_msv_marksman","rhs_msv_marksman",
		"rhs_msv_at","rhs_msv_at","rhs_msv_grenadier_rpg","rhs_msv_aa",
		"rhs_msv_rifleman","rhs_msv_machinegunner_assistant","rhs_msv_strelok_rpg_assist","rhs_msv_engineer","rhs_msv_medic"],
		[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[5,2,0],[-5,2,0],[5,4,0],[-5,4,0],[5,6,0],[0,0,0]],
		["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
	]],0.5],
	// пво
	[[[["rhs_zsu234_aa"],[],["LIEUTENANT"]]],0.4],
	// танки
	[[[["rhs_t80uk","rhs_t80um","rhs_t80um"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.1],
	[[[["rhs_t80bvk","rhs_t80bv","rhs_t80bv"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.1],
	[[[["rhs_t72bd_tv","rhs_t72bd_tv","rhs_t72bd_tv"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.2],
	[[[["rhs_t90_tv","rhs_t90_tv","rhs_t90_tv"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.3],
	[[[["rhs_t90a_tv","rhs_t90a_tv","rhs_t90a_tv"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	// беспилотники
	[[[["rhs_pchela1t_vvsc"],[],["LIEUTENANT"]]],0.5],
	// авиация
	[[[["rhs_mi28n_vvsc","rhs_mi28n_vvsc"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["RHS_Ka52_vvsc","RHS_Ka52_vvsc"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["RHS_Mi24P_vvsc","RHS_Mi24P_vvsc"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.2],
	[[[["RHS_Mi24V_vvsc","RHS_Mi24V_vvsc"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["RHS_Mi8MTV3_vvsc","RHS_Mi8MTV3_vvsc"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.1],
	[[[["rhs_mig29sm_vvsc","rhs_mig29sm_vvsc"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["RHS_Su25SM_vvsc","RHS_Su25SM_vvsc"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.4],
	// артиллерия
	[[[["rhs_2s3_tv","rhs_2s3_tv"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5]
];

// _west=[
// ];
// _east=[
// ];
// _guer=[
// ];

AllGroupsWest=_west;
AllGroupsEast=_east;
AllGroupsGuer=_guer;

diag_log format ["Log: [config_groups.sqf] west %1", count AllGroupsWest];
diag_log format ["Log: [config_groups.sqf] east %1", count AllGroupsEast];
diag_log format ["Log: [config_groups.sqf] guer %1", count AllGroupsGuer];
diag_log format ["Log: [config_groups.sqf] end %1", time];

			// пехота
			// разведка
			// водолазы
			// корабль
			// колесный
			// бтр
			// гусеничный
			// танки
			// беспилотники
			// авиация
			// артиллерия
			// поддержка
