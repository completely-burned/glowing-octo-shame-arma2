/*
 * Здесь собраны отряды с лесным камуфляжем!
 * А не отряды DLC Contact (enoch), как может показатся из названия файла.
 */

#include "..\include\ranks.sqf"

//-- Спецназ
	// FIXME: Есть 3 класса спецназа (без глушителей, с глушителями, combat patrol). Не понимаю разницу между последними двумя, возможно skill разный.
	[_groups_map, east, "OPF_R_F", [[
			// configName O_R_InfSquad
			[[[["O_R_soldier_TL_F","O_R_soldier_AR_F","O_R_medic_F","O_R_soldier_LAT_F","O_R_Soldier_GL_F","O_R_soldier_AR_F","O_R_soldier_LAT_F","O_R_soldier_M_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
			// configName O_R_InfTeam
			[[[["O_R_soldier_TL_F","O_R_Soldier_AR_F","O_R_soldier_M_F","O_R_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
			// configName O_R_InfSentry
			[[[["O_R_soldier_GL_F","O_R_soldier_M_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
			// configName O_R_reconSquad
			[[[["O_R_recon_TL_F","O_R_recon_JTAC_F","O_R_recon_medic_F","O_R_recon_exp_F","O_R_recon_GL_F","O_R_recon_AR_F","O_R_recon_M_F","O_R_recon_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName O_R_reconTeam
			[[[["O_R_recon_TL_F","O_R_recon_M_F","O_R_recon_AR_F","O_R_recon_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
			// configName O_R_reconSentry
			[[[["O_R_recon_GL_F","O_R_recon_M_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [160,249],
	["CUP_O_RU", "CUP_O_TK"]
	] call gosa_fnc_map_groups_add;


//-- NATO Woodland
[_groups_map, west, "BLU_W_F", [[
	// BUS_Support_CLS
	[[[["B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_medic_F","B_W_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// BUS_Support_EOD
	[[[["B_W_soldier_TL_F","B_W_engineer_F","B_W_soldier_exp_F","B_W_soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// BUS_Support_ENG
	[[[["B_W_soldier_TL_F","B_W_engineer_F","B_W_engineer_F","B_W_soldier_repair_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-5,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// BUS_Support_MG
	[[[["B_W_soldier_TL_F","B_W_support_MG_F","B_W_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
	// BUS_Support_GMG
	[[[["B_W_soldier_TL_F","B_W_support_GMG_F","B_W_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
	// BUS_Support_Mort
	[[[["B_W_soldier_TL_F","B_W_support_Mort_F","B_W_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],

	// BUS_Recon_EOD
	[[[["B_W_recon_TL_F","B_W_recon_exp_F","B_W_recon_exp_F","B_W_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// BUS_ReconTeam
	[[[["B_W_recon_TL_F","B_W_recon_M_F","B_W_recon_medic_F","B_W_recon_LAT_F","B_W_recon_JTAC_F","B_W_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// BUS_ReconPatrol
	[[[["B_W_recon_TL_F","B_W_recon_M_F","B_W_recon_medic_F","B_W_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// BUS_ReconSentry
	[[[["B_W_recon_M_F","B_W_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.05],
	// BUS_SniperTeam
	[[[["B_W_sniper_F","B_W_spotter_F"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],
	// BUS_ReconSquad
	[[[["B_W_recon_TL_F","B_W_recon_M_F","B_W_recon_medic_F","B_W_recon_F","B_W_recon_LAT_F","B_W_recon_JTAC_F","B_W_recon_exp_F","B_W_recon_Sharpshooter_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL"]]],0.5],

	// BUS_InfSquad
	[[[["B_W_soldier_SL_F","B_W_soldier_F","B_W_soldier_LAT_F","B_W_soldier_M_F","B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_A_F","B_W_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// BUS_InfSquad_Weapons
	[[[["B_W_soldier_SL_F","B_W_soldier_AR_F","B_W_soldier_GL_F","B_W_soldier_M_F","B_W_soldier_AT_F","B_W_soldier_AAT_F","B_W_soldier_A_F","B_W_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// BUS_InfTeam
	[[[["B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_GL_F","B_W_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// BUS_InfTeam_AT
	[[[["B_W_soldier_TL_F","B_W_soldier_AT_F","B_W_soldier_AT_F","B_W_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// BUS_InfTeam_AA
	[[[["B_W_soldier_TL_F","B_W_soldier_AA_F","B_W_soldier_AA_F","B_W_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// BUS_InfSentry
	[[[["B_W_soldier_GL_F","B_W_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// BUS_InfAssault
	[[[["B_W_soldier_SL_F","B_W_soldier_AR_F","B_W_HeavyGunner_F","B_W_soldier_AAR_F","B_W_soldier_M_F","B_W_Sharpshooter_F","B_W_soldier_LAT_F","B_W_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// B_InfTeam_Light
	[[[["B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_F","B_W_soldier_LAT2_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1]
], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1990,2100], [160,224],
["BLU_NATO_lxWS","BLU_F","BLU_T_F"]
] call gosa_fnc_map_groups_add;

//- NATO Woodland Vecicles
_arr = [[
	// BUS_TankPlatoon
	[[[["B_W_MBT_01_cannon_F","B_W_MBT_01_cannon_F","B_W_MBT_01_cannon_F","B_W_MBT_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// BUS_TankPlatoon_AA
	[[[["B_W_MBT_01_cannon_F","B_W_APC_Tracked_01_aa_F","B_W_MBT_01_cannon_F","B_W_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// BUS_TankSection
	[[[["B_W_MBT_01_cannon_F","B_W_MBT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],

	// BUS_SPGPlatoon_Scorcher
	//[[[["B_W_MBT_01_arty_F","B_W_MBT_01_arty_F","B_W_MBT_01_arty_F","B_W_MBT_01_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0],
	// BUS_SPGSection_Scorcher
	//[[[["B_W_MBT_01_arty_F","B_W_MBT_01_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0],
	// BUS_SPGSection_MLRS
	//[[[["B_W_MBT_01_mlrs_F","B_W_MBT_01_mlrs_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0],

	// B_TankDestrSection_Rhino
	[[[["B_W_AFV_Wheeled_01_cannon_F","B_W_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.2],
	// B_TankDestrSection_RhinoUP
	[[[["B_W_AFV_Wheeled_01_up_cannon_F","B_W_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.2],

	// BUS_MechInfSquad
	[[[["B_W_APC_Wheeled_01_cannon_F","B_W_soldier_SL_F","B_W_soldier_F","B_W_soldier_LAT_F","B_W_soldier_M_F","B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_A_F","B_W_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// BUS_MechInf_AT
	[[[["B_W_APC_Tracked_01_rcws_F","B_W_soldier_SL_F","B_W_soldier_AR_F","B_W_soldier_AT_F","B_W_soldier_AT_F","B_W_soldier_AT_F","B_W_soldier_AAT_F","B_W_soldier_AAT_F","B_W_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// BUS_MechInf_AA
	[[[["B_W_APC_Tracked_01_aa_F","B_W_soldier_SL_F","B_W_soldier_AR_F","B_W_soldier_AA_F","B_W_soldier_AA_F","B_W_soldier_AA_F","B_W_soldier_AAA_F","B_W_soldier_AAA_F","B_W_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// BUS_MechInf_Support
	[[[["B_W_APC_Wheeled_01_cannon_F","B_W_soldier_SL_F","B_W_soldier_TL_F","B_W_soldier_repair_F","B_W_engineer_F","B_W_medic_F","B_W_soldier_AR_F","B_W_soldier_exp_F","B_W_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// lxWS
	[[[["B_T_APC_Wheeled_01_atgm_lxWS","B_W_soldier_SL_F","B_W_soldier_F","B_W_soldier_LAT_F","B_W_soldier_M_F","B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_A_F","B_W_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","LIEUTENANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],

	// BUS_MotInf_Team
	[[[["B_W_MRAP_01_gmg_F","B_W_soldier_AR_F","B_W_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"],[],1]],0.5],
	// BUS_MotInf_AT
	[[[["B_W_MRAP_01_F","B_W_soldier_AT_F","B_W_soldier_AT_F","B_W_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"],[],1]],0.5],
	// BUS_MotInf_AA
	[[[["B_W_MRAP_01_F","B_W_soldier_AA_F","B_W_soldier_AA_F","B_W_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"],[],1]],0.5],
	// BUS_MotInf_MGTeam
	[[[["B_W_MRAP_01_F","B_W_soldier_TL_F","B_W_support_MG_F","B_W_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.5],
	// BUS_MotInf_GMGTeam
	[[[["B_W_MRAP_01_F","B_W_soldier_TL_F","B_W_support_GMG_F","B_W_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.5],
	// BUS_MotInf_MortTeam
	[[[["B_W_MRAP_01_F","B_W_soldier_TL_F","B_W_support_Mort_F","B_W_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.5],
	// BUS_MotInf_Reinforce
	[[[["B_W_Truck_01_transport_F","B_W_soldier_SL_F","B_W_soldier_F","B_W_soldier_LAT_F","B_W_soldier_M_F","B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_A_F","B_W_medic_F","B_W_soldier_SL_F","B_W_soldier_F","B_W_soldier_LAT_F","B_W_soldier_M_F","B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_A_F","B_W_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],["PRIVATE","LIEUTENANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","LIEUTENANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5]
], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
if (count _arr > 0) then {
	[_groups_map, west, "BLU_W_F", _arr,
	[1990,2100], [160,224],
	["BLU_NATO_lxWS","BLU_F","BLU_T_F"]
	] call gosa_fnc_map_groups_add;
} else {
	// TODO: Заменить экипаж ТС.
	_arr=[[
		// BUS_TankPlatoon
		[[[["B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
		// BUS_TankPlatoon_AA
		[[[["B_T_MBT_01_cannon_F","B_T_APC_Tracked_01_aa_F","B_T_MBT_01_cannon_F","B_T_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
		// BUS_TankSection
		[[[["B_T_MBT_01_cannon_F","B_T_MBT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],

		// BUS_SPGPlatoon_Scorcher
		//[[[["B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0],
		// BUS_SPGSection_Scorcher
		//[[[["B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0],
		// BUS_SPGSection_MLRS
		//[[[["B_MBT_01_mlrs_F","B_MBT_01_mlrs_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0],

		// B_TankDestrSection_Rhino
		[[[["B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.2],
		// B_TankDestrSection_RhinoUP
		[[[["B_T_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.2],

		// BUS_MechInfSquad
		[[[["B_T_APC_Wheeled_01_cannon_F","B_W_soldier_SL_F","B_W_soldier_F","B_W_soldier_LAT_F","B_W_soldier_M_F","B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_A_F","B_W_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.4],
		// BUS_MechInf_AT
		[[[["B_T_APC_Tracked_01_rcws_F","B_W_soldier_SL_F","B_W_soldier_AR_F","B_W_soldier_AT_F","B_W_soldier_AT_F","B_W_soldier_AT_F","B_W_soldier_AAT_F","B_W_soldier_AAT_F","B_W_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.4],
		// BUS_MechInf_AA
		[[[["B_T_APC_Tracked_01_aa_F","B_W_soldier_SL_F","B_W_soldier_AR_F","B_W_soldier_AA_F","B_W_soldier_AA_F","B_W_soldier_AA_F","B_W_soldier_AAA_F","B_W_soldier_AAA_F","B_W_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.4],
		// BUS_MechInf_Support
		[[[["B_T_APC_Wheeled_01_cannon_F","B_W_soldier_SL_F","B_W_soldier_TL_F","B_W_soldier_repair_F","B_W_engineer_F","B_W_medic_F","B_W_soldier_AR_F","B_W_soldier_exp_F","B_W_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.4],

		// BUS_MotInf_Team
		[[[["B_T_MRAP_01_gmg_F","B_W_soldier_AR_F","B_W_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.4],
		// BUS_MotInf_AT
		[[[["B_T_MRAP_01_F","B_W_soldier_AT_F","B_W_soldier_AT_F","B_W_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.4],
		// BUS_MotInf_AA
		[[[["B_T_MRAP_01_F","B_W_soldier_AA_F","B_W_soldier_AA_F","B_W_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.4],
		// BUS_MotInf_MGTeam
		[[[["B_T_MRAP_01_F","B_W_soldier_TL_F","B_W_support_MG_F","B_W_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.4],
		// BUS_MotInf_GMGTeam
		[[[["B_T_MRAP_01_F","B_W_soldier_TL_F","B_W_support_GMG_F","B_W_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.4],
		// BUS_MotInf_MortTeam
		[[[["B_T_MRAP_01_F","B_W_soldier_TL_F","B_W_support_Mort_F","B_W_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.4],
		// BUS_MotInf_Reinforce
		[[[["B_T_Truck_01_transport_F","B_W_soldier_SL_F","B_W_soldier_F","B_W_soldier_LAT_F","B_W_soldier_M_F","B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_A_F","B_W_medic_F","B_W_soldier_SL_F","B_W_soldier_F","B_W_soldier_LAT_F","B_W_soldier_M_F","B_W_soldier_TL_F","B_W_soldier_AR_F","B_W_soldier_A_F","B_W_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],["PRIVATE","LIEUTENANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","LIEUTENANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.4]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
	[_groups_map, west, "BLU_W_F", _arr,
	[1990,2100], [160,224],
	["BLU_NATO_lxWS","BLU_F","BLU_T_F"]
	] call gosa_fnc_map_groups_add;
};


//-- ВСЛ
_arr = [
			// configName I_E_MotInf_Team
			[[[["I_E_Offroad_01_F",
				"I_E_soldier_TL_F","I_E_RadioOperator_F",
				"I_E_Soldier_F","I_E_Soldier_AR_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0]],
				["SERGEANT",
				"SERGEANT","PRIVATE",
				"CORPORAL","PRIVATE"],[],1]],0.5],
			// configName I_E_MotInf_Squad
			[[[["I_E_Truck_02_transport_F",
				"I_E_soldier_SL_F","I_E_soldier_F",
				"I_E_soldier_LAT_F","I_E_soldier_M_F",
				"I_E_soldier_TL_F","I_E_soldier_AR_F",
				"I_E_soldier_A_F","I_E_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0]],
				["SERGEANT",
				"SERGEANT","PRIVATE",
				"CORPORAL","PRIVATE",
				"SERGEANT","CORPORAL",
				"PRIVATE","PRIVATE"],[],1]],0.5],
			// configName I_E_MotInf_Reinforcements
			// Слишком загружен.
			[[[["I_E_Truck_02_transport_F",
				"I_E_soldier_SL_F","I_E_soldier_F",
				"I_E_soldier_LAT_F","I_E_soldier_M_F",
				"I_E_soldier_TL_F","I_E_soldier_AR_F",
				"I_E_soldier_A_F","I_E_medic_F",
				"I_E_soldier_SL_F","I_E_soldier_F",
				"I_E_soldier_LAT_F","I_E_soldier_M_F",
				"I_E_soldier_TL_F","I_E_soldier_AR_F",
				"I_E_soldier_A_F","I_E_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],
				["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],
				[],1]],0.1],
			// configName I_E_MechInfSquad
			[[[["I_E_APC_tracked_03_cannon_F",
				"I_E_soldier_SL_F","I_E_RadioOperator_F",
				"I_E_soldier_LAT_F","I_E_soldier_TL_F",
				"I_E_soldier_AR_F","I_E_soldier_A_F",
				"I_E_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
				["LIEUTENANT",
				"SERGEANT","PRIVATE",
				"CORPORAL","PRIVATE",
				"SERGEANT","CORPORAL",
				"PRIVATE"],[],1]],0.5],
			// InfTeam_Light
			[[[["I_E_soldier_TL_F","I_E_soldier_AR_F","I_E_soldier_F","I_E_soldier_LAT2_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
			// configName I_E_InfSquad
			[[[["I_E_soldier_SL_F",
				"I_E_RadioOperator_F","I_E_soldier_LAT_F",
				"I_E_soldier_M_F","I_E_soldier_TL_F",
				"I_E_soldier_AR_F","I_E_soldier_A_F",
				"I_E_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
				["SERGEANT",
				"PRIVATE","CORPORAL",
				"PRIVATE","SERGEANT",
				"CORPORAL","PRIVATE",
				"PRIVATE"]]],1],
			// configName I_E_InfSentry
			[[[["I_E_soldier_GL_F","I_E_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
			// configName I_E_InfTeam
			[[[["I_E_soldier_TL_F",
				"I_E_soldier_AR_F","I_E_soldier_GL_F",
				"I_E_RadioOperator_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
				["SERGEANT",
				"CORPORAL","PRIVATE",
				"PRIVATE"]]],1]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		[[[["I_E_Truck_02_MRL_F","I_E_Truck_02_MRL_F","I_E_Truck_02_MRL_F","I_E_Truck_02_MRL_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.1],
		[[[["I_E_Truck_02_MRL_F","I_E_Truck_02_MRL_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.1]
	];
};
	[_groups_map, resistance, "IND_E_F", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [160,249],
	["CUP_I_NAPA"]
	] call gosa_fnc_map_groups_add;
