#include "..\include\ranks.sqf"

_arr = [
	// User
	[[[["EF_B_MRAP_01_LAAD_MJTF_Wdl","EF_B_MRAP_01_LAAD_MJTF_Wdl"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1],
	[[[["EF_B_MRAP_01_FSV_MJTF_Wdl","EF_B_MRAP_01_FSV_MJTF_Wdl"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1],
	[[[["EF_B_AH99J_MJTF_Wdl","EF_B_AH99J_MJTF_Wdl"],[[0,0,0],[20,-20,0]],["CAPTAIN","LIEUTENANT"]]],0.1],
	[[[["EF_B_CombatBoat_HMG_MJTF_Wdl","EF_B_CombatBoat_AT_MJTF_Wdl"],[[0,0,0],[20,-20,0]],["CAPTAIN","CAPTAIN"]]], _depth min 0.5],

	// EF_B_MJTF_Wdl_InfSquad
	[[[["EF_B_Marine_SL_Wdl","EF_B_Marine_Medic_Wdl","EF_B_Marine_UAV_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_GL_Wdl","EF_B_Marine_LAT_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_GL_Wdl","EF_B_Marine_LAT_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_GL_Wdl","EF_B_Marine_LAT_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0],[-30,-30,0],[35,-35,0],[-35,-35,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],1],
	// EF_B_MJTF_Wdl_InfSquad_Weapons
	[[[["EF_B_Marine_SL_Wdl","EF_B_Marine_Medic_Wdl","EF_B_Marine_UAV_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_AT_Wdl","EF_B_Marine_AAT_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_Mark_Wdl","EF_B_Marine_Mark_Wdl","EF_B_Marine_LAT_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_AT_Wdl","EF_B_Marine_AAT_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0],[-30,-30,0],[35,-35,0],[-35,-35,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],1],
	// EF_B_MJTF_Wdl_ComTeam
	[[[["EF_B_Marine_SL_Wdl","EF_B_Marine_Medic_Wdl","EF_B_Marine_JTAC_Wdl","EF_B_Marine_R_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_InfTeam
	[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_GL_Wdl","EF_B_Marine_LAT_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// EF_B_MJTF_Wdl_InfTeam_AT
	[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_AT_Wdl","EF_B_Marine_AT_Wdl","EF_B_Marine_AAT_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// EF_B_MJTF_Wdl_InfTeam_AA
	[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_AA_Wdl","EF_B_Marine_AA_Wdl","EF_B_Marine_AAA_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_InfSentry
	[[[["EF_B_Marine_GL_Wdl","EF_B_Marine_R_Wdl"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_ReconTeam
	[[[["EF_B_Marine_Recon_TL_Wdl","EF_B_Marine_Recon_M_Wdl","EF_B_Marine_Recon_Medic_Wdl","EF_B_Marine_Recon_LAT_Wdl","EF_B_Marine_Recon_JTAC_Wdl","EF_B_Marine_Recon_Exp_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// EF_B_MJTF_Wdl_ReconPatrol
	[[[["EF_B_Marine_Recon_TL_Wdl","EF_B_Marine_Recon_M_Wdl","EF_B_Marine_Recon_Medic_Wdl","EF_B_Marine_Recon_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// EF_B_MJTF_Wdl_ReconSentry
	[[[["EF_B_Marine_Recon_M_Wdl","EF_B_Marine_Recon_Wdl"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.05],
	// EF_B_MJTF_Wdl_DiverTeam
	[[[["EF_B_Marine_Diver_Wdl","EF_B_Marine_Diver_Wdl","EF_B_Marine_Diver_Wdl","EF_B_Marine_Diver_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.05],
	// EF_B_MJTF_Wdl_DiverTeam_Boat
	[[[["EF_B_Marine_Diver_Wdl","EF_B_Marine_Diver_Wdl","EF_B_Marine_Diver_Wdl","EF_B_Marine_Diver_Wdl","EF_B_Boat_Transport_01_MJTF_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.05],
	// EF_B_MJTF_Wdl_DiverTeam_SDV
	//[[[["EF_B_Marine_Diver_Wdl","EF_B_Marine_Diver_Wdl","EF_B_Marine_Diver_Wdl","EF_B_Marine_Diver_Wdl","EF_B_SDV_01_MJTF_Wdl","EF_B_SDV_01_MJTF_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0],
	// EF_B_MJTF_Wdl_CombatDiverTeam
	[[[["EF_B_Marine_Diver_TL_Wdl","EF_B_Marine_Diver_Pointman_Wdl","EF_B_Marine_Diver_Scout_Wdl","EF_B_Marine_Diver_Eng_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.05],
	// EF_B_MJTF_Wdl_CombatDiverTeam_Boat
	[[[["EF_B_Marine_Diver_TL_Wdl","EF_B_Marine_Diver_Pointman_Wdl","EF_B_Marine_Diver_Scout_Wdl","EF_B_Marine_Diver_Eng_Wdl","EF_B_Boat_Transport_01_MJTF_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.05],
	// EF_B_MJTF_Wdl_CombatDiverTeam_SDV
	//[[[["EF_B_Marine_Diver_TL_Wdl","EF_B_Marine_Diver_Pointman_Wdl","EF_B_Marine_Diver_Scout_Wdl","EF_B_Marine_Diver_Eng_Wdl","EF_B_SDV_01_MJTF_Wdl","EF_B_SDV_01_MJTF_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.05],
	// EF_B_MJTF_Wdl_SmallTeam_UAV
	//[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_UAV_Wdl","EF_B_UAV_01_MJTF_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_ReconTeam_UGV
	//[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_UAV_Wdl","EF_B_UGV_01_MJTF_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_AttackTeam_UGV
	//[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_UAV_Wdl","EF_B_UGV_01_rcws_MJTF_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_ReconTeam_UAV
	//[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_UAV_Wdl","EF_B_UAV_02_MJTF_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
	// EF_B_MJTF_Wdl_AttackTeam_UAV
	//[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_UAV_Wdl","EF_B_UAV_02_CAS_MJTF_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
	// EF_B_MJTF_Wdl_Support_CLS
	[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_Medic_Wdl","EF_B_Marine_Medic_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_Support_EOD
	[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_Eng_Wdl","EF_B_Marine_Exp_Wdl","EF_B_Marine_Exp_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_Support_ENG
	[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_Eng_Wdl","EF_B_Marine_Eng_Wdl","EF_B_Marine_Repair_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_Recon_EOD
	[[[["EF_B_Marine_Recon_TL_Wdl","EF_B_Marine_Recon_Exp_Wdl","EF_B_Marine_Recon_Exp_Wdl","EF_B_Marine_Recon_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_Support_MG
	[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_HMG_Wdl","EF_B_Marine_AMG_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_Support_GMG
	[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_GMG_Wdl","EF_B_Marine_AMG_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_Support_Mort
	[[[["EF_B_Marine_TL_Wdl","EF_B_Marine_Mort_Wdl","EF_B_Marine_AMort_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_MotInf_Team
	[[[["EF_B_MRAP_01_gmg_MJTF_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_LAT_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_MotInf_AT
	[[[["EF_B_MRAP_01_MJTF_Wdl","EF_B_Marine_AT_Wdl","EF_B_Marine_AT_Wdl","EF_B_Marine_AAT_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_MotInf_AA
	[[[["EF_B_MRAP_01_MJTF_Wdl","EF_B_Marine_AA_Wdl","EF_B_Marine_AA_Wdl","EF_B_Marine_AAA_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Wdl_MotInf_MGTeam
	[[[["EF_B_MRAP_01_MJTF_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_HMG_Wdl","EF_B_Marine_AMG_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Wdl_MotInf_GMGTeam
	[[[["EF_B_MRAP_01_MJTF_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_GMG_Wdl","EF_B_Marine_AMG_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Wdl_MotInf_MortTeam
	[[[["EF_B_MRAP_01_MJTF_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_Mort_Wdl","EF_B_Marine_AMort_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0],
	// EF_B_MJTF_Wdl_MotInf_Reinforce
	[[[["EF_B_Truck_01_transport_MJTF_Wdl","EF_B_Marine_SL_Wdl","EF_B_Marine_R_Wdl","EF_B_Marine_LAT_Wdl","EF_B_Marine_Mark_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_Medic_Wdl","EF_B_Marine_SL_Wdl","EF_B_Marine_R_Wdl","EF_B_Marine_LAT_Wdl","EF_B_Marine_Mark_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_Medic_Wdl"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Wdl_MechInfSquad
	[[[["EF_B_AAV9_50mm_MJTF_Wdl","EF_B_Marine_SL_Wdl","EF_B_Marine_Medic_Wdl","EF_B_Marine_UAV_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_GL_Wdl","EF_B_Marine_LAT_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_GL_Wdl","EF_B_Marine_LAT_Wdl","EF_B_Marine_Mark_Wdl","EF_B_Marine_AT_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0],[-30,-30,0],[35,-35,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL"],[],1]],1],
	// EF_B_MJTF_Wdl_MechInf_AT
	[[[["EF_B_AAV9_50mm_MJTF_Wdl","EF_B_Marine_SL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_AT_Wdl","EF_B_Marine_AT_Wdl","EF_B_Marine_AT_Wdl","EF_B_Marine_AAT_Wdl","EF_B_Marine_AAT_Wdl","EF_B_Marine_AAT_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.3],
	// EF_B_MJTF_Wdl_MechInf_AA
	[[[["EF_B_AAV9_50mm_MJTF_Wdl","EF_B_Marine_SL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_AA_Wdl","EF_B_Marine_AA_Wdl","EF_B_Marine_AA_Wdl","EF_B_Marine_AAA_Wdl","EF_B_Marine_AAA_Wdl","EF_B_Marine_AAA_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.3],
	// EF_B_MJTF_Wdl_MechInf_Support
	[[[["EF_B_AAV9_50mm_MJTF_Wdl","EF_B_Marine_SL_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_Repair_Wdl","EF_B_Marine_Eng_Wdl","EF_B_Marine_Medic_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_Exp_Wdl","EF_B_Marine_AR_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Wdl_TankPlatoon
	[[[["EF_B_MBT_01_cannon_MJTF_Wdl","EF_B_MBT_01_cannon_MJTF_Wdl","EF_B_MBT_01_cannon_MJTF_Wdl","EF_B_MBT_01_cannon_MJTF_Wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.2],
	// EF_B_MJTF_Wdl_TankPlatoon_AA
	[[[["EF_B_MBT_01_cannon_MJTF_Wdl","EF_B_MRAP_01_LAAD_MJTF_Wdl","EF_B_MBT_01_cannon_MJTF_Wdl","EF_B_MRAP_01_LAAD_MJTF_Wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.1],
	// EF_B_MJTF_Wdl_TankSection
	[[[["EF_B_MBT_01_cannon_MJTF_Wdl","EF_B_MBT_01_cannon_MJTF_Wdl"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.2],
	// EF_B_MJTF_Wdl_ATPlatoon
	[[[["EF_B_MRAP_01_AT_MJTF_Wdl","EF_B_MRAP_01_AT_MJTF_Wdl","EF_B_MRAP_01_AT_MJTF_Wdl","EF_B_MRAP_01_AT_MJTF_Wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.1],
	// EF_B_MJTF_Wdl_ATSection
	[[[["EF_B_MRAP_01_AT_MJTF_Wdl","EF_B_MRAP_01_AT_MJTF_Wdl"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// EF_B_MJTF_Wdl_SPGSection_MLRS
		[[[["EF_B_MBT_01_mlrs_MJTF_Wdl","EF_B_MBT_01_mlrs_MJTF_Wdl"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1]
	];
};
if (_landing in [1,4,24,34]) then {
	// Застревает с убитым водителем.
	_arr append [
		[[[["EF_B_LCC_MJTF_Wdl"],[],["LIEUTENANT"]],[["EF_B_AAV9_MJTF_Wdl","EF_B_AAV9_MJTF_Wdl"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1],
		[[[["EF_B_CombatBoat_Unarmed_MJTF_Wdl"],[],["LIEUTENANT"]],
			[["EF_B_Marine_SL_Wdl","EF_B_Marine_Medic_Wdl","EF_B_Marine_UAV_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_GL_Wdl","EF_B_Marine_LAT_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_GL_Wdl","EF_B_Marine_LAT_Wdl","EF_B_Marine_TL_Wdl","EF_B_Marine_AR_Wdl","EF_B_Marine_GL_Wdl","EF_B_Marine_LAT_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0],[-30,-30,0],[35,-35,0],[-35,-35,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]
		],0.1]
	];
};
if (count gosa_zone_lighthouse > 0) then {
	_arr append [
	];
};
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "EF_B_MJTF", _arr,
	[1990,2100], [150,249],
	[]
] call gosa_fnc_map_groups_add;

_arr = [
	// User
	[[[["EF_B_MRAP_01_LAAD_MJTF_Des","EF_B_MRAP_01_LAAD_MJTF_Des"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1],
	[[[["EF_B_MRAP_01_FSV_MJTF_Des","EF_B_MRAP_01_FSV_MJTF_Des"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1],
	[[[["EF_B_AH99J_MJTF_Des","EF_B_AH99J_MJTF_Des"],[[0,0,0],[20,-20,0]],["CAPTAIN","LIEUTENANT"]]],0.1],
	[[[["EF_B_CombatBoat_HMG_MJTF_Des","EF_B_CombatBoat_AT_MJTF_Des"],[[0,0,0],[20,-20,0]],["CAPTAIN","CAPTAIN"]]], _depth min 0.5],

	// EF_B_MJTF_Des_InfSquad
	[[[["EF_B_Marine_SL_Des","EF_B_Marine_Medic_Des","EF_B_Marine_UAV_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_GL_Des","EF_B_Marine_LAT_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_GL_Des","EF_B_Marine_LAT_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_GL_Des","EF_B_Marine_LAT_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0],[-30,-30,0],[35,-35,0],[-35,-35,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],1],
	// EF_B_MJTF_Des_InfSquad_Weapons
	[[[["EF_B_Marine_SL_Des","EF_B_Marine_Medic_Des","EF_B_Marine_UAV_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_AT_Des","EF_B_Marine_AAT_Des","EF_B_Marine_TL_Des","EF_B_Marine_Mark_Des","EF_B_Marine_Mark_Des","EF_B_Marine_LAT_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_AT_Des","EF_B_Marine_AAT_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0],[-30,-30,0],[35,-35,0],[-35,-35,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.8],
	// EF_B_MJTF_Des_ComTeam
	[[[["EF_B_Marine_SL_Des","EF_B_Marine_Medic_Des","EF_B_Marine_JTAC_Des","EF_B_Marine_R_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_InfTeam
	[[[["EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_GL_Des","EF_B_Marine_LAT_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// EF_B_MJTF_Des_InfTeam_AT
	[[[["EF_B_Marine_TL_Des","EF_B_Marine_AT_Des","EF_B_Marine_AT_Des","EF_B_Marine_AAT_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// EF_B_MJTF_Des_InfTeam_AA
	[[[["EF_B_Marine_TL_Des","EF_B_Marine_AA_Des","EF_B_Marine_AA_Des","EF_B_Marine_AAA_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_InfSentry
	[[[["EF_B_Marine_GL_Des","EF_B_Marine_R_Des"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_ReconTeam
	[[[["EF_B_Marine_Recon_TL_Des","EF_B_Marine_Recon_M_Des","EF_B_Marine_Recon_Medic_Des","EF_B_Marine_Recon_LAT_Des","EF_B_Marine_Recon_JTAC_Des","EF_B_Marine_Recon_Exp_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// EF_B_MJTF_Des_ReconPatrol
	[[[["EF_B_Marine_Recon_TL_Des","EF_B_Marine_Recon_M_Des","EF_B_Marine_Recon_Medic_Des","EF_B_Marine_Recon_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// EF_B_MJTF_Des_ReconSentry
	[[[["EF_B_Marine_Recon_M_Des","EF_B_Marine_Recon_Des"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.05],
	// EF_B_MJTF_Des_DiverTeam
	[[[["EF_B_Marine_Diver_Des","EF_B_Marine_Diver_Des","EF_B_Marine_Diver_Des","EF_B_Marine_Diver_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_DiverTeam_Boat
	[[[["EF_B_Marine_Diver_Des","EF_B_Marine_Diver_Des","EF_B_Marine_Diver_Des","EF_B_Marine_Diver_Des","EF_B_Boat_Transport_01_MJTF_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_DiverTeam_SDV
	//[[[["EF_B_Marine_Diver_Des","EF_B_Marine_Diver_Des","EF_B_Marine_Diver_Des","EF_B_Marine_Diver_Des","EF_B_SDV_01_MJTF_Des","EF_B_SDV_01_MJTF_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0],
	// EF_B_MJTF_Des_CombatDiverTeam
	[[[["EF_B_Marine_Diver_TL_Des","EF_B_Marine_Diver_Pointman_Des","EF_B_Marine_Diver_Scout_Des","EF_B_Marine_Diver_Eng_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_CombatDiverTeam_Boat
	[[[["EF_B_Marine_Diver_TL_Des","EF_B_Marine_Diver_Pointman_Des","EF_B_Marine_Diver_Scout_Des","EF_B_Marine_Diver_Eng_Des","EF_B_Boat_Transport_01_MJTF_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_CombatDiverTeam_SDV
	//[[[["EF_B_Marine_Diver_TL_Des","EF_B_Marine_Diver_Pointman_Des","EF_B_Marine_Diver_Scout_Des","EF_B_Marine_Diver_Eng_Des","EF_B_SDV_01_MJTF_Des","EF_B_SDV_01_MJTF_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0],
	// EF_B_MJTF_Des_SmallTeam_UAV
	//[[[["EF_B_Marine_TL_Des","EF_B_Marine_UAV_Des","EF_B_UAV_01_MJTF_Des"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
	// EF_B_MJTF_Des_ReconTeam_UGV
	//[[[["EF_B_Marine_TL_Des","EF_B_Marine_UAV_Des","EF_B_UGV_01_MJTF_Des"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
	// EF_B_MJTF_Des_AttackTeam_UGV
	//[[[["EF_B_Marine_TL_Des","EF_B_Marine_UAV_Des","EF_B_UGV_01_rcws_MJTF_Des"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
	// EF_B_MJTF_Des_ReconTeam_UAV
	//[[[["EF_B_Marine_TL_Des","EF_B_Marine_UAV_Des","EF_B_UAV_02_MJTF_Des"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
	// EF_B_MJTF_Des_AttackTeam_UAV
	//[[[["EF_B_Marine_TL_Des","EF_B_Marine_UAV_Des","EF_B_UAV_02_CAS_MJTF_Des"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
	// EF_B_MJTF_Des_Support_CLS
	[[[["EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_Medic_Des","EF_B_Marine_Medic_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_Support_EOD
	[[[["EF_B_Marine_TL_Des","EF_B_Marine_Eng_Des","EF_B_Marine_Exp_Des","EF_B_Marine_Exp_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_Support_ENG
	[[[["EF_B_Marine_TL_Des","EF_B_Marine_Eng_Des","EF_B_Marine_Eng_Des","EF_B_Marine_Repair_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_Recon_EOD
	[[[["EF_B_Marine_Recon_TL_Des","EF_B_Marine_Recon_Exp_Des","EF_B_Marine_Recon_Exp_Des","EF_B_Marine_Recon_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_Support_MG
	[[[["EF_B_Marine_TL_Des","EF_B_Marine_HMG_Des","EF_B_Marine_AMG_Des"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_Support_GMG
	[[[["EF_B_Marine_TL_Des","EF_B_Marine_GMG_Des","EF_B_Marine_AMG_Des"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_Support_Mort
	[[[["EF_B_Marine_TL_Des","EF_B_Marine_Mort_Des","EF_B_Marine_AMort_Des"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_MotInf_Team
	[[[["EF_B_MRAP_01_gmg_MJTF_Des","EF_B_Marine_AR_Des","EF_B_Marine_LAT_Des"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
	// EF_B_MJTF_Des_MotInf_AT
	[[[["EF_B_MRAP_01_MJTF_Des","EF_B_Marine_AT_Des","EF_B_Marine_AT_Des","EF_B_Marine_AAT_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
	// EF_B_MJTF_Des_MotInf_AA
	[[[["EF_B_MRAP_01_MJTF_Des","EF_B_Marine_AA_Des","EF_B_Marine_AA_Des","EF_B_Marine_AAA_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
	// EF_B_MJTF_Des_MotInf_MGTeam
	[[[["EF_B_MRAP_01_MJTF_Des","EF_B_Marine_TL_Des","EF_B_Marine_HMG_Des","EF_B_Marine_AMG_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Des_MotInf_GMGTeam
	[[[["EF_B_MRAP_01_MJTF_Des","EF_B_Marine_TL_Des","EF_B_Marine_GMG_Des","EF_B_Marine_AMG_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Des_MotInf_MortTeam
	[[[["EF_B_MRAP_01_MJTF_Des","EF_B_Marine_TL_Des","EF_B_Marine_Mort_Des","EF_B_Marine_AMort_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Des_MotInf_Reinforce
	[[[["EF_B_Truck_01_transport_MJTF_Des","EF_B_Marine_SL_Des","EF_B_Marine_R_Des","EF_B_Marine_LAT_Des","EF_B_Marine_Mark_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_AR_Des","EF_B_Marine_Medic_Des","EF_B_Marine_SL_Des","EF_B_Marine_R_Des","EF_B_Marine_LAT_Des","EF_B_Marine_Mark_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_AR_Des","EF_B_Marine_Medic_Des"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Des_MechInfSquad
	[[[["EF_B_AAV9_50mm_MJTF_Des","EF_B_Marine_SL_Des","EF_B_Marine_Medic_Des","EF_B_Marine_UAV_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_GL_Des","EF_B_Marine_LAT_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_GL_Des","EF_B_Marine_LAT_Des","EF_B_Marine_Mark_Des","EF_B_Marine_AT_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0],[-30,-30,0],[35,-35,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL"],[],1]],1],
	// EF_B_MJTF_Des_MechInf_AT
	[[[["EF_B_AAV9_50mm_MJTF_Des","EF_B_Marine_SL_Des","EF_B_Marine_AR_Des","EF_B_Marine_AT_Des","EF_B_Marine_AT_Des","EF_B_Marine_AT_Des","EF_B_Marine_AAT_Des","EF_B_Marine_AAT_Des","EF_B_Marine_AAT_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.4],
	// EF_B_MJTF_Des_MechInf_AA
	[[[["EF_B_AAV9_50mm_MJTF_Des","EF_B_Marine_SL_Des","EF_B_Marine_AR_Des","EF_B_Marine_AA_Des","EF_B_Marine_AA_Des","EF_B_Marine_AA_Des","EF_B_Marine_AAA_Des","EF_B_Marine_AAA_Des","EF_B_Marine_AAA_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Des_MechInf_Support
	[[[["EF_B_AAV9_50mm_MJTF_Des","EF_B_Marine_SL_Des","EF_B_Marine_TL_Des","EF_B_Marine_Repair_Des","EF_B_Marine_Eng_Des","EF_B_Marine_Medic_Des","EF_B_Marine_AR_Des","EF_B_Marine_Exp_Des","EF_B_Marine_AR_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.1],
	// EF_B_MJTF_Des_TankPlatoon
	[[[["EF_B_MBT_01_cannon_MJTF_Des","EF_B_MBT_01_cannon_MJTF_Des","EF_B_MBT_01_cannon_MJTF_Des","EF_B_MBT_01_cannon_MJTF_Des"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// EF_B_MJTF_Des_TankPlatoon_AA
	[[[["EF_B_MBT_01_cannon_MJTF_Des","EF_B_MRAP_01_LAAD_MJTF_Des","EF_B_MBT_01_cannon_MJTF_Des","EF_B_MRAP_01_LAAD_MJTF_Des"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.2],
	// EF_B_MJTF_Des_TankSection
	[[[["EF_B_MBT_01_cannon_MJTF_Des","EF_B_MBT_01_cannon_MJTF_Des"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.2],
	// EF_B_MJTF_Des_ATPlatoon
	[[[["EF_B_MRAP_01_AT_MJTF_Des","EF_B_MRAP_01_AT_MJTF_Des","EF_B_MRAP_01_AT_MJTF_Des","EF_B_MRAP_01_AT_MJTF_Des"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.1],
	// EF_B_MJTF_Des_ATSection
	[[[["EF_B_MRAP_01_AT_MJTF_Des","EF_B_MRAP_01_AT_MJTF_Des"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// EF_B_MJTF_Des_SPGSection_MLRS
		[[[["EF_B_MBT_01_mlrs_MJTF_Des","EF_B_MBT_01_mlrs_MJTF_Des"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1]
	];
};
if (_landing in [1,4,24,34]) then {
	// Застревает с убитым водителем.
	_arr append [
		[[[["EF_B_LCC_MJTF_Des"],[],["LIEUTENANT"]],[["EF_B_AAV9_MJTF_Des","EF_B_AAV9_MJTF_Des"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1],
		[[[["EF_B_CombatBoat_Unarmed_MJTF_Des"],[],["LIEUTENANT"]],
			[["EF_B_Marine_SL_Des","EF_B_Marine_Medic_Des","EF_B_Marine_UAV_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_GL_Des","EF_B_Marine_LAT_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_GL_Des","EF_B_Marine_LAT_Des","EF_B_Marine_TL_Des","EF_B_Marine_AR_Des","EF_B_Marine_GL_Des","EF_B_Marine_LAT_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0],[-30,-30,0],[35,-35,0],[-35,-35,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]
		],0.1]
	];
};
if (count gosa_zone_lighthouse > 0) then {
	_arr append [
	];
};
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "EF_B_MJTF", _arr,
	[1990,2100], [250,999],
	[]
] call gosa_fnc_map_groups_add;
