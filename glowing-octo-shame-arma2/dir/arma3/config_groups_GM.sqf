/*
 * TODO: Баланс.
 */

// east
_arr = [
	// configName gm_gc_bgs_infantry_post_str
	[[[["gm_gc_bgs_rifleman_mpikm72_80_str","gm_gc_bgs_rifleman_mpikm72_80_str"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
	// configName gm_gc_bgs_sf_infantry_specops_str
	[[[["gm_gc_bgs_sf_squadleader_hk33_80_str","gm_gc_bgs_sf_rifleman_hk33_80_str","gm_gc_bgs_sf_marksman_svd_80_str","gm_gc_bgs_sf_rifleman_pm63_80_str","gm_gc_bgs_sf_demolition_pm63_80_str","gm_gc_bgs_sf_rifleman_hk33_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],

	// configName gm_gc_army_motorizedinfantly_squad_ural4320_cargo_80
	[[[["gm_gc_army_ural4320_cargo_oli","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_gc_army_motorizedinfantly_squad_bmp1sp2
	[[[["gm_gc_army_bmp1sp2_oli","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE"],[],1]],0.5],
	// configName gm_gc_army_motorizedinfantly_squad_BTR60PB_80
	[[[["gm_gc_army_btr60pb_oli","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_gc_army_motorizedinfantly_squad_BTR60PA_80
	[[[["gm_gc_army_btr60pa_oli","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_gc_army_motorizedinfantly_squad_BTR60PA_DSHKM_80
	[[[["gm_gc_army_btr60pa_dshkm_oli","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_gc_army_motorizedinfantly_squad_ural375d_cargo_80
	[[[["gm_gc_army_ural375d_cargo_oli","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],

	// configName gm_platoon_gm_gc_army_t55a_oli
	[[[["gm_gc_army_t55a_oli","gm_gc_army_t55a_oli","gm_gc_army_t55a_oli"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.5],
	// configName gm_platoon_gm_gc_army_t55am2_oli
	[[[["gm_gc_army_t55am2b_oli","gm_gc_army_t55am2_oli","gm_gc_army_t55am2_oli"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.5],
	// configName gm_platoon_gm_gc_army_btr60pu12_oli_gm_gc_army_zsu234v1_oli
	[[[["gm_gc_army_btr60pu12_oli","gm_gc_army_zsu234v1_oli","gm_gc_army_zsu234v1_oli","gm_gc_army_zsu234v1_oli","gm_gc_army_zsu234v1_oli"],[[0,0,0],[10,-10,0],[-10,-10,0],[-10,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.01],
	// configName gm_platoon_gm_gc_army_zsu234v1_oli
	[[[["gm_gc_army_zsu234v1_oli","gm_gc_army_zsu234v1_oli"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.1],
	// configName gm_platoon_gm_gc_army_pt76b_oli
	[[[["gm_gc_army_pt76b_oli","gm_gc_army_pt76b_oli"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// configName gm_platoon_gm_gc_army_brdm2_oli
	[[[["gm_gc_army_brdm2_oli","gm_gc_army_brdm2_oli"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// configName gm_gc_army_infantry_squad_str
	[[[["gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_mggroup_str
	[[[["gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_machinegunner_pk_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_str"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_atgroup_str
	[[[["gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_aagroup_str
	[[[["gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antiair_mpiak74n_9k32m_80_str","gm_gc_army_antiair_mpiak74n_9k32m_80_str"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// configName gm_ge_army_infantry_atgmgroup_str
	[[[["gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_fagot_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_gc_army_sf_infantry_specops_str
	[[[["gm_gc_army_sf_squadleader_mpikms72_80_str","gm_gc_army_sf_machinegunner_lmgrpk_80_str","gm_gc_army_sf_marksman_svd_80_str","gm_gc_army_sf_antitank_mpikms72_rpg7_80_str","gm_gc_army_sf_demolition_pm63_80_str","gm_gc_army_sf_antitank_mpikms72_rpg18_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
];
_arr append [
	// configName gm_gc_army_supply_team_01
	[[[["gm_gc_army_ural4320_repair_oli","gm_gc_army_ural375d_refuel_oli","gm_gc_army_ural4320_reammo_oli"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["gm_gc_army_ural375d_medic"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.025],
	[[[["gm_gc_bgs_ural375d_medic"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.025]
];
_arr append [
	[[[["gm_gc_airforce_mi2us","gm_gc_airforce_mi2us"],[[0,0,0],[10,-10,0]],["CAPITAN","CAPITAN"]]],0.1],
	[[[["gm_gc_airforce_mi2urn","gm_gc_airforce_mi2urn"],[[0,0,0],[10,-10,0]],["CAPITAN","CAPITAN"]]],0.1],
	[[[["gm_gc_airforce_l410t"],[],["LIEUTENANT"]],
		[["gm_gc_army_sf_squadleader_mpikms72_80_str","gm_gc_army_sf_machinegunner_lmgrpk_80_str","gm_gc_army_sf_marksman_svd_80_str","gm_gc_army_sf_antitank_mpikms72_rpg7_80_str","gm_gc_army_sf_demolition_pm63_80_str","gm_gc_army_sf_antitank_mpikms72_rpg18_80_str"]]
		],0.1]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// configName gm_platoon_gm_gc_army_2p16_oli
		[[[["gm_gc_army_2p16_oli","gm_gc_army_2p16_oli"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.01],
		// configName gm_platoon_gm_gc_army_2s1_oli
		[[[["gm_gc_army_2s1_oli","gm_gc_army_2s1_oli","gm_gc_army_2s1_oli"],[[0,0,0],[10,-10,0],[-10,-10,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.1],
		// configName gm_platoon_gm_gc_army_ural375d_mlrs_oli
		[[[["gm_gc_army_ural375d_mlrs_oli","gm_gc_army_ural375d_mlrs_oli","gm_gc_army_ural375d_mlrs_oli","gm_gc_army_ural375d_mlrs_oli"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1]
	];
};
[_groups_map, east, "gm_gc_army", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1960,1990], [160,999],
[]
] call gosa_fnc_map_groups_add;

// gm_gc_army_win
_arr = [
	// gm_gc_army_motorizedinfantly_squad_ural4320_cargo_80
	[[[["gm_gc_army_ural4320_cargo_olw","gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_machinegunner_lmgrpk74_80_win","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_win","gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_antitank_mpiak74n_rpg7_80_win","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// gm_gc_army_motorizedinfantly_squad_bmp1sp2
	[[[["gm_gc_army_bmp1sp2_olw","gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_machinegunner_lmgrpk74_80_win","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_win","gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_antitank_mpiak74n_rpg7_80_win","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win","gm_gc_army_rifleman_mpiak74n_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
	// gm_gc_army_motorizedinfantly_squad_BTR60PB_80
	[[[["gm_gc_army_btr60pb_olw","gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_machinegunner_lmgrpk74_80_win","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_win","gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_antitank_mpiak74n_rpg7_80_win","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// gm_gc_army_motorizedinfantly_squad_BTR60PA_80
	[[[["gm_gc_army_btr60pa_olw","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// gm_gc_army_motorizedinfantly_squad_BTR60PA_DSHKM_80
	[[[["gm_gc_army_btr60pa_dshkm_olw","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// gm_gc_army_motorizedinfantly_squad_ural375d_cargo_80
	[[[["gm_gc_army_ural375d_cargo_olw","gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_machinegunner_lmgrpk74_80_win","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_win","gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_antitank_mpiak74n_rpg7_80_win","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// gm_platoon_gm_gc_army_t55a_olw
	[[[["gm_gc_army_t55a_olw","gm_gc_army_t55a_olw","gm_gc_army_t55a_olw"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.5],
	// gm_platoon_gm_gc_army_t55am2_olw
	[[[["gm_gc_army_t55am2b_olw","gm_gc_army_t55am2_olw","gm_gc_army_t55am2_olw"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.5],
	// gm_platoon_gm_gc_army_btr60pu12_olw_gm_gc_army_zsu234v1_olw
	[[[["gm_gc_army_btr60pu12_olw","gm_gc_army_zsu234v1_olw","gm_gc_army_zsu234v1_olw","gm_gc_army_zsu234v1_olw","gm_gc_army_zsu234v1_olw"],[[0,0,0],[10,-10,0],[-10,-10,0],[-10,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.01],
	// gm_platoon_gm_gc_army_zsu234v1_olw
	[[[["gm_gc_army_zsu234v1_olw","gm_gc_army_zsu234v1_olw"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.1],
	// gm_platoon_gm_gc_army_pt76b_olw
	[[[["gm_gc_army_pt76b_olw","gm_gc_army_pt76b_olw"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// gm_platoon_gm_gc_army_brdm2_olw
	[[[["gm_gc_army_brdm2_olw","gm_gc_army_brdm2_olw"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// gm_gc_army_infantry_squad_win
	[[[["gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_machinegunner_lmgrpk74_80_win","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_win","gm_gc_army_antitank_mpiak74n_rpg7_80_win","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win","gm_gc_army_rifleman_mpiak74n_80_win","gm_gc_army_rifleman_mpiak74n_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// gm_ge_army_infantry_mggroup_win
	[[[["gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_machinegunner_pk_80_win","gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_ge_army_infantry_atgroup_win
	[[[["gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_antitank_mpiak74n_rpg7_80_win","gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_ge_army_infantry_aagroup_win
	[[[["gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_antiair_mpiak74n_9k32m_80_win","gm_gc_army_antiair_mpiak74n_9k32m_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// gm_ge_army_infantry_atgmgroup_win
	[[[["gm_gc_army_squadleader_mpiak74n_80_win","gm_gc_army_antitank_mpiak74n_fagot_80_win","gm_gc_army_rifleman_mpiak74n_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_gc_army_sf_infantry_specops_win
	[[[["gm_gc_army_sf_squadleader_mpikms72_80_win","gm_gc_army_sf_machinegunner_lmgrpk_80_win","gm_gc_army_sf_marksman_svd_80_win","gm_gc_army_sf_antitank_mpikms72_rpg7_80_win","gm_gc_army_sf_demolition_pm63_80_win","gm_gc_army_sf_antitank_mpikms72_rpg18_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
];
_arr append [
	// gm_gc_army_supply_team_01
	[[[["gm_gc_army_ural4320_repair_olw","gm_gc_army_ural375d_refuel_olw","gm_gc_army_ural4320_reammo_olw"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["gm_gc_army_ural375d_medic_olw"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// gm_platoon_gm_gc_army_2p16_olw
		[[[["gm_gc_army_2p16_olw","gm_gc_army_2p16_olw"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.01],
		// gm_platoon_gm_gc_army_2s1_olw
		[[[["gm_gc_army_2s1_olw","gm_gc_army_2s1_olw","gm_gc_army_2s1_olw"],[[0,0,0],[10,-10,0],[-10,-10,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.1],
		// gm_platoon_gm_gc_army_ural375d_mlrs_olw
		[[[["gm_gc_army_ural375d_mlrs_olw","gm_gc_army_ural375d_mlrs_olw","gm_gc_army_ural375d_mlrs_olw","gm_gc_army_ural375d_mlrs_olw"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1]
	];
};
[_groups_map, east, "gm_gc_army", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1960,1990], [-999,159],
[]
] call gosa_fnc_map_groups_add;

// Poland
_arr = [
	// configName gm_pl_army_motorizedinfantly_squad_ural4320_cargo_80
	[[[["gm_pl_army_ural4320_cargo_oli","gm_pl_army_squadleader_akm_80_Moro","gm_pl_army_rifleman_akm_80_Moro","gm_pl_army_machinegunner_pk_80_Moro","gm_pl_army_machinegunner_assistant_akm_pk_80_Moro","gm_pl_army_squadleader_akm_80_Moro","gm_pl_army_antitank_akm_rpg7_80_Moro","gm_pl_army_antitank_assistant_akm_rpg7_80_Moro","gm_pl_army_rifleman_akm_80_Moro","gm_pl_army_rifleman_akm_80_Moro"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_pl_army_motorizedinfantly_squad_bmp1sp2_80
	[[[["gm_pl_army_bmp1sp2_oli","gm_pl_army_squadleader_akm_80_moro","gm_pl_army_rifleman_akm_80_moro","gm_pl_army_machinegunner_pk_80_moro","gm_pl_army_machinegunner_assistant_akm_pk_80_moro","gm_pl_army_squadleader_akm_80_moro","gm_pl_army_antitank_akm_rpg7_80_moro","gm_pl_army_antitank_assistant_akm_rpg7_80_moro","gm_pl_army_rifleman_akm_80_moro"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE"],[],1]],0.5],
	// configName gm_pl_army_motorizedinfantly_squad_ot64a_80
	[[[["gm_pl_army_ot64a_oli","gm_pl_army_squadleader_akm_80_moro","gm_pl_army_rifleman_akm_80_moro","gm_pl_army_machinegunner_pk_80_moro","gm_pl_army_machinegunner_assistant_akm_pk_80_moro","gm_pl_army_squadleader_akm_80_moro","gm_pl_army_antitank_akm_rpg7_80_moro","gm_pl_army_antitank_assistant_akm_rpg7_80_moro","gm_pl_army_rifleman_akm_80_moro"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE"],[],1]],0.5],

	// configName gm_platoon_gm_pl_army_pt76b_oli
	[[[["gm_pl_army_pt76b_oli","gm_pl_army_pt76b_oli"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// configName gm_platoon_gm_pl_army_t55a_oli
	[[[["gm_pl_army_t55a_oli","gm_pl_army_t55a_oli","gm_pl_army_t55a_oli"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.5],
	// configName gm_platoon_gm_pl_army_zsu234v1_oli
	[[[["gm_pl_army_zsu234v1_oli","gm_pl_army_zsu234v1_oli"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.1],
	// configName gm_platoon_gm_pl_army_brdm2_oli
	[[[["gm_pl_army_brdm2_oli","gm_pl_army_brdm2_oli"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// configName gm_pl_army_infantry_squad_80_moro
	[[[["gm_pl_army_squadleader_akm_80_moro","gm_pl_army_rifleman_akm_80_moro","gm_pl_army_rifleman_akm_80_moro","gm_pl_army_machinegunner_pk_80_moro","gm_pl_army_machinegunner_assistant_akm_pk_80_moro","gm_pl_army_antitank_akm_rpg7_80_moro","gm_pl_army_antitank_assistant_akm_rpg7_80_moro","gm_pl_army_marksman_svd_80_moro","gm_pl_army_grenadier_akm_pallad_80_moro"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// configName gm_pl_army_infantry_mggroup_80_moro
	[[[["gm_pl_army_squadleader_akm_80_moro","gm_pl_army_machinegunner_pk_80_moro","gm_pl_army_machinegunner_assistant_akm_pk_80_moro"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_pl_army_infantry_atgroup_80_moro
	[[[["gm_pl_army_squadleader_akm_80_moro","gm_pl_army_antitank_akm_rpg7_80_moro","gm_pl_army_antitank_assistant_akm_rpg7_80_moro"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_pl_army_infantry_aagroup_80_moro
	[[[["gm_pl_army_squadleader_akm_80_moro","gm_pl_army_antiair_akm_9k32m_80_moro","gm_pl_army_antiair_akm_9k32m_80_moro"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// configName gm_pl_army_infantry_atgmgroup_80_moro
	[[[["gm_pl_army_squadleader_akm_80_moro","gm_pl_army_antitank_akm_fagot_80_moro","gm_pl_army_rifleman_akm_80_moro"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_pl_army_sf_infantry_specops_80_moro
	[[[["gm_pl_army_sf_squadleader_akmn_80_moro","gm_pl_army_sf_machinegunner_rpk_80_moro","gm_pl_army_sf_marksman_svd_80_moro","gm_pl_army_sf_antitank_akmn_fagot_80_moro","gm_pl_army_sf_demolition_pm63_80_moro","gm_pl_army_sf_grenadier_akm_pallad_80_moro"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
];
_arr append [
	// configName gm_pl_army_supply_team_01
	[[[["gm_pl_army_ural4320_repair_oli","gm_pl_army_ural375d_refuel_oli","gm_pl_army_ural4320_reammo_oli"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["gm_pl_army_ural375d_medic"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
_arr append [
	[[[["gm_pl_airforce_mi2urs","gm_pl_airforce_mi2urs"],[[0,0,0],[10,-10,0]],["CAPITAN","CAPITAN"]]],0.1],
	[[[["gm_pl_airforce_mi2urp","gm_pl_airforce_mi2urp"],[[0,0,0],[10,-10,0]],["CAPITAN","CAPITAN"]]],0.1],
	[[[["gm_pl_airforce_mi2urpg","gm_pl_airforce_mi2urpg"],[[0,0,0],[10,-10,0]],["CAPITAN","CAPITAN"]]],0.1]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// configName gm_platoon_gm_pl_army_2p16_oli
		[[[["gm_pl_army_2p16_oli","gm_pl_army_2p16_oli"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.01],
		// configName gm_platoon_gm_pl_army_2s1_oli
		[[[["gm_pl_army_2s1_oli","gm_pl_army_2s1_oli","gm_pl_army_2s1_oli"],[[0,0,0],[10,-10,0],[-10,-10,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.1],
		// configName gm_platoon_gm_pl_army_ural375d_mlrs_oli
		[[[["gm_pl_army_ural375d_mlrs_oli","gm_pl_army_ural375d_mlrs_oli","gm_pl_army_ural375d_mlrs_oli","gm_pl_army_ural375d_mlrs_oli"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1]
	];
};
[_groups_map, east, "gm_pl_army", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1960,1990], [160,999],
[]
] call gosa_fnc_map_groups_add;

// gm_pl_army_win
_arr = [
	// gm_pl_army_motorizedinfantly_squad_ural4320_cargo_80
	[[[["gm_pl_army_ural4320_cargo_olw","gm_pl_army_squadleader_akm_80_win","gm_pl_army_rifleman_akm_80_win","gm_pl_army_machinegunner_pk_80_win","gm_pl_army_machinegunner_assistant_akm_pk_80_win","gm_pl_army_squadleader_akm_80_win","gm_pl_army_antitank_akm_rpg7_80_win","gm_pl_army_antitank_assistant_akm_rpg7_80_win","gm_pl_army_rifleman_akm_80_win","gm_pl_army_rifleman_akm_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[-20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// gm_pl_army_motorizedinfantly_squad_bmp1sp2_80
	[[[["gm_pl_army_bmp1sp2_olw","gm_pl_army_squadleader_akm_80_win","gm_pl_army_rifleman_akm_80_win","gm_pl_army_machinegunner_pk_80_win","gm_pl_army_machinegunner_assistant_akm_pk_80_win","gm_pl_army_squadleader_akm_80_win","gm_pl_army_antitank_akm_rpg7_80_win","gm_pl_army_antitank_assistant_akm_rpg7_80_win","gm_pl_army_rifleman_akm_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],
	// gm_pl_army_motorizedinfantly_squad_ot64a_80
	[[[["gm_pl_army_ot64a_olw","gm_pl_army_squadleader_akm_80_win","gm_pl_army_rifleman_akm_80_win","gm_pl_army_machinegunner_pk_80_win","gm_pl_army_machinegunner_assistant_akm_pk_80_win","gm_pl_army_squadleader_akm_80_win","gm_pl_army_antitank_akm_rpg7_80_win","gm_pl_army_antitank_assistant_akm_rpg7_80_win","gm_pl_army_rifleman_akm_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","CORPORAL","SERGEANT","CORPORAL","CORPORAL","PRIVATE"]]],0.5],

	// gm_platoon_gm_pl_army_pt76b_olw
	[[[["gm_pl_army_pt76b_olw","gm_pl_army_pt76b_olw"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// gm_platoon_gm_pl_army_t55a_olw
	[[[["gm_pl_army_t55a_olw","gm_pl_army_t55a_olw","gm_pl_army_t55a_olw"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.5],
	// gm_platoon_gm_pl_army_zsu234v1_olw
	[[[["gm_pl_army_zsu234v1_olw","gm_pl_army_zsu234v1_olw"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.1],
	// gm_platoon_gm_pl_army_brdm2_olw
	[[[["gm_pl_army_brdm2_olw","gm_pl_army_brdm2_olw"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// gm_pl_army_infantry_squad_80_win
	[[[["gm_pl_army_squadleader_akm_80_win","gm_pl_army_rifleman_akm_80_win","gm_pl_army_rifleman_akm_80_win","gm_pl_army_machinegunner_pk_80_win","gm_pl_army_machinegunner_assistant_akm_pk_80_win","gm_pl_army_antitank_akm_rpg7_80_win","gm_pl_army_antitank_assistant_akm_rpg7_80_win","gm_pl_army_marksman_svd_80_win","gm_pl_army_grenadier_akm_pallad_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// gm_pl_army_infantry_mggroup_80_win
	[[[["gm_pl_army_squadleader_akm_80_win","gm_pl_army_machinegunner_pk_80_win","gm_pl_army_machinegunner_assistant_akm_pk_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_pl_army_infantry_atgroup_80_win
	[[[["gm_pl_army_squadleader_akm_80_win","gm_pl_army_antitank_akm_rpg7_80_win","gm_pl_army_antitank_assistant_akm_rpg7_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_pl_army_infantry_aagroup_80_win
	[[[["gm_pl_army_squadleader_akm_80_win","gm_pl_army_antiair_akm_9k32m_80_win","gm_pl_army_antiair_akm_9k32m_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// gm_pl_army_infantry_atgmgroup_80_win
	[[[["gm_pl_army_squadleader_akm_80_win","gm_pl_army_antitank_akm_fagot_80_win","gm_pl_army_rifleman_akm_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_pl_army_sf_infantry_specops_80_win
	[[[["gm_pl_army_sf_squadleader_akmn_80_win","gm_pl_army_sf_machinegunner_rpk_80_win","gm_pl_army_sf_marksman_svd_80_win","gm_pl_army_sf_antitank_akmn_fagot_80_win","gm_pl_army_sf_demolition_pm63_80_win","gm_pl_army_sf_grenadier_akm_pallad_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
];
_arr append [
	// gm_pl_army_supply_team_01
	[[[["gm_pl_army_ural4320_repair_olw","gm_pl_army_ural375d_refuel_olw","gm_pl_army_ural4320_reammo_olw"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["gm_pl_army_ural375d_medic_olw"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// gm_platoon_gm_pl_army_2p16_olw
		[[[["gm_pl_army_2p16_olw","gm_pl_army_2p16_olw"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.01],
		// gm_platoon_gm_pl_army_2s1_olw
		[[[["gm_pl_army_2s1_olw","gm_pl_army_2s1_olw","gm_pl_army_2s1_olw"],[[0,0,0],[10,-10,0],[-10,-10,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.1],
		// gm_platoon_gm_pl_army_ural375d_mlrs_olw
		[[[["gm_pl_army_ural375d_mlrs_olw","gm_pl_army_ural375d_mlrs_olw","gm_pl_army_ural375d_mlrs_olw","gm_pl_army_ural375d_mlrs_olw"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1]
	];
};
[_groups_map, east, "gm_pl_army", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1960,1990], [-999,159],
[]
] call gosa_fnc_map_groups_add;


// west
_arr = [
	// configName gm_ge_bgs_motorizedInfantry_squad_w123_80
	[[[["gm_ge_bgs_w123_cargo","gm_ge_bgs_sf_squadleader_mp5a2_80_blk","gm_ge_bgs_sf_specialist_hk512_80_blk","gm_ge_bgs_sf_grenadier_hk69a1_80_blk"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","SERGEANT","SERGEANT","SERGEANT"],[],1]],0.5],
	// configName gm_ge_bgs_sf_infantry_specops_80_blk
	[[[["gm_ge_bgs_sf_squadleader_mp5a2_80_blk","gm_ge_bgs_sf_rifleman_mp5a2_80_blk","gm_ge_bgs_sf_marksman_psg1_80_blk","gm_ge_bgs_sf_machinegunner_g8_80_blk","gm_ge_bgs_sf_demolition_mp5a2_80_blk","gm_ge_bgs_sf_specialist_hk512_80_blk"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
	// configName gm_ge_bgs_infantry_squad_80
	[[[["gm_ge_bgs_squadleader_mp5a2_p2a1_80_smp","gm_ge_bgs_machinegunner_mg3_80_smp","gm_ge_bgs_machinegunner_assistant_mp5a2_mg3_80_smp","gm_ge_bgs_squadleader_mp5a2_p2a1_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp"],[[0,0,0],[5,-5,0],[10,-10,0],[-5,-5,0],[-10,-10,0],[-15,-15,0],[-20,-20,0],[15,-15,0],[-25,-25,0],[20,-20,0],[25,-25,0],[30,-30,0]],["SERGEANT","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// configName gm_ge_bgs_infantry_post_80
	[[[["gm_ge_bgs_squadleader_mp5a2_p2a1_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp","gm_ge_bgs_rifleman_mp5a2_80_smp"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],

	// configName gm_ge_army_motorizedInfantry_squad_u1300l_80
	[[[["gm_ge_army_u1300l_cargo_wdl","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_machinegunner_mg3_80_ols","gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_antitank_g3a3_pzf44_80_ols","gm_ge_army_antitank_assistant_g3a3_pzf44_80_ols","gm_ge_army_grenadier_g3a3_80_ols"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_ge_army_mechanizedInfantry_squad_fuchs1a0_milan_80
	[[[["gm_ge_army_fuchsa0_reconnaissance_wdl","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_machinegunner_mg3_80_ols","gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_antitank_g3a3_pzf44_80_ols","gm_ge_army_antitank_assistant_g3a3_pzf44_80_ols"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.5],
	// configName gm_ge_army_motorizedInfantry_squad_kat451_80
	[[[["gm_ge_army_kat1_451_cargo_wdl","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_machinegunner_mg3_80_ols","gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_antitank_g3a3_pzf44_80_ols","gm_ge_army_antitank_assistant_g3a3_pzf44_80_ols","gm_ge_army_grenadier_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_ge_army_motorizedInfantry_squad_u1300l_90
	[[[["gm_ge_army_u1300l_cargo_wdl","gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_machinegunner_mg3_90_flk","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_flk","gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_ge_army_mechanizedInfantry_squad_fuchs1a0_milan_90
	[[[["gm_ge_army_fuchsa0_reconnaissance_wdl","gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_machinegunner_mg3_90_flk","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_flk","gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE"],[],1]],0.5],
	// configName gm_ge_army_motorizedInfantry_squad_kat451_90
	[[[["gm_ge_army_kat1_451_cargo_wdl","gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_machinegunner_mg3_90_flk","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_flk","gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],

	// configName gm_platoon_gm_ge_army_Leopard1a1_oli
	[[[["gm_ge_army_Leopard1a1_oli","gm_ge_army_Leopard1a1_oli","gm_ge_army_Leopard1a1_oli","gm_ge_army_Leopard1a1_oli"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// configName gm_platoon_gm_ge_army_Leopard1a1a1_wdl
	[[[["gm_ge_army_Leopard1a1a1_wdl","gm_ge_army_Leopard1a1a1_wdl","gm_ge_army_Leopard1a1a1_wdl","gm_ge_army_Leopard1a1a1_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// configName gm_platoon_gm_ge_army_Leopard1a3_wdl
	[[[["gm_ge_army_Leopard1a3_wdl","gm_ge_army_Leopard1a3_wdl","gm_ge_army_Leopard1a3_wdl","gm_ge_army_Leopard1a3_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// configName gm_platoon_gm_ge_army_Leopard1a5_wdl
	[[[["gm_ge_army_Leopard1a5_wdl","gm_ge_army_Leopard1a5_wdl","gm_ge_army_Leopard1a5_wdl","gm_ge_army_Leopard1a5_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],

	// configName gm_ge_army_mechanizedInfantry_squad_m113a1g
	[[[["gm_ge_army_m113a1g_apc_wdl","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_machinegunner_mg3_80_ols","gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_antitank_g3a3_pzf44_80_ols","gm_ge_army_antitank_assistant_g3a3_pzf44_80_ols","gm_ge_army_grenadier_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_ge_army_mechanizedInfantry_squad_marder1a1a
	[[[["gm_ge_army_marder1a1a_oli","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_machinegunner_mg3_80_ols","gm_ge_army_marksman_g3a3_80_ols","gm_ge_army_antitank_g3a3_pzf44_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_ge_army_mechanizedInfantry_squad_marder1a1plus
	[[[["gm_ge_army_marder1a1plus_oli","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_machinegunner_mg3_80_ols","gm_ge_army_marksman_g3a3_80_ols","gm_ge_army_antitank_g3a3_pzf44_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_ge_army_mechanizedInfantry_squad_marder1a2
	[[[["gm_ge_army_marder1a2_wdl","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_machinegunner_mg3_80_ols","gm_ge_army_marksman_g3a3_80_ols","gm_ge_army_antitank_g3a3_pzf44_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],

	// configName gm_platoon_gm_ge_army_iltis_mg3_wdl
	[[[["gm_ge_army_iltis_mg3_wdl","gm_ge_army_iltis_cargo_wdl","gm_ge_army_iltis_cargo_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.5],
	// configName gm_platoon_gm_ge_army_luchsa1_oli
	[[[["gm_ge_army_luchsa1_oli","gm_ge_army_luchsa1_oli"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// configName gm_platoon_gm_ge_army_luchsa2_wdl
	[[[["gm_ge_army_luchsa2_wdl","gm_ge_army_luchsa2_wdl"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// configName gm_platoon_gm_ge_army_iltis_milan_wdl
	[[[["gm_ge_army_iltis_milan_wdl","gm_ge_army_iltis_milan_wdl","gm_ge_army_iltis_milan_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.5],

	// configName gm_ge_army_infantry_squad_80_ols
	[[[["gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_machinegunner_mg3_80_ols","gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols","gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_antitank_g3a3_pzf44_80_ols","gm_ge_army_antitank_assistant_g3a3_pzf44_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols","gm_ge_army_rifleman_g3a3_80_ols"],[[0,0,0],[5,-5,0],[10,-10,0],[-5,-5,0],[-10,-10,0],[-15,-15,0],[-20,-20,0],[15,-15,0],[-25,-25,0],[20,-20,0],[25,-25,0],[30,-30,0]],["SERGEANT","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_mggroup_80_ols
	[[[["gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_machinegunner_mg3_80_ols","gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_atgroup_80_ols
	[[[["gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_antitank_g3a3_pzf84_80_ols","gm_ge_army_antitank_assistant_g3a3_pzf84_80_ols"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_atgmgroup_80_ols
	[[[["gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_antitank_g3a3_milan_80_ols","gm_ge_army_rifleman_g3a3_80_ols"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_aagroup_80_ols
	[[[["gm_ge_army_squadleader_g3a3_p2a1_80_ols","gm_ge_army_antiair_g3a3_fim43_80_ols","gm_ge_army_antiair_g3a3_fim43_80_ols"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// configName gm_ge_army_sf_infantry_specops_80_wdl
	[[[["gm_ge_army_sf_squadleader_mp5sd3_p2a1_80_wdl","gm_ge_army_sf_rifleman_mp5a3_80_wdl","gm_ge_army_sf_marksman_g3a3_80_wdl","gm_ge_army_sf_antitank_mp5a2_pzf84_80_wdl","gm_ge_army_sf_demolition_mp5a2_80_wdl","gm_ge_army_sf_rifleman_mp5a3_80_wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
	// configName gm_ge_army_infantry_squad_90_flk
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_machinegunner_mg3_90_flk","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_flk","gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk"],[[0,0,0],[5,-5,0],[10,-10,0],[-5,-5,0],[-10,-10,0],[-15,-15,0],[-20,-20,0],[15,-15,0],[-25,-25,0],[20,-20,0],[25,-25,0],[30,-30,0]],["SERGEANT","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_mggroup_90_flk
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_machinegunner_mg3_90_flk","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_flk"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_atgroup_90_flk
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_atgmgroup_90_flk
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_antitank_g36a1_milan_90_flk","gm_ge_army_rifleman_g36a1_90_flk"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_ge_army_infantry_aagroup_90_flk
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_antiair_g36a1_fim43_90_flk","gm_ge_army_antiair_g36a1_fim43_90_flk"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// configName gm_ge_bgs_sf_infantry_specops_90_blk
	[[[["gm_ge_bgs_sf_squadleader_sig551_90_blk","gm_ge_bgs_sf_rifleman_mp5a2_90_blk","gm_ge_bgs_sf_marksman_psg1_90_blk","gm_ge_bgs_sf_machinegunner_g8_90_blk","gm_ge_bgs_sf_demolition_sig551_90_blk","gm_ge_bgs_sf_specialist_hk512_90_blk"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
	// configName gm_platoon_gm_ge_army_fuchsa0_command_wdl_gm_ge_army_gepard1a1_wdl
	[[[["gm_ge_army_fuchsa0_command_wdl","gm_ge_army_gepard1a1_wdl","gm_ge_army_gepard1a1_wdl","gm_ge_army_gepard1a1_wdl","gm_ge_army_gepard1a1_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[-10,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.5],
	// configName gm_platoon_gm_ge_army_gepard1a1_wdl
	[[[["gm_ge_army_gepard1a1_wdl","gm_ge_army_gepard1a1_wdl"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.5]
];
_arr append [
	// configName gm_ge_army_supply_team_01
	[[[["gm_ge_army_u1300l_repair_wdl","gm_ge_army_kat1_451_reammo_wdl","gm_ge_army_kat1_451_refuel_wdl"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["gm_ge_army_m113a1g_medic"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.025],
	[[[["gm_ge_army_u1300l_medic"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.025]
];
_arr append [
	[[[["gm_ge_army_bo105p_pah1","gm_ge_army_bo105p_pah1"],[[0,0,0],[10,-10,0]],["CAPITAN","CAPITAN"]]],0.1],
	[[[["gm_ge_army_bo105p_pah1a1","gm_ge_army_bo105p_pah1a1"],[[0,0,0],[10,-10,0]],["CAPITAN","CAPITAN"]]],0.1],
	[[[["gm_ge_airforce_do28d2"],[],["LIEUTENANT"]],
		[["gm_ge_bgs_sf_squadleader_mp5a2_80_blk","gm_ge_bgs_sf_rifleman_mp5a2_80_blk","gm_ge_bgs_sf_marksman_psg1_80_blk","gm_ge_bgs_sf_machinegunner_g8_80_blk","gm_ge_bgs_sf_demolition_mp5a2_80_blk","gm_ge_bgs_sf_specialist_hk512_80_blk"]]
		],0.1]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// configName gm_platoon_gm_ge_army_m109g_wdl
		[[[["gm_ge_army_m109g_wdl","gm_ge_army_m109g_wdl","gm_ge_army_m109g_wdl","gm_ge_army_m109g_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1],
		// configName gm_platoon_gm_ge_army_kat1_463_mlrs_wdl
		[[[["gm_ge_army_kat1_463_mlrs_wdl","gm_ge_army_kat1_463_mlrs_wdl","gm_ge_army_kat1_463_mlrs_wdl","gm_ge_army_kat1_463_mlrs_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1]
	];
};
[_groups_map, west, "gm_ge_army", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1960,1990], [160,999],
[]
] call gosa_fnc_map_groups_add;

// gm_ge_army_win
_arr = [
	// gm_ge_army_motorizedInfantry_squad_u1300l_80
	[[[["gm_ge_army_u1300l_cargo_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_machinegunner_mg3_parka_80_win","gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_antitank_g3a3_pzf44_parka_80_win","gm_ge_army_antitank_assistant_g3a3_pzf44_parka_80_win","gm_ge_army_grenadier_g3a3_parka_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// gm_ge_army_mechanizedInfantry_squad_fuchs1a0_milan_80
	[[[["gm_ge_army_fuchsa0_reconnaissance_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_machinegunner_mg3_parka_80_win","gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_antitank_g3a3_pzf44_parka_80_win","gm_ge_army_antitank_assistant_g3a3_pzf44_parka_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
	// gm_ge_army_motorizedInfantry_squad_kat451_80
	[[[["gm_ge_army_kat1_451_cargo_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_machinegunner_mg3_parka_80_win","gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_antitank_g3a3_pzf44_parka_80_win","gm_ge_army_antitank_assistant_g3a3_pzf44_parka_80_win","gm_ge_army_grenadier_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_ge_army_motorizedInfantry_squad_u1300l_90
	[[[["gm_ge_army_u1300l_cargo_win","gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_machinegunner_mg3_90_flk","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_flk","gm_ge_army_squadleader_g36a1_p2a1_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_rifleman_g36a1_90_flk"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_ge_army_mechanizedInfantry_squad_fuchs1a0_milan_90
	[[[["gm_ge_army_fuchsa0_reconnaissance_win","gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_rifleman_g36a1_90_win","gm_ge_army_machinegunner_mg3_90_win","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_win","gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_antitank_g36a1_pzf3_90_win","gm_ge_army_antitank_g36a1_pzf3_90_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE"]]],0.5],
	// gm_ge_army_motorizedInfantry_squad_kat451_90
	[[[["gm_ge_army_kat1_451_cargo_win","gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_rifleman_g36a1_90_win","gm_ge_army_machinegunner_mg3_90_win","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_win","gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_antitank_g36a1_pzf3_90_win","gm_ge_army_antitank_g36a1_pzf3_90_win","gm_ge_army_rifleman_g36a1_90_win","gm_ge_army_rifleman_g36a1_90_win","gm_ge_army_rifleman_g36a1_90_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_platoon_gm_ge_army_Leopard1a1_olw
	[[[["gm_ge_army_Leopard1a1_olw","gm_ge_army_Leopard1a1_olw","gm_ge_army_Leopard1a1_olw","gm_ge_army_Leopard1a1_olw"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// gm_platoon_gm_ge_army_Leopard1a1a1_win
	[[[["gm_ge_army_Leopard1a1a1_win","gm_ge_army_Leopard1a1a1_win","gm_ge_army_Leopard1a1a1_win","gm_ge_army_Leopard1a1a1_win"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// gm_platoon_gm_ge_army_Leopard1a3_win
	[[[["gm_ge_army_Leopard1a3_win","gm_ge_army_Leopard1a3_win","gm_ge_army_Leopard1a3_win","gm_ge_army_Leopard1a3_win"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// gm_platoon_gm_ge_army_Leopard1a5_win
	[[[["gm_ge_army_Leopard1a5_win","gm_ge_army_Leopard1a5_win","gm_ge_army_Leopard1a5_win","gm_ge_army_Leopard1a5_win"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// gm_ge_army_mechanizedInfantry_squad_m113a1g
	[[[["gm_ge_army_m113a1g_apc_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_machinegunner_mg3_parka_80_win","gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_antitank_g3a3_pzf44_parka_80_win","gm_ge_army_antitank_assistant_g3a3_pzf44_parka_80_win","gm_ge_army_grenadier_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0],[-25,-25,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_ge_army_mechanizedInfantry_squad_marder1a1a
	[[[["gm_ge_army_marder1a1a_olw","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_machinegunner_mg3_parka_80_win","gm_ge_army_marksman_g3a3_parka_80_win","gm_ge_army_antitank_g3a3_pzf44_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_ge_army_mechanizedInfantry_squad_marder1a1plus
	[[[["gm_ge_army_marder1a1plus_olw","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_machinegunner_mg3_parka_80_win","gm_ge_army_marksman_g3a3_parka_80_win","gm_ge_army_antitank_g3a3_pzf44_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_ge_army_mechanizedInfantry_squad_marder1a2
	[[[["gm_ge_army_marder1a2_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_machinegunner_mg3_parka_80_win","gm_ge_army_marksman_g3a3_parka_80_win","gm_ge_army_antitank_g3a3_pzf44_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["LIEUTENANT","SERGEANT","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_platoon_gm_ge_army_iltis_mg3_win
	[[[["gm_ge_army_iltis_mg3_win","gm_ge_army_iltis_cargo_win","gm_ge_army_iltis_cargo_win"],[[0,0,0],[10,-10,0],[-10,-10,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.5],
	// gm_platoon_gm_ge_army_luchsa1_olw
	[[[["gm_ge_army_luchsa1_olw","gm_ge_army_luchsa1_olw"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// gm_platoon_gm_ge_army_luchsa2_win
	[[[["gm_ge_army_luchsa2_win","gm_ge_army_luchsa2_win"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5],
	// gm_platoon_gm_ge_army_iltis_milan_win
	[[[["gm_ge_army_iltis_milan_win","gm_ge_army_iltis_milan_win","gm_ge_army_iltis_milan_win"],[[0,0,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","SERGEANT","SERGEANT"]]],0.5],

	// gm_ge_army_infantry_squad_parka_80_win
	[[[["gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_machinegunner_mg3_parka_80_win","gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_win","gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_antitank_g3a3_pzf44_parka_80_win","gm_ge_army_antitank_assistant_g3a3_pzf44_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win"],[[0,0,0],[5,-5,0],[10,-10,0],[-5,-5,0],[-10,-10,0],[-15,-15,0],[-20,-20,0],[15,-15,0],[-25,-25,0],[20,-20,0],[25,-25,0],[30,-30,0]],["SERGEANT","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// gm_ge_army_infantry_mggroup_parka_80_win
	[[[["gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_machinegunner_mg3_parka_80_win","gm_ge_army_machinegunner_assistant_g3a3_mg3_parka_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_ge_army_infantry_atgroup_parka_80_win
	[[[["gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_antitank_g3a3_pzf84_parka_80_win","gm_ge_army_antitank_assistant_g3a3_pzf84_parka_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_ge_army_infantry_atgmgroup_parka_80_win
	[[[["gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_antitank_g3a3_milan_parka_80_win","gm_ge_army_rifleman_g3a3_parka_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_ge_army_infantry_aagroup_parka_80_win
	[[[["gm_ge_army_squadleader_g3a3_p2a1_parka_80_win","gm_ge_army_antiair_g3a3_fim43_parka_80_win","gm_ge_army_antiair_g3a3_fim43_parka_80_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// gm_ge_army_sf_infantry_specops_parka_80_win
	[[[["gm_ge_army_sf_squadleader_mp5sd3_p2a1_parka_80_win","gm_ge_army_sf_rifleman_mp5a3_parka_80_win","gm_ge_army_sf_marksman_g3a3_parka_80_win","gm_ge_army_sf_antitank_mp5a2_pzf84_parka_80_win","gm_ge_army_sf_demolition_mp5a2_parka_80_win","gm_ge_army_sf_rifleman_mp5a3_parka_80_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
	// gm_ge_army_infantry_squad_90_win
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_machinegunner_mg3_90_win","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_win","gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_antitank_g36a1_pzf3_90_win","gm_ge_army_antitank_g36a1_pzf3_90_win","gm_ge_army_rifleman_g36a1_90_win","gm_ge_army_rifleman_g36a1_90_win","gm_ge_army_rifleman_g36a1_90_win","gm_ge_army_rifleman_g36a1_90_win","gm_ge_army_rifleman_g36a1_90_win","gm_ge_army_rifleman_g36a1_90_win"],[[0,0,0],[5,-5,0],[10,-10,0],[-5,-5,0],[-10,-10,0],[-15,-15,0],[-20,-20,0],[15,-15,0],[-25,-25,0],[20,-20,0],[25,-25,0],[30,-30,0]],["SERGEANT","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// gm_ge_army_infantry_mggroup_90_win
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_machinegunner_mg3_90_win","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_ge_army_infantry_atgroup_90_win
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_antitank_g36a1_pzf3_90_win","gm_ge_army_antitank_g36a1_pzf3_90_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_ge_army_infantry_atgmgroup_90_win
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_antitank_g36a1_milan_90_win","gm_ge_army_rifleman_g36a1_90_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_ge_army_infantry_aagroup_90_win
	[[[["gm_ge_army_squadleader_g36a1_p2a1_90_win","gm_ge_army_antiair_g36a1_fim43_90_win","gm_ge_army_antiair_g36a1_fim43_90_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// gm_platoon_gm_ge_army_fuchsa0_command_win_gm_ge_army_gepard1a1_win
	[[[["gm_ge_army_fuchsa0_command_win","gm_ge_army_gepard1a1_win","gm_ge_army_gepard1a1_win","gm_ge_army_gepard1a1_win","gm_ge_army_gepard1a1_win"],[[0,0,0],[10,-10,0],[-10,-10,0],[-10,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT","SERGEANT"]]],0.5],
	// gm_platoon_gm_ge_army_gepard1a1_win
	[[[["gm_ge_army_gepard1a1_win","gm_ge_army_gepard1a1_win"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.5]
];
_arr append [
	// gm_ge_army_supply_team_01
	[[[["gm_ge_army_u1300l_repair_win","gm_ge_army_kat1_451_reammo_win","gm_ge_army_kat1_451_refuel_win"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05],
	[[[["gm_ge_army_m113a1g_medic_win"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.025],
	[[[["gm_ge_army_u1300l_medic_win"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.025]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// gm_platoon_gm_ge_army_m109g_win
		[[[["gm_ge_army_m109g_win","gm_ge_army_m109g_win","gm_ge_army_m109g_win","gm_ge_army_m109g_win"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1],
		// gm_platoon_gm_ge_army_kat1_463_mlrs_win
		[[[["gm_ge_army_kat1_463_mlrs_win","gm_ge_army_kat1_463_mlrs_win","gm_ge_army_kat1_463_mlrs_win","gm_ge_army_kat1_463_mlrs_win"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1]
	];
};
[_groups_map, west, "gm_ge_army", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1960,1990], [-999,159],
[]
] call gosa_fnc_map_groups_add;


// Denmark
_arr = [
	// configName gm_dk_army_mechanizedInfantry_squad_m113a1dk_90
	[[[["gm_dk_army_m113a1dk_apc_wdl","gm_dk_army_squadleader_gvm95_p2a1_90_m84","gm_dk_army_machinegunner_mg3_90_m84","gm_dk_army_machinegunner_assistant_gvm95_mg3_90_m84","gm_dk_army_antitank_gvm95_pzf84_90_m84","gm_dk_army_machinegunner_mg3_90_m84","gm_dk_army_antitank_assistant_gvm95_pzf84_90_m84","gm_dk_army_rifleman_gvm95_90_m84","gm_dk_army_rifleman_gvm95_90_m84"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_section_gm_dk_army_m113a2dk_wdl
	[[[["gm_dk_army_m113a2dk_wdl","gm_dk_army_m113a2dk_wdl"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.5],
	// configName gm_dk_army_motorizedInfantry_squad_u1300l_80
	[[[["gm_dk_army_u1300l_container_wdl","gm_dk_army_squadleader_g3a3_p2a1_84_m84","gm_dk_army_rifleman_g3a3_84_m84","gm_dk_army_machinegunner_mg3_84_m84","gm_dk_army_machinegunner_assistant_g3a3_mg3_84_m84","gm_dk_army_squadleader_g3a3_p2a1_84_m84","gm_dk_army_antitank_g3a3_pzf84_84_m84","gm_dk_army_antitank_assistant_g3a3_pzf84_84_m84","gm_dk_army_rifleman_g3a3_84_m84","gm_dk_army_rifleman_g3a3_84_m84"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_dk_army_motorizedInfantry_squad_u1300l_90
	[[[["gm_dk_army_u1300l_container_wdl","gm_dk_army_squadleader_gvm95_p2a1_90_m84","gm_dk_army_rifleman_gvm95_90_m84","gm_dk_army_machinegunner_mg3_90_m84","gm_dk_army_machinegunner_assistant_gvm95_mg3_90_m84","gm_dk_army_squadleader_gvm95_p2a1_90_m84","gm_dk_army_antitank_gvm95_pzf84_90_m84","gm_dk_army_antitank_assistant_gvm95_pzf84_90_m84","gm_dk_army_rifleman_gvm95_90_m84","gm_dk_army_rifleman_gvm95_90_m84"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],
	// configName gm_platoon_gm_dk_army_Leopard1a3_wdl
	[[[["gm_dk_army_Leopard1a3_wdl","gm_dk_army_Leopard1a3_wdl","gm_dk_army_Leopard1a3_wdl","gm_dk_army_Leopard1a3_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// configName gm_dk_army_mechanizedInfantry_squad_m113a1dk_80
	[[[["gm_dk_army_m113a1dk_apc_wdl","gm_dk_army_squadleader_g3a3_p2a1_84_m84","gm_dk_army_machinegunner_mg3_84_m84","gm_dk_army_machinegunner_assistant_g3a3_mg3_84_m84","gm_dk_army_antitank_g3a3_pzf84_84_m84","gm_dk_army_machinegunner_mg3_84_m84","gm_dk_army_antitank_assistant_g3a3_pzf84_84_m84","gm_dk_army_rifleman_g3a3_84_m84","gm_dk_army_rifleman_g3a3_84_m84"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],1]],0.5],

	// configName gm_dk_army_infantry_squad_84_m84
	[[[["gm_dk_army_squadleader_g3a3_p2a1_84_m84","gm_dk_army_machinegunner_mg3_84_m84","gm_dk_army_machinegunner_assistant_g3a3_mg3_84_m84","gm_dk_army_antitank_g3a3_pzf84_84_m84","gm_dk_army_antitank_assistant_g3a3_pzf84_84_m84","gm_dk_army_rifleman_g3a3_84_m84","gm_dk_army_rifleman_g3a3_84_m84","gm_dk_army_rifleman_g3a3_84_m84"],[[0,0,0],[5,-5,0],[10,-10,0],[-5,-5,0],[-10,-10,0],[-15,-15,0],[15,-15,0],[-20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// configName gm_dk_army_infantry_mggroup_84_m84
	[[[["gm_dk_army_squadleader_g3a3_p2a1_84_m84","gm_dk_army_machinegunner_mg3_84_m84","gm_dk_army_machinegunner_assistant_g3a3_mg3_84_m84"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_dk_army_infantry_atgroup_84_m84
	[[[["gm_dk_army_squadleader_g3a3_p2a1_84_m84","gm_dk_army_antitank_g3a3_pzf84_84_m84","gm_dk_army_antitank_assistant_g3a3_pzf84_84_m84"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_dk_army_infantry_aagroup_84_m84
	[[[["gm_dk_army_squadleader_g3a3_p2a1_84_m84","gm_dk_army_antiair_g3a3_fim43_84_m84","gm_dk_army_antiair_g3a3_fim43_84_m84"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// configName gm_dk_army_sf_infantry_specops_84_m84
	[[[["gm_dk_army_sf_squadleader_mp5a3_p2a1_84_m84","gm_dk_army_sf_marksman_g3a3_84_m84","gm_dk_army_sf_rifleman_mp5a3_84_m84","gm_dk_army_sf_antitank_mp5a3_pzf84_84_m84","gm_dk_army_sf_demolition_mp5a3_84_m84","gm_dk_army_sf_machinegunner_mg8_84_m84"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
	// configName gm_dk_army_infantry_squad_90_m84
	[[[["gm_dk_army_squadleader_gvm95_p2a1_90_m84","gm_dk_army_machinegunner_mg3_90_m84","gm_dk_army_machinegunner_assistant_gvm95_mg3_90_m84","gm_dk_army_antitank_gvm95_pzf84_90_m84","gm_dk_army_antitank_assistant_gvm95_pzf84_90_m84","gm_dk_army_rifleman_gvm95_90_m84","gm_dk_army_rifleman_gvm95_90_m84","gm_dk_army_rifleman_gvm95_90_m84"],[[0,0,0],[5,-5,0],[10,-10,0],[-5,-5,0],[-10,-10,0],[-15,-15,0],[15,-15,0],[-20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// configName gm_dk_army_infantry_mggroup_90_m84
	[[[["gm_dk_army_squadleader_gvm95_p2a1_90_m84","gm_dk_army_machinegunner_mg3_90_m84","gm_dk_army_machinegunner_assistant_gvm95_mg3_90_m84"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_dk_army_infantry_atgroup_90_m84
	[[[["gm_dk_army_squadleader_gvm95_p2a1_90_m84","gm_dk_army_antitank_gvm95_pzf84_90_m84","gm_dk_army_antitank_assistant_gvm95_pzf84_90_m84"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// configName gm_dk_army_infantry_aagroup_90_m84
	[[[["gm_dk_army_squadleader_gvm95_p2a1_90_m84","gm_dk_army_antiair_gvm95_fim43_90_m84","gm_dk_army_antiair_gvm95_fim43_90_m84"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// configName gm_dk_army_sf_infantry_specops_90_m84
	[[[["gm_dk_army_sf_squadleader_mpm85_p2a1_90_m84","gm_dk_army_sf_marksman_msg90a1_90_m84","gm_dk_army_sf_rifleman_mpm85_90_m84","gm_dk_army_sf_antitank_mpm85_pzf84_90_m84","gm_dk_army_sf_demolition_mpm85_90_m84","gm_dk_army_sf_machinegunner_mg8_90_m84"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
];
_arr append [
	[[[["gm_dk_army_m113a1dk_medic"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// configName gm_platoon_gm_dk_army_m109_wdl
		[[[["gm_dk_army_m109_wdl","gm_dk_army_m109_wdl","gm_dk_army_m109_wdl","gm_dk_army_m109_wdl"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1]
	];
};
[_groups_map, west, "gm_dk_army", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1960,1990], [160,999],
[]
] call gosa_fnc_map_groups_add;

// gm_dk_army_win
_arr = [
	// gm_dk_army_mechanizedInfantry_squad_m113a1dk_90
	[[[["gm_dk_army_m113a1dk_apc_win","gm_dk_army_squadleader_gvm95_p2a1_90_win","gm_dk_army_machinegunner_mg3_90_win","gm_dk_army_machinegunner_assistant_gvm95_mg3_90_win","gm_dk_army_antitank_gvm95_pzf84_90_win","gm_dk_army_machinegunner_mg3_90_win","gm_dk_army_antitank_assistant_gvm95_pzf84_90_win","gm_dk_army_rifleman_gvm95_90_win","gm_dk_army_rifleman_gvm95_90_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_section_gm_dk_army_m113a2dk_win
	[[[["gm_dk_army_m113a2dk_win","gm_dk_army_m113a2dk_win"],[[0,0,0],[10,-10,0]],["SERGEANT","SERGEANT"]]],0.5],
	// gm_dk_army_motorizedInfantry_squad_u1300l_80
	[[[["gm_dk_army_u1300l_container_win","gm_dk_army_squadleader_g3a3_p2a1_84_win","gm_dk_army_rifleman_g3a3_84_win","gm_dk_army_machinegunner_mg3_84_win","gm_dk_army_machinegunner_assistant_g3a3_mg3_84_win","gm_dk_army_squadleader_g3a3_p2a1_84_win","gm_dk_army_antitank_g3a3_pzf84_84_win","gm_dk_army_antitank_assistant_g3a3_pzf84_84_win","gm_dk_army_rifleman_g3a3_84_win","gm_dk_army_rifleman_g3a3_84_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_dk_army_motorizedInfantry_squad_u1300l_90
	[[[["gm_dk_army_u1300l_container_win","gm_dk_army_squadleader_gvm95_p2a1_90_win","gm_dk_army_rifleman_gvm95_90_win","gm_dk_army_machinegunner_mg3_90_win","gm_dk_army_machinegunner_assistant_gvm95_mg3_90_win","gm_dk_army_squadleader_gvm95_p2a1_90_win","gm_dk_army_antitank_gvm95_pzf84_90_win","gm_dk_army_antitank_assistant_gvm95_pzf84_90_win","gm_dk_army_rifleman_gvm95_90_win","gm_dk_army_rifleman_gvm95_90_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0],[25,-25,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// gm_platoon_gm_dk_army_Leopard1a3_win
	[[[["gm_dk_army_Leopard1a3_win","gm_dk_army_Leopard1a3_win","gm_dk_army_Leopard1a3_win","gm_dk_army_Leopard1a3_win"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// gm_dk_army_mechanizedInfantry_squad_m113a1dk_80
	[[[["gm_dk_army_m113a1dk_apc_win","gm_dk_army_squadleader_g3a3_p2a1_84_win","gm_dk_army_machinegunner_mg3_84_win","gm_dk_army_machinegunner_assistant_g3a3_mg3_84_win","gm_dk_army_antitank_g3a3_pzf84_84_win","gm_dk_army_machinegunner_mg3_84_win","gm_dk_army_antitank_assistant_g3a3_pzf84_84_win","gm_dk_army_rifleman_g3a3_84_win","gm_dk_army_rifleman_g3a3_84_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],

	// gm_dk_army_infantry_squad_84_win
	[[[["gm_dk_army_squadleader_g3a3_p2a1_84_win","gm_dk_army_machinegunner_mg3_84_win","gm_dk_army_machinegunner_assistant_g3a3_mg3_84_win","gm_dk_army_antitank_g3a3_pzf84_84_win","gm_dk_army_antitank_assistant_g3a3_pzf84_84_win","gm_dk_army_rifleman_g3a3_84_win","gm_dk_army_rifleman_g3a3_84_win","gm_dk_army_rifleman_g3a3_84_win"],[[0,0,0],[5,-5,0],[10,-10,0],[-5,-5,0],[-10,-10,0],[-15,-15,0],[15,-15,0],[-20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// gm_dk_army_infantry_mggroup_84_win
	[[[["gm_dk_army_squadleader_g3a3_p2a1_84_win","gm_dk_army_machinegunner_mg3_84_win","gm_dk_army_machinegunner_assistant_g3a3_mg3_84_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_dk_army_infantry_atgroup_84_win
	[[[["gm_dk_army_squadleader_g3a3_p2a1_84_win","gm_dk_army_antitank_g3a3_pzf84_84_win","gm_dk_army_antitank_assistant_g3a3_pzf84_84_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_dk_army_infantry_aagroup_84_win
	[[[["gm_dk_army_squadleader_g3a3_p2a1_84_win","gm_dk_army_antiair_g3a3_fim43_84_win","gm_dk_army_antiair_g3a3_fim43_84_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// gm_dk_army_sf_infantry_specops_84_win
	[[[["gm_dk_army_sf_squadleader_mp5a3_p2a1_84_win","gm_dk_army_sf_marksman_g3a3_84_win","gm_dk_army_sf_rifleman_mp5a3_84_win","gm_dk_army_sf_antitank_mp5a3_pzf84_84_win","gm_dk_army_sf_demolition_mp5a3_84_win","gm_dk_army_sf_machinegunner_mg8_84_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
	// gm_dk_army_infantry_squad_90_win
	[[[["gm_dk_army_squadleader_gvm95_p2a1_90_win","gm_dk_army_machinegunner_mg3_90_win","gm_dk_army_machinegunner_assistant_gvm95_mg3_90_win","gm_dk_army_antitank_gvm95_pzf84_90_win","gm_dk_army_antitank_assistant_gvm95_pzf84_90_win","gm_dk_army_rifleman_gvm95_90_win","gm_dk_army_rifleman_gvm95_90_win","gm_dk_army_rifleman_gvm95_90_win"],[[0,0,0],[5,-5,0],[10,-10,0],[-5,-5,0],[-10,-10,0],[-15,-15,0],[15,-15,0],[-20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// gm_dk_army_infantry_mggroup_90_win
	[[[["gm_dk_army_squadleader_gvm95_p2a1_90_win","gm_dk_army_machinegunner_mg3_90_win","gm_dk_army_machinegunner_assistant_gvm95_mg3_90_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_dk_army_infantry_atgroup_90_win
	[[[["gm_dk_army_squadleader_gvm95_p2a1_90_win","gm_dk_army_antitank_gvm95_pzf84_90_win","gm_dk_army_antitank_assistant_gvm95_pzf84_90_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE"]]],1],
	// gm_dk_army_infantry_aagroup_90_win
	[[[["gm_dk_army_squadleader_gvm95_p2a1_90_win","gm_dk_army_antiair_gvm95_fim43_90_win","gm_dk_army_antiair_gvm95_fim43_90_win"],[[0,0,0],[5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","CORPORAL"]]],1],
	// gm_dk_army_sf_infantry_specops_90_win
	[[[["gm_dk_army_sf_squadleader_mpm85_p2a1_90_win","gm_dk_army_sf_marksman_msg90a1_90_win","gm_dk_army_sf_rifleman_mpm85_90_win","gm_dk_army_sf_antitank_mpm85_pzf84_90_win","gm_dk_army_sf_demolition_mpm85_90_win","gm_dk_army_sf_machinegunner_mg8_90_win"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5]
];
_arr append [
	[[[["gm_dk_army_m113a1dk_medic_win"],[[0,0,0],[0,-15,0],[0,-30,0]],["SERGEANT","SERGEANT","SERGEANT"]]],0.05]
];
if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
	_arr append [
		// gm_platoon_gm_dk_army_m109_win
		[[[["gm_dk_army_m109_win","gm_dk_army_m109_win","gm_dk_army_m109_win","gm_dk_army_m109_win"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","SERGEANT"]]],0.1]
	];
};
[_groups_map, west, "gm_dk_army", [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1960,1990], [-999,159],
[]
] call gosa_fnc_map_groups_add;


// guer
[_groups_map, resistance, "gm_xx_army", [[
	// configName gm_xx_army_infantry_squad_80
	[[[["gm_xx_army_squadleader_m16a1_80_grn","gm_xx_army_rifleman_01_akm_alp","gm_xx_army_medic_01_mpikms72_m84","gm_xx_army_machinegunner_rpk_80_oli","gm_xx_army_assault_ak74nk_80_wdl","gm_xx_army_antitank_hk53a2_rpg7_80_oli","gm_xx_army_demolition_mp2a1_80_blk","gm_xx_army_marksman_svd_80_wdl","gm_xx_army_engineer_hk33a2_80_brn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// configName gm_xx_army_infantry_detachment_80
	[[[["gm_xx_army_squadleader_m16a1_80_grn","gm_xx_army_machinegunner_rpk_80_oli","gm_xx_army_marksman_svd_80_wdl","gm_xx_army_antitank_hk53a2_rpg7_80_oli","gm_xx_army_medic_01_mpikms72_m84","gm_xx_army_assault_ak74nk_80_wdl"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","CORPORAL","CORPORAL"]]],0.5],
	// configName gm_xx_army_infantry_post_80
	[[[["gm_xx_army_assault_ak74nk_80_wdl","gm_xx_army_rifleman_01_akm_alp"],[[0,0,0],[5,-5,0]],["LIEUTENANT","SERGEANT"]]],0.1]
], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[1960,1990], [160,999],
[]
] call gosa_fnc_map_groups_add;

/*
// Союзы формируются после групп.
if (resistance getFriend west >= 0.6) then {
	[_groups_map, resistance, "gm_xx_army", [[
		// configName gm_xx_army_infantry_squad_80
		[[
			[["gm_ge_airforce_do28d2"],[],["LIEUTENANT"],[["gm_xx_army_assault_ak74nk_80_wdl","gm_xx_army_assault_ak74nk_80_wdl"]]],
			[["gm_xx_army_squadleader_m16a1_80_grn","gm_xx_army_rifleman_01_akm_alp","gm_xx_army_medic_01_mpikms72_m84","gm_xx_army_machinegunner_rpk_80_oli","gm_xx_army_assault_ak74nk_80_wdl","gm_xx_army_antitank_hk53a2_rpg7_80_oli","gm_xx_army_demolition_mp2a1_80_blk","gm_xx_army_marksman_svd_80_wdl","gm_xx_army_engineer_hk33a2_80_brn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1960,1990], [160,999],
	[]
	] call gosa_fnc_map_groups_add;
};
if (resistance getFriend east >= 0.6) then {
	[_groups_map, resistance, "gm_xx_army", [[
		// configName gm_xx_army_infantry_squad_80
		[[
			[["gm_gc_airforce_l410t"],[],["LIEUTENANT"],[["gm_xx_army_assault_ak74nk_80_wdl","gm_xx_army_assault_ak74nk_80_wdl"]]],
			[["gm_xx_army_squadleader_m16a1_80_grn","gm_xx_army_rifleman_01_akm_alp","gm_xx_army_medic_01_mpikms72_m84","gm_xx_army_machinegunner_rpk_80_oli","gm_xx_army_assault_ak74nk_80_wdl","gm_xx_army_antitank_hk53a2_rpg7_80_oli","gm_xx_army_demolition_mp2a1_80_blk","gm_xx_army_marksman_svd_80_wdl","gm_xx_army_engineer_hk33a2_80_brn"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[25,-25,0]],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5]
	], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
	[1960,1990], [160,999],
	[]
	] call gosa_fnc_map_groups_add;
};
*/
