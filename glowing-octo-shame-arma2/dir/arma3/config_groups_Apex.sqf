
#include "..\include\ranks.sqf"

// B_T_
_arr = [
			// пехота
			[[[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_GL_F","B_T_soldier_M_F","B_T_soldier_AT_F","B_T_soldier_AAT_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_soldier_GL_F","B_T_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["B_T_soldier_TL_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["B_T_soldier_TL_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["B_T_soldier_GL_F","B_T_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
			// DLC Tanks
			[[[["B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_soldier_F","B_T_soldier_LAT2_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
			// разведка
			[[[["B_T_recon_TL_F","B_T_recon_M_F","B_T_recon_medic_F","B_T_recon_LAT_F","B_T_recon_JTAC_F","B_T_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_recon_TL_F","B_T_recon_M_F","B_T_recon_medic_F","B_T_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_recon_M_F","B_T_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
			[[[["B_T_sniper_F","B_T_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
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
			[[[["B_T_soldier_AR_F","B_T_soldier_LAT_F","B_T_LSV_01_armed_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_Exp_tna_F","B_T_LSV_01_unarmed_CTRG_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_LAT_tna_F","B_T_LSV_01_armed_CTRG_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// бтр
			[[[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F","B_T_APC_Wheeled_01_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_repair_F","B_T_engineer_F","B_T_medic_F","B_T_soldier_AR_F","B_T_soldier_exp_F","B_T_soldier_A_F","B_T_APC_Wheeled_01_cannon_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// lxWS
			[[[["B_T_APC_Wheeled_01_atgm_lxWS","B_T_soldier_SL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_TL_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","LIEUTENANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
			// Rhino MGS
			[[[["B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.2],
			[[[["B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.2],
			[[[["B_T_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.2],
			[[[["B_T_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.2],
			// гусеничный
			[[[["B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AT_F","B_T_soldier_AAT_F","B_T_soldier_AAT_F","B_T_soldier_AAT_F","B_T_APC_Tracked_01_rcws_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AA_F","B_T_soldier_AAA_F","B_T_soldier_AAA_F","B_T_soldier_AAA_F","B_T_APC_Tracked_01_aa_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[0,0,0]],["CAPTAIN","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["B_T_APC_Tracked_01_CRV_F"],[],["SERGEANT"]]],0.01],
			// танки
			[[[["B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
			[[[["B_T_MBT_01_cannon_F","B_T_APC_Tracked_01_aa_F","B_T_MBT_01_cannon_F","B_T_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
			[[[["B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
			[[[["B_T_MBT_01_TUSK_F","B_T_MBT_01_TUSK_F","B_T_MBT_01_TUSK_F","B_T_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
			[[[["B_T_MBT_01_TUSK_F","B_T_APC_Tracked_01_aa_F","B_T_MBT_01_TUSK_F","B_T_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
			[[[["B_T_MBT_01_TUSK_F","B_T_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
			// поддержка
			[[[["B_T_Truck_01_medical_F"],[],["PRIVATE"],[["B_T_Medic_F"]]]],0.02],
			[[[["B_T_Truck_01_Repair_F"],[],["PRIVATE"],[["B_T_Engineer_F"]]]],0.02],
			[[[["B_T_Truck_01_fuel_F"],[],["PRIVATE"]]],0.01],
			[[[["B_T_Truck_01_ammo_F"],[],["PRIVATE"]]],0.02],
			// беспилотники
			// авиация
			[[
				[["B_Heli_Transport_03_F"],[[0,0,0]],["LIEUTENANT"]],
				[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1],
			[[
				[["B_Heli_Transport_03_F"],[[0,0,0]],["LIEUTENANT"]],
				[["B_T_soldier_SL_F","B_T_soldier_AR_F","B_T_soldier_GL_F","B_T_soldier_M_F","B_T_soldier_AT_F","B_T_soldier_AAT_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1],
			[[
				[["B_T_VTOL_01_infantry_F"],[[0,0,0]],["LIEUTENANT"]],
				[["B_T_soldier_SL_F","B_T_soldier_TL_F","B_T_soldier_F","B_T_soldier_LAT_F","B_T_soldier_M_F","B_T_soldier_AR_F","B_T_soldier_A_F","B_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1],
			[[
				[["B_CTRG_Heli_Transport_01_tropic_F"],[[0,0,0]],["LIEUTENANT"]],
				[["B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_Exp_tna_F","B_CTRG_Soldier_AR_tna_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1]
			// турели
			/*
			[[[["B_T_GMG_01_F"],[],["PRIVATE"]]],0.1],
			[[[["B_T_Static_AA_F"],[],["PRIVATE"]]],0.1],
			[[[["B_T_Static_AT_F"],[],["PRIVATE"]]],0.1],
			[[[["B_T_HMG_01_F"],[],["PRIVATE"]]],0.1],
			[[[["B_T_Mortar_01_F"],[],["PRIVATE"]]],0.05]
			*/
];
	// артиллерия
	if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
		_arr append [
			[[[["B_T_MBT_01_arty_F","B_T_MBT_01_arty_F","B_T_MBT_01_arty_F","B_T_MBT_01_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
			[[[["B_T_MBT_01_arty_F","B_T_MBT_01_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
			[[[["B_T_MBT_01_mlrs_F","B_T_MBT_01_mlrs_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5]
		];
	};
	[_groups_map, west, "BLU_T_F", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [225,249],
	["BLU_F", "CUP_B_US_Army", "CUP_B_USMC", "BLU_W_F"]
	] call gosa_fnc_map_groups_add;

// O_T_
_arr = [
			// пехота
			[[[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["O_T_soldier_SL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_M_F","O_T_soldier_AT_F","O_T_soldier_AAT_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["O_T_soldier_TL_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["O_T_soldier_TL_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
			[[[["O_T_soldier_GL_F","O_T_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
			[[[["O_T_soldier_TL_F","O_T_soldier_HAT_F","O_T_soldier_HAT_F","O_T_soldier_AHAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
				["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],
				1],
			// разведка
			[[[["O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_recon_TL_F","O_T_recon_M_F","O_T_recon_medic_F","O_T_recon_LAT_F","O_T_recon_JTAC_F","O_T_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_recon_TL_F","O_T_recon_M_F","O_T_recon_medic_F","O_T_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			[[[["O_T_recon_M_F","O_T_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
			[[[["O_T_sniper_F","O_T_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.05],
			[[[["O_T_ghillie_tna_F","O_T_ghillie_tna_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.05],
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
			[[[["O_T_MBT_04_command_F","O_T_MBT_04_cannon_F","O_T_MBT_04_cannon_F","O_T_MBT_04_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.2],
			[[[["O_T_MBT_04_command_F","O_T_MBT_04_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.2],
			// Рельсотрон
			[[[["O_T_MBT_02_railgun_ghex_F","O_T_MBT_02_railgun_ghex_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.01],
			// поддержка
			[[[["O_T_Truck_03_medical_ghex_F"],[],["PRIVATE"],[["O_T_Medic_F"]]]],0.02],
			[[[["O_T_Truck_03_repair_ghex_F"],[],["PRIVATE"],[["O_T_Engineer_F"]]]],0.02],
			[[[["O_T_Truck_03_fuel_ghex_F"],[],["PRIVATE"]]],0.01],
			[[[["O_T_Truck_03_ammo_ghex_F"],[],["PRIVATE"]]],0.02],
			// беспилотники
			// авиация
			[[
				[["O_Heli_Transport_04_covered_F"],[[0,0,0]],["LIEUTENANT"]],
				[["O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F","O_V_Soldier_ghex_F","O_V_Soldier_ghex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1],
			[[
				[["O_Heli_Transport_04_covered_F"],[[0,0,0]],["LIEUTENANT"]],
				[["O_T_soldier_SL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_M_F","O_T_soldier_AT_F","O_T_soldier_AAT_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1],
			[[
				[["O_Heli_Transport_04_covered_F"],[[0,0,0]],["LIEUTENANT"]],
				[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1],
			[[
				[["O_T_VTOL_02_infantry_dynamicLoadout_F"],[[0,0,0]],["LIEUTENANT"]],
				[["O_T_soldier_SL_F","O_T_soldier_TL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1]
	];
	// артиллерия
	if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
		_arr append [
			[[[["O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
			[[[["O_T_MBT_02_arty_ghex_F","O_T_MBT_02_arty_ghex_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5]
		];
	};
	[_groups_map, east, "OPF_T_F", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [160,249],
	["OPF_F", "CUP_O_RU", "CUP_O_TK"]
	] call gosa_fnc_map_groups_add;


// IND_C_F Syndicate
	[_groups_map, resistance, "IND_C_F", [[
		// пехота
			[[[["I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_3_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.1],
			[[[["I_C_Soldier_Para_6_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.1],
			[[[["I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_3_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
			[[[["I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_1_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.1],
			[[[["I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_8_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE"]]],0.1],
			[[[["I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_8_F","I_C_Soldier_Bandit_1_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
		// колесный
			[[[["I_C_Soldier_Para_6_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_3_F","I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F","I_C_Offroad_02_unarmed_F"],[[15,0,0],[0,15,0],[15,15,0],[-15,0,0],[0,-15,0],[0,10,0],[10,0,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.05],
			[[[["I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Offroad_02_unarmed_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.05]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [160,999],
	["CUP_I_NAPA"]
	] call gosa_fnc_map_groups_add;
