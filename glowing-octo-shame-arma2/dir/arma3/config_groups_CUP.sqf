/*
 * Отряды из CUP
 * TODO: Назначить командира.
 */

//-- CUP_O_RU
	// EMR, VDV, VDV_EMR, M_EMR_V2
	// Ratnik_Summer, Ratnik_Autumn, Ratnik_Winter, Ratnik_BeigeDigital, Ratnik_Desert
	// RUS_SpecOps, MVD
	// Default
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"CUP_O_RU");
if (_tmp > 0 or (_tmp == -1 && _d >= 1980)) then {
	if (_tmp > 0 or (_tmp == -1 && _n >= 150)) then {
		_east=_east+[
			// configName InfSquad
			[[[["CUP_O_RU_Soldier_SL_M_EMR_V2",
			"CUP_O_RU_Soldier_M_EMR_V2","CUP_O_RU_Soldier_LAT_M_EMR_V2",
			"CUP_O_RU_Soldier_MG_M_EMR_V2","CUP_O_RU_Soldier_TL_M_EMR_V2",
			"CUP_O_RU_Soldier_AR_M_EMR_V2","CUP_O_RU_Soldier_A_M_EMR_V2",
			"CUP_O_RU_Soldier_Medic_M_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfSquad_Weapons
			[[[["CUP_O_RU_Soldier_SL_M_EMR_V2",
			"CUP_O_RU_Soldier_AR_M_EMR_V2","CUP_O_RU_Soldier_GL_M_EMR_V2",
			"CUP_O_RU_Soldier_MG_M_EMR_V2","CUP_O_RU_Soldier_AT_M_EMR_V2",
			"CUP_O_RU_Soldier_AAT_M_EMR_V2","CUP_O_RU_Soldier_A_M_EMR_V2",
			"CUP_O_RU_Soldier_Medic_M_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam
			[[[["CUP_O_RU_Soldier_TL_M_EMR_V2","CUP_O_RU_Soldier_AR_M_EMR_V2","CUP_O_RU_Soldier_GL_M_EMR_V2","CUP_O_RU_Soldier_LAT_M_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AT
			[[[["CUP_O_RU_Soldier_TL_M_EMR_V2","CUP_O_RU_Soldier_AT_M_EMR_V2","CUP_O_RU_Soldier_AT_M_EMR_V2","CUP_O_RU_Soldier_AAT_M_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AA
			[[[["CUP_O_RU_Soldier_TL_M_EMR_V2","CUP_O_RU_Soldier_AA_M_EMR_V2","CUP_O_RU_Soldier_AA_M_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
			// configName InfSentry
			[[[["CUP_O_RU_Soldier_GL_M_EMR_V2","CUP_O_RU_Soldier_M_EMR_V2"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0],
			// configName InfAssault
			[[[["CUP_O_RU_Soldier_SL_M_EMR_V2",
			"CUP_O_RU_Soldier_AR_M_EMR_V2","CUP_O_RU_Soldier_MG_M_EMR_V2",
			"CUP_O_RU_Soldier_AAR_M_EMR_V2","CUP_O_RU_Soldier_Marksman_M_EMR_V2",
			"CUP_O_RU_Soldier_AT_M_EMR_V2","CUP_O_RU_Soldier_AAT_M_EMR_V2",
			"CUP_O_RU_Soldier_Medic_M_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName O_InfTeam_AT_Heavy
			[[[["CUP_O_RU_Soldier_TL_M_EMR_V2","CUP_O_RU_Soldier_HAT_M_EMR_V2","CUP_O_RU_Soldier_HAT_M_EMR_V2","CUP_O_RU_Soldier_AHAT_M_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfSquad
			[[[["CUP_O_RU_Soldier_SL_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_M_VDV_EMR_V2","CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_MG_M_VDV_EMR_V2","CUP_O_RU_Soldier_TL_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_AR_M_VDV_EMR_V2","CUP_O_RU_Soldier_A_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfSquad_Weapons
			[[[["CUP_O_RU_Soldier_SL_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_AR_M_VDV_EMR_V2","CUP_O_RU_Soldier_GL_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_MG_M_VDV_EMR_V2","CUP_O_RU_Soldier_AT_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_AAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_A_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam
			[[[["CUP_O_RU_Soldier_TL_M_VDV_EMR_V2","CUP_O_RU_Soldier_AR_M_VDV_EMR_V2","CUP_O_RU_Soldier_GL_M_VDV_EMR_V2","CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AT
			[[[["CUP_O_RU_Soldier_TL_M_VDV_EMR_V2","CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AAT_M_VDV_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AA
			[[[["CUP_O_RU_Soldier_TL_M_VDV_EMR_V2","CUP_O_RU_Soldier_AA_M_VDV_EMR_V2","CUP_O_RU_Soldier_AA_M_VDV_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
			// configName InfSentry
			[[[["CUP_O_RU_Soldier_GL_M_VDV_EMR_V2","CUP_O_RU_Soldier_M_VDV_EMR_V2"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0],
			// configName InfAssault
			[[[["CUP_O_RU_Soldier_SL_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_AR_M_VDV_EMR_V2","CUP_O_RU_Soldier_MG_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_AAR_M_VDV_EMR_V2","CUP_O_RU_Soldier_Marksman_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AAT_M_VDV_EMR_V2",
			"CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName O_InfTeam_AT_Heavy
			[[[["CUP_O_RU_Soldier_TL_M_VDV_EMR_V2","CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AHAT_M_VDV_EMR_V2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],

			// configName InfSquad
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Summer",
			"CUP_O_RU_Soldier_Ratnik_Summer","CUP_O_RU_Soldier_LAT_Ratnik_Summer",
			"CUP_O_RU_Soldier_MG_Ratnik_Summer","CUP_O_RU_Soldier_TL_Ratnik_Summer",
			"CUP_O_RU_Soldier_AR_Ratnik_Summer","CUP_O_RU_Soldier_A_Ratnik_Summer",
			"CUP_O_RU_Soldier_Medic_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfSquad_Weapons
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Summer",
			"CUP_O_RU_Soldier_AR_Ratnik_Summer","CUP_O_RU_Soldier_GL_Ratnik_Summer",
			"CUP_O_RU_Soldier_MG_Ratnik_Summer","CUP_O_RU_Soldier_AT_Ratnik_Summer",
			"CUP_O_RU_Soldier_AAT_Ratnik_Summer","CUP_O_RU_Soldier_A_Ratnik_Summer",
			"CUP_O_RU_Soldier_Medic_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Summer","CUP_O_RU_Soldier_AR_Ratnik_Summer","CUP_O_RU_Soldier_GL_Ratnik_Summer","CUP_O_RU_Soldier_LAT_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AT
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Summer","CUP_O_RU_Soldier_AT_Ratnik_Summer","CUP_O_RU_Soldier_AT_Ratnik_Summer","CUP_O_RU_Soldier_AAT_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AA
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Summer","CUP_O_RU_Soldier_AA_Ratnik_Summer","CUP_O_RU_Soldier_AA_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
			// configName InfSentry
			[[[["CUP_O_RU_Soldier_GL_Ratnik_Summer","CUP_O_RU_Soldier_Ratnik_Summer"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0],
			// configName reconTeam
			[[[["CUP_O_RU_Recon_TL_Ratnik_Summer",
			"CUP_O_RU_Recon_Marksman_Ratnik_Summer","CUP_O_RU_Recon_Medic_Ratnik_Summer",
			"CUP_O_RU_Recon_LAT_Ratnik_Summer","CUP_O_RU_Recon_Ratnik_Summer",
			"CUP_O_RU_Recon_Exp_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName reconSentry
			[[[["CUP_O_RU_Recon_Marksman_Ratnik_Summer","CUP_O_RU_Recon_Ratnik_Summer"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0],
			// configName InfAssault
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Summer",
			"CUP_O_RU_Soldier_AR_Ratnik_Summer","CUP_O_RU_Soldier_MG_Ratnik_Summer",
			"CUP_O_RU_Soldier_AAR_Ratnik_Summer","CUP_O_RU_Soldier_Marksman_Ratnik_Summer",
			"CUP_O_RU_Soldier_AT_Ratnik_Summer","CUP_O_RU_Soldier_AAT_Ratnik_Summer",
			"CUP_O_RU_Soldier_Medic_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName O_InfTeam_AT_Heavy
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Summer","CUP_O_RU_Soldier_HAT_Ratnik_Summer","CUP_O_RU_Soldier_HAT_Ratnik_Summer","CUP_O_RU_Soldier_AHAT_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],

			// configName InfSquad
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Autumn",
			"CUP_O_RU_Soldier_Ratnik_Autumn","CUP_O_RU_Soldier_LAT_Ratnik_Autumn",
			"CUP_O_RU_Soldier_MG_Ratnik_Autumn","CUP_O_RU_Soldier_TL_Ratnik_Autumn",
			"CUP_O_RU_Soldier_AR_Ratnik_Autumn","CUP_O_RU_Soldier_A_Ratnik_Autumn",
			"CUP_O_RU_Soldier_Medic_Ratnik_Autumn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfSquad_Weapons
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Autumn",
			"CUP_O_RU_Soldier_AR_Ratnik_Autumn","CUP_O_RU_Soldier_GL_Ratnik_Autumn",
			"CUP_O_RU_Soldier_MG_Ratnik_Autumn","CUP_O_RU_Soldier_AT_Ratnik_Autumn",
			"CUP_O_RU_Soldier_AAT_Ratnik_Autumn","CUP_O_RU_Soldier_A_Ratnik_Autumn",
			"CUP_O_RU_Soldier_Medic_Ratnik_Autumn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Autumn","CUP_O_RU_Soldier_AR_Ratnik_Autumn","CUP_O_RU_Soldier_GL_Ratnik_Autumn","CUP_O_RU_Soldier_LAT_Ratnik_Autumn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AT
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Autumn","CUP_O_RU_Soldier_AT_Ratnik_Autumn","CUP_O_RU_Soldier_AT_Ratnik_Autumn","CUP_O_RU_Soldier_AAT_Ratnik_Autumn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AA
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Autumn","CUP_O_RU_Soldier_AA_Ratnik_Autumn","CUP_O_RU_Soldier_AA_Ratnik_Autumn"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
			// configName InfSentry
			[[[["CUP_O_RU_Soldier_GL_Ratnik_Autumn","CUP_O_RU_Soldier_Ratnik_Autumn"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0],
			// configName reconTeam
			[[[["CUP_O_RU_Recon_TL_Ratnik_Autumn",
			"CUP_O_RU_Recon_Marksman_Ratnik_Autumn","CUP_O_RU_Recon_Medic_Ratnik_Autumn",
			"CUP_O_RU_Recon_LAT_Ratnik_Autumn","CUP_O_RU_Recon_Ratnik_Autumn",
			"CUP_O_RU_Recon_Exp_Ratnik_Autumn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName reconSentry
			[[[["CUP_O_RU_Recon_Marksman_Ratnik_Autumn","CUP_O_RU_Recon_Ratnik_Autumn"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0],
			// configName InfAssault
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Autumn",
			"CUP_O_RU_Soldier_AR_Ratnik_Autumn","CUP_O_RU_Soldier_MG_Ratnik_Autumn",
			"CUP_O_RU_Soldier_AAR_Ratnik_Autumn","CUP_O_RU_Soldier_Marksman_Ratnik_Autumn",
			"CUP_O_RU_Soldier_AT_Ratnik_Autumn","CUP_O_RU_Soldier_AAT_Ratnik_Autumn",
			"CUP_O_RU_Soldier_Medic_Ratnik_Autumn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName O_InfTeam_AT_Heavy
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Autumn","CUP_O_RU_Soldier_HAT_Ratnik_Autumn","CUP_O_RU_Soldier_HAT_Ratnik_Autumn","CUP_O_RU_Soldier_AHAT_Ratnik_Autumn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],

			// configName InfSquad
			[[[["CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_Ratnik_BeigeDigital","CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital","CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_AR_Ratnik_BeigeDigital","CUP_O_RU_Soldier_A_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfSquad_Weapons
			[[[["CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_AR_Ratnik_BeigeDigital","CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AT_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_AAT_Ratnik_BeigeDigital","CUP_O_RU_Soldier_A_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam
			[[[["CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AR_Ratnik_BeigeDigital","CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital","CUP_O_RU_Soldier_LAT_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AT
			[[[["CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AT_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AT_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AAT_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AA
			[[[["CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AA_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AA_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
			// configName InfSentry
			[[[["CUP_O_RU_Soldier_GL_Ratnik_BeigeDigital","CUP_O_RU_Soldier_Ratnik_BeigeDigital"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0],
			// configName reconTeam
			[[[["CUP_O_RU_Recon_TL_Ratnik_BeigeDigital",
			"CUP_O_RU_Recon_Marksman_Ratnik_BeigeDigital","CUP_O_RU_Recon_Medic_Ratnik_BeigeDigital",
			"CUP_O_RU_Recon_LAT_Ratnik_BeigeDigital","CUP_O_RU_Recon_Ratnik_BeigeDigital",
			"CUP_O_RU_Recon_Exp_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName reconSentry
			[[[["CUP_O_RU_Recon_Marksman_Ratnik_BeigeDigital","CUP_O_RU_Recon_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0],
			// configName InfAssault
			[[[["CUP_O_RU_Soldier_SL_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_AR_Ratnik_BeigeDigital","CUP_O_RU_Soldier_MG_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_AAR_Ratnik_BeigeDigital","CUP_O_RU_Soldier_Marksman_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_AT_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AAT_Ratnik_BeigeDigital",
			"CUP_O_RU_Soldier_Medic_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName O_InfTeam_AT_Heavy
			[[[["CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital","CUP_O_RU_Soldier_HAT_Ratnik_BeigeDigital","CUP_O_RU_Soldier_HAT_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AHAT_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],

			// configName CUP_O_RU_InfSquad_EMR
			[[[["CUP_O_RU_Soldier_SL_EMR",
			"CUP_O_RU_Soldier_MG_EMR","CUP_O_RU_Soldier_AT_EMR",
			"CUP_O_RU_Soldier_LAT_EMR","CUP_O_RU_Soldier_GL_EMR",
			"CUP_O_RU_Soldier_Marksman_EMR","CUP_O_RU_Soldier_MG_EMR",
			"CUP_O_RU_Soldier_AT_EMR","CUP_O_RU_Soldier_AR_EMR",
			"CUP_O_RU_Soldier_LAT_EMR","CUP_O_RU_Soldier_GL_EMR",
			"CUP_O_RU_Soldier_EMR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
			// configName CUP_O_RU_InfSection_EMR
			[[[["CUP_O_RU_Soldier_TL_EMR","CUP_O_RU_Soldier_AR_EMR","CUP_O_RU_Soldier_AT_EMR","CUP_O_RU_Soldier_GL_EMR","CUP_O_RU_Soldier_EMR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSection_AT_EMR
			[[[["CUP_O_RU_Soldier_HAT_EMR","CUP_O_RU_Soldier_HAT_EMR","CUP_O_RU_Soldier_AT_EMR","CUP_O_RU_Soldier_AT_EMR","CUP_O_RU_Soldier_EMR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSection_AA_EMR
			[[[["CUP_O_RU_Soldier_AA_EMR","CUP_O_RU_Soldier_AA_EMR","CUP_O_RU_Soldier_AA_EMR"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1],
			// configName CUP_O_RU_InfSection_MG_EMR
			[[[["CUP_O_RU_Soldier_TL_EMR","CUP_O_RU_Soldier_MG_EMR","CUP_O_RU_Soldier_MG_EMR","CUP_O_RU_Soldier_GL_EMR","CUP_O_RU_Soldier_AT_EMR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSentry_EMR
			[[[["CUP_O_RU_Soldier_GL_EMR","CUP_O_RU_Soldier_EMR"],[[0,5,0],[3,0,0]],["CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_O_RU_SniperTeam_EMR
			[[[["CUP_O_RU_Sniper_EMR","CUP_O_RU_Spotter_EMR"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],

			// configName CUP_O_RU_InfSquad_VDV
			[[[["CUP_O_RU_Soldier_SL_VDV",
			"CUP_O_RU_Soldier_MG_VDV","CUP_O_RU_Soldier_AT_VDV",
			"CUP_O_RU_Soldier_LAT_VDV","CUP_O_RU_Soldier_GL_VDV",
			"CUP_O_RU_Soldier_Marksman_VDV","CUP_O_RU_Soldier_MG_VDV",
			"CUP_O_RU_Soldier_AT_VDV","CUP_O_RU_Soldier_AR_VDV",
			"CUP_O_RU_Soldier_LAT_VDV","CUP_O_RU_Soldier_GL_VDV",
			"CUP_O_RU_Soldier_VDV"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
			// configName CUP_O_RU_InfSection_VDV
			[[[["CUP_O_RU_Soldier_TL_VDV","CUP_O_RU_Soldier_AR_VDV","CUP_O_RU_Soldier_AT_VDV","CUP_O_RU_Soldier_GL_VDV","CUP_O_RU_Soldier_VDV"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSection_AT_VDV
			[[[["CUP_O_RU_Soldier_HAT_VDV","CUP_O_RU_Soldier_HAT_VDV","CUP_O_RU_Soldier_AT_VDV","CUP_O_RU_Soldier_AT_VDV","CUP_O_RU_Soldier_VDV"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSection_AA_VDV
			[[[["CUP_O_RU_Soldier_AA_VDV","CUP_O_RU_Soldier_AA_VDV","CUP_O_RU_Soldier_AA_VDV"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1],
			// configName CUP_O_RU_InfSection_MG_VDV
			[[[["CUP_O_RU_Soldier_TL_VDV","CUP_O_RU_Soldier_MG_VDV","CUP_O_RU_Soldier_MG_VDV","CUP_O_RU_Soldier_GL_VDV","CUP_O_RU_Soldier_AT_VDV"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSentry_VDV
			[[[["CUP_O_RU_Soldier_GL_VDV","CUP_O_RU_Soldier_VDV"],[[0,5,0],[3,0,0]],["CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_O_RU_SniperTeam_VDV
			[[[["CUP_O_RU_Sniper_VDV","CUP_O_RU_Spotter_VDV"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],

			// configName CUP_O_RU_InfSquad_VDV_EMR
			[[[["CUP_O_RU_Soldier_SL_VDV_EMR",
			"CUP_O_RU_Soldier_MG_VDV_EMR","CUP_O_RU_Soldier_AT_VDV_EMR",
			"CUP_O_RU_Soldier_LAT_VDV_EMR","CUP_O_RU_Soldier_GL_VDV_EMR",
			"CUP_O_RU_Soldier_Marksman_VDV_EMR","CUP_O_RU_Soldier_MG_VDV_EMR",
			"CUP_O_RU_Soldier_AT_VDV_EMR","CUP_O_RU_Soldier_AR_VDV_EMR",
			"CUP_O_RU_Soldier_LAT_VDV_EMR","CUP_O_RU_Soldier_GL_VDV_EMR",
			"CUP_O_RU_Soldier_VDV_EMR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
			// configName CUP_O_RU_InfSection_VDV_EMR
			[[[["CUP_O_RU_Soldier_TL_VDV_EMR","CUP_O_RU_Soldier_AR_VDV_EMR","CUP_O_RU_Soldier_AT_VDV_EMR","CUP_O_RU_Soldier_GL_VDV_EMR","CUP_O_RU_Soldier_VDV_EMR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSection_AT_VDV_EMR
			[[[["CUP_O_RU_Soldier_HAT_VDV_EMR","CUP_O_RU_Soldier_HAT_VDV_EMR","CUP_O_RU_Soldier_AT_VDV_EMR","CUP_O_RU_Soldier_AT_VDV_EMR","CUP_O_RU_Soldier_VDV_EMR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSection_AA_VDV_EMR
			[[[["CUP_O_RU_Soldier_AA_VDV_EMR","CUP_O_RU_Soldier_AA_VDV_EMR","CUP_O_RU_Soldier_AA_VDV_EMR"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1],
			// configName CUP_O_RU_InfSection_MG_VDV_EMR
			[[[["CUP_O_RU_Soldier_TL_VDV_EMR","CUP_O_RU_Soldier_MG_VDV_EMR","CUP_O_RU_Soldier_MG_VDV_EMR","CUP_O_RU_Soldier_GL_VDV_EMR","CUP_O_RU_Soldier_AT_VDV_EMR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSentry_VDV_EMR
			[[[["CUP_O_RU_Soldier_GL_VDV_EMR","CUP_O_RU_Soldier_VDV_EMR"],[[0,5,0],[3,0,0]],["CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_O_RU_SniperTeam_VDV_EMR
			[[[["CUP_O_RU_Sniper_VDV_EMR","CUP_O_RU_Spotter_VDV_EMR"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],

			// configName CUP_O_RU_MotInfSquad
			[[[["CUP_O_RU_Soldier_SL",
			"CUP_O_Ural_RU","CUP_O_RU_Soldier_MG",
			"CUP_O_RU_Soldier_AT","CUP_O_RU_Soldier_LAT",
			"CUP_O_RU_Soldier_GL","CUP_O_RU_Soldier_Marksman",
			"CUP_O_RU_Soldier_MG","CUP_O_RU_Soldier_LAT",
			"CUP_O_RU_Soldier_AR","CUP_O_RU_Soldier_AT",
			"CUP_O_RU_Soldier_GL","CUP_O_RU_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.3],
			// configName CUP_O_RU_MechInfSquad_2
			[[[["CUP_O_RU_Soldier_SL",
			"CUP_O_BTR90_RU","CUP_O_RU_Soldier_MG",
			"CUP_O_RU_Soldier_MG","CUP_O_RU_Soldier_AT",
			"CUP_O_RU_Soldier_LAT","CUP_O_RU_Soldier_GL"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.9],
			// configName CUP_O_RU_TankPlatoon
			[[[["CUP_O_T72_RU","CUP_O_T72_RU","CUP_O_T72_RU"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT"]]],0.6],

			// configName CUP_O_RU_Mi24VSquadron
			[[[["CUP_O_Mi24_V_RU","CUP_O_Mi24_V_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			// configName CUP_O_RU_Mi24PSquadron
			[[[["CUP_O_Mi24_P_RU","CUP_O_Mi24_P_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			// configName CUP_O_RU_Mi8Squadron
			[[[["CUP_O_Mi8_RU","CUP_O_Mi8_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.5],
			// configName CUP_O_RU_Su34FighterSquadron
			[[[["CUP_O_SU34_AGM_RU","CUP_O_SU34_AGM_RU"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.2],

			// configName CUP_O_RU_InfSquad
			[[[["CUP_O_RU_Soldier_SL",
			"CUP_O_RU_Soldier_MG","CUP_O_RU_Soldier_AT",
			"CUP_O_RU_Soldier_LAT","CUP_O_RU_Soldier_GL",
			"CUP_O_RU_Soldier_Marksman","CUP_O_RU_Soldier_MG",
			"CUP_O_RU_Soldier_AT","CUP_O_RU_Soldier_AR",
			"CUP_O_RU_Soldier_LAT","CUP_O_RU_Soldier_GL",
			"CUP_O_RU_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
			// configName CUP_O_RU_InfSection
			[[[["CUP_O_RU_Soldier_TL","CUP_O_RU_Soldier_AR","CUP_O_RU_Soldier_AT","CUP_O_RU_Soldier_GL","CUP_O_RU_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSection_AT
			[[[["CUP_O_RU_Soldier_HAT","CUP_O_RU_Soldier_HAT","CUP_O_RU_Soldier_AT","CUP_O_RU_Soldier_AT","CUP_O_RU_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSection_AA
			[[[["CUP_O_RU_Soldier_AA","CUP_O_RU_Soldier_AA","CUP_O_RU_Soldier_AA"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1],
			// configName CUP_O_RU_InfSection_MG
			[[[["CUP_O_RU_Soldier_TL","CUP_O_RU_Soldier_MG","CUP_O_RU_Soldier_MG","CUP_O_RU_Soldier_GL","CUP_O_RU_Soldier_AT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_RU_InfSentry
			[[[["CUP_O_RU_Soldier_GL","CUP_O_RU_Soldier"],[[0,5,0],[3,0,0]],["CORPORAL","PRIVATE"]]],0.2],

			// configName CUP_O_RU_SniperTeam
			[[[["CUP_O_RU_Sniper","CUP_O_RU_Spotter"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
			// configName CUP_O_RU_ReconTeam
			[[[["CUP_O_RUS_Soldier_TL","CUP_O_RUS_Soldier_GL","CUP_O_RUS_Soldier_Marksman","CUP_O_RUS_SpecOps_Scout","CUP_O_RUS_SpecOps","CUP_O_RUS_SpecOps_SD"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL"]]],0.07],
			// configName CUP_O_RU_ReconTeam_AUT
			[[[["CUP_O_RUS_Soldier_TL_Autumn",
			"CUP_O_RUS_Soldier_GL_Autumn","CUP_O_RUS_Soldier_Marksman_Autumn",
			"CUP_O_RUS_SpecOps_Scout_Autumn","CUP_O_RUS_SpecOps_Autumn",
			"CUP_O_RUS_SpecOps_SD_Autumn"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL"]]],0.07],
			// configName CUP_O_MVD_AssaultTeam
			[[[["CUP_O_MVD_Soldier_TL",
			"CUP_O_MVD_Soldier_MG","CUP_O_MVD_Soldier_AT",
			"CUP_O_MVD_Soldier_GL","CUP_O_MVD_Sniper",
			"CUP_O_MVD_Soldier_Marksman","CUP_O_MVD_Soldier_GL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.02]
		];
	};
	// Desert
	if (_tmp > 0 or (_tmp == -1 && _n > 250)) then {
		_east=_east+[
			// configName InfSquad
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Desert",
			"CUP_O_RU_Soldier_Ratnik_Desert","CUP_O_RU_Soldier_LAT_Ratnik_Desert",
			"CUP_O_RU_Soldier_MG_Ratnik_Desert","CUP_O_RU_Soldier_TL_Ratnik_Desert",
			"CUP_O_RU_Soldier_AR_Ratnik_Desert","CUP_O_RU_Soldier_A_Ratnik_Desert",
			"CUP_O_RU_Soldier_Medic_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfSquad_Weapons
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Desert",
			"CUP_O_RU_Soldier_AR_Ratnik_Desert","CUP_O_RU_Soldier_GL_Ratnik_Desert",
			"CUP_O_RU_Soldier_MG_Ratnik_Desert","CUP_O_RU_Soldier_AT_Ratnik_Desert",
			"CUP_O_RU_Soldier_AAT_Ratnik_Desert","CUP_O_RU_Soldier_A_Ratnik_Desert",
			"CUP_O_RU_Soldier_Medic_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Desert","CUP_O_RU_Soldier_AR_Ratnik_Desert","CUP_O_RU_Soldier_GL_Ratnik_Desert","CUP_O_RU_Soldier_LAT_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AT
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Desert","CUP_O_RU_Soldier_AT_Ratnik_Desert","CUP_O_RU_Soldier_AT_Ratnik_Desert","CUP_O_RU_Soldier_AAT_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AA
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Desert","CUP_O_RU_Soldier_AA_Ratnik_Desert","CUP_O_RU_Soldier_AA_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0],
			// configName InfSentry
			[[[["CUP_O_RU_Soldier_GL_Ratnik_Desert","CUP_O_RU_Soldier_Ratnik_Desert"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0],
			// configName reconTeam
			[[[["CUP_O_RU_Recon_TL_Ratnik_Desert",
			"CUP_O_RU_Recon_Marksman_Ratnik_Desert","CUP_O_RU_Recon_Medic_Ratnik_Desert",
			"CUP_O_RU_Recon_LAT_Ratnik_Desert","CUP_O_RU_Recon_Ratnik_Desert",
			"CUP_O_RU_Recon_Exp_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName reconSentry
			[[[["CUP_O_RU_Recon_Marksman_Ratnik_Desert","CUP_O_RU_Recon_Ratnik_Desert"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0],
			// configName InfAssault
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Desert",
			"CUP_O_RU_Soldier_AR_Ratnik_Desert","CUP_O_RU_Soldier_MG_Ratnik_Desert",
			"CUP_O_RU_Soldier_AAR_Ratnik_Desert","CUP_O_RU_Soldier_Marksman_Ratnik_Desert",
			"CUP_O_RU_Soldier_AT_Ratnik_Desert","CUP_O_RU_Soldier_AAT_Ratnik_Desert",
			"CUP_O_RU_Soldier_Medic_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName O_InfTeam_AT_Heavy
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Desert","CUP_O_RU_Soldier_HAT_Ratnik_Desert","CUP_O_RU_Soldier_HAT_Ratnik_Desert","CUP_O_RU_Soldier_AHAT_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0]
		];
	};
	// Winter
	if (_tmp > 0 or (_tmp == -1 && _n < 150)) then {
		_east=_east+[
			// configName InfSquad
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Winter",
			"CUP_O_RU_Soldier_Ratnik_Winter","CUP_O_RU_Soldier_LAT_Ratnik_Winter",
			"CUP_O_RU_Soldier_MG_Ratnik_Winter","CUP_O_RU_Soldier_TL_Ratnik_Winter",
			"CUP_O_RU_Soldier_AR_Ratnik_Winter","CUP_O_RU_Soldier_A_Ratnik_Winter",
			"CUP_O_RU_Soldier_Medic_Ratnik_Winter"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],
			0.7],
			// configName InfSquad_Weapons
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Winter",
			"CUP_O_RU_Soldier_AR_Ratnik_Winter","CUP_O_RU_Soldier_GL_Ratnik_Winter",
			"CUP_O_RU_Soldier_MG_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter",
			"CUP_O_RU_Soldier_AAT_Ratnik_Winter","CUP_O_RU_Soldier_A_Ratnik_Winter",
			"CUP_O_RU_Soldier_Medic_Ratnik_Winter"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],
			0.5],
			// configName InfTeam
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Winter","CUP_O_RU_Soldier_AR_Ratnik_Winter","CUP_O_RU_Soldier_GL_Ratnik_Winter","CUP_O_RU_Soldier_LAT_Ratnik_Winter"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName InfTeam_AT
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter","CUP_O_RU_Soldier_AAT_Ratnik_Winter"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],
			0.2],
			// configName InfTeam_AA
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Winter","CUP_O_RU_Soldier_AA_Ratnik_Winter","CUP_O_RU_Soldier_AA_Ratnik_Winter"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],
			0.1],
			// configName InfSentry
			[[[["CUP_O_RU_Soldier_GL_Ratnik_Winter","CUP_O_RU_Soldier_Ratnik_Winter"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0],
			// configName reconTeam
			[[[["CUP_O_RU_Recon_TL_Ratnik_Winter",
			"CUP_O_RU_Recon_Marksman_Ratnik_Winter","CUP_O_RU_Recon_Medic_Ratnik_Winter",
			"CUP_O_RU_Recon_LAT_Ratnik_Winter","CUP_O_RU_Recon_Ratnik_Winter",
			"CUP_O_RU_Recon_Exp_Ratnik_Winter"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0],
			// configName reconSentry
			[[[["CUP_O_RU_Recon_Marksman_Ratnik_Winter","CUP_O_RU_Recon_Ratnik_Winter"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.05],
			// configName InfAssault
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Winter",
			"CUP_O_RU_Soldier_AR_Ratnik_Winter","CUP_O_RU_Soldier_MG_Ratnik_Winter",
			"CUP_O_RU_Soldier_AAR_Ratnik_Winter","CUP_O_RU_Soldier_Marksman_Ratnik_Winter",
			"CUP_O_RU_Soldier_AT_Ratnik_Winter","CUP_O_RU_Soldier_AAT_Ratnik_Winter",
			"CUP_O_RU_Soldier_Medic_Ratnik_Winter"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],
			0],
			// configName O_InfTeam_AT_Heavy
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Winter","CUP_O_RU_Soldier_HAT_Ratnik_Winter","CUP_O_RU_Soldier_HAT_Ratnik_Winter","CUP_O_RU_Soldier_AHAT_Ratnik_Winter"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],
			0.15]
		];
	};
};


//-- CUP_B_US_Army
	// UCP, OCP, OEFCP
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"CUP_B_US_Army");
if (_tmp > 0 or (_tmp == -1 && _d >= 1980)) then {
	// Air
	_west=_west+[
		// configName CUP_B_US_Army_A10Flight
		[[[["CUP_B_A10_CAS_USA","CUP_B_A10_CAS_USA"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_B_US_Army_AH64DFlight
		[[[["CUP_B_AH64D_USA"],[[0,0,0]],["CAPTAIN"]]],0.3],
		// configName CUP_B_US_Army_C130JFlight
		//[[[["CUP_B_C130J_USMC"],[[0,0,0]],["CAPTAIN"]]],0.3],
		// configName CUP_B_US_Army_CH47FFlight
		[[[["CUP_B_CH47F_USA"],[[0,0,0]],["CAPTAIN"]]],0.3]
	];

	// Inf.
	if (_tmp > 0 or (_tmp == -1 && (_n < 150 or _n > 250))) then {
		_west=_west+[
			// configName CUP_B_US_Army_RifleSquad_UCP
			[[[["CUP_B_US_Soldier_SL_UCP",
			"CUP_B_US_Soldier_TL_UCP","CUP_B_US_Soldier_GL_UCP",
			"CUP_B_US_Soldier_AR_UCP","CUP_B_US_Soldier_AT_UCP",
			"CUP_B_US_Soldier_TL_UCP","CUP_B_US_Soldier_GL_UCP",
			"CUP_B_US_Soldier_AR_UCP","CUP_B_US_Soldier_AAR_UCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_US_Army_WeaponsSquad_UCP
			[[[["CUP_B_US_Soldier_SL_UCP",
			"CUP_B_US_Soldier_MG_UCP","CUP_B_US_Soldier_GL_UCP",
			"CUP_B_US_Soldier_AMG_UCP","CUP_B_US_Soldier_MG_UCP",
			"CUP_B_US_Soldier_GL_UCP","CUP_B_US_Soldier_AMG_UCP",
			"CUP_B_US_Soldier_LAT_UCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_US_Army_Team_UCP
			[[[["CUP_B_US_Soldier_TL_UCP","CUP_B_US_Soldier_AR_UCP","CUP_B_US_Soldier_GL_UCP","CUP_B_US_Soldier_AAR_UCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.3],
			// configName CUP_B_US_Army_TeamMG_UCP
			[[[["CUP_B_US_Soldier_TL_UCP","CUP_B_US_Soldier_MG_UCP","CUP_B_US_Soldier_GL_UCP","CUP_B_US_Soldier_AMG_UCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_US_Army_TeamAT_UCP
			[[[["CUP_B_US_Soldier_TL_UCP","CUP_B_US_Soldier_AT_UCP","CUP_B_US_Soldier_AT_UCP","CUP_B_US_Soldier_AAT_UCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_US_Army_TeamSupport_UCP
			[[[["CUP_B_US_Soldier_TL_UCP","CUP_B_US_Soldier_GL_UCP","CUP_B_US_Soldier_Marksman_UCP","CUP_B_US_Medic_UCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_US_Army_HeavyATTeam_UCP
			[[[["CUP_B_US_Soldier_HAT_UCP","CUP_B_US_Soldier_HAT_UCP","CUP_B_US_Soldier_AHAT_UCP"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1],

			// configName CUP_B_US_Army_RifleSquad_OCP
			[[[["CUP_B_US_Soldier_SL_OCP",
			"CUP_B_US_Soldier_TL_OCP","CUP_B_US_Soldier_GL_OCP",
			"CUP_B_US_Soldier_AR_OCP","CUP_B_US_Soldier_AT_OCP",
			"CUP_B_US_Soldier_TL_OCP","CUP_B_US_Soldier_GL_OCP",
			"CUP_B_US_Soldier_AR_OCP","CUP_B_US_Soldier_AAR_OCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_US_Army_WeaponsSquad_OCP
			[[[["CUP_B_US_Soldier_SL_OCP",
			"CUP_B_US_Soldier_MG_OCP","CUP_B_US_Soldier_GL_OCP",
			"CUP_B_US_Soldier_AMG_OCP","CUP_B_US_Soldier_MG_OCP",
			"CUP_B_US_Soldier_GL_OCP","CUP_B_US_Soldier_AMG_OCP",
			"CUP_B_US_Soldier_LAT_OCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_US_Army_Team_OCP
			[[[["CUP_B_US_Soldier_TL_OCP","CUP_B_US_Soldier_AR_OCP","CUP_B_US_Soldier_GL_OCP","CUP_B_US_Soldier_AAR_OCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.3],
			// configName CUP_B_US_Army_TeamMG_OCP
			[[[["CUP_B_US_Soldier_TL_OCP","CUP_B_US_Soldier_MG_OCP","CUP_B_US_Soldier_GL_OCP","CUP_B_US_Soldier_AMG_OCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_US_Army_TeamAT_OCP
			[[[["CUP_B_US_Soldier_TL_OCP","CUP_B_US_Soldier_AT_OCP","CUP_B_US_Soldier_AT_OCP","CUP_B_US_Soldier_AAT_OCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_US_Army_TeamSupport_OCP
			[[[["CUP_B_US_Soldier_TL_OCP","CUP_B_US_Soldier_GL_OCP","CUP_B_US_Soldier_Marksman_OCP","CUP_B_US_Medic_OCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_US_Army_HeavyATTeam_OCP
			[[[["CUP_B_US_Soldier_HAT_OCP","CUP_B_US_Soldier_HAT_OCP","CUP_B_US_Soldier_AHAT_OCP"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1],

			// configName CUP_B_US_Army_SniperTeam
			[[[["CUP_B_US_Sniper","CUP_B_US_Sniper","CUP_B_US_Spotter"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","CORPORAL"]]],0.05],
			// configName CUP_B_US_Army_DeltaForceTeam
			[[[["CUP_B_US_SpecOps_TL","CUP_B_US_SpecOps_MG","CUP_B_US_SpecOps_Assault","CUP_B_US_SpecOps_M"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL"]]],0]
		];
	};
	if (_tmp > 0 or (_tmp == -1 && _n >= 150)) then {
		_west=_west+[
			// configName CUP_B_US_Army_MotorizedSection_OEFCP
			[[[["CUP_B_US_Soldier_SL_OEFCP",
			"CUP_B_HMMWV_M2_GPK_USA","CUP_B_HMMWV_MK19_USA",
			"CUP_B_US_Soldier_AT_OEFCP","CUP_B_US_Soldier_GL_OEFCP",
			"CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_AAT_OEFCP",
			"CUP_B_US_Soldier_Marksman_OEFCP"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_US_Army_MotorizedSectionAT_OEFCP
			[[[["CUP_B_US_Soldier_SL_OEFCP","CUP_B_HMMWV_TOW_USA","CUP_B_HMMWV_TOW_USA","CUP_B_US_Soldier_AR_OEFCP"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.15],

			// configName CUP_B_US_Army_RifleSquad_OEFCP
			[[[["CUP_B_US_Soldier_SL_OEFCP",
			"CUP_B_US_Soldier_TL_OEFCP","CUP_B_US_Soldier_GL_OEFCP",
			"CUP_B_US_Soldier_AR_OEFCP","CUP_B_US_Soldier_AT_OEFCP",
			"CUP_B_US_Soldier_TL_OEFCP","CUP_B_US_Soldier_GL_OEFCP",
			"CUP_B_US_Soldier_AR_OEFCP","CUP_B_US_Soldier_AAR_OEFCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_US_Army_WeaponsSquad_OEFCP
			[[[["CUP_B_US_Soldier_SL_OEFCP",
			"CUP_B_US_Soldier_MG_OEFCP","CUP_B_US_Soldier_GL_OEFCP",
			"CUP_B_US_Soldier_AMG_OEFCP","CUP_B_US_Soldier_MG_OEFCP",
			"CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_AMG_OEFCP",
			"CUP_B_US_Soldier_LAT_OEFCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_US_Army_Team_OEFCP
			[[[["CUP_B_US_Soldier_TL_OEFCP","CUP_B_US_Soldier_AR_OEFCP","CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_AAR_OEFCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.3],
			// configName CUP_B_US_Army_TeamMG_OEFCP
			[[[["CUP_B_US_Soldier_TL_OEFCP","CUP_B_US_Soldier_MG_OEFCP","CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_AMG_OEFCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_US_Army_TeamAT_OEFCP
			[[[["CUP_B_US_Soldier_TL_OEFCP","CUP_B_US_Soldier_AT_OEFCP","CUP_B_US_Soldier_AT_OEFCP","CUP_B_US_Soldier_AAT_OEFCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_US_Army_TeamSupport_OEFCP
			[[[["CUP_B_US_Soldier_TL_OEFCP","CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_Marksman_OEFCP","CUP_B_US_Medic_OEFCP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_US_Army_HeavyATTeam_OEFCP
			[[[["CUP_B_US_Soldier_HAT_OEFCP","CUP_B_US_Soldier_HAT_OEFCP","CUP_B_US_Soldier_AHAT_OEFCP"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1]
		];
	};

	// Vehicles Desert
	if (_tmp > 0 or (_tmp == -1 && (_n < 150 or _n > 250))) then {
		_west=_west+[
			// configName CUP_B_US_Army_DeltaPatrolHMMWV
			[[[["CUP_B_US_SpecOps_TL","CUP_B_HMMWV_SOV_USA","CUP_B_US_SpecOps_Assault","CUP_B_US_SpecOps_M"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0],

			// configName CUP_B_US_Army_MotorizedSection_UCP
			[[[["CUP_B_US_Soldier_SL_UCP",
			"CUP_B_HMMWV_M2_GPK_USA","CUP_B_HMMWV_MK19_USA",
			"CUP_B_US_Soldier_AT_UCP","CUP_B_US_Soldier_GL_UCP",
			"CUP_B_US_Soldier_GL_UCP","CUP_B_US_Soldier_AAT_UCP",
			"CUP_B_US_Soldier_Marksman_UCP"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_US_Army_MotorizedSectionAT_UCP
			[[[["CUP_B_US_Soldier_SL_UCP","CUP_B_HMMWV_TOW_USA","CUP_B_HMMWV_TOW_USA","CUP_B_US_Soldier_AR_UCP"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.15],
			// configName CUP_B_US_Army_MechanizedInfantrySquadICVM2_UCP
			[[[["CUP_B_US_Soldier_SL_UCP",
			"CUP_B_M1126_ICV_M2_Desert","CUP_B_US_Soldier_TL_UCP",
			"CUP_B_US_Soldier_AR_UCP","CUP_B_US_Soldier_AT_UCP",
			"CUP_B_US_Soldier_GL_UCP","CUP_B_US_Soldier_TL_UCP",
			"CUP_B_US_Soldier_AR_UCP","CUP_B_US_Soldier_GL_UCP",
			"CUP_B_US_Soldier_Marksman_UCP"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
			// configName CUP_B_US_Army_MechanizedInfantrySquadICVMK19_UCP
			[[[["CUP_B_US_Soldier_SL_UCP",
			"CUP_B_M1126_ICV_MK19_Desert","CUP_B_US_Soldier_TL_UCP",
			"CUP_B_US_Soldier_GL_UCP","CUP_B_US_Soldier_AR_UCP",
			"CUP_B_US_Soldier_AT_UCP","CUP_B_US_Soldier_TL_UCP",
			"CUP_B_US_Soldier_GL_UCP","CUP_B_US_Soldier_AR_UCP",
			"CUP_B_US_Soldier_Marksman_UCP"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
			// configName CUP_B_US_Army_MechanizedReconSection_UCP
			[[[["CUP_B_US_Soldier_TL_UCP",
			"CUP_B_M2A3Bradley_USA_D","CUP_B_US_Soldier_AR_UCP",
			"CUP_B_US_Soldier_GL_UCP","CUP_B_US_Soldier_GL_UCP",
			"CUP_B_US_Soldier_AT_UCP","CUP_B_US_Soldier_LAT_UCP"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.6],

			// configName CUP_B_US_Army_MotorizedSection_OCP
			[[[["CUP_B_US_Soldier_SL_OCP",
			"CUP_B_HMMWV_M2_GPK_USA","CUP_B_HMMWV_MK19_USA",
			"CUP_B_US_Soldier_AT_OCP","CUP_B_US_Soldier_GL_OCP",
			"CUP_B_US_Soldier_GL_OCP","CUP_B_US_Soldier_AAT_OCP",
			"CUP_B_US_Soldier_Marksman_OCP"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_US_Army_MotorizedSectionAT_OCP
			[[[["CUP_B_US_Soldier_SL_OCP","CUP_B_HMMWV_TOW_USA","CUP_B_HMMWV_TOW_USA","CUP_B_US_Soldier_AR_OCP"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.15],
			// configName CUP_B_US_Army_MechanizedInfantrySquadICVM2_OCP
			[[[["CUP_B_US_Soldier_SL_OCP",
			"CUP_B_M1126_ICV_M2_Desert","CUP_B_US_Soldier_TL_OCP",
			"CUP_B_US_Soldier_AR_OCP","CUP_B_US_Soldier_AT_OCP",
			"CUP_B_US_Soldier_GL_OCP","CUP_B_US_Soldier_TL_OCP",
			"CUP_B_US_Soldier_AR_OCP","CUP_B_US_Soldier_GL_OCP",
			"CUP_B_US_Soldier_Marksman_OCP"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
			// configName CUP_B_US_Army_MechanizedInfantrySquadICVMK19_OCP
			[[[["CUP_B_US_Soldier_SL_OCP",
			"CUP_B_M1126_ICV_MK19_Desert","CUP_B_US_Soldier_TL_OCP",
			"CUP_B_US_Soldier_GL_OCP","CUP_B_US_Soldier_AR_OCP",
			"CUP_B_US_Soldier_AT_OCP","CUP_B_US_Soldier_TL_OCP",
			"CUP_B_US_Soldier_GL_OCP","CUP_B_US_Soldier_AR_OCP",
			"CUP_B_US_Soldier_Marksman_OCP"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
			// configName CUP_B_US_Army_MechanizedReconSection_OCP
			[[[["CUP_B_US_Soldier_TL_OCP",
			"CUP_B_M2A3Bradley_USA_D","CUP_B_US_Soldier_AR_OCP",
			"CUP_B_US_Soldier_GL_OCP","CUP_B_US_Soldier_GL_OCP",
			"CUP_B_US_Soldier_AT_OCP","CUP_B_US_Soldier_LAT_OCP"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.6],
			// configName CUP_B_US_Army_MechanizedInfantrySquadICVM2_OEFCP
			[[[["CUP_B_US_Soldier_SL_OEFCP",
			"CUP_B_M1126_ICV_M2_Desert","CUP_B_US_Soldier_TL_OEFCP",
			"CUP_B_US_Soldier_AR_OEFCP","CUP_B_US_Soldier_AT_OEFCP",
			"CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_TL_OEFCP",
			"CUP_B_US_Soldier_AR_OEFCP","CUP_B_US_Soldier_GL_OEFCP",
			"CUP_B_US_Soldier_Marksman_OEFCP"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
			// configName CUP_B_US_Army_MechanizedInfantrySquadICVMK19_OEFCP
			[[[["CUP_B_US_Soldier_SL_OEFCP",
			"CUP_B_M1126_ICV_MK19_Desert","CUP_B_US_Soldier_TL_OEFCP",
			"CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_AR_OEFCP",
			"CUP_B_US_Soldier_AT_OEFCP","CUP_B_US_Soldier_TL_OEFCP",
			"CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_AR_OEFCP",
			"CUP_B_US_Soldier_Marksman_OEFCP"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
			// configName CUP_B_US_Army_MechanizedReconSection_OEFCP
			[[[["CUP_B_US_Soldier_TL_OEFCP",
			"CUP_B_M2A3Bradley_USA_D","CUP_B_US_Soldier_AR_OEFCP",
			"CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_GL_OEFCP",
			"CUP_B_US_Soldier_AT_OEFCP","CUP_B_US_Soldier_LAT_OEFCP"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.6],

			// configName CUP_B_US_Army_MGSPlatoon
			[[[["CUP_B_M1128_MGS_Desert","CUP_B_M1128_MGS_Desert","CUP_B_M1128_MGS_Desert"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
			// configName CUP_B_US_Army_M1A2Platoon
			[[[["CUP_B_M1A2_TUSK_MG_DES_US_Army","CUP_B_M1A2_TUSK_MG_DES_US_Army","CUP_B_M1A2_TUSK_MG_DES_US_Army","CUP_B_M1A2_TUSK_MG_DES_US_Army"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.05],
			// configName CUP_B_US_Army_M1A1Platoon
			[[[["CUP_B_M1A1_DES_US_Army","CUP_B_M1A1_DES_US_Army","CUP_B_M1A1_DES_US_Army","CUP_B_M1A1_DES_US_Army"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.05],
			// configName CUP_B_US_Army_M1A2Section
			[[[["CUP_B_M1A2_TUSK_MG_DES_US_Army","CUP_B_M1A2_TUSK_MG_DES_US_Army"],[[0,10,0],[5,0,0]],["CAPTAIN","LIEUTENANT"]]],0.05]
		];
	};
};

//-- CUP_B_USMC
	// FROG_WDL, FROG_DES, MARSOC, DES, FRTeam, FRTeam_Desert, Default
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"CUP_B_USMC");
if (_tmp > 0 or (_tmp == -1 && _d >= 1980)) then {
	// Air
	_west=_west+[
		// configName CUP_B_USMC_AH1ZSquadron
		[[[["CUP_B_AH1Z","CUP_B_AH1Z"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_B_USMC_UH1YSquadron
		[[[["CUP_B_UH1Y_GUNSHIP_F","CUP_B_UH1Y_GUNSHIP_F"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.5],
		// configName CUP_B_USMC_MV22Squadron
		//[[[["CUP_B_MV22_USMC","CUP_B_MV22_USMC"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.5],
		// configName CUP_B_USMC_AV8BFighterSquadron
		[[[["CUP_B_AV8B","CUP_B_AV8B"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_B_USMC_AV8BBomberSquadron
		[[[["CUP_B_AV8B_LGB","CUP_B_AV8B_LGB"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.5]
	];

	if (_tmp > 0 or (_tmp == -1 && (_n >= 150 && _n <= 250))) then {
		_west=_west+[
			// configName CUP_B_USMC_InfSquad_FROG_WDL
			[[[["CUP_B_USMC_Soldier_SL_FROG_WDL","CUP_B_USMC_Soldier_TL_FROG_WDL","CUP_B_USMC_Soldier_AR_FROG_WDL","CUP_B_USMC_Soldier_LAT_FROG_WDL","CUP_B_USMC_Soldier_FROG_WDL","CUP_B_USMC_Soldier_TL_FROG_WDL","CUP_B_USMC_Soldier_AR_FROG_WDL","CUP_B_USMC_Soldier_LAT_FROG_WDL","CUP_B_USMC_Soldier_FROG_WDL","CUP_B_USMC_Soldier_TL_FROG_WDL","CUP_B_USMC_Soldier_AR_FROG_WDL","CUP_B_USMC_Soldier_LAT_FROG_WDL","CUP_B_USMC_Soldier_FROG_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_B_USMC_FireTeam_FROG_WDL
			[[[["CUP_B_USMC_Soldier_TL_FROG_WDL","CUP_B_USMC_Soldier_AR_FROG_WDL","CUP_B_USMC_Soldier_LAT_FROG_WDL","CUP_B_USMC_Soldier_FROG_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.05],
			// configName CUP_B_USMC_FireTeam_MG_FROG_WDL
			[[[["CUP_B_USMC_Soldier_TL_FROG_WDL","CUP_B_USMC_Soldier_MG_FROG_WDL","CUP_B_USMC_Soldier_AR_FROG_WDL","CUP_B_USMC_Soldier_LAT_FROG_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_USMC_FireTeam_AT_FROG_WDL
			[[[["CUP_B_USMC_Soldier_TL_FROG_WDL","CUP_B_USMC_Soldier_AR_FROG_WDL","CUP_B_USMC_Soldier_AT_FROG_WDL","CUP_B_USMC_Soldier_LAT_FROG_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_USMC_FireTeam_Support_FROG_WDL
			[[[["CUP_B_USMC_Soldier_TL_FROG_WDL","CUP_B_USMC_Soldier_AR_FROG_WDL","CUP_B_USMC_Soldier_LAT_FROG_WDL","CUP_B_USMC_Medic_FROG_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.05],
			// configName CUP_B_USMC_HeavyATTeam_FROG_WDL
			[[[["CUP_B_USMC_Soldier_HAT_FROG_WDL","CUP_B_USMC_Soldier_AT_FROG_WDL","CUP_B_USMC_Soldier_LAT_FROG_WDL"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.15],

			// configName CUP_B_USMC_InfSquad_MARSOC
			[[[["CUP_B_USMC_MARSOC_TL","CUP_B_USMC_MARSOC_TC","CUP_B_USMC_MARSOC_OC","CUP_B_USMC_MARSOC_CC","CUP_B_USMC_MARSOC_EL","CUP_B_USMC_MARSOC_AR","CUP_B_USMC_MARSOC_Marksman","CUP_B_USMC_MARSOC_Medic","CUP_B_USMC_MARSOC","CUP_B_USMC_MARSOC_EL","CUP_B_USMC_MARSOC","CUP_B_USMC_MARSOC","CUP_B_USMC_MARSOC","CUP_B_USMC_MARSOC_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0],[11,-5,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
			// configName CUP_B_USMC_FireTeam_MARSOC
			[[[["CUP_B_USMC_MARSOC_EL","CUP_B_USMC_MARSOC","CUP_B_USMC_MARSOC","CUP_B_USMC_MARSOC_AR","CUP_B_USMC_MARSOC_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
			// configName CUP_B_USMC_FireTeam_MARSOC_HQ
			[[[["CUP_B_USMC_MARSOC_TL","CUP_B_USMC_MARSOC_TC","CUP_B_USMC_MARSOC_OC","CUP_B_USMC_MARSOC_CC"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL"]]],0.1],
			// configName CUP_B_USMC_InfSquad_MARSOC_DA
			[[[["CUP_B_USMC_MARSOC_TL_DA","CUP_B_USMC_MARSOC_TC_DA","CUP_B_USMC_MARSOC_OC_DA","CUP_B_USMC_MARSOC_CC_DA","CUP_B_USMC_MARSOC_EL_DA","CUP_B_USMC_MARSOC_AR_DA","CUP_B_USMC_MARSOC_Marksman_DA","CUP_B_USMC_MARSOC_Medic_DA","CUP_B_USMC_MARSOC_DA","CUP_B_USMC_MARSOC_EL_DA","CUP_B_USMC_MARSOC_DA","CUP_B_USMC_MARSOC_DA","CUP_B_USMC_MARSOC_DA","CUP_B_USMC_MARSOC_Medic_DA"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0],[11,-5,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
			// configName CUP_B_USMC_FireTeam_MARSOC_DA
			[[[["CUP_B_USMC_MARSOC_EL_DA","CUP_B_USMC_MARSOC_DA","CUP_B_USMC_MARSOC_DA","CUP_B_USMC_MARSOC_AR_DA","CUP_B_USMC_MARSOC_Medic_DA"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
			// configName CUP_B_USMC_FireTeam_MARSOC_HQ_DA
			[[[["CUP_B_USMC_MARSOC_TL_DA","CUP_B_USMC_MARSOC_TC_DA","CUP_B_USMC_MARSOC_OC_DA","CUP_B_USMC_MARSOC_CC_DA"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL"]]],0.1],

			// configName CUP_B_USMC_MotInfSquad
			[[[["CUP_B_USMC_Soldier_SL","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier","CUP_RG31E_M2","CUP_RG31_Mk19"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0],[-5,0,0],[-5,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","SERGEANT"]]],0.2],
			// configName CUP_B_USMC_MotInfSection
			[[[["CUP_B_USMC_Soldier_TL","CUP_B_HMMWV_M2_USMC","CUP_B_HMMWV_MK19_USMC","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_USMC_MotInfSection_AT
			[[[["CUP_B_USMC_Soldier_TL","CUP_B_HMMWV_TOW_USMC","CUP_B_HMMWV_TOW_USMC","CUP_B_USMC_Soldier_AR"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],["SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.15],
			// configName CUP_B_USMC_MechInfSquad
			[[[["CUP_B_USMC_Soldier_SL","CUP_B_AAV_USMC","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.9],
			// configName CUP_B_USMC_MechReconSection
			[[[["CUP_B_USMC_Soldier_TL","CUP_B_LAV25_USMC","CUP_B_USMC_Soldier_MG","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_B_USMC_TankPlatoon
			[[[["CUP_B_M1A2_TUSK_MG_USMC","CUP_B_M1A2_TUSK_MG_USMC","CUP_B_M1A2_TUSK_MG_USMC","CUP_B_M1A2_TUSK_MG_USMC"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.5],

			// configName CUP_B_USMC_InfSquad
			[[[["CUP_B_USMC_Soldier_SL","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_B_USMC_FireTeam
			[[[["CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.05],
			// configName CUP_B_USMC_FireTeam_MG
			[[[["CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_MG","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_USMC_FireTeam_AT
			[[[["CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_LAT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_USMC_FireTeam_Support
			[[[["CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.05],
			// configName CUP_B_USMC_HeavyATTeam
			[[[["CUP_B_USMC_Soldier_HAT","CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_LAT"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.15],

			// configName CUP_B_USMC_SniperTeam
			[[[["CUP_B_USMC_Sniper_M40A3","CUP_B_USMC_Spotter"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
			// configName CUP_B_USMC_FRTeam
			[[[["CUP_B_FR_Soldier_TL","CUP_B_FR_Soldier_AR","CUP_B_FR_Soldier_GL","CUP_B_FR_Soldier_Marksman","CUP_B_FR_Saboteur","CUP_B_FR_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.01],
			// configName CUP_B_USMC_FRTeam_DA
			[[[["CUP_B_FR_Soldier_Assault_GL","CUP_B_FR_Soldier_Assault_GL","CUP_B_FR_Soldier_Assault","CUP_B_FR_Soldier_Assault","CUP_B_FR_Soldier_Assault","CUP_B_FR_Soldier_Assault"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.01]
			// configName CUP_B_USMC_FRTeam_Razor
			//[[[["CUP_B_FR_Story_Miles","CUP_B_FR_Story_Cooper","CUP_B_FR_Story_Sykes","CUP_B_FR_Story_Rodriguez","CUP_B_FR_Story_OHara"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0]
		];
	};
	if (_tmp > 0 or (_tmp == -1 && (_n < 150 or _n > 250))) then {
		_west=_west+[
			// configName CUP_B_USMC_InfSquad_DES
			[[[["CUP_B_USMC_Soldier_SL_des","CUP_B_USMC_Soldier_TL_des","CUP_B_USMC_Soldier_AR_des","CUP_B_USMC_Soldier_LAT_des","CUP_B_USMC_Soldier_des","CUP_B_USMC_Soldier_TL_des","CUP_B_USMC_Soldier_AR_des","CUP_B_USMC_Soldier_LAT_des","CUP_B_USMC_Soldier_des","CUP_B_USMC_Soldier_TL_des","CUP_B_USMC_Soldier_AR_des","CUP_B_USMC_Soldier_LAT_des","CUP_B_USMC_Soldier_des"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_B_USMC_FireTeam_DES
			[[[["CUP_B_USMC_Soldier_TL_des","CUP_B_USMC_Soldier_AR_des","CUP_B_USMC_Soldier_LAT_des","CUP_B_USMC_Soldier_des"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.05],
			// configName CUP_B_USMC_FireTeam_MG_DES
			[[[["CUP_B_USMC_Soldier_TL_des","CUP_B_USMC_Soldier_MG_des","CUP_B_USMC_Soldier_AR_des","CUP_B_USMC_Soldier_LAT_des"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_USMC_FireTeam_AT_DES
			[[[["CUP_B_USMC_Soldier_TL_des","CUP_B_USMC_Soldier_AR_des","CUP_B_USMC_Soldier_AT_des","CUP_B_USMC_Soldier_LAT_des"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_USMC_FireTeam_Support_DES
			[[[["CUP_B_USMC_Soldier_TL_des","CUP_B_USMC_Soldier_AR_des","CUP_B_USMC_Soldier_LAT_des","CUP_B_USMC_Medic_des"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.05],
			// configName CUP_B_USMC_HeavyATTeam_DES
			[[[["CUP_B_USMC_Soldier_HAT_des","CUP_B_USMC_Soldier_AT_des","CUP_B_USMC_Soldier_LAT_des"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.15],

			// configName CUP_B_USMC_SniperTeam_DES
			[[[["CUP_B_USMC_Sniper_M40A3_des","CUP_B_USMC_Spotter_des"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
			// configName CUP_B_USMC_FRTeam_DA_Desert
			[[[["CUP_B_FR_Soldier_Assault_GL_DES","CUP_B_FR_Soldier_Assault_GL_DES","CUP_B_FR_Soldier_Assault_DES","CUP_B_FR_Soldier_Assault_DES","CUP_B_FR_Soldier_Assault_DES","CUP_B_FR_Soldier_Assault_DES"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.01],
			// configName CUP_B_USMC_FRTeam_Desert
			[[[["CUP_B_FR_Soldier_TL_DES","CUP_B_FR_Soldier_AR_DES","CUP_B_FR_Soldier_GL_DES","CUP_B_FR_Soldier_Marksman_DES","CUP_B_FR_Saboteur_DES","CUP_B_FR_Medic_DES"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.01],
			// configName CUP_B_USMC_FRTeam_Razor_Desert
			//[[[["CUP_B_FR_Story_Miles_DES","CUP_B_FR_Story_Cooper_DES","CUP_B_FR_Story_Sykes_DES","CUP_B_FR_Story_Rodriguez_DES","CUP_B_FR_Story_OHara_DES"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0],

			// configName CUP_B_USMC_InfSquad_FROG_DES
			[[[["CUP_B_USMC_Soldier_SL_FROG_DES","CUP_B_USMC_Soldier_TL_FROG_DES","CUP_B_USMC_Soldier_AR_FROG_DES","CUP_B_USMC_Soldier_LAT_FROG_DES","CUP_B_USMC_Soldier_FROG_DES","CUP_B_USMC_Soldier_TL_FROG_DES","CUP_B_USMC_Soldier_AR_FROG_DES","CUP_B_USMC_Soldier_LAT_FROG_DES","CUP_B_USMC_Soldier_FROG_DES","CUP_B_USMC_Soldier_TL_FROG_DES","CUP_B_USMC_Soldier_AR_FROG_DES","CUP_B_USMC_Soldier_LAT_FROG_DES","CUP_B_USMC_Soldier_FROG_DES"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[12,0,0],[14,0,0],[16,0,0],[18,0,0],[3,-5,0],[5,-5,0],[7,-5,0],[9,-5,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_B_USMC_FireTeam_FROG_DES
			[[[["CUP_B_USMC_Soldier_TL_FROG_DES","CUP_B_USMC_Soldier_AR_FROG_DES","CUP_B_USMC_Soldier_LAT_FROG_DES","CUP_B_USMC_Soldier_FROG_DES"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.05],
			// configName CUP_B_USMC_FireTeam_MG_FROG_DES
			[[[["CUP_B_USMC_Soldier_TL_FROG_DES","CUP_B_USMC_Soldier_MG_FROG_DES","CUP_B_USMC_Soldier_AR_FROG_DES","CUP_B_USMC_Soldier_LAT_FROG_DES"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_USMC_FireTeam_AT_FROG_DES
			[[[["CUP_B_USMC_Soldier_TL_FROG_DES","CUP_B_USMC_Soldier_AR_FROG_DES","CUP_B_USMC_Soldier_AT_FROG_DES","CUP_B_USMC_Soldier_LAT_FROG_DES"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_USMC_FireTeam_Support_FROG_DES
			[[[["CUP_B_USMC_Soldier_TL_FROG_DES","CUP_B_USMC_Soldier_AR_FROG_DES","CUP_B_USMC_Soldier_LAT_FROG_DES","CUP_B_USMC_Medic_FROG_DES"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.05],
			// configName CUP_B_USMC_HeavyATTeam_FROG_DES
			[[[["CUP_B_USMC_Soldier_HAT_FROG_DES","CUP_B_USMC_Soldier_AT_FROG_DES","CUP_B_USMC_Soldier_LAT_FROG_DES"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.15]
		];
	};
};

//-- CUP_I_NAPA
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"CUP_I_NAPA");
if (_tmp > 0 or (_tmp == -1 && _d >= 1980)) then {
	if (_tmp > 0 or _n <= 250) then {
	_guer append [
		// configName CUP_I_NAPA_MechInfSection
		[[[["CUP_I_GUE_Soldier_AR","CUP_I_BRDM2_NAPA","CUP_I_GUE_Soldier_GL","CUP_I_GUE_Soldier_AKSU"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],
		0.1],
		// configName CUP_I_NAPA_MechInfSquad
		[[[["CUP_I_GUE_Commander",
		"CUP_I_BMP2_NAPA","CUP_I_GUE_Soldier_MG",
		"CUP_I_GUE_Soldier_GL","CUP_I_GUE_Soldier_AKS74",
		"CUP_I_GUE_Soldier_AR","CUP_I_GUE_Sniper",
		"CUP_I_GUE_Soldier_AT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],
		0.05],
		// configName CUP_I_NAPA_TankSection
		[[[["CUP_I_T72_NAPA","CUP_I_T72_NAPA"],[[0,10,0],[5,0,0]],["SERGEANT","CORPORAL"]]],0.01],
		// configName CUP_I_NAPA_T55Section
		[[[["CUP_I_T55_NAPA","CUP_I_T55_NAPA"],[[0,10,0],[5,0,0]],["SERGEANT","CORPORAL"]]],0.01],

		// configName CUP_I_NAPA_InfSquad
		[[[["CUP_I_GUE_Commander",
		"CUP_I_GUE_Soldier_GL","CUP_I_GUE_Soldier_AR",
		"CUP_I_GUE_Soldier_AKSU","CUP_I_GUE_Soldier_AKS74",
		"CUP_I_GUE_Soldier_GL","CUP_I_GUE_Soldier_AKM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
		// configName CUP_I_NAPA_InfSquad_Assault
		[[[["CUP_I_GUE_Commander",
		"CUP_I_GUE_Soldier_GL","CUP_I_GUE_Soldier_MG",
		"CUP_I_GUE_Soldier_AT","CUP_I_GUE_Soldier_AR",
		"CUP_I_GUE_Soldier_MG","CUP_I_GUE_Soldier_AT",
		"CUP_I_GUE_Soldier_AKM","CUP_I_GUE_Soldier_AKSU"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
		// configName CUP_I_NAPA_InfSquad_Weapons
		[[[["CUP_I_GUE_Soldier_AKM",
		"CUP_I_GUE_Soldier_MG","CUP_I_GUE_Soldier_AT",
		"CUP_I_GUE_Soldier_MG","CUP_I_GUE_Soldier_GL",
		"CUP_I_GUE_Soldier_AT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.9],
		// configName CUP_I_NAPA_InfTeam_1
		[[[["CUP_I_GUE_Soldier_AKM","CUP_I_GUE_Soldier_MG","CUP_I_GUE_Soldier_AT","CUP_I_GUE_Soldier_GL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],1],
		// configName CUP_I_NAPA_InfTeam_2
		[[[["CUP_I_GUE_Soldier_AKSU","CUP_I_GUE_Soldier_AR","CUP_I_GUE_Soldier_GL","CUP_I_GUE_Soldier_AKM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],1],
		// configName CUP_I_NAPA_InfTeam_AT
		[[[["CUP_I_GUE_Soldier_AT","CUP_I_GUE_Soldier_AT","CUP_I_GUE_Soldier_AR"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.8],
		// configName CUP_I_NAPA_GrpInf_TeamAA
		[[[["CUP_I_GUE_Commander","CUP_I_GUE_Soldier_AA","CUP_I_GUE_Soldier_AA","CUP_I_GUE_Soldier_AR"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],

		// configName CUP_I_NAPA_GrpInf_TeamSniper
		[[[["CUP_I_GUE_Sniper","CUP_I_GUE_Soldier_Scout"],[[0,5,0],[3,0,0]],["SERGEANT","CORPORAL"]]],0.8],
		// configName CUP_I_NAPA_GrpInf_Militia
		[[[["CUP_I_GUE_Local",
		"CUP_I_GUE_Forester","CUP_I_GUE_Farmer",
		"CUP_I_GUE_Gamekeeper","CUP_I_GUE_Woodman",
		"CUP_I_GUE_Villager"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5]
	];
	};
};
