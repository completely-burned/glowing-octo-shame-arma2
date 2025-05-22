/*
 * Отряды из CUP
 * TODO: Назначить командира.
 * TODO: Из MTLB плохой боец, его нужно попробовать разместить в конце отряда чтобы он не бросался в атаку первым.
 * TODO: SLA
	//CUP_B_LCU1600_USMC
	//CUP_B_MK10_GB
 */

#include "..\include\ranks.sqf"

//-- CUP_O_RU
	// EMR, VDV, VDV_EMR, M_EMR_V2
	// Ratnik_Summer, Ratnik_Autumn, Ratnik_Winter, Ratnik_BeigeDigital, Ratnik_Desert
	// RUS_SpecOps, MVD
	// Default
	// TODO: Добавить недостающие камуфляжи.
	// TODO: Отделить современную от других.

	// _Ratnik_Summer
	_arr = [
		// TODO: "CUP_O_Kamaz_6396_transport_RUS_M"
		// configName CUP_O_RU_MotInfSquad
		[[[["CUP_O_RU_Soldier_SL_Ratnik_Summer",
		"CUP_O_Kamaz_6396_covered_RUS_M","CUP_O_RU_Soldier_MG_Ratnik_Summer",
		"CUP_O_RU_Soldier_AT_Ratnik_Summer","CUP_O_RU_Soldier_LAT_Ratnik_Summer",
		"CUP_O_RU_Soldier_GL_Ratnik_Summer","CUP_O_RU_Soldier_Marksman_Ratnik_Summer",
		"CUP_O_RU_Soldier_MG_Ratnik_Summer","CUP_O_RU_Soldier_LAT_Ratnik_Summer",
		"CUP_O_RU_Soldier_AR_Ratnik_Summer","CUP_O_RU_Soldier_AT_Ratnik_Summer",
		"CUP_O_RU_Soldier_GL_Ratnik_Summer","CUP_O_RU_Soldier_Ratnik_Summer"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
		["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],0]],0.5],
		// configName CUP_O_RU_MechInfSquad_2
		[[[["CUP_O_RU_Soldier_SL_Ratnik_Summer",
		"CUP_O_BTR80A_GREEN_RU","CUP_O_RU_Soldier_MG_Ratnik_Summer",
		"CUP_O_RU_Soldier_MG_Ratnik_Summer","CUP_O_RU_Soldier_AT_Ratnik_Summer",
		"CUP_O_RU_Soldier_LAT_Ratnik_Summer","CUP_O_RU_Soldier_GL_Ratnik_Summer"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],
		["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[],0]],0.5],

		// configName CUP_O_RU_TankPlatoon
		[[[["CUP_O_T90M_RU","CUP_O_T90M_RU","CUP_O_T90M_RU"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT"]]],0.5],

		// configName CUP_O_RU_Mi24VSquadron
		[[[["CUP_O_Mi24_V_RU","CUP_O_Mi24_V_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_O_RU_Mi24PSquadron
		[[[["CUP_O_Mi24_P_RU","CUP_O_Mi24_P_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_O_RU_Mi8Squadron
		[[[["CUP_O_Mi8_RU","CUP_O_Mi8_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.1],
		// configName CUP_O_RU_Su34FighterSquadron
		[[[["CUP_O_SU34_AGM_RU","CUP_O_SU34_AGM_RU"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.2],

			// configName InfSquad
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Summer",
			"CUP_O_RU_Soldier_Ratnik_Summer","CUP_O_RU_Soldier_LAT_Ratnik_Summer",
			"CUP_O_RU_Soldier_MG_Ratnik_Summer","CUP_O_RU_Soldier_TL_Ratnik_Summer",
			"CUP_O_RU_Soldier_AR_Ratnik_Summer","CUP_O_RU_Soldier_A_Ratnik_Summer",
			"CUP_O_RU_Soldier_Medic_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
			// configName InfSquad_Weapons
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Summer",
			"CUP_O_RU_Soldier_AR_Ratnik_Summer","CUP_O_RU_Soldier_GL_Ratnik_Summer",
			"CUP_O_RU_Soldier_MG_Ratnik_Summer","CUP_O_RU_Soldier_AT_Ratnik_Summer",
			"CUP_O_RU_Soldier_AAT_Ratnik_Summer","CUP_O_RU_Soldier_A_Ratnik_Summer",
			"CUP_O_RU_Soldier_Medic_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],1],
			// configName InfTeam
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Summer","CUP_O_RU_Soldier_AR_Ratnik_Summer","CUP_O_RU_Soldier_GL_Ratnik_Summer","CUP_O_RU_Soldier_LAT_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
			// configName InfTeam_AT
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Summer","CUP_O_RU_Soldier_AT_Ratnik_Summer","CUP_O_RU_Soldier_AT_Ratnik_Summer","CUP_O_RU_Soldier_AAT_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
			// configName InfTeam_AA
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Summer","CUP_O_RU_Soldier_AA_Ratnik_Summer","CUP_O_RU_Soldier_AA_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
			// configName InfSentry
			[[[["CUP_O_RU_Soldier_GL_Ratnik_Summer","CUP_O_RU_Soldier_Ratnik_Summer"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0.1],
			// configName reconTeam
			[[[["CUP_O_RU_Recon_TL_Ratnik_Summer",
			"CUP_O_RU_Recon_Marksman_Ratnik_Summer","CUP_O_RU_Recon_Medic_Ratnik_Summer",
			"CUP_O_RU_Recon_LAT_Ratnik_Summer","CUP_O_RU_Recon_Ratnik_Summer",
			"CUP_O_RU_Recon_Exp_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName reconSentry
			[[[["CUP_O_RU_Recon_Marksman_Ratnik_Summer","CUP_O_RU_Recon_Ratnik_Summer"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
			// configName InfAssault
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Summer",
			"CUP_O_RU_Soldier_AR_Ratnik_Summer","CUP_O_RU_Soldier_MG_Ratnik_Summer",
			"CUP_O_RU_Soldier_AAR_Ratnik_Summer","CUP_O_RU_Soldier_Marksman_Ratnik_Summer",
			"CUP_O_RU_Soldier_AT_Ratnik_Summer","CUP_O_RU_Soldier_AAT_Ratnik_Summer",
			"CUP_O_RU_Soldier_Medic_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],1],
			// configName O_InfTeam_AT_Heavy
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Summer","CUP_O_RU_Soldier_HAT_Ratnik_Summer","CUP_O_RU_Soldier_HAT_Ratnik_Summer","CUP_O_RU_Soldier_AHAT_Ratnik_Summer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1]
	];
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_O_ZUBR_RU"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	[_groups_map, east, "CUP_O_RUS_M", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[2020,2100], [160,249],
		["CUP_O_RU"]
	] call gosa_fnc_map_groups_add;

	/*
	_arr = [
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
			[[[["CUP_O_RU_Soldier_TL_Ratnik_BeigeDigital","CUP_O_RU_Soldier_HAT_Ratnik_BeigeDigital","CUP_O_RU_Soldier_HAT_Ratnik_BeigeDigital","CUP_O_RU_Soldier_AHAT_Ratnik_BeigeDigital"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0]
	];
	[_groups_map, east, "CUP_O_RUS_M", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [160,274],
		["CUP_O_RU"]
	] call gosa_fnc_map_groups_add;
	*/

	// _VKPO_Desert
	_arr = [
		// configName CUP_O_RU_MotInfSquad
		[[[["CUP_O_RU_Soldier_SL_VKPO_Desert",
		"CUP_O_Kamaz_6396_covered_RUS_M","CUP_O_RU_Soldier_MG_VKPO_Desert",
		"CUP_O_RU_Soldier_AT_VKPO_Desert","CUP_O_RU_Soldier_LAT_VKPO_Desert",
		"CUP_O_RU_Soldier_GL_VKPO_Desert","CUP_O_RU_Soldier_Marksman_VKPO_Desert",
		"CUP_O_RU_Soldier_MG_VKPO_Desert","CUP_O_RU_Soldier_LAT_VKPO_Desert",
		"CUP_O_RU_Soldier_AR_VKPO_Desert","CUP_O_RU_Soldier_AT_VKPO_Desert",
		"CUP_O_RU_Soldier_GL_VKPO_Desert","CUP_O_RU_Soldier_VKPO_Desert"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],0]],0.5],
		// configName CUP_O_RU_MechInfSquad_2
		[[[["CUP_O_RU_Soldier_SL_VKPO_Desert",
		"CUP_O_BTR80A_DESERT_RU","CUP_O_RU_Soldier_MG_VKPO_Desert",
		"CUP_O_RU_Soldier_MG_VKPO_Desert","CUP_O_RU_Soldier_AT_VKPO_Desert",
		"CUP_O_RU_Soldier_LAT_VKPO_Desert","CUP_O_RU_Soldier_GL_VKPO_Desert"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[],0]],0.5],

		// configName CUP_O_RU_TankPlatoon
		[[[["CUP_O_T90M_CAMO_RU","CUP_O_T90M_CAMO_RU","CUP_O_T90M_CAMO_RU"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT"]]],0.5],

		// configName CUP_O_RU_Mi24VSquadron
		[[[["CUP_O_Mi24_V_RU","CUP_O_Mi24_V_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_O_RU_Mi24PSquadron
		[[[["CUP_O_Mi24_P_RU","CUP_O_Mi24_P_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_O_RU_Mi8Squadron
		[[[["CUP_O_Mi8_RU","CUP_O_Mi8_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.1],
		// configName CUP_O_RU_Su34FighterSquadron
		[[[["CUP_O_SU34_AGM_RU","CUP_O_SU34_AGM_RU"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.2],

		// InfSquad
		[[[["CUP_O_RUS_M_Soldier_SL_VKPO_Desert","CUP_O_RUS_M_Soldier_VKPO_Desert","CUP_O_RUS_M_Soldier_LAT_VKPO_Desert","CUP_O_RUS_M_Soldier_MG_VKPO_Desert","CUP_O_RUS_M_Soldier_TL_VKPO_Desert","CUP_O_RUS_M_Soldier_AR_VKPO_Desert","CUP_O_RUS_M_Soldier_A_VKPO_Desert","CUP_O_RUS_M_Soldier_Medic_VKPO_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
		// InfSquad_Weapons
		[[[["CUP_O_RUS_M_Soldier_SL_VKPO_Desert","CUP_O_RUS_M_Soldier_AR_VKPO_Desert","CUP_O_RUS_M_Soldier_GL_VKPO_Desert","CUP_O_RUS_M_Soldier_MG_VKPO_Desert","CUP_O_RUS_M_Soldier_AT_VKPO_Desert","CUP_O_RUS_M_Soldier_AAT_VKPO_Desert","CUP_O_RUS_M_Soldier_A_VKPO_Desert","CUP_O_RUS_M_Soldier_Medic_VKPO_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],1],
		// InfTeam
		[[[["CUP_O_RUS_M_Soldier_TL_VKPO_Desert","CUP_O_RUS_M_Soldier_AR_VKPO_Desert","CUP_O_RUS_M_Soldier_GL_VKPO_Desert","CUP_O_RUS_M_Soldier_LAT_VKPO_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
		// InfTeam_AT
		[[[["CUP_O_RUS_M_Soldier_TL_VKPO_Desert","CUP_O_RUS_M_Soldier_AT_VKPO_Desert","CUP_O_RUS_M_Soldier_AT_VKPO_Desert","CUP_O_RUS_M_Soldier_AAT_VKPO_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
		// InfTeam_AA
		[[[["CUP_O_RUS_M_Soldier_TL_VKPO_Desert","CUP_O_RUS_M_Soldier_AA_VKPO_Desert","CUP_O_RUS_M_Soldier_AA_VKPO_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
		// InfSentry
		[[[["CUP_O_RUS_M_Soldier_GL_VKPO_Desert","CUP_O_RUS_M_Soldier_VKPO_Desert"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0.1],
		// InfAssault
		[[[["CUP_O_RUS_M_Soldier_SL_VKPO_Desert","CUP_O_RUS_M_Soldier_AR_VKPO_Desert","CUP_O_RUS_M_Soldier_MG_VKPO_Desert","CUP_O_RUS_M_Soldier_AAR_VKPO_Desert","CUP_O_RUS_M_Soldier_Marksman_VKPO_Desert","CUP_O_RUS_M_Soldier_AT_VKPO_Desert","CUP_O_RUS_M_Soldier_AAT_VKPO_Desert","CUP_O_RUS_M_Soldier_Medic_VKPO_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],1],
		// O_InfTeam_AT_Heavy
		[[[["CUP_O_RUS_M_Soldier_TL_VKPO_Desert","CUP_O_RUS_M_Soldier_HAT_VKPO_Desert","CUP_O_RUS_M_Soldier_HAT_VKPO_Desert","CUP_O_RUS_M_Soldier_AHAT_VKPO_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1]
	];
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_O_ZUBR_RU"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	[_groups_map, east, "CUP_O_RUS_M", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[2020,2100], [275,299],
		["CUP_O_RU"]
	] call gosa_fnc_map_groups_add;

	// _Ratnik_Desert
	_arr = [
		// TODO: "CUP_O_Kamaz_6396_transport_RUS_M"
		// configName CUP_O_RU_MotInfSquad
		[[[["CUP_O_RU_Soldier_SL_Ratnik_Desert",
		"CUP_O_Kamaz_6396_covered_RUS_M","CUP_O_RU_Soldier_MG_Ratnik_Desert",
		"CUP_O_RU_Soldier_AT_Ratnik_Desert","CUP_O_RU_Soldier_LAT_Ratnik_Desert",
		"CUP_O_RU_Soldier_GL_Ratnik_Desert","CUP_O_RU_Soldier_Marksman_Ratnik_Desert",
		"CUP_O_RU_Soldier_MG_Ratnik_Desert","CUP_O_RU_Soldier_LAT_Ratnik_Desert",
		"CUP_O_RU_Soldier_AR_Ratnik_Desert","CUP_O_RU_Soldier_AT_Ratnik_Desert",
		"CUP_O_RU_Soldier_GL_Ratnik_Desert","CUP_O_RU_Soldier_Ratnik_Desert"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],0]],0.5],
		// configName CUP_O_RU_MechInfSquad_2
		[[[["CUP_O_RU_Soldier_SL_Ratnik_Desert",
		"CUP_O_BTR80A_DESERT_RU","CUP_O_RU_Soldier_MG_Ratnik_Desert",
		"CUP_O_RU_Soldier_MG_Ratnik_Desert","CUP_O_RU_Soldier_AT_Ratnik_Desert",
		"CUP_O_RU_Soldier_LAT_Ratnik_Desert","CUP_O_RU_Soldier_GL_Ratnik_Desert"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[],0]],0.5],

		// configName CUP_O_RU_TankPlatoon
		[[[["CUP_O_T90M_DESERT_RU","CUP_O_T90M_DESERT_RU","CUP_O_T90M_DESERT_RU"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT"]]],0.5],

		// configName CUP_O_RU_Mi24VSquadron
		[[[["CUP_O_Mi24_V_RU","CUP_O_Mi24_V_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_O_RU_Mi24PSquadron
		[[[["CUP_O_Mi24_P_RU","CUP_O_Mi24_P_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_O_RU_Mi8Squadron
		[[[["CUP_O_Mi8_RU","CUP_O_Mi8_RU"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.1],
		// configName CUP_O_RU_Su34FighterSquadron
		[[[["CUP_O_SU34_AGM_RU","CUP_O_SU34_AGM_RU"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.2],

			// configName InfSquad
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Desert",
			"CUP_O_RU_Soldier_Ratnik_Desert","CUP_O_RU_Soldier_LAT_Ratnik_Desert",
			"CUP_O_RU_Soldier_MG_Ratnik_Desert","CUP_O_RU_Soldier_TL_Ratnik_Desert",
			"CUP_O_RU_Soldier_AR_Ratnik_Desert","CUP_O_RU_Soldier_A_Ratnik_Desert",
			"CUP_O_RU_Soldier_Medic_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName InfSquad_Weapons
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Desert",
			"CUP_O_RU_Soldier_AR_Ratnik_Desert","CUP_O_RU_Soldier_GL_Ratnik_Desert",
			"CUP_O_RU_Soldier_MG_Ratnik_Desert","CUP_O_RU_Soldier_AT_Ratnik_Desert",
			"CUP_O_RU_Soldier_AAT_Ratnik_Desert","CUP_O_RU_Soldier_A_Ratnik_Desert",
			"CUP_O_RU_Soldier_Medic_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName InfTeam
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Desert","CUP_O_RU_Soldier_AR_Ratnik_Desert","CUP_O_RU_Soldier_GL_Ratnik_Desert","CUP_O_RU_Soldier_LAT_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName InfTeam_AT
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Desert","CUP_O_RU_Soldier_AT_Ratnik_Desert","CUP_O_RU_Soldier_AT_Ratnik_Desert","CUP_O_RU_Soldier_AAT_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName InfTeam_AA
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Desert","CUP_O_RU_Soldier_AA_Ratnik_Desert","CUP_O_RU_Soldier_AA_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
			// configName InfSentry
			[[[["CUP_O_RU_Soldier_GL_Ratnik_Desert","CUP_O_RU_Soldier_Ratnik_Desert"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0.1],
			// configName reconTeam
			[[[["CUP_O_RU_Recon_TL_Ratnik_Desert",
			"CUP_O_RU_Recon_Marksman_Ratnik_Desert","CUP_O_RU_Recon_Medic_Ratnik_Desert",
			"CUP_O_RU_Recon_LAT_Ratnik_Desert","CUP_O_RU_Recon_Ratnik_Desert",
			"CUP_O_RU_Recon_Exp_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
			// configName reconSentry
			[[[["CUP_O_RU_Recon_Marksman_Ratnik_Desert","CUP_O_RU_Recon_Ratnik_Desert"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
			// configName InfAssault
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Desert",
			"CUP_O_RU_Soldier_AR_Ratnik_Desert","CUP_O_RU_Soldier_MG_Ratnik_Desert",
			"CUP_O_RU_Soldier_AAR_Ratnik_Desert","CUP_O_RU_Soldier_Marksman_Ratnik_Desert",
			"CUP_O_RU_Soldier_AT_Ratnik_Desert","CUP_O_RU_Soldier_AAT_Ratnik_Desert",
			"CUP_O_RU_Soldier_Medic_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName O_InfTeam_AT_Heavy
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Desert","CUP_O_RU_Soldier_HAT_Ratnik_Desert","CUP_O_RU_Soldier_HAT_Ratnik_Desert","CUP_O_RU_Soldier_AHAT_Ratnik_Desert"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5]
	];
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_O_ZUBR_RU"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	[_groups_map, east, "CUP_O_RUS_M", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[2020,2100], [300,999],
		["CUP_O_RU"]
	] call gosa_fnc_map_groups_add;

	// Winter
	/* TODO:
		CUP_O_Tigr_233014_WINTER_PK_RU
		CUP_O_Tigr_M_233114_WINTER_KORD_RU
		CUP_O_Tigr_M_233114_WINTER_PK_RU
		CUP_O_Tigr_M_233114_WINTER_RU
	*/
	_arr = [
		// User
			// CUP_O_Tigr_M_233114_WINTER_RU
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Winter","CUP_O_Tigr_M_233114_WINTER_RU",
				"CUP_O_RU_Soldier_MG_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter",
				"CUP_O_RU_Soldier_Marksman_Ratnik_Winter","CUP_O_RU_Soldier_GL_Ratnik_Winter",
				"CUP_O_RU_Soldier_MG_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
				["SERGEANT","PRIVATE",
				"SERGEANT","SERGEANT",
				"PRIVATE","CORPORAL",
				"PRIVATE","PRIVATE"]]],0.05],

			// CUP_O_Tigr_233014_WINTER_RU
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Winter","CUP_O_Tigr_233014_WINTER_RU",
				"CUP_O_RU_Soldier_AR_Ratnik_Winter","CUP_O_RU_Soldier_LAT_Ratnik_Winter",
				"CUP_O_RU_Soldier_GL_Ratnik_Winter","CUP_O_RU_Soldier_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
				["SERGEANT","PRIVATE",
				"PRIVATE","PRIVATE",
				"CORPORAL","PRIVATE"]]],0.05],
			// CUP_O_Tigr_233014_WINTER_RU AT
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Winter","CUP_O_Tigr_233014_WINTER_RU",
				"CUP_O_RU_Soldier_HAT_Ratnik_Winter","CUP_O_RU_Soldier_HAT_Ratnik_Winter",
				"CUP_O_RU_Soldier_AT_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter",
				"CUP_O_RU_Soldier_AHAT_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
				["SERGEANT","PRIVATE",
				"CORPORAL","CORPORAL",
				"PRIVATE","PRIVATE",
				"PRIVATE"]]],0.05],
			// CUP_O_Tigr_233014_WINTER_RU AA
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Winter","CUP_O_Tigr_233014_WINTER_RU",
				"CUP_O_RU_Soldier_AA_Ratnik_Winter","CUP_O_RU_Soldier_AA_Ratnik_Winter",
				"CUP_O_RU_Soldier_AA_Ratnik_Winter","CUP_O_RU_Soldier_AAA_Ratnik_Winter",
				"CUP_O_RU_Soldier_AAA_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
				["SERGEANT","PRIVATE",
				"CORPORAL","CORPORAL",
				"PRIVATE","PRIVATE",
				"PRIVATE"]]],0.05],
			// CUP_O_Tigr_233014_WINTER_RU MG
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Winter","CUP_O_Tigr_233014_WINTER_RU",
				"CUP_O_RU_Soldier_MG_Ratnik_Winter","CUP_O_RU_Soldier_MG_Ratnik_Winter",
				"CUP_O_RU_Soldier_GL_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
				["SERGEANT","PRIVATE",
				"CORPORAL","CORPORAL",
				"PRIVATE","PRIVATE"]]],0.05],

			// CUP_O_Tigr_233011_WINTER_RU
			[[[["CUP_O_RU_Soldier_TL_Ratnik_Winter","CUP_O_Tigr_233011_WINTER_RU",
				"CUP_O_RU_Soldier_Medic_Ratnik_Winter","CUP_O_RU_Soldier_LAT_Ratnik_Winter",
				"CUP_O_RU_Soldier_AR_Ratnik_Winter","CUP_O_RU_Soldier_GL_Ratnik_Winter",
				"CUP_O_RU_Soldier_Marksman_Ratnik_Winter","CUP_O_RU_Soldier_LAT_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,-5,0],[21,-5,0],[23,-5,0]],
				["SERGEANT","PRIVATE",
				"PRIVATE","CORPORAL",
				"CORPORAL","CORPORAL",
				"PRIVATE","PRIVATE"]]],0.05],

			// CUP_O_T90M_WINTER_RU
			[[[["CUP_O_T90M_WINTER_RU","CUP_O_T90M_WINTER_RU","CUP_O_T90M_WINTER_RU"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.6],
			// CUP_O_BTR60_Winter_RU
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Winter",
			"CUP_O_BTR60_Winter_RU","CUP_O_RU_Soldier_Ratnik_Winter",
			"CUP_O_RU_Soldier_MG_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter",
			"CUP_O_RU_Soldier_LAT_Ratnik_Winter","CUP_O_RU_Soldier_GL_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.01],
			// CUP_O_BTR80_WINTER_RU
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Winter",
			"CUP_O_BTR80_WINTER_RU","CUP_O_RU_Soldier_Ratnik_Winter",
			"CUP_O_RU_Soldier_MG_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter",
			"CUP_O_RU_Soldier_LAT_Ratnik_Winter","CUP_O_RU_Soldier_GL_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
			// CUP_O_BTR80A_WINTER_RU
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Winter",
			"CUP_O_BTR80A_WINTER_RU","CUP_O_RU_Soldier_Ratnik_Winter",
			"CUP_O_RU_Soldier_MG_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter",
			"CUP_O_RU_Soldier_LAT_Ratnik_Winter","CUP_O_RU_Soldier_GL_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
			// CUP_O_MTLB_pk_Winter_RU
			[[[["CUP_O_RU_Soldier_SL_Ratnik_Winter","CUP_O_MTLB_pk_Winter_RU",
				"CUP_O_RU_Soldier_AR_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter",
				"CUP_O_RU_Soldier_Marksman_Ratnik_Winter","CUP_O_RU_Soldier_GL_Ratnik_Winter",
				"CUP_O_RU_Soldier_MG_Ratnik_Winter","CUP_O_RU_Soldier_AT_Ratnik_Winter",
				"CUP_O_RU_Soldier_A_Ratnik_Winter","CUP_O_RU_Soldier_AAT_Ratnik_Winter"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
				["LIEUTENANT","SERGEANT",
				"PRIVATE","CORPORAL",
				"PRIVATE","SERGEANT",
				"PRIVATE","PRIVATE",
				"CORPORAL","PRIVATE"]]],0.01],

		// cfgGroups
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
	
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_O_ZUBR_RU"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	[_groups_map, east, "CUP_O_RUS_M", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[2020,2100], [-999,159],
		["CUP_O_RU"]
	] call gosa_fnc_map_groups_add;

	_arr = [
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

		// EMR похож на камуфляж РФ из A2.
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
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_O_ZUBR_RU"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	[_groups_map, east, "CUP_O_RU", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [160,274],
		["OPF_G_F","OPF_F","OPF_T_F","OPF_R_F","OPF_SFIA_lxWS","OPF_TURA_lxWS","CUP_O_RUS_M"]
	] call gosa_fnc_map_groups_add;

	/*
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

		// VDV под бронёй более сухой-осенний чем EMR, а броня на EMR.
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

		// VDV_EMR под бронёй похож на ратник, а броня на EMR.
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
	*/

	if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
		_arr = [
			[[[["CUP_O_BM21_RU","CUP_O_BM21_RU"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.05]
		];
		[_groups_map, east, "CUP_O_RU",
			[_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
			[1990,2100], [-999,999],
			["CUP_O_RUS_M"]
		] call gosa_fnc_map_groups_add;
		[_groups_map, east, "CUP_O_RUS_M",
			[_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
			[2020,2100], [-999,999],
			["CUP_O_RU"]
		] call gosa_fnc_map_groups_add;
	};


//-- CUP_O_TK
	[_groups_map, east, "CUP_O_TK", [[
			// configName CUP_O_TK_MotorizedReconSection
			[[[["CUP_O_TK_Soldier_SL","CUP_O_UAZ_MG_TKA","CUP_O_UAZ_AGS30_TKA","CUP_O_TK_Soldier_AT"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.3],
			// configName CUP_O_TK_MotorizedPatrol
			[[[["CUP_O_TK_Soldier_GL","CUP_O_UAZ_Unarmed_TKA","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier"],[[3,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.4],
			// configName CUP_O_TK_MechanizedInfantrySquadBMP2
			[[[["CUP_O_TK_Soldier_SL","CUP_O_BMP2_TKA","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_LAT","CUP_O_TK_Soldier_AAT"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.7],
			// configName CUP_O_TK_MechanizedInfantrySquadBTR60
			[[[["CUP_O_TK_Soldier_SL","CUP_O_BTR60_TK","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier_LAT","CUP_O_TK_Soldier"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","SERGEANT","CORPORAL","CORPORAL"]]],0.9],
			// configName CUP_O_TK_MechanizedSpecialSquad
			[[[["CUP_O_TK_SpecOps_TL","CUP_O_BTR60_TK","CUP_O_TK_SpecOps_MG","CUP_O_TK_SpecOps_MG","CUP_O_TK_SpecOps_MG","CUP_O_TK_SpecOps","CUP_O_TK_SpecOps","CUP_O_TK_SpecOps","CUP_O_TK_SpecOps"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL"]]],0],
			// configName CUP_O_TK_MechanizedReconSection
			[[[["CUP_O_TK_Soldier_SL","CUP_O_BRDM2_TKA","CUP_O_BRDM2_TKA","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_AR","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.7],
			// configName CUP_O_TK_MechanizedReconSectionAT
			[[[["CUP_O_BRDM2_ATGM_TKA","CUP_O_BRDM2_ATGM_TKA"],[[0,10,0],[5,0,0]],["SERGEANT","SERGEANT"]]],0.7],
			// configName CUP_O_TK_T72Platoon
			[[[["CUP_O_T72_TKA","CUP_O_T72_TKA","CUP_O_T72_TKA"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
			// configName CUP_O_TK_T55Platoon
			[[[["CUP_O_T55_TK","CUP_O_T55_TK","CUP_O_T55_TK"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
			// configName CUP_O_TK_T34Platoon
			[[[["CUP_O_T34_TKA","CUP_O_T34_TKA","CUP_O_T34_TKA"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT"]]],0.05],
			// configName CUP_O_TK_Mi24_DFlight
			[[[["CUP_O_Mi24_D_TK"],[[0,0,0]],["CAPTAIN"]]],0.3],
			// configName CUP_O_TK_Mi_17Flight
			[[[["CUP_O_Mi17_TK","CUP_O_Mi17_TK"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			// configName CUP_O_TK_Su25Flight
			[[[["CUP_O_Su25_TKA","CUP_O_Su25_TKA"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			// configName CUP_O_TK_UH1HFlight
			[[[["CUP_O_UH1H_TKA","CUP_O_UH1H_TKA"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			// configName CUP_O_TK_InfantrySquad
			[[[["CUP_O_TK_Soldier_SL","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_LAT","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier_AAT","CUP_O_TK_Soldier_AMG"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
			// configName CUP_O_TK_InfantrySection
			[[[["CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier","CUP_O_TK_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_TK_InfantrySectionAT
			[[[["CUP_O_TK_Soldier_HAT","CUP_O_TK_Soldier_HAT","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_AAT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_O_TK_InfantrySectionAA
			[[[["CUP_O_TK_Soldier_AA","CUP_O_TK_Soldier_AA","CUP_O_TK_Soldier_AA"],[[0,5,0],[3,0,0],[5,0,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.2],
			// configName CUP_O_TK_InfantrySectionMG
			[[[["CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier_AMG"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_O_TK_SniperTeam
			[[[["CUP_O_TK_Sniper_KSVK","CUP_O_TK_Spotter"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
			// configName CUP_O_TK_SpecialPurposeSquad
			[[[["CUP_O_TK_SpecOps_TL","CUP_O_TK_SpecOps_MG","CUP_O_TK_SpecOps","CUP_O_TK_SpecOps","CUP_O_TK_SpecOps_MG","CUP_O_TK_SpecOps","CUP_O_TK_SpecOps"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [161,999],
	["OPF_G_F","OPF_F","OPF_T_F","OPF_R_F","OPF_SFIA_lxWS","OPF_TURA_lxWS"]
	] call gosa_fnc_map_groups_add;

//-- CUP_O_ChDKZ
	[_groups_map, east, "CUP_O_ChDKZ", [[
			// configName CUP_O_ChDKZ_MotInfSquad
			[[[["CUP_O_INS_Commander","CUP_O_Ural_CHDKZ","CUP_O_INS_Soldier_MG","CUP_O_INS_Soldier_AT","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier_AK74","CUP_O_INS_Soldier_GL","CUP_O_INS_Soldier","CUP_O_INS_Soldier_MG","CUP_O_INS_Soldier_AT","CUP_O_INS_Soldier","CUP_O_INS_Soldier","CUP_O_INS_Soldier_AK74"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0],[21,0,0],[23,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.25],
			// configName CUP_O_ChDKZ_MotInfSection
			[[[["CUP_O_INS_Soldier_GL","CUP_O_UAZ_MG_CHDKZ","CUP_O_UAZ_SPG9_CHDKZ","CUP_O_UAZ_MG_CHDKZ","CUP_O_INS_Soldier","CUP_O_INS_Soldier_MG","CUP_O_INS_Soldier_GL"],[[0,5,0],[-5,0,0],[-5,-7,0],[-5,-14,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
			// configName CUP_O_ChDKZ_MechInfSection
			[[[["CUP_O_INS_Commander","CUP_O_BRDM2_CHDKZ","CUP_O_BRDM2_CHDKZ","CUP_O_INS_Soldier_MG","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier_GL","CUP_O_INS_Soldier","CUP_O_INS_Soldier_AT","CUP_O_INS_Soldier_AK74"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.25],
			// configName CUP_O_ChDKZ_MechInfSection_AT
			[[[["CUP_O_INS_Soldier_GL","CUP_O_BRDM2_ATGM_CHDKZ","CUP_O_BRDM2_ATGM_CHDKZ","CUP_O_INS_Soldier_AT"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_O_ChDKZ_TankSection
			[[[["CUP_O_T72_CHDKZ","CUP_O_T72_CHDKZ"],[[0,10,0],[5,0,0]],["SERGEANT","CORPORAL"]]],0.07],
			// configName CUP_O_ChDKZ_T55Section
			[[[["CUP_O_T55_CHDKZ","CUP_O_T55_CHDKZ"],[[0,10,0],[5,0,0]],["SERGEANT","CORPORAL"]]],0.07],
			// configName CUP_O_ChDKZ_Mi8Squadron
			[[[["CUP_O_Mi8_CHDKZ"],[[0,0,0]],["CAPTAIN"]]],0.05],
			// configName CUP_O_ChDKZ_InfSquad
			[[[["CUP_O_INS_Commander","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier_GL","CUP_O_INS_Soldier_AT","CUP_O_INS_Soldier_AK74","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier","CUP_O_INS_Soldier_AK74"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.85],
			// configName CUP_O_ChDKZ_InfSquad_Weapons
			[[[["CUP_O_INS_Commander","CUP_O_INS_Soldier_MG","CUP_O_INS_Soldier_MG","CUP_O_INS_Soldier_AT","CUP_O_INS_Soldier_AT","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier_AK74"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_O_ChDKZ_InfSection_AT
			[[[["CUP_O_INS_Soldier_AT","CUP_O_INS_Soldier_AT","CUP_O_INS_Soldier"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","PRIVATE","PRIVATE"]]],0.25],
			// configName CUP_O_ChDKZ_InfSection_AA
			[[[["CUP_O_INS_Soldier_AA","CUP_O_INS_Soldier_AA","CUP_O_INS_Soldier_AA"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","PRIVATE","PRIVATE"]]],0.1],
			// configName CUP_O_ChDKZ_SniperTeam
			[[[["CUP_O_INS_Sniper","CUP_O_INS_Sniper","CUP_O_INS_Soldier"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.2]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [160,250],
	["OPF_G_F","OPF_F","OPF_T_F","OPF_R_F","OPF_SFIA_lxWS","OPF_TURA_lxWS"]
	] call gosa_fnc_map_groups_add;


//-- CUP_B_US_Army
	// UCP, OCP, OEFCP
	// Air
	[_groups_map, west, "CUP_B_US_Army", [[
		// configName CUP_B_US_Army_A10Flight
		[[[["CUP_B_A10_CAS_USA","CUP_B_A10_CAS_USA"],[[0,20,0],[20,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
		// configName CUP_B_US_Army_AH64DFlight
		[[[["CUP_B_AH64D_USA"],[[0,0,0]],["CAPTAIN"]]],0.3],
		// configName CUP_B_US_Army_C130JFlight
		//[[[["CUP_B_C130J_USMC"],[[0,0,0]],["CAPTAIN"]]],0.3],
		// configName CUP_B_US_Army_CH47FFlight
		[[[["CUP_B_CH47F_USA"],[[0,0,0]],["CAPTAIN"]]],0.3]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [-999,999],
	["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
	] call gosa_fnc_map_groups_add;

		// Inf. UCP (самый белый)
		[_groups_map, west, "CUP_B_US_Army", [[
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
			[[[["CUP_B_US_Soldier_HAT_UCP","CUP_B_US_Soldier_HAT_UCP","CUP_B_US_Soldier_AHAT_UCP"],[[0,5,0],[3,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.1]
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [251,999,1],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

		// Inf. OCP (цвет "Латте")
		[_groups_map, west, "CUP_B_US_Army", [[
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
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [251,999],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

		// Inf. OEFCP
		[_groups_map, west, "CUP_B_US_Army", [[
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
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [160,999],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

		// Vehicles Desert
		[_groups_map, west, "CUP_B_US_Army", [[
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

			// configName CUP_B_US_Army_MotorizedSection_OEFCP
			[[[["CUP_B_US_Soldier_SL_OEFCP",
			"CUP_B_HMMWV_M2_GPK_USA","CUP_B_HMMWV_MK19_USA",
			"CUP_B_US_Soldier_AT_OEFCP","CUP_B_US_Soldier_GL_OEFCP",
			"CUP_B_US_Soldier_GL_OEFCP","CUP_B_US_Soldier_AAT_OEFCP",
			"CUP_B_US_Soldier_Marksman_OEFCP"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_US_Army_MotorizedSectionAT_OEFCP
			[[[["CUP_B_US_Soldier_SL_OEFCP","CUP_B_HMMWV_TOW_USA","CUP_B_HMMWV_TOW_USA","CUP_B_US_Soldier_AR_OEFCP"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.15],
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
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [250,999],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;
	// TODO: Добавить камуфляжи лесной, зимний.

//-- CUP_B_USMC
	// FROG_WDL, FROG_DES, MARSOC, DES, FRTeam, FRTeam_Desert, Default
	// Air
	[_groups_map, west, "CUP_B_USMC", [[
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
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [-999,999],
	["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
	] call gosa_fnc_map_groups_add;

		// WDL
		[_groups_map, west, "CUP_B_USMC", [[
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
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [160,250,1],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

		// DES
		[_groups_map, west, "CUP_B_USMC", [[
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
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [251,999],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

//-- CUP_B_GB
		[_groups_map, west, "CUP_B_GB", [[
			[[[["CUP_B_Challenger2_Snow_BAF","CUP_B_Challenger2_Snow_BAF","CUP_B_Challenger2_Snow_BAF","CUP_B_Challenger2_Snow_BAF"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.05],
			[[[["CUP_B_Challenger2_2CS_BAF","CUP_B_Challenger2_2CS_BAF"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.05]
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [-999,149],
		[]
		] call gosa_fnc_map_groups_add;

		[_groups_map, west, "CUP_B_GB", [[
			// FIXME: DDPM слишком пустынный для смешанных локаций.
			// configName CUP_B_GB_Section_DDPM
			[[[["CUP_B_BAF_Soldier_SL_DDPM","CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_AR_DDPM","CUP_B_BAF_Soldier_Marksman_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_AR_DDPM","CUP_B_BAF_Soldier_AAR_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GB_Fireteam_DDPM
			[[[["CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_AR_DDPM","CUP_B_BAF_Soldier_Marksman_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
			// configName CUP_B_GB_Support_DDPM
			[[[["CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_JTAC_DDPM","CUP_B_BAF_Medic_DDPM","CUP_B_BAF_Engineer_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_GB_MG_DDPM
			[[[["CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_MG_DDPM","CUP_B_BAF_Soldier_AMG_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_GB_AT_DDPM
			[[[["CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_AT_DDPM","CUP_B_BAF_Soldier_AAT_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
			// configName CUP_B_GB_HAT_DDPM
			[[[["CUP_B_BAF_Soldier_AT_DDPM","CUP_B_BAF_Soldier_HAT_DDPM","CUP_B_BAF_Soldier_AHAT_DDPM","CUP_B_BAF_Soldier_AAT_DDPM"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.05],

			// configName CUP_B_GB_MPatrol_MTP
			[[[["CUP_B_BAF_Soldier_SL_DDPM","CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_AR_DDPM","CUP_B_BAF_Soldier_AR_DDPM","CUP_B_BAF_Soldier_Marksman_DDPM","CUP_B_LR_Transport_GB_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[-5,0,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],0]],0.5],
			// configName CUP_B_GB_MTeam_MTP
			[[[["CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_BAF_Jackal2_L2A1_D"],[[0,5,0],[3,0,0],[-5,0,0]],["CORPORAL","PRIVATE","PRIVATE"],[],0]],0.3],
			// configName CUP_B_GB_MSection_MTP
			[[[["CUP_B_BAF_Soldier_SL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_BAF_Jackal2_L2A1_D","CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_BAF_Jackal2_L2A1_D"],[[0,5,0],[3,0,0],[-5,0,0],[5,0,0],[7,0,0],[-5,-10,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"],[],0]],0.1],
			// configName CUP_B_GB_MSection_MTP_Ridgback
			[[[["CUP_B_BAF_Soldier_SL_DDPM","CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_AR_DDPM","CUP_B_Ridgback_HMG_GB_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[-5,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],0]],0.1],
			// configName CUP_B_GB_MSection_MTP_Mastiff
			[[[["CUP_B_BAF_Soldier_SL_DDPM","CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_AR_DDPM","CUP_B_BAF_Medic_DDPM","CUP_B_BAF_Soldier_Marksman_DDPM","CUP_B_BAF_Soldier_AAR_DDPM","CUP_B_Mastiff_HMG_GB_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[-5,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],0]],0.1],

			// configName CUP_B_GB_MechSec_MTP
			[[[["CUP_B_BAF_Soldier_SL_DDPM","CUP_B_BAF_Soldier_TL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_GL_DDPM","CUP_B_BAF_Soldier_AR_DDPM","CUP_B_BAF_Soldier_Marksman_DDPM","CUP_B_FV510_GB_D"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],0]],0.3],
			// configName CUP_B_GB_MechAT_MTP
			[[[["CUP_B_BAF_Soldier_AT_DDPM","CUP_B_BAF_Soldier_AT_DDPM","CUP_B_BAF_Soldier_HAT_DDPM","CUP_B_BAF_Soldier_AAT_DDPM","CUP_B_BAF_Soldier_AAT_DDPM","CUP_B_BAF_Soldier_AHAT_DDPM","CUP_B_FV510_GB_D_SLAT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],["CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.3],

			// configName CUP_B_GB_WPlatoon_MTP
			[[[["CUP_B_FV510_GB_D","CUP_B_FV510_GB_D","CUP_B_FV510_GB_D_SLAT","CUP_B_FV510_GB_D_SLAT"],[[0,8,0],[8,0,0],[-8,0,0],[0,-8,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.05],

			// configName CUP_B_GB_Section_MTP
			[[[["CUP_B_BAF_Soldier_SL_MTP","CUP_B_BAF_Soldier_TL_MTP","CUP_B_BAF_Soldier_GL_MTP","CUP_B_BAF_Soldier_AR_MTP","CUP_B_BAF_Soldier_Marksman_MTP","CUP_B_BAF_Soldier_GL_MTP","CUP_B_BAF_Soldier_AR_MTP","CUP_B_BAF_Soldier_AAR_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GB_Fireteam_MTP
			[[[["CUP_B_BAF_Soldier_TL_MTP","CUP_B_BAF_Soldier_GL_MTP","CUP_B_BAF_Soldier_AR_MTP","CUP_B_BAF_Soldier_Marksman_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
			// configName CUP_B_GB_Support_MTP
			[[[["CUP_B_BAF_Soldier_TL_MTP","CUP_B_BAF_Soldier_JTAC_MTP","CUP_B_BAF_Medic_MTP","CUP_B_BAF_Engineer_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_GB_MG_MTP
			[[[["CUP_B_BAF_Soldier_TL_MTP","CUP_B_BAF_Soldier_GL_MTP","CUP_B_BAF_Soldier_MG_MTP","CUP_B_BAF_Soldier_AMG_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_GB_AT_MTP
			[[[["CUP_B_BAF_Soldier_TL_MTP","CUP_B_BAF_Soldier_GL_MTP","CUP_B_BAF_Soldier_AT_MTP","CUP_B_BAF_Soldier_AAT_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
			// configName CUP_B_GB_HAT_MTP
			[[[["CUP_B_BAF_Soldier_AT_MTP","CUP_B_BAF_Soldier_HAT_MTP","CUP_B_BAF_Soldier_AHAT_MTP","CUP_B_BAF_Soldier_AAT_MTP"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.05],

			// configName CUP_B_GB_Snipers_MTP
			[[[["CUP_B_BAF_Sniper_MTP","CUP_B_BAF_Sniper_AS50_MTP","CUP_B_BAF_Spotter_MTP"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.05],
			// configName CUP_B_GB_SnipersN_MTP
			[[[["CUP_B_BAF_Sniper_AS50_TWS_MTP","CUP_B_BAF_Sniper_AS50_TWS_MTP","CUP_B_BAF_Spotter_L85TWS_MTP"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.05]
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [250,999],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

		[_groups_map, west, "CUP_B_GB", [[
			// configName CUP_B_GB_Section_W
			[[[["CUP_B_BAF_Soldier_SL_WDL","CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_AR_WDL","CUP_B_BAF_Soldier_Marksman_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_AR_WDL","CUP_B_BAF_Soldier_AAR_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GB_Fireteam_W
			[[[["CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_AR_WDL","CUP_B_BAF_Soldier_Marksman_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.8],
			// configName CUP_B_GB_Support_W
			[[[["CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_JTAC_WDL","CUP_B_BAF_Medic_WDL","CUP_B_BAF_Engineer_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_GB_MG_W
			[[[["CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_MG_WDL","CUP_B_BAF_Soldier_AMG_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_B_GB_AT_W
			[[[["CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_AT_WDL","CUP_B_BAF_Soldier_AAT_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
			// configName CUP_B_GB_HAT_W
			[[[["CUP_B_BAF_Soldier_AT_WDL","CUP_B_BAF_Soldier_HAT_WDL","CUP_B_BAF_Soldier_AHAT_WDL","CUP_B_BAF_Soldier_AAT_WDL"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.05],
			// configName CUP_B_GB_Snipers_W
			[[[["CUP_B_BAF_Sniper_WDL","CUP_B_BAF_Sniper_AS50_WDL","CUP_B_BAF_Spotter_WDL"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.05],

			// configName CUP_B_GB_MPatrol_W
			[[[["CUP_B_BAF_Soldier_SL_WDL","CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_AR_WDL","CUP_B_BAF_Soldier_AR_WDL","CUP_B_BAF_Soldier_Marksman_WDL","CUP_B_LR_Transport_GB_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[-5,0,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GB_MTeam_W
			[[[["CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_BAF_Jackal2_L2A1_W"],[[0,5,0],[3,0,0],[-5,0,0]],["CORPORAL","PRIVATE","PRIVATE"]]],0.3],
			// configName CUP_B_GB_MSection_W
			[[[["CUP_B_BAF_Soldier_SL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_BAF_Jackal2_L2A1_W","CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_BAF_Jackal2_L2A1_W"],[[0,5,0],[3,0,0],[-5,0,0],[5,0,0],[7,0,0],[-5,-10,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
			// configName CUP_B_GB_MSection_W_Ridgback
			[[[["CUP_B_BAF_Soldier_SL_WDL","CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_AR_WDL","CUP_B_Ridgback_HMG_GB_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[-5,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
			// configName CUP_B_GB_MSection_W_Mastiff
			[[[["CUP_B_BAF_Soldier_SL_WDL","CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_AR_WDL","CUP_B_BAF_Medic_WDL","CUP_B_BAF_Soldier_Marksman_WDL","CUP_B_BAF_Soldier_AAR_WDL","CUP_B_Mastiff_HMG_GB_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[-5,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.1],


			// configName CUP_B_GB_MechSec_W
			[[[["CUP_B_BAF_Soldier_SL_WDL","CUP_B_BAF_Soldier_TL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_GL_WDL","CUP_B_BAF_Soldier_AR_WDL","CUP_B_BAF_Soldier_Marksman_WDL","CUP_B_FV510_GB_W"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.3],
			// configName CUP_B_GB_MechAT_W
			[[[["CUP_B_BAF_Soldier_AT_WDL","CUP_B_BAF_Soldier_AT_WDL","CUP_B_BAF_Soldier_HAT_WDL","CUP_B_BAF_Soldier_AAT_WDL","CUP_B_BAF_Soldier_AAT_WDL","CUP_B_BAF_Soldier_AHAT_WDL","CUP_B_FV510_GB_W_SLAT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[-5,0,0]],["CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.3],
			// configName CUP_B_GB_WPlatoon_W
			[[[["CUP_B_FV510_GB_W","CUP_B_FV510_GB_W","CUP_B_FV510_GB_W_SLAT","CUP_B_FV510_GB_W_SLAT"],[[0,8,0],[8,0,0],[-8,0,0],[0,-8,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.05],


			// configName CUP_B_GB_SnipersN_W
			[[[["CUP_B_BAF_Sniper_AS50_TWS_WDL","CUP_B_BAF_Sniper_AS50_TWS_WDL","CUP_B_BAF_Spotter_L85TWS_WDL"],[[0,5,0],[3,0,0],[5,0,0]],["CORPORAL","CORPORAL","PRIVATE"]]],0.05]

			/*
			TODO: Настроить авиацию.
			// configName CUP_B_GB_CH47FSquadron
			[[[["CUP_B_CH47F_GB"],[[0,15,0]],["CAPTAIN"]]],0.3],
			// configName CUP_B_GB_AH11Squadron
			[[[["CUP_B_AW159_Armed_BAF"],[[0,15,0]],["CAPTAIN"]]],0.3],
			// configName CUP_B_GB_AH1Squadron
			[[[["CUP_B_AH1_BAF","CUP_B_AH1_BAF"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			// configName CUP_B_GB_HC3Squadron
			[[[["CUP_Merlin_HC3"],[[0,15,0]],["CAPTAIN"]]],0.3]
			*/
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [150,249,1],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

//-- CUP_B_GER
		[_groups_map, west, "CUP_B_GER", [[
			[[[["CUP_B_Leopard_1A3GRNW_GER","CUP_B_Leopard_1A3GRNW_GER","CUP_B_Leopard_1A3GRNW_GER","CUP_B_Leopard_1A3GRNW_GER"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.03],
			[[[["CUP_B_Leopard_1A3GRNW_GER","CUP_B_Leopard_1A3GRNW_GER"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.03],
			[[[["CUP_B_Leopard_1A3WDS_GER","CUP_B_Leopard_1A3WDS_GER","CUP_B_Leopard_1A3WDS_GER","CUP_B_Leopard_1A3WDS_GER"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.03],
			[[[["CUP_B_Leopard_1A3WDS_GER","CUP_B_Leopard_1A3WDS_GER"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.03],
			[[[["CUP_B_Leopard_1A3SNOW_GER","CUP_B_Leopard_1A3SNOW_GER","CUP_B_Leopard_1A3SNOW_GER","CUP_B_Leopard_1A3SNOW_GER"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.04],
			[[[["CUP_B_Leopard_1A3SNOW_GER","CUP_B_Leopard_1A3SNOW_GER"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.04]
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [-999,149],
		[]
		] call gosa_fnc_map_groups_add;

		[_groups_map, west, "CUP_B_GER", [[
			// configName CUP_B_GER_Fleck_KSK_Team
			[[[["CUP_B_GER_Fleck_Soldier_TL","CUP_B_GER_Fleck_Soldier_MG","CUP_B_GER_Fleck_Soldier","CUP_B_GER_Fleck_Soldier_Scout","CUP_B_GER_Fleck_Soldier","CUP_B_GER_Fleck_Medic"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_Fleck_KSK_AssaultTeam
			[[[["CUP_B_GER_Fleck_Operator_TL","CUP_B_GER_Fleck_Operator_GL","CUP_B_GER_Fleck_Operator_EXP","CUP_B_GER_Fleck_Operator"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_Fleck_KSK_SniperTeam
			[[[["CUP_B_GER_Fleck_Soldier_Sniper","CUP_B_GER_Fleck_Soldier_Scout"],[[0,0,0],[5,-5,0]],["SERGEANT","PRIVATE"]]],0.5],
			// configName CUP_B_GER_Fleck_KSK_ATTeam
			[[[["CUP_B_GER_Fleck_Soldier_TL","CUP_B_GER_Fleck_Soldier_AT","CUP_B_GER_Fleck_Soldier_AAT","CUP_B_GER_Fleck_Soldier_Scout"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_Fleck_KSK_AATeam
			[[[["CUP_B_GER_Fleck_Soldier_TL","CUP_B_GER_Fleck_Soldier_AA","CUP_B_GER_Fleck_Soldier_AAA","CUP_B_GER_Fleck_Soldier_Scout"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
			// configName CUP_B_GER_Fleck_KSK_EngineerTeam
			[[[["CUP_B_GER_Fleck_Soldier_TL","CUP_B_GER_Fleck_Soldier_Engineer","CUP_B_GER_Fleck_Soldier_Engineer","CUP_B_GER_Fleck_Soldier_Scout"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_Fleck_KSK_ReconPatrol
			[[[["CUP_B_GER_Fleck_Soldier_Scout","CUP_B_GER_Fleck_Soldier_Scout","CUP_B_GER_Fleck_Soldier_Scout"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_B_GER_Fleck_KSK_AssaultSquad
			[[[["CUP_B_GER_Fleck_Operator_TL","CUP_B_GER_Fleck_Operator_GL","CUP_B_GER_Fleck_Operator_Medic","CUP_B_GER_Fleck_Operator_EXP","CUP_B_GER_Fleck_Operator_GL","CUP_B_GER_Fleck_Operator_EXP","CUP_B_GER_Fleck_Operator","CUP_B_GER_Fleck_Operator"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],

			// configName CUP_B_GER_BW_Fleck_sniper_team
			[[[["CUP_B_GER_BW_Fleck_Soldier_Sniper","CUP_B_GER_BW_Fleck_Soldier_Scout"],[[0,0,0],[5,-5,0]],["SERGEANT","PRIVATE"]]],0.5],

			// configName CUP_B_GER_BW_Fleck_rifle_squad
			[[[["CUP_B_GER_BW_Fleck_Soldier_TL","CUP_B_GER_BW_Fleck_Soldier_GL","CUP_B_GER_BW_Fleck_Medic","CUP_B_GER_BW_Fleck_Soldier_MG3","CUP_B_GER_BW_Fleck_Soldier_AT","CUP_B_GER_BW_Fleck_Soldier_AAT","CUP_B_GER_BW_Fleck_Soldier_Marksman","CUP_B_GER_BW_Fleck_Soldier_Marksman","CUP_B_GER_BW_Fleck_Soldier","CUP_B_GER_BW_Fleck_Soldier","CUP_B_GER_BW_Fleck_Soldier_Ammo","CUP_B_GER_BW_Fleck_Soldier_Engineer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_BW_Fleck_fire_team
			[[[["CUP_B_GER_BW_Fleck_Soldier_TL","CUP_B_GER_BW_Fleck_Soldier","CUP_B_GER_BW_Fleck_Soldier_MG3","CUP_B_GER_BW_Fleck_Soldier_GL"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_BW_Fleck_weapon_squad
			[[[["CUP_B_GER_BW_Fleck_Soldier_TL","CUP_B_GER_BW_Fleck_Soldier_MG3","CUP_B_GER_BW_Fleck_Soldier_GL","CUP_B_GER_BW_Fleck_Soldier_AT","CUP_B_GER_BW_Fleck_Soldier_AAT","CUP_B_GER_BW_Fleck_Soldier_Ammo","CUP_B_GER_BW_Fleck_Soldier_MG3","CUP_B_GER_BW_Fleck_Soldier_Ammo","CUP_B_GER_BW_Fleck_Soldier_GL","CUP_B_GER_BW_Fleck_Medic"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_BW_Fleck_anti_tank_team
			[[[["CUP_B_GER_BW_Fleck_Soldier_AT","CUP_B_GER_BW_Fleck_Soldier_AAT","CUP_B_GER_BW_Fleck_Soldier_AT","CUP_B_GER_BW_Fleck_Soldier_AAT"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_BW_Fleck_anti_air_team
			[[[["CUP_B_GER_BW_Fleck_Soldier_AA","CUP_B_GER_BW_Fleck_Soldier_AAA","CUP_B_GER_BW_Fleck_Soldier_AA","CUP_B_GER_BW_Fleck_Soldier_AAA"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],

			// configName CUP_B_GER_SF_MotInf_KSK_WDL
			[[[["CUP_B_GER_Fleck_Soldier_TL","CUP_B_GER_Fleck_Soldier_MG","CUP_B_GER_Fleck_Soldier","CUP_B_GER_Fleck_Soldier_Scout","CUP_B_GER_Fleck_Soldier","CUP_B_GER_Fleck_Medic","CUP_B_GER_Fleck_Soldier_AT","CUP_B_GER_Fleck_Soldier_Ammo","CUP_B_Dingo_GER_Wdl","CUP_B_Dingo_GL_GER_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[15,0,0],[15,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","SERGEANT","SERGEANT"]]],0.6],
			// configName CUP_B_GER_SF_MotInf_ReconPatrol_KSK_WDL
			[[[["CUP_B_GER_Fleck_Soldier_Scout","CUP_B_GER_Fleck_Soldier_Scout","CUP_B_GER_Fleck_Soldier_Scout","CUP_B_Dingo_GER_Wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","SERGEANT"]]],0],

			// configName CUP_B_GER_MechInf_HMG_WDL
			[[[["CUP_B_GER_BW_Fleck_Soldier_TL","CUP_B_GER_BW_Fleck_Soldier_MG","CUP_B_GER_BW_Fleck_Soldier_Ammo","CUP_B_GER_BW_Fleck_Soldier_Marksman","CUP_B_GER_BW_Fleck_Medic","CUP_B_GER_BW_Fleck_Soldier","CUP_B_GER_BW_Fleck_Soldier_AT","CUP_B_Boxer_HMG_GER_WDL"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[15,0,0]],["SERGANT","CORPORAL","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","SERGEANT"]]],0.3],
			// configName CUP_B_GER_MechInf_GMG_WDL
			[[[["CUP_B_GER_BW_Fleck_Soldier_TL","CUP_B_GER_BW_Fleck_Soldier_MG","CUP_B_GER_BW_Fleck_Soldier_Ammo","CUP_B_GER_BW_Fleck_Soldier_Marksman","CUP_B_GER_BW_Fleck_Medic","CUP_B_GER_BW_Fleck_Soldier","CUP_B_GER_BW_Fleck_Soldier_AT","CUP_B_Boxer_GMG_GER_WDL"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[15,0,0]],["SERGANT","CORPORAL","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","SERGEANT"]]],0.3],

			// configName CUP_B_GER_TankPlatoon_WDL
			[[[["CUP_B_Leopard2A6_GER","CUP_B_Leopard2A6_GER","CUP_B_Leopard2A6_GER","CUP_B_Leopard2A6_GER"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.2]
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [150,249,1],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

		[_groups_map, west, "CUP_B_GER", [[
			// configName CUP_B_GER_BW_rifle_squad
			[[[["CUP_B_GER_BW_Soldier_TL","CUP_B_GER_BW_Soldier_GL","CUP_B_GER_BW_Medic","CUP_B_GER_BW_Soldier_MG3","CUP_B_GER_BW_Soldier_AT","CUP_B_GER_BW_Soldier_AAT","CUP_B_GER_BW_Soldier_Marksman","CUP_B_GER_BW_Soldier_Marksman","CUP_B_GER_BW_Soldier","CUP_B_GER_BW_Soldier","CUP_B_GER_BW_Soldier_Ammo","CUP_B_GER_BW_Soldier_Engineer"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_BW_fire_team
			[[[["CUP_B_GER_BW_Soldier_TL","CUP_B_GER_BW_Soldier","CUP_B_GER_BW_Soldier_MG3","CUP_B_GER_BW_Soldier_GL"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_BW_weapon_squad
			[[[["CUP_B_GER_BW_Soldier_TL","CUP_B_GER_BW_Soldier_MG3","CUP_B_GER_BW_Soldier_GL","CUP_B_GER_BW_Soldier_AT","CUP_B_GER_BW_Soldier_AAT","CUP_B_GER_BW_Soldier_Ammo","CUP_B_GER_BW_Soldier_MG3","CUP_B_GER_BW_Soldier_Ammo","CUP_B_GER_BW_Soldier_GL","CUP_B_GER_BW_Medic"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_BW_anti_tank_team
			[[[["CUP_B_GER_BW_Soldier_AT","CUP_B_GER_BW_Soldier_AAT","CUP_B_GER_BW_Soldier_AT","CUP_B_GER_BW_Soldier_AAT"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_BW_anti_air_team
			[[[["CUP_B_GER_BW_Soldier_AA","CUP_B_GER_BW_Soldier_AAA","CUP_B_GER_BW_Soldier_AA","CUP_B_GER_BW_Soldier_AAA"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],

			// configName CUP_B_GER_SF_MotInf_KSK
			[[[["CUP_B_GER_Soldier_TL","CUP_B_GER_Soldier_MG","CUP_B_GER_Soldier","CUP_B_GER_Soldier_Scout","CUP_B_GER_Soldier","CUP_B_GER_Medic","CUP_B_GER_Soldier_AT","CUP_B_GER_Soldier_Ammo","CUP_B_Dingo_GL_GER_Des","CUP_B_Dingo_GER_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[15,0,0],[15,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","SERGEANT","SERGEANT"]]],0.6],
			// configName CUP_B_GER_SF_MotInf_ReconPatrol_KSK
			[[[["CUP_B_GER_Soldier_Scout","CUP_B_GER_Soldier_Scout","CUP_B_GER_Soldier_Scout","CUP_B_Dingo_GER_Des"],[[0,0,0],[5,-5,0],[-5,-5,0],[15,0,0]],["SERGEANT","CORPORAL","PRIVATE","SERGEANT"]]],0.6],
			// configName CUP_B_GER_MechInf_HMG_DST
			[[[["CUP_B_GER_BW_Soldier_TL","CUP_B_GER_BW_Soldier_MG","CUP_B_GER_BW_Soldier_Ammo","CUP_B_GER_BW_Soldier_Marksman","CUP_B_GER_BW_Medic","CUP_B_GER_BW_Soldier","CUP_B_GER_BW_Soldier_AT","CUP_B_Boxer_HMG_GER_DES"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[15,0,0]],["SERGANT","CORPORAL","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","SERGEANT"]]],0.3],
			// configName CUP_B_GER_MechInf_GMG_DST
			[[[["CUP_B_GER_BW_Soldier_TL","CUP_B_GER_BW_Soldier_MG","CUP_B_GER_BW_Soldier_Ammo","CUP_B_GER_BW_Soldier_Marksman","CUP_B_GER_BW_Medic","CUP_B_GER_BW_Soldier","CUP_B_GER_BW_Soldier_AT","CUP_B_Boxer_GMG_GER_DES"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[15,0,0]],["SERGANT","CORPORAL","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","SERGEANT"]]],0.3],
			// configName CUP_B_GER_TankPlatoon_DST
			[[[["CUP_B_Leopard2A6DST_GER","CUP_B_Leopard2A6DST_GER","CUP_B_Leopard2A6DST_GER","CUP_B_Leopard2A6DST_GER"],[[0,10,0],[5,0,0],[10,0,0],[15,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","SERGEANT"]]],0.2],

			// configName CUP_B_GER_KSK_Team
			[[[["CUP_B_GER_Soldier_TL","CUP_B_GER_Soldier_MG","CUP_B_GER_Soldier","CUP_B_GER_Soldier_Scout","CUP_B_GER_Soldier","CUP_B_GER_Medic"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_KSK_AssaultTeam
			[[[["CUP_B_GER_Operator_TL","CUP_B_GER_Operator_GL","CUP_B_GER_Operator_EXP","CUP_B_GER_Operator"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_KSK_SniperTeam
			[[[["CUP_B_GER_Soldier_Sniper","CUP_B_GER_Soldier_Scout"],[[0,0,0],[5,-5,0]],["SERGEANT","PRIVATE"]]],0.5],
			// configName CUP_B_GER_KSK_ATTeam
			[[[["CUP_B_GER_Soldier_TL","CUP_B_GER_Soldier_AT","CUP_B_GER_Soldier_AAT","CUP_B_GER_Soldier_Scout"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_KSK_AATeam
			[[[["CUP_B_GER_Soldier_TL","CUP_B_GER_Soldier_AA","CUP_B_GER_Soldier_AAA","CUP_B_GER_Soldier_Scout"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
			// configName CUP_B_GER_KSK_EngineerTeam
			[[[["CUP_B_GER_Soldier_TL","CUP_B_GER_Soldier_Engineer","CUP_B_GER_Soldier_Engineer","CUP_B_GER_Soldier_Scout"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_B_GER_KSK_ReconPatrol
			[[[["CUP_B_GER_Soldier_Scout","CUP_B_GER_Soldier_Scout","CUP_B_GER_Soldier_Scout"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_B_GER_KSK_AssaultSquad
			[[[["CUP_B_GER_Operator_TL","CUP_B_GER_Operator_GL","CUP_B_GER_Operator_Medic","CUP_B_GER_Operator_EXP","CUP_B_GER_Operator_GL","CUP_B_GER_Operator_EXP","CUP_B_GER_Operator","CUP_B_GER_Operator"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],

			// configName CUP_B_GER_BW_sniper_team
			[[[["CUP_B_GER_BW_Soldier_Sniper","CUP_B_GER_BW_Soldier_Scout"],[[0,0,0],[5,-5,0]],["SERGEANT","PRIVATE"]]],0.5],

			// configName CUP_B_GER_UH1DFlight
			[[[["CUP_B_UH1D_GER_KSK_Des","CUP_B_UH1D_GER_KSK_Des"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3]
		], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [250,999],
		["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

//-- CUP_B_CDF
	// winter
	_arr = [
			// CUP_B_MTLB_pk_Winter_CDF
			[[[["CUP_B_CDF_Soldier_TL_SNW","CUP_B_MTLB_pk_Winter_CDF",
				"CUP_B_CDF_Medic_SNW","CUP_B_CDF_Soldier_LAT_SNW",
				"CUP_B_CDF_Soldier_AR_SNW","CUP_B_CDF_Soldier_GL_SNW",
				"CUP_B_CDF_Soldier_Marksman_SNW","CUP_B_CDF_Soldier_LAT_SNW",
				"CUP_B_CDF_Soldier_MG_SNW","CUP_B_CDF_Soldier_SNW"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],
				["LIEUTENANT","SERGEANT",
				"PRIVATE","CORPORAL",
				"PRIVATE","SERGEANT",
				"PRIVATE","PRIVATE",
				"CORPORAL","PRIVATE"]]],0.05],

			// configName CUP_B_CDFInfSquad_SNW
			[[[["CUP_B_CDF_Soldier_TL_SNW","CUP_B_CDF_Soldier_MG_SNW","CUP_B_CDF_Soldier_LAT_SNW","CUP_B_CDF_Soldier_GL_SNW","CUP_B_CDF_Soldier_SNW","CUP_B_CDF_Soldier_MG_SNW","CUP_B_CDF_Soldier_GL_SNW","CUP_B_CDF_Soldier_LAT_SNW","CUP_B_CDF_Soldier_SNW","CUP_B_CDF_Medic_SNW"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_B_CDFInfSquad_Weapons_SNW
			[[[["CUP_B_CDF_Soldier_TL_SNW","CUP_B_CDF_Soldier_AR_SNW","CUP_B_CDF_Soldier_MG_SNW","CUP_B_CDF_Soldier_MG_SNW","CUP_B_CDF_Soldier_LAT_SNW","CUP_B_CDF_Soldier_LAT_SNW","CUP_B_CDF_Soldier_GL_SNW","CUP_B_CDF_Soldier_Marksman_SNW"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_B_CDFInfSection_AT_SNW
			[[[["CUP_B_CDF_Soldier_TL_SNW","CUP_B_CDF_Soldier_LAT_SNW","CUP_B_CDF_Soldier_LAT_SNW","CUP_B_CDF_Soldier_AR_SNW"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_B_CDFInfSection_AA_SNW
			[[[["CUP_B_CDF_Soldier_TL_SNW","CUP_B_CDF_Soldier_AA_SNW","CUP_B_CDF_Soldier_AA_SNW","CUP_B_CDF_Soldier_MG_SNW"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_CDFInfSection_MG_SNW
			[[[["CUP_B_CDF_Soldier_MG_SNW","CUP_B_CDF_Soldier_MG_SNW","CUP_B_CDF_Soldier_AR_SNW","CUP_B_CDF_Soldier_LAT_SNW"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_CDFInfSection_Patrol_SNW
			[[[["CUP_B_CDF_Militia_SNW","CUP_B_CDF_Militia_SNW","CUP_B_CDF_Militia_SNW","CUP_B_CDF_Militia_SNW"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
			// configName CUP_B_CDFSniperTeam_SNW
			[[[["CUP_B_CDF_Sniper_SNW","CUP_B_CDF_Sniper_SNW"],[[0,5,0],[3,0,0]],["SERGEANT","CORPORAL"]]],0.05]
		];
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_B_ZUBR_CDF"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
		_arr append [
			[[[["CUP_B_BM21_CDF","CUP_B_BM21_CDF"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.05]
		];
	};
	[_groups_map, west, "CUP_B_CDF", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [-999,159],
		["CUP_I_UN","BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

	// wdl
	_arr = [
			// configName CUP_B_CDFInfSquad_MNT
			[[[["CUP_B_CDF_Soldier_TL_MNT","CUP_B_CDF_Soldier_MG_MNT","CUP_B_CDF_Soldier_LAT_MNT","CUP_B_CDF_Soldier_GL_MNT","CUP_B_CDF_Soldier_MNT","CUP_B_CDF_Soldier_MG_MNT","CUP_B_CDF_Soldier_GL_MNT","CUP_B_CDF_Soldier_LAT_MNT","CUP_B_CDF_Soldier_MNT","CUP_B_CDF_Medic_MNT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_B_CDFInfSquad_Weapons_MNT
			[[[["CUP_B_CDF_Soldier_TL_MNT","CUP_B_CDF_Soldier_AR_MNT","CUP_B_CDF_Soldier_MG_MNT","CUP_B_CDF_Soldier_MG_MNT","CUP_B_CDF_Soldier_LAT_MNT","CUP_B_CDF_Soldier_LAT_MNT","CUP_B_CDF_Soldier_GL_MNT","CUP_B_CDF_Soldier_Marksman_MNT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_B_CDFInfSection_AT_MNT
			[[[["CUP_B_CDF_Soldier_TL_MNT","CUP_B_CDF_Soldier_LAT_MNT","CUP_B_CDF_Soldier_LAT_MNT","CUP_B_CDF_Soldier_AR_MNT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_B_CDFInfSection_AA_MNT
			[[[["CUP_B_CDF_Soldier_TL_MNT","CUP_B_CDF_Soldier_AA_MNT","CUP_B_CDF_Soldier_AA_MNT","CUP_B_CDF_Soldier_MG_MNT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_CDFInfSection_MG_MNT
			[[[["CUP_B_CDF_Soldier_MG_MNT","CUP_B_CDF_Soldier_MG_MNT","CUP_B_CDF_Soldier_AR_MNT","CUP_B_CDF_Soldier_LAT_MNT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_CDFInfSection_Patrol_MNT
			[[[["CUP_B_CDF_Militia_MNT","CUP_B_CDF_Militia_MNT","CUP_B_CDF_Militia_MNT","CUP_B_CDF_Militia_MNT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
			// configName CUP_B_CDFSniperTeam_MNT
			[[[["CUP_B_CDF_Sniper_MNT","CUP_B_CDF_Sniper_MNT"],[[0,5,0],[3,0,0]],["SERGEANT","CORPORAL"]]],0.05],

			// FST очень зелёный.
			// configName CUP_B_CDFInfSquad_FST
			[[[["CUP_B_CDF_Soldier_TL_FST","CUP_B_CDF_Soldier_MG_FST","CUP_B_CDF_Soldier_LAT_FST","CUP_B_CDF_Soldier_GL_FST","CUP_B_CDF_Soldier_FST","CUP_B_CDF_Soldier_MG_FST","CUP_B_CDF_Soldier_GL_FST","CUP_B_CDF_Soldier_LAT_FST","CUP_B_CDF_Soldier_FST","CUP_B_CDF_Medic_FST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_B_CDFInfSquad_Weapons_FST
			[[[["CUP_B_CDF_Soldier_TL_FST","CUP_B_CDF_Soldier_AR_FST","CUP_B_CDF_Soldier_MG_FST","CUP_B_CDF_Soldier_MG_FST","CUP_B_CDF_Soldier_LAT_FST","CUP_B_CDF_Soldier_LAT_FST","CUP_B_CDF_Soldier_GL_FST","CUP_B_CDF_Soldier_Marksman_FST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_B_CDFInfSection_AT_FST
			[[[["CUP_B_CDF_Soldier_TL_FST","CUP_B_CDF_Soldier_LAT_FST","CUP_B_CDF_Soldier_LAT_FST","CUP_B_CDF_Soldier_AR_FST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_B_CDFInfSection_AA_FST
			[[[["CUP_B_CDF_Soldier_TL_FST","CUP_B_CDF_Soldier_AA_FST","CUP_B_CDF_Soldier_AA_FST","CUP_B_CDF_Soldier_MG_FST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_CDFInfSection_MG_FST
			[[[["CUP_B_CDF_Soldier_MG_FST","CUP_B_CDF_Soldier_MG_FST","CUP_B_CDF_Soldier_AR_FST","CUP_B_CDF_Soldier_LAT_FST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_CDFInfSection_Patrol_FST
			[[[["CUP_B_CDF_Militia_FST","CUP_B_CDF_Militia_FST","CUP_B_CDF_Militia_FST","CUP_B_CDF_Militia_FST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
			// configName CUP_B_CDFSniperTeam_FST
			[[[["CUP_B_CDF_Sniper_FST","CUP_B_CDF_Sniper_FST"],[[0,5,0],[3,0,0]],["SERGEANT","CORPORAL"]]],0.05],

			// configName CUP_B_CDFMotInfSquad
			[[[["CUP_B_CDF_Soldier_TL","CUP_B_Ural_CDF","CUP_B_CDF_Soldier_MG","CUP_B_CDF_Soldier_LAT","CUP_B_CDF_Soldier_GL","CUP_B_CDF_Soldier","CUP_B_CDF_Soldier_MG","CUP_B_CDF_Soldier_GL","CUP_B_CDF_Soldier_LAT","CUP_B_CDF_Soldier","CUP_B_CDF_Medic"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.4],
			// configName CUP_B_CDFMotInfSection
			[[[["CUP_B_CDF_Soldier_GL","CUP_B_UAZ_Unarmed_CDF","CUP_B_CDF_Soldier_LAT"],[[0,5,0],[-5,0,0],[3,0,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.15],
			// configName CUP_B_CDFMotInfSection_Weapons
			[[[["CUP_B_CDF_Soldier_TL","CUP_B_UAZ_AGS30_CDF","CUP_B_UAZ_AGS30_CDF","CUP_B_CDF_Soldier_MG"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_B_CDFMi24DSquadron
			[[[["CUP_B_Mi24_D_CDF","CUP_B_Mi24_D_CDF"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.1],
			// configName CUP_B_CDFMi8Squadron
			[[[["CUP_B_Mi17_CDF","CUP_B_Mi17_CDF"],[[0,15,0],[15,0,0]],["CAPTAIN","LIEUTENANT"]]],0.3],
			// configName CUP_B_CDFMechReconSection
			[[[["CUP_B_CDF_Soldier_TL","CUP_B_BRDM2_CDF","CUP_B_CDF_Soldier_MG","CUP_B_CDF_Soldier_LAT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			// configName CUP_B_CDFMechATSection
			[[[["CUP_B_CDF_Soldier_TL","CUP_B_BRDM2_ATGM_CDF","CUP_B_CDF_Soldier_MG","CUP_B_CDF_Soldier_LAT"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0]],["SERGEANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
			// configName CUP_B_CDFTankPlatoon
			[[[["CUP_B_T72_CDF","CUP_B_T72_CDF","CUP_B_T72_CDF"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT"]]],0.25]
		];
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_B_ZUBR_CDF"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
		_arr append [
			[[[["CUP_B_BM21_CDF","CUP_B_BM21_CDF"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.05]
		];
	};
	[_groups_map, west, "CUP_B_CDF", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [160,250],
		["CUP_I_UN","BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
		] call gosa_fnc_map_groups_add;

	// _DST
	_arr = [
			// configName CUP_B_CDFInfSquad_DST
			[[[["CUP_B_CDF_Soldier_TL_DST","CUP_B_CDF_Soldier_MG_DST","CUP_B_CDF_Soldier_LAT_DST","CUP_B_CDF_Soldier_GL_DST","CUP_B_CDF_Soldier_DST","CUP_B_CDF_Soldier_MG_DST","CUP_B_CDF_Soldier_GL_DST","CUP_B_CDF_Soldier_LAT_DST","CUP_B_CDF_Soldier_DST","CUP_B_CDF_Medic_DST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_B_CDFInfSquad_Weapons_DST
			[[[["CUP_B_CDF_Soldier_TL_DST","CUP_B_CDF_Soldier_AR_DST","CUP_B_CDF_Soldier_MG_DST","CUP_B_CDF_Soldier_MG_DST","CUP_B_CDF_Soldier_LAT_DST","CUP_B_CDF_Soldier_LAT_DST","CUP_B_CDF_Soldier_GL_DST","CUP_B_CDF_Soldier_Marksman_DST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.6],
			// configName CUP_B_CDFInfSection_AT_DST
			[[[["CUP_B_CDF_Soldier_TL_DST","CUP_B_CDF_Soldier_LAT_DST","CUP_B_CDF_Soldier_LAT_DST","CUP_B_CDF_Soldier_AR_DST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
			// configName CUP_B_CDFInfSection_AA_DST
			[[[["CUP_B_CDF_Soldier_TL_DST","CUP_B_CDF_Soldier_AA_DST","CUP_B_CDF_Soldier_AA_DST","CUP_B_CDF_Soldier_MG_DST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_CDFInfSection_MG_DST
			[[[["CUP_B_CDF_Soldier_MG_DST","CUP_B_CDF_Soldier_MG_DST","CUP_B_CDF_Soldier_AR_DST","CUP_B_CDF_Soldier_LAT_DST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.1],
			// configName CUP_B_CDFInfSection_Patrol_DST
			[[[["CUP_B_CDF_Militia_DST","CUP_B_CDF_Militia_DST","CUP_B_CDF_Militia_DST","CUP_B_CDF_Militia_DST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
			// configName CUP_B_CDFSniperTeam_DST
			[[[["CUP_B_CDF_Sniper_DST","CUP_B_CDF_Sniper_DST"],[[0,5,0],[3,0,0]],["SERGEANT","CORPORAL"]]],0.05]
		];
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_B_ZUBR_CDF"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
		_arr append [
			[[[["CUP_B_BM21_CDF","CUP_B_BM21_CDF"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.05]
		];
	};
	[_groups_map, west, "CUP_B_CDF", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
		[1990,2100], [251,999],
		["CUP_I_UN","BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
	] call gosa_fnc_map_groups_add;

//-- CUP_B_HIL
// FIXME: _Res - зеленый.
_arr = [
	// CUP_B_HIL_InfantrySquad
	[[[["CUP_B_HIL_SL_Res","CUP_B_HIL_MMG_Res","CUP_B_HIL_Soldier_Res","CUP_B_HIL_GL_Res","CUP_B_HIL_MMG_Res","CUP_B_HIL_Soldier_MAT_Res","CUP_B_HIL_GL_Res","CUP_B_HIL_Medic_Res","CUP_B_HIL_M_Res"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
	// CUP_B_HIL_InfantrySection
	[[[["CUP_B_HIL_MMG_Res","CUP_B_HIL_GL_Res","CUP_B_HIL_Soldier_Res","CUP_B_HIL_Soldier_Res"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// CUP_B_HIL_InfantrySectionAT
	[[[["CUP_B_HIL_Soldier_HAT_Res","CUP_B_HIL_Soldier_HAT_Res","CUP_B_HIL_Soldier_HAT_Res","CUP_B_HIL_Soldier_HAT_Res","CUP_B_HIL_Soldier_MAT_Res"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
	// CUP_B_HIL_InfantrySectionMG
	[[[["CUP_B_HIL_MMG_Res","CUP_B_HIL_MMG_Res","CUP_B_HIL_Soldier_HAT_Res","CUP_B_HIL_GL_Res","CUP_B_HIL_M_Res"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// CUP_B_HIL_MarksmanTeam
	[[[["CUP_B_HIL_M_Res","CUP_B_HIL_M_Res"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
	// CUP_B_HIL_InfantrySquad
	[[[["CUP_B_HIL_SL_Recon","CUP_B_HIL_MMG_Recon","CUP_B_HIL_Soldier_Recon","CUP_B_HIL_GL_Recon","CUP_B_HIL_MMG_Recon","CUP_B_HIL_Soldier_MAT_Recon","CUP_B_HIL_GL_Recon","CUP_B_HIL_Medic_Recon","CUP_B_HIL_M_Recon"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
	// CUP_B_HIL_InfantrySection
	[[[["CUP_B_HIL_MMG_Recon","CUP_B_HIL_GL_Recon","CUP_B_HIL_Soldier_Recon","CUP_B_HIL_Soldier_Recon"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// CUP_B_HIL_InfantrySectionAT
	[[[["CUP_B_HIL_Soldier_HAT_Recon","CUP_B_HIL_Soldier_HAT_Recon","CUP_B_HIL_Soldier_HAT_Recon","CUP_B_HIL_Soldier_HAT_Recon","CUP_B_HIL_Soldier_MAT_Recon"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
	// CUP_B_HIL_InfantrySectionMG
	[[[["CUP_B_HIL_MMG_Recon","CUP_B_HIL_MMG_Recon","CUP_B_HIL_Soldier_HAT_Recon","CUP_B_HIL_GL_Recon","CUP_B_HIL_M_Recon"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// CUP_B_HIL_MarksmanTeam
	[[[["CUP_B_HIL_M_Recon","CUP_B_HIL_M_Recon"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
	// CUP_B_HIL_InfantrySquad
	[[[["CUP_B_HIL_SL","CUP_B_HIL_MMG","CUP_B_HIL_Soldier","CUP_B_HIL_GL","CUP_B_HIL_MMG","CUP_B_HIL_Soldier_MAT","CUP_B_HIL_Soldier_LAT","CUP_B_HIL_Medic","CUP_B_HIL_M"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
	// CUP_B_HIL_InfantrySection
	[[[["CUP_B_HIL_Soldier_LAT","CUP_B_HIL_GL","CUP_B_HIL_MMG","CUP_B_HIL_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// CUP_B_HIL_InfantrySectionAT
	[[[["CUP_B_HIL_SL","CUP_B_HIL_Soldier_HAT","CUP_B_HIL_Soldier_HAT","CUP_B_HIL_Soldier_MAT","CUP_B_HIL_Soldier_MAT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE"]]],0.2],
	// CUP_B_HIL_InfantrySectionMG
	[[[["CUP_B_HIL_Soldier","CUP_B_HIL_MMG","CUP_B_HIL_MMG","CUP_B_HIL_GL","CUP_B_HIL_M"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// CUP_B_HIL_MarksmanTeam
	[[[["CUP_B_HIL_M","CUP_B_HIL_M"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
	// CUP_B_HIL_InfantrySquad
	[[[["CUP_B_HIL_SL_SF","CUP_B_HIL_MMG_SF","CUP_B_HIL_Soldier_SF","CUP_B_HIL_GL_SF","CUP_B_HIL_MMG_SF","CUP_B_HIL_Soldier_MAT_SF","CUP_B_HIL_GL_SF","CUP_B_HIL_Medic_SF","CUP_B_HIL_M_SF"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.7],
	// CUP_B_HIL_InfantrySection
	[[[["CUP_B_HIL_Soldier_SF","CUP_B_HIL_Soldier_PM_SF","CUP_B_HIL_Soldier_SF","CUP_B_HIL_Soldier_LAT_SF"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// CUP_B_HIL_InfantrySectionAT
	[[[["CUP_B_HIL_Soldier_HAT_SF","CUP_B_HIL_Soldier_HAT_SF","CUP_B_HIL_Soldier_MAT_SF","CUP_B_HIL_Soldier_MAT_SF"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.2],
	// CUP_B_HIL_MarksmanTeam
	[[[["CUP_B_HIL_M_SF","CUP_B_HIL_M_SF"],[[0,5,0],[3,0,0]],["SERGEANT","SERGEANT"]]],0.05],
	// CUP_B_HIL_ScoutSection
	[[[["CUP_B_HIL_Scout_MP5_SF","CUP_B_HIL_Scout_SF","CUP_B_HIL_Scout_MP7_SF","CUP_B_HIL_Scout_SF"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.2],
	// CUP_B_HIL_DiverSection
	[[[["CUP_B_HIL_Diver_MP5_SF","CUP_B_HIL_Diver_MP7_SF","CUP_B_HIL_Diver_MP5_SF","CUP_B_HIL_Diver_MP7_SF"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.01]
];
if (_landing in [1,4,24,34]) then {
	_arr append [
		[[[["CUP_B_LCU1600_HIL"],[],[]],[["CUP_B_Leopard2A6_HIL","CUP_B_Leopard2A6_HIL","CUP_B_Leopard2A6_HIL"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT"]]],0.1],
		[[[["CUP_B_LCU1600_HIL"],[],[]],[["CUP_B_Boxer_GMG_HIL","CUP_B_Boxer_GMG_HIL","CUP_B_Boxer_GMG_HIL"],[[0,10,0],[5,0,0],[10,0,0]],["CAPTAIN","LIEUTENANT","SERGEANT"]]],0.1]
	];
};
[_groups_map, west, "CUP_B_HIL",
	[_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [225,999],
	["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
] call gosa_fnc_map_groups_add;

//-- CUP_B_AFU
// TODO: Баланс.
_arr = [
	// CUP_B_AFU_Motorized_Team
	[[[["CUP_B_AFU_Soldier_SquadLeader","CUP_B_AFU_Soldier_Grenadier","CUP_B_AFU_Soldier_Engineer","CUP_B_AFU_Soldier_Medic","CUP_B_Tigr_M_233114_GREEN_AFU"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_AFU_Motorized_SOF_Team
	[[[["CUP_B_AFU_SF_TeamLeader","CUP_B_AFU_SF_Marksman","CUP_B_AFU_SF_Medic","CUP_B_AFU_SF_OperatorAssault","CUP_B_nM1151_Unarmed_DF_AFU"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT"]]
	],0.1],
	// CUP_B_Motorized_Squad
	[[[["CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Grenadier","CUP_B_AFU_Soldier_Marksman","CUP_B_AFU_Soldier_SquadLeader","CUP_B_AFU_Soldier_Autorifleman","CUP_B_AFU_Soldier_AAR","CUP_B_AFU_Soldier_Grenadier","CUP_B_nM1151_Unarmed_AFU","CUP_B_nM1151_Unarmed_AFU"],[[0,0,0],[5,-4.9502,0],[-5,-4.9502,0],[10,-9.9502,0],[-10,-9.9502,0],[15,-14.9502,0],[-15,-14.9502,0],[27.5,-27.5,0.148561],[-27.5,-27.5,0.148561]],["PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_Motorized_Assault_Team
	[[[["CUP_B_AFU_Soldier_SquadLeader","CUP_B_AFU_Soldier_Medic","CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Autorifleman","CUP_B_AFU_Soldier_AAR","CUP_B_AFU_Soldier_Grenadier","CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Machinegunner","CUP_B_AFU_Soldier_AMG","CUP_B_AFU_Soldier_Grenadier","CUP_B_AFU_Soldier_Marksman","CUP_B_Ural_AFU"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0],[30,-30,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_Motorized_Recon
	[[[["CUP_B_AFU_Soldier_ReconTL","CUP_B_AFU_Soldier_ReconDemo","CUP_B_AFU_Soldier_ReconScoutAT","CUP_B_AFU_Soldier_ReconMedic","CUP_B_UAZ_Unarmed_AFU"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.1],

	// CUP_B_AFU_Mechanized_Team
	[[[["CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Autorifleman","CUP_B_AFU_Soldier_AAR","CUP_B_AFU_Soldier_Grenadier","CUP_B_BTR60_AFU"],[[0,0,0],[5,-4.9502,0],[-5,-4.9502,0],[10,-9.9502,0],[-18.5,-18.5,0.129148]],["PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.8],
	// CUP_B_Mechanized_Assault_Squad
	[[[["CUP_B_AFU_Soldier_SquadLeader","CUP_B_AFU_Soldier_Medic","CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Autorifleman","CUP_B_AFU_Soldier_AAR","CUP_B_AFU_Soldier_Grenadier","CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Machinegunner","CUP_B_AFU_Soldier_AMG","CUP_B_AFU_Soldier_Grenadier","CUP_B_AFU_Soldier_Marksman","CUP_B_MTLB_pk_AFU","CUP_B_MTLB_pk_AFU"],[[0,0,0],[5,-4.9502,0],[-5,-4.9502,0],[10,-9.9502,0],[-10,-9.9502,0],[15,-14.9502,0],[-15,-14.9502,0],[20,-19.9502,0],[-20,-19.9502,0],[25,-24.9502,0],[-25,-24.9502,0],[-37.5,-42.5,-0.0764389],[-57.5,-72.5,-0.0764389]],["PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_Mechanized_Recon_Squad
	[[[["CUP_B_AFU_Soldier_ReconTL","CUP_B_AFU_Soldier_ReconDemo","CUP_B_AFU_Soldier_ReconGL","CUP_B_AFU_Soldier_ReconMarksman","CUP_B_AFU_Soldier_ReconMedic","CUP_B_AFU_Soldier_ReconScout","CUP_B_AFU_Soldier_ReconScoutAT","CUP_B_BTR60_AFU"],[[0,0,0],[5,-4.9502,0],[-5,-4.9502,0],[10,-9.9502,0],[-10,-9.9502,0],[15,-14.9502,0],[-15,-14.9502,0],[28.5,-28.5,0.129148]],["PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_Mechanized_AA_Team
	[[[["CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_MissileSoldier_AA","CUP_B_AFU_Soldier_MissileSoldier_AA","CUP_B_AFU_Soldier_Rifleman_1P90","CUP_B_M6LineBacker_AFU","CUP_B_UAZ_Unarmed_AFU"],[[0,0,0],[5,-4.9502,0],[-5,-4.9502,0],[10,-9.9502,0],[-18.5,-23.4995,0.103352],[23.5,-23.5,-0.0146389]],["PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_Mechanized_Squad
	[[[["CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Autorifleman","CUP_B_AFU_Soldier_AAR","CUP_B_AFU_Soldier_Grenadier","CUP_B_AFU_Soldier_Grenadier","CUP_B_AFU_Soldier_Medic","CUP_B_M2A3Bradley_AFU"],[[14.5,11.5498,-2.49514],[-12.5,-17.4502,-2.49514],[19.5,6.5498,-2.49514],[-17.5,-22.4502,-2.49514],[24.5,1.5498,-2.49514],[-22.5,-27.4502,-2.49514],[0,0,-2.39179]],["PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.8],

	// CUP_B_Leopard_Platoon
	[[[["CUP_B_Leopard2A6Green_UA","CUP_B_Leopard2A6Green_UA","CUP_B_Leopard2A6Green_UA","CUP_B_Leopard2A6Green_UA"],[[0,0,-1.09892],[-21,-31,-1.09892],[-42,-62,-1.09892],[-63,-93,-1.09892]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]
	],0.3],
	// CUP_B_Abrams_Platoon
	[[[["CUP_B_M1A1_TUSK_AFU","CUP_B_M1A1_TUSK_AFU","CUP_B_M1A1_TUSK_AFU","CUP_B_M1A1_TUSK_AFU"],[[0,0,-2.71232],[-21,-31,-2.71232],[-42,-62,-2.71232],[-63,-93,-2.71232]],["CAPTAIN","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]
	],0.3],
	// CUP_B_Leopard_Section
	[[[["CUP_B_Leopard2A6_UA","CUP_B_Leopard2A6_UA"],[[0,0,-1.09892],[-21,-31,-1.09892]],["CAPTAIN","LIEUTENANT"]]
	],0.3],
	// CUP_B_Abrams_Sectiop
	[[[["CUP_B_M1A1_TUSK_AFU","CUP_B_M1A1_TUSK_AFU"],[[0,0,-2.71232],[-21,-31,-2.71232]],["CAPTAIN","LIEUTENANT"]]
	],0.3],

	// CUP_B_MI24_Squadron
	[[[["CUP_B_Mi24_D_Dynamic_AFU","CUP_B_Mi24_D_Dynamic_AFU"],[[0.0878906,-5.61133,-1.81773],[-49.9121,-105.611,-1.81773]],["PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_MI8_Squadron
	[[[["CUP_B_Mi17_AFU","CUP_B_Mi17_AFU"],[[0.583984,-5.69922,-1.51228],[-50.416,-106.699,-1.51228]],["PRIVATE","PRIVATE"]]
	],0.1],

	// CUP_B_Medevac_Squadron
	[[[["CUP_B_Mi24_D_Dynamic_AFU","CUP_B_Mi17_medevac_AFU"],[[0.0878906,-5.61133,-1.81773],[-49.897,-104.994,-1.81773]],["PRIVATE","PRIVATE"]]
	],0]
];
_arr append [
	// CUP_B_AFU_SF_Team
	[[[["CUP_B_AFU_SF_TeamLeader","CUP_B_AFU_SF_Medic","CUP_B_AFU_SF_Autorifleman","CUP_B_AFU_SF_Operator","CUP_B_AFU_SF_OperatorAssault"],[[0,0,0],[4.6333,-4.89453,0],[-4.51563,-4.84668,0],[9.28711,-9.70996,0],[-9.09766,-9.64844,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_AFU_SF_Squad
	[[[["CUP_B_AFU_SF_TeamLeader","CUP_B_AFU_SF_Autorifleman","CUP_B_AFU_SF_DroneOperator","CUP_B_AFU_SF_FAC","CUP_B_AFU_SF_MachineGunner","CUP_B_AFU_SF_Marksman","CUP_B_AFU_SF_Medic","CUP_B_AFU_SF_Operator","CUP_B_AFU_SF_OperatorAssault"],[[0,0,0],[4.59326,-4.78564,0],[-4.56592,-4.76074,0],[9.26318,-9.59082,0],[-9.15332,-9.50781,0],[13.8774,-14.3208,0],[-13.8149,-14.3179,0],[18.5405,-19.0864,0],[-18.3906,-19.0747,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_AFU_HQ
	[[[["CUP_B_AFU_Soldier_SquadLeader","CUP_B_AFU_Soldier_Medic"],[[0,0,0],[4.62988,-4.79346,0]],["LIEUTENANT","SERGEANT"]]
	],0.1],
	// CUP_B_AFU_FireTeam
	[[[["CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Autorifleman","CUP_B_AFU_Soldier_AAR","CUP_B_AFU_Soldier_Grenadier"],[[0,0,0],[4.55957,-4.81348,0],[-4.53906,-4.81543,0],[9.27881,-9.521,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.2],
	// CUP_B_AFU_ATTeam
	[[[["CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_ATSpecialist","CUP_B_AFU_Soldier_AAT","CUP_B_AFU_Soldier_Rifleman"],[[0,0,0],[4.57764,-4.76074,0],[-4.64746,-4.81201,0],[9.32275,-9.44775,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.4],
	// CUP_B_AFU_MachinegunTeam
	[[[["CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Machinegunner","CUP_B_AFU_Soldier_AMG","CUP_B_AFU_Soldier_Grenadier"],[[0,0,0],[4.65234,-4.82715,0],[-4.59766,-4.80127,0],[9.32275,-9.49902,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.2],
	// CUP_B_AFU_AntiAirTeam
	[[[["CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_MissileSoldier_AA","CUP_B_AFU_Soldier_MissileSoldier_AA","CUP_B_AFU_Soldier_Rifleman_1P90"],[[0,0,0],[4.67969,-4.80176,0],[-4.61914,-4.80762,0],[9.3667,-9.45166,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_AFU_SniperTeam
	[[[["CUP_B_AFU_Soldier_Sniper_AM","CUP_B_AFU_Soldier_Spotter"],[[0,0,0],[4.64795,-4.63379,0]],["LIEUTENANT","SERGEANT"]]
	],0.05],
	// CUP_B_AFU_HeavyATTeam
	[[[["CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_ATSpecialist_METIS","CUP_B_AFU_Soldier_ATSpecialist_METIS","CUP_B_AFU_Soldier_ATSpecialist"],[[0,0,0],[4.55908,-4.80762,0],[-4.58691,-4.78711,0],[9.27148,-9.50391,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_AFU_InfantySquad
	[[[["CUP_B_AFU_Soldier_SquadLeader","CUP_B_AFU_Soldier_Medic","CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Autorifleman","CUP_B_AFU_Soldier_AAR","CUP_B_AFU_Soldier_Grenadier","CUP_B_AFU_Soldier_TeamLeader","CUP_B_AFU_Soldier_Machinegunner","CUP_B_AFU_Soldier_AMG","CUP_B_AFU_Soldier_Grenadier"],[[0,0,0],[4.6499,-4.78906,0],[-5.02881,-5.44824,0],[9.1792,-9.81299,0],[-9.66992,-10.0015,0],[13.8618,-14.6069,0],[-14.3789,-14.7549,0],[18.876,-20.1802,0],[-19.0127,-19.5986,0],[22.6597,-23.8564,0]],["PRIVATE","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.8],
	// CUP_B_AFU_ReconPatrol
	[[[["CUP_B_AFU_Soldier_ReconTL","CUP_B_AFU_Soldier_ReconMedic","CUP_B_AFU_Soldier_ReconMarksman","CUP_B_AFU_Soldier_ReconDemo","CUP_B_AFU_Soldier_ReconMarksman"],[[0,0,0],[4.60645,-4.75977,0],[-4.62646,-4.85107,0],[9.26465,-9.56445,0],[-9.20996,-9.61621,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_AFU_ReconSquad
	[[[["CUP_B_AFU_Soldier_ReconTL","CUP_B_AFU_Soldier_ReconDemo","CUP_B_AFU_Soldier_ReconGL","CUP_B_AFU_Soldier_ReconMarksman","CUP_B_AFU_Soldier_ReconMedic","CUP_B_AFU_Soldier_ReconScout","CUP_B_AFU_Soldier_ReconScoutAT"],[[0,0,0],[4.54932,-4.8833,0],[-4.61475,-4.90234,0],[9.18945,-9.68652,0],[-9.20996,-9.75293,0],[13.8037,-14.5264,0],[-13.8408,-14.5957,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]
	],0.1]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "CUP_B_AFU", _arr,
	[1990,2100], [160,274],
	["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
] call gosa_fnc_map_groups_add;

// ILDU
/*
_arr = [
	// CUP_B_AFU_ILDU_Command
	[[[["CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_MedicGB"],[[0,0,0],[4.72705,-4.70166,0]],["LIEUTENANT","SERGEANT"]]
	],0.7],
	// CUP_B_AFU_ILDU_ATTeam
	[[[["CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_ATSpecialistUSA","CUP_B_ILDU_Soldier_ATSpecialistUSA","CUP_B_ILDU_Soldier_RiflemanATCZ"],[[0,0,0],[4.53906,-4.77686,0],[-4.61035,-4.82568,0],[9.20264,-9.46533,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_ILDU_WeaponsTeam
	[[[["CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_MachinegunnerCZ","CUP_B_ILDU_Soldier_GrenadierGB","CUP_B_ILDU_Soldier_RiflemanUSAT"],[[0,0,0],[4.55078,-4.80469,0],[-4.56836,-4.76709,0],[9.25635,-9.4668,0]],["PRIVATE","CORPORAL","SERGEANT","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_ILDU_Fireteam
	[[[["CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_GrenadierGB","CUP_B_ILDU_Soldier_RiflemanFR","CUP_B_ILDU_Soldier_RiflemanUS"],[[0,0,0],[4.56641,-4.78809,0],[-4.56689,-4.82617,0],[9.20703,-9.42285,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_ILDU_SupportTeam
	[[[["CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_EngineerDE","CUP_B_ILDU_Soldier_MedicGB","CUP_B_ILDU_Soldier_EngineerDE"],[[0,0,0],[4.5459,-4.86768,0],[-4.6665,-4.81494,0],[9.22119,-9.59521,0]],["PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_IDLU_FireTeam2
	[[[["CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_RiflemanBE","CUP_B_ILDU_Soldier_MarksmanDE","CUP_B_ILDU_Soldier_RiflemanFR"],[[0,0,0],[4.58594,-4.83154,0],[-4.6792,-4.77637,0],[9.34473,-9.49561,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_IDLU_Fireteam3
	[[[["CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_ARUS","CUP_B_ILDU_Soldier_MarksmanDE","CUP_B_ILDU_Soldier_MedicGB"],[[0,0,0],[4.59473,-4.7793,0],[-4.62549,-4.83594,0],[9.29492,-9.52148,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_ILDU_RifleSquad
	[[[["CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_MedicGB","CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_RiflemanBE","CUP_B_ILDU_Soldier_MarksmanDE","CUP_B_ILDU_Soldier_RiflemanFR","CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_GrenadierGB","CUP_B_ILDU_Soldier_RiflemanFR","CUP_B_ILDU_Soldier_RiflemanUS"],[[0,0,0],[4.72656,-4.70117,0],[-4.59131,-5.28662,0],[9.37305,-9.85547,0],[-9.15967,-9.89258,0],[13.9932,-14.6431,0],[-13.7363,-14.7212,0],[19.3052,-19.8926,0],[-18.3154,-19.6841,0],[23.855,-24.5508,0]],["LIEUTENANT","SERGEANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_ILDU_WeaponsSquad
	[[[["CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_MedicGB","CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_MachinegunnerCZ","CUP_B_ILDU_Soldier_GrenadierGB","CUP_B_ILDU_Soldier_RiflemanUSAT","CUP_B_ILDU_Soldier_TeamleaderUS","CUP_B_ILDU_Soldier_ARUS","CUP_B_ILDU_Soldier_MarksmanDE","CUP_B_ILDU_Soldier_MedicGB"],[[0,0,0],[4.72705,-4.70068,0],[-4.69824,-4.73535,0],[9.30078,-9.85352,0],[-9.31738,-9.56934,0],[13.9106,-14.5332,0],[-13.9985,-14.3188,0],[18.8237,-19.106,0],[-18.5342,-19.1289,0],[23.4453,-23.8003,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","SERGEANT","PRIVATE","SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_ILDU_ReconTeam
	[[[["CUP_B_ILDU_Soldier_ReconTeamLeader","CUP_B_ILDU_Soldier_ReconMarksman","CUP_B_ILDU_Soldier_ReconScout","CUP_B_ILDU_Soldier_ReconDemoSpecialist","CUP_B_ILDU_Soldier_ReconParamedic"],[[0,0,0],[4.7168,-4.68701,0],[-4.68652,-4.69775,0],[9.33936,-9.42041,0],[-9.29883,-9.37939,0]],["LIEUTENANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_ILDU_ReconSquad
	[[[["CUP_B_ILDU_Soldier_ReconTeamLeader","CUP_B_ILDU_Soldier_ReconParamedic","CUP_B_ILDU_Soldier_ReconDemoSpecialist","CUP_B_ILDU_Soldier_ReconGrenadier","CUP_B_ILDU_Soldier_ReconMarksman","CUP_B_ILDU_Soldier_ReconScout","CUP_B_ILDU_Soldier_ReconScoutAT","CUP_B_ILDU_Soldier_ReconScout"],[[0,0,0],[4.64795,-4.81592,0],[-4.604,-4.83301,0],[9.22852,-9.62939,0],[-9.13379,-9.70459,0],[13.7529,-14.5054,0],[-13.7627,-14.5723,0],[18.395,-19.2329,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
	],0.7],
	// CUP_B_AFU_ILDU_SniperTeam
	[[[["CUP_B_ILDU_Soldier_SniperGB","CUP_B_ILDU_Soldier_SpotterGB"],[[0,0,0],[4.5542,-4.97656,0]],["LIEUTENANT","SERGEANT"]]
	],0.7]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "CUP_B_AFU", _arr,
	[1990,2100], [160,249],
	["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
] call gosa_fnc_map_groups_add;
*/

// FIXME: TDF для Altis слишком пустынный.
_arr = [
	// CUP_B_AFU_TDF_HQElement
	[[[["CUP_B_TDF_Soldier_SquadLeader","CUP_B_TDF_Soldier_Medic"],[[0,0,0],[4.63379,-4.62695,0]],["LIEUTENANT","SERGEANT"]]
	],0.1],
	// CUP_B_AFU_TDF_Fireteam
	[[[["CUP_B_TDF_Solider_TeamLeader","CUP_B_TDF_Soldier_Autorifleman","CUP_B_TDF_Soldier_AAR","CUP_B_TDF_Soldier_Grenatier_AKM"],[[0,0,0],[4.6582,-4.78467,0],[-4.66113,-4.79688,0],[9.32178,-9.44482,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.2],
	// CUP_B_AFU_TDF_Fireteam_2
	[[[["CUP_B_TDF_Solider_TeamLeader","CUP_B_TDF_Soldier_Grenadier","CUP_B_TDF_Soldier_Marksman","CUP_B_TDF_Soldier_Rifleman_Ammo"],[[0,0,0],[4.6582,-4.80078,0],[-4.64355,-4.76904,0],[9.43213,-9.46143,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.2],
	// CUP_B_AFU_TDF_Fireteam_3
	[[[["CUP_B_TDF_Solider_TeamLeader","CUP_B_TDF_Soldier_Grenadier","CUP_B_TDF_Soldier_Rifleman_PSO","CUP_B_TDF_Soldier_Rifleman_SKS"],[[0,0,0],[4.6748,-4.81201,0],[-4.62646,-4.771,0],[9.40869,-9.43896,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.2],
	// CUP_B_AFU_TDF_Engineering
	[[[["CUP_B_TDF_Solider_TeamLeader","CUP_B_TDF_Soldier_Engineer","CUP_B_TDF_Soldier_Engineer","CUP_B_TDF_Soldier_Engineer"],[[0,0,0],[4.58008,-4.75977,0],[-4.56055,-4.78613,0],[9.37109,-9.41992,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.1],
	// CUP_B_AFU_TDF_MachinegunTeam
	[[[["CUP_B_TDF_Solider_TeamLeader","CUP_B_TDF_Soldier_Machinegunner","CUP_B_TDF_Soldier_AMG","CUP_B_TDF_Soldier_Rifleman_AT"],[[0,0,0],[4.5459,-4.77344,0],[-4.59473,-4.80518,0],[9.21045,-9.39502,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.2],
	// CUP_B_AFU_TDF_ATTeam
	[[[["CUP_B_TDF_Solider_TeamLeader","CUP_B_TDF_Soldier_ATSpecialist","CUP_B_TDF_Soldier_ATSpecialist","CUP_B_TDF_Soldier_Rifleman_AT"],[[0,0,0],[4.59131,-4.70703,0],[-4.5874,-4.72559,0],[9.31006,-9.39307,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]
	],0.4],
	// CUP_B_AFU_TDF_Squad
	[[[["CUP_B_TDF_Soldier_SquadLeader","CUP_B_TDF_Soldier_Medic","CUP_B_TDF_Solider_TeamLeader","CUP_B_TDF_Soldier_Grenadier","CUP_B_TDF_Soldier_Rifleman_PSO","CUP_B_TDF_Soldier_Rifleman_SKS","CUP_B_TDF_Solider_TeamLeader","CUP_B_TDF_Soldier_Machinegunner","CUP_B_TDF_Soldier_AMG","CUP_B_TDF_Soldier_Rifleman_AT"],[[0,0,0],[4.6333,-4.62695,0],[-4.60498,-5.02393,0],[9.64355,-10.0186,0],[-9.2124,-9.68555,0],[14.7363,-13.9766,0],[-14.4106,-14.249,0],[19.2847,-19.4497,0],[-18.9863,-19.1138,0],[23.9072,-24.7021,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
	],0.8],
	// CUP_B_AFU_DemoTeam
	[[[["CUP_B_TDF_Solider_TeamLeader","CUP_B_TDF_Soldier_Sapper","CUP_B_TDF_Soldier_Sapper_2","CUP_B_TDF_Soldier_Engineer"],[[0,0,0],[4.72021,-4.73779,0],[-4.72949,-4.72559,0],[9.37402,-9.51123,0]],["SERGEANT","PRIVATE","SERGEANT","PRIVATE"]]
	],0.1]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "CUP_B_AFU", _arr,
	[1990,2100], [275,999],
	["BLU_G_F","BLU_F","BLU_T_F","BLU_NATO_lxWS","BLU_TURA_lxWS","BLU_W_F"]
] call gosa_fnc_map_groups_add;


//-- CUP_I_NAPA
	[_groups_map, resistance, "CUP_I_NAPA", [[
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
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [160,250],
	["IND_SFIA_lxWS","IND_E_F","IND_C_F","IND_F","IND_G_F"]
	] call gosa_fnc_map_groups_add;

//-- CUP_I_PMC_ION
	[_groups_map, resistance, "CUP_I_PMC_ION", [[
			// configName CUP_I_PMC_Winter_ION_Field_Security_Patrol
			[[[["CUP_I_PMC_Winter_Soldier_GL","CUP_I_PMC_Winter_Soldier_GL","CUP_I_PMC_Winter_Soldier_M4A3","CUP_I_PMC_Winter_Soldier_M4A3"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_I_PMC_Winter_ION_Field_Security_Team
			[[[["CUP_I_PMC_Winter_Soldier_TL","CUP_I_PMC_Winter_Sniper","CUP_I_PMC_Winter_Soldier_AT","CUP_I_PMC_Winter_Soldier_MG","CUP_I_PMC_Winter_Soldier_GL","CUP_I_PMC_Winter_Soldier_M4A3"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_I_PMC_Winter_ION_Security_Detail
			[[[["CUP_I_PMC_Winter_Soldier_TL","CUP_I_PMC_Winter_Sniper","CUP_I_PMC_Winter_Soldier_AT","CUP_I_PMC_Winter_Soldier_MG","CUP_I_PMC_Winter_Soldier_MG_PKM","CUP_I_PMC_Winter_Soldier_GL","CUP_I_PMC_Winter_Soldier_GL","CUP_I_PMC_Winter_Soldier_M4A3","CUP_I_PMC_Winter_Soldier","CUP_I_PMC_Winter_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_I_PMC_Winter_ION_Security_Specialists
			[[[["CUP_I_PMC_Winter_Soldier_TL","CUP_I_PMC_Winter_Sniper_KSVK","CUP_I_PMC_Winter_Soldier_AT","CUP_I_PMC_Winter_Soldier_MG","CUP_I_PMC_Winter_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_I_PMC_Winter_ION_Field_Support_Team
			[[[["CUP_I_PMC_Winter_Soldier_GL","CUP_I_PMC_Winter_Soldier_GL","CUP_I_PMC_Winter_Engineer","CUP_I_PMC_Winter_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","SERGEANT"]]],0.5]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [-999,149],
	["BLU_ION_lxWS"]
	] call gosa_fnc_map_groups_add;

	[_groups_map, resistance, "CUP_I_PMC_ION", [[
			// configName CUP_I_PMC_ION_Patrol
			[[[["CUP_I_PMC_Bodyguard_M4","CUP_I_SUV_ION","CUP_I_PMC_Bodyguard_AA12"],[[3,5,0],[-5,0,0],[5,0,0]],["SERGEANT","CORPORAL","CORPORAL"]]],0.4],
			// configName CUP_I_PMC_ION_Tactical_Patrol
			[[[["CUP_I_PMC_Soldier_TL","CUP_I_SUV_ION","CUP_I_SUV_ION","CUP_I_PMC_Sniper","CUP_I_PMC_Soldier_AT","CUP_I_PMC_Bodyguard_AA12","CUP_I_PMC_Soldier_GL","CUP_I_PMC_Bodyguard_M4"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
			// configName CUP_I_PMC_ION_Armored_Patrol
			[[[["CUP_I_PMC_Soldier_TL","CUP_I_SUV_Armored_ION","CUP_I_SUV_Armored_ION","CUP_I_PMC_Sniper","CUP_I_PMC_Bodyguard_M4","CUP_I_PMC_Soldier_MG_PKM","CUP_I_PMC_Soldier_GL","CUP_I_PMC_Soldier_GL"],[[3,5,0],[-5,0,0],[-5,-7,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
			// configName CUP_I_PMC_ION_VIP_Bodyguard
			[[[["CUP_I_PMC_Soldier_TL","CUP_I_PMC_Bodyguard_AA12","CUP_I_PMC_Bodyguard_M4"],[[0,5,0],[3,0,0],[5,0,0]],["LIEUTENANT","CORPORAL","CORPORAL"]]],0.5],
			// configName CUP_I_PMC_ION_Field_Security_Patrol
			[[[["CUP_I_PMC_Soldier_GL","CUP_I_PMC_Soldier_GL_M16A2","CUP_I_PMC_Soldier_M4A3","CUP_I_PMC_Soldier_M4A3"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_I_PMC_ION_Field_Security_Team
			[[[["CUP_I_PMC_Soldier_TL","CUP_I_PMC_Sniper","CUP_I_PMC_Soldier_AT","CUP_I_PMC_Soldier_MG","CUP_I_PMC_Soldier_GL","CUP_I_PMC_Soldier_M4A3"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_I_PMC_ION_Security_Detail
			[[[["CUP_I_PMC_Soldier_TL","CUP_I_PMC_Sniper","CUP_I_PMC_Soldier_AT","CUP_I_PMC_Soldier_MG","CUP_I_PMC_Soldier_MG_PKM","CUP_I_PMC_Soldier_GL","CUP_I_PMC_Soldier_GL_M16A2","CUP_I_PMC_Soldier_M4A3","CUP_I_PMC_Soldier","CUP_I_PMC_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0],[19,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_I_PMC_ION_Security_Specialists
			[[[["CUP_I_PMC_Soldier_TL","CUP_I_PMC_Sniper_KSVK","CUP_I_PMC_Soldier_AT","CUP_I_PMC_Soldier_MG","CUP_I_PMC_Soldier"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
			// configName CUP_I_PMC_ION_Field_Support_Team
			[[[["CUP_I_PMC_Soldier_GL_M16A2","CUP_I_PMC_Soldier_GL","CUP_I_PMC_Engineer","CUP_I_PMC_Medic"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","SERGEANT"]]],0.5]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [150,999],
	["BLU_ION_lxWS"]
	] call gosa_fnc_map_groups_add;

//-- CUP_I_UN
	_arr = [
			// configName CUP_I_UN_Patrol_MNT
			[[[["CUP_I_UN_CDF_Officer_MNT","CUP_I_UN_CDF_Soldier_MNT","CUP_I_UN_CDF_Soldier_AT_MNT","CUP_I_UN_CDF_Soldier_MG_MNT"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
			// configName CUP_I_UN_Patrol_FST
			[[[["CUP_I_UN_CDF_Officer_FST","CUP_I_UN_CDF_Soldier_FST","CUP_I_UN_CDF_Soldier_AT_FST","CUP_I_UN_CDF_Soldier_MG_FST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
	];
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_I_ZUBR_UN"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	[_groups_map, resistance, "CUP_I_UN", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [160,250],
	["CUP_B_CDF","BLU_UN_lxWS"]
	] call gosa_fnc_map_groups_add;
	_arr = [
			// configName CUP_I_UN_MotorizedPatrol
			[[[["CUP_I_UN_CDF_Guard","CUP_I_UAZ_Unarmed_UN","CUP_I_UN_CDF_Soldier","CUP_I_UN_CDF_Soldier_MG"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.6],
			// configName CUP_I_UN_MechanizedPatrolBMP2
			[[[["CUP_I_UN_CDF_Soldier_SL","CUP_I_BMP2_UN","CUP_I_UN_CDF_Soldier_AT","CUP_I_UN_CDF_Soldier_AT","CUP_I_UN_CDF_Soldier_MG","CUP_I_UN_CDF_Soldier_MG","CUP_I_UN_CDF_Soldier","CUP_I_UN_CDF_Soldier"],[[3,5,0],[-5,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_I_UN_MechanizedPatrolM113
			[[[["CUP_I_UN_CDF_Soldier_SL","CUP_I_M113_UN","CUP_I_UN_CDF_Soldier_AT","CUP_I_UN_CDF_Soldier_MG","CUP_I_UN_CDF_Soldier_MG","CUP_I_UN_CDF_Soldier","CUP_I_UN_CDF_Soldier"],[[0,5,0],[-5,0,0],[3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0]],["SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
			// configName CUP_I_UN_Patrol_DST
			[[[["CUP_I_UN_CDF_Officer_DST","CUP_I_UN_CDF_Soldier_DST","CUP_I_UN_CDF_Soldier_AT_DST","CUP_I_UN_CDF_Soldier_MG_DST"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0]],["SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
	];
	if (count gosa_zone_lighthouse > 0) then {
	_arr append [
		[[[["CUP_I_ZUBR_UN"],[],["CAPTAIN"]]], _depth min 0.5]
	];
	};
	[_groups_map, resistance, "CUP_I_UN", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1990,2100], [251,999,1],
	["CUP_B_CDF","BLU_UN_lxWS"]
	] call gosa_fnc_map_groups_add;
