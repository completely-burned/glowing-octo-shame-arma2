//--- East
_arr = [
	// base_b1_fireteam
	[[[["lsd_cis_b1SquadLead_standard","lsd_cis_b1_standard","lsd_cis_b1Heavy_standard","lsd_cis_b1_standard"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// base_security_team
	[[[["lsd_cis_b1SquadLead_standard","lsd_cis_oomSecurity_standard","lsd_cis_oomSecurity_standard","lsd_cis_oomSecurity_standard"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// base_b1_squad
	[[[["lsd_cis_b1SquadLead_standard","lsd_cis_b1Heavy_standard","lsd_cis_b1_standard","lsd_cis_b1At_standard","lsd_cis_b1Marksman_standard","lsd_cis_b1Heavy_standard","lsd_cis_b1_standard","lsd_cis_b1_standard"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// base_b1_at
	[[[["lsd_cis_b1SquadLead_standard","lsd_cis_b1Heavy_standard","lsd_cis_b1AtMissile_standard","lsd_cis_b1AtMissile_standard"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// base_b1_aa
	[[[["lsd_cis_b1SquadLead_standard","lsd_cis_b1Heavy_standard","lsd_cis_b1AaMissile_standard","lsd_cis_b1AaMissile_standard"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// base_b1_sentry
	[[[["lsd_cis_b1_standard","lsd_cis_b1Heavy_standard"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// base_b1_marksmanPair
	[[[["lsd_cis_b1Marksman_standard","lsd_cis_b1Marksman_standard"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],
	// base_b1_mgTeam
	[[[["lsd_cis_b1SquadLead_standard","lsd_cis_b1Heavy_standard","lsd_cis_b1Heavy_standard"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.3]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_groups_cis", _arr,
	[3000,9999999], [-999,224],
	[]
] call gosa_fnc_map_groups_add;
[_groups_map, east, "ls_groups_cis", _arr,
	[3000,9999999], [250,299],
	[]
] call gosa_fnc_map_groups_add;

_arr = [
	// geonosis_b1_fireteam
	[[[["lsd_cis_b1SquadLead_geonosis","lsd_cis_b1_geonosis","lsd_cis_b1Heavy_geonosis","lsd_cis_b1_geonosis"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// geonosis_b1_squad
	[[[["lsd_cis_b1SquadLead_geonosis","lsd_cis_b1Heavy_geonosis","lsd_cis_b1_geonosis","lsd_cis_b1At_geonosis","lsd_cis_b1Marksman_geonosis","lsd_cis_b1Heavy_geonosis","lsd_cis_b1_geonosis","lsd_cis_b1_geonosis"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// geonosis_b1_at
	[[[["lsd_cis_b1SquadLead_geonosis","lsd_cis_b1Heavy_geonosis","lsd_cis_b1AtMissile_geonosis","lsd_cis_b1AtMissile_geonosis"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// geonosis_b1_aa
	[[[["lsd_cis_b1SquadLead_geonosis","lsd_cis_b1Heavy_geonosis","lsd_cis_b1AaMissile_geonosis","lsd_cis_b1AaMissile_geonosis"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// geonosis_b1_sentry
	[[[["lsd_cis_b1_geonosis","lsd_cis_b1Heavy_geonosis"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// geonosis_b1_marksmanPair
	[[[["lsd_cis_b1Marksman_geonosis","lsd_cis_b1Marksman_geonosis"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],
	// geonosis_b1_mgTeam
	[[[["lsd_cis_b1SquadLead_geonosis","lsd_cis_b1Heavy_geonosis","lsd_cis_b1Heavy_geonosis"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.3]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_groups_cis", _arr,
	[3000,9999999], [225,249],
	[]
] call gosa_fnc_map_groups_add;
[_groups_map, east, "ls_groups_cis", _arr,
	[3000,9999999], [300,999],
	[]
] call gosa_fnc_map_groups_add;

_arr = [
	/*
	// training_b1_fireteam
	[[[["lsd_cis_b1SquadLead_training","lsd_cis_b1_training","lsd_cis_b1Heavy_training","lsd_cis_b1_training"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// training_b1_squad
	[[[["lsd_cis_b1SquadLead_training","lsd_cis_b1Heavy_training","lsd_cis_b1_training","lsd_cis_b1At_training","lsd_cis_b1Marksman_training","lsd_cis_b1Heavy_training","lsd_cis_b1_training","lsd_cis_b1_training"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// training_b1_at
	[[[["lsd_cis_b1SquadLead_training","lsd_cis_b1Heavy_training","lsd_cis_b1AtMissile_training","lsd_cis_b1AtMissile_training"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// training_b1_aa
	[[[["lsd_cis_b1SquadLead_training","lsd_cis_b1Heavy_training","lsd_cis_b1AaMissile_training","lsd_cis_b1AaMissile_training"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// training_b1_sentry
	[[[["lsd_cis_b1_training","lsd_cis_b1Heavy_training"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// training_b1_marksmanPair
	[[[["lsd_cis_b1Marksman_training","lsd_cis_b1Marksman_training"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],
	// training_b1_mgTeam
	[[[["lsd_cis_b1SquadLead_training","lsd_cis_b1Heavy_training","lsd_cis_b1Heavy_training"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.3],
	*/
	// deathwatch_infantry_squad
	[[[["ls_mandalorian_sergeant_deathwatch","ls_mandalorian_at_deathwatch","ls_mandalorian_assault_deathwatch","ls_mandalorian_assault_deathwatch","ls_mandalorian_sergeant_deathwatch","ls_mandalorian_assault_deathwatch","ls_mandalorian_rto_deathwatch","ls_mandalorian_medic_deathwatch"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// deathwatch_weapons_squad
	[[[["ls_mandalorian_sergeant_deathwatch","ls_mandalorian_support_deathwatch","ls_mandalorian_assault_deathwatch","ls_mandalorian_aa_deathwatch","ls_mandalorian_sergeant_deathwatch","ls_mandalorian_heavyAT_deathwatch","ls_mandalorian_rto_deathwatch","ls_mandalorian_medic_deathwatch"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// deathwatch_infantry_team
	[[[["ls_mandalorian_sergeant_deathwatch","ls_mandalorian_at_deathwatch","ls_mandalorian_assault_deathwatch","ls_mandalorian_assault_deathwatch"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// deathwatch_at_team
	[[[["ls_mandalorian_sergeant_deathwatch","ls_mandalorian_heavyAT_deathwatch","ls_mandalorian_at_deathwatch","ls_mandalorian_at_deathwatch"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// deathwatch_aa_team
	[[[["ls_mandalorian_sergeant_deathwatch","ls_mandalorian_at_deathwatch","ls_mandalorian_aa_deathwatch","ls_mandalorian_aa_deathwatch"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// deathwatch_support_team
	[[[["ls_mandalorian_sergeant_deathwatch","ls_mandalorian_assault_deathwatch","ls_mandalorian_medic_deathwatch","ls_mandalorian_medic_deathwatch"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// deathwatch_eod_team
	[[[["ls_mandalorian_sergeant_deathwatch","ls_mandalorian_demo_deathwatch","ls_mandalorian_demo_deathwatch","ls_mandalorian_demo_deathwatch"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// deathwatch_mg_team
	[[[["ls_mandalorian_sergeant_deathwatch","ls_mandalorian_support_deathwatch","ls_mandalorian_support_deathwatch"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// deathwatch_infantry_sentry
	[[[["ls_mandalorian_sergeant_deathwatch","ls_mandalorian_assault_deathwatch"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// deathwatch_sniper_team
	[[[["ls_mandalorian_marksman_deathwatch","ls_mandalorian_heavy_deathwatch"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],
	// cis_mechanized_raptorPack
	[[[["lsd_ground_agtRaptor","lsd_ground_agtRaptor","lsd_ground_agtRaptor","lsd_ground_agtRaptor"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_groups_cis", _arr,
	[3000,9999999], [-999,999],
	[]
] call gosa_fnc_map_groups_add;


//--- West
_arr = [
	// saber_plt
	[[[["SWLG_tanks_tx130","SWLG_tanks_tx130","SWLG_tanks_tx130","SWLG_tanks_tx130"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0.5],
	// Clone_SaberSection
	[[[["SWLG_tanks_tx130","SWLG_tanks_tx130"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.1],
	// clone_fireteam
	[[[["SWLB_clone_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_engineer_base_P2","SWLB_clone_at_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.3],
	// clone_squad
	[[[["SWLB_clone_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_engineer_base_P2","SWLB_clone_at_base_P2","SWLB_clone_medic_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// clone_AT
	[[[["SWLB_clone_base_P2","SWLB_clone_at_base_P2","SWLB_clone_at_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0.4],
	// clone_sniper
	[[[["SWLB_clone_base_P2","SWLB_clone_sniper_base_P2"],[[0,0,0],[5,-5,0]],["SERGEANT","PRIVATE"]]],0.1],
	/*
	// clone_arc_squad
	[[[["SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0],
	// clone_cfr
	[[[["SWLB_clone_lieutenant_base_P2","SWLB_clone_cfr_base_P2","SWLB_clone_cfr_base_P2","SWLB_clone_cfr_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0],
	// clone_fireteam
	[[[["SWLB_clone_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_engineer_base_P2","SWLB_clone_at_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0],
	// clone_squad
	[[[["SWLB_clone_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_engineer_base_P2","SWLB_clone_at_base_P2","SWLB_clone_medic_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// clone_AT
	[[[["SWLB_clone_base_P2","SWLB_clone_at_base_P2","SWLB_clone_at_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","PRIVATE","PRIVATE"]]],0],
	// clone_sniper
	[[[["SWLB_clone_base_P2","SWLB_clone_sniper_base_P2"],[[0,0,0],[5,-5,0]],["SERGEANT","PRIVATE"]]],0],
	*/
	// clone_arc_squad
	[[[["SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	// clone_cfr
	[[[["SWLB_clone_lieutenant_base_P2","SWLB_clone_cfr_base_P2","SWLB_clone_cfr_base_P2","SWLB_clone_cfr_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_aiwha
	[[[["SWLB_AiwhaSarge","SWLB_AiwhaDikut","SWLB_AiwhaTyto","SWLB_AiwhaZag"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_bravo
	[[[["SWLB_BravoRam","SWLB_Bravo2","SWLB_Bravo3","SWLB_Bravo4"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_delta
	[[[["SWLB_DeltaBoss","SWLB_DeltaFixer","SWLB_DeltaScorch","SWLB_DeltaSev"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_omega
	[[[["SWLB_OmegaNiner","SWLB_OmegaAtin","SWLB_OmegaDarman","SWLB_OmegaFi"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_yayax
	[[[["SWLB_YayaxCov","SWLB_YayaxDev","SWLB_YayaxJind","SWLB_YayaxYover"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	/*
	// saber_plt
	[[[["SWLG_tanks_tx130","SWLG_tanks_tx130","SWLG_tanks_tx130","SWLG_tanks_tx130"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL"]]],0],
	// Clone_SaberSection
	[[[["SWLG_tanks_tx130","SWLG_tanks_tx130"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0],
	*/
	// clone_squad
	[[[["SWLB_clone_sergeant_base_P1","SWLB_clone_base_P1","SWLB_clone_at_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_base_P1","SWLB_clone_sg_base_P1","SWLB_clone_RTO_base_P1","SWLB_clone_medic_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// Clone_InfSquad_Weapons
	[[[["SWLB_clone_sergeant_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_sg_base_P1","SWLB_clone_base_P1","SWLB_clone_at_heavy_P1","SWLB_clone_aa_base_P1","SWLB_clone_RTO_base_P1","SWLB_clone_medic_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// clone_fireteam
	[[[["SWLB_clone_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_at_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// clone_cfr
	[[[["SWLB_clone_sergeant_base_P1","SWLB_clone_cfr_base_P1","SWLB_clone_cfr_base_P1","SWLB_clone_cfr_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone_AT
	[[[["SWLB_clone_base_P1","SWLB_clone_at_base_P1","SWLB_clone_at_heavy_P1","SWLB_clone_at_heavy_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// Clone_InfTeam_AA
	[[[["SWLB_clone_base_P1","SWLB_clone_at_base_P1","SWLB_clone_aa_base_P1","SWLB_clone_aa_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// Clone_InfSentry
	[[[["SWLB_clone_assault_base_P1","SWLB_clone_base_P1"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// Clone_ReconTeam
	[[[["SWLB_clone_recon_officer_base_P1","SWLB_clone_recon_nco_base_P1","SWLB_clone_recon_medic_base_P1","SWLB_clone_recon_at_base_P1","SWLB_clone_recon_base_P1","SWLB_clone_recon_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// Clone_ReconPatrol
	[[[["SWLB_clone_recon_nco_base_P1","SWLB_clone_recon_base_P1","SWLB_clone_recon_base_P1","SWLB_clone_recon_medic_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// Clone_ReconSentry
	[[[["SWLB_clone_recon_base_P1","SWLB_clone_recon_base_P1"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// clone_sniper
	[[[["SWLB_clone_sniper_base_P1","SWLB_clone_base_P1"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],
	// Clone_Security
	[[[["SWLB_clone_sergeant_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_RTO_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// CloneHQ_SecurityTeam
	[[[["SWLB_clone_lieutenant_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_RTO_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone2_squad
	[[[["SWLB_clone_base_P2","SWLB_clone_base_P2","SWLB_clone_at_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_RTO_base_P2","SWLB_clone_medic_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// Clone2_InfSquad_Weapons
	[[[["SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_base_P2","SWLB_clone_at_heavy_P2","SWLB_clone_aa_base_P2","SWLB_clone_RTO_base_P2","SWLB_clone_medic_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// clone2_fireteam
	[[[["SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_at_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// clone2_cfr
	[[[["SWLB_clone_base_P2","SWLB_clone_cfr_base_P2","SWLB_clone_cfr_base_P2","SWLB_clone_cfr_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone2_AT
	[[[["SWLB_clone_base_P2","SWLB_clone_at_base_P2","SWLB_clone_at_heavy_P2","SWLB_clone_at_heavy_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// Clone2_InfTeam_AA
	[[[["SWLB_clone_base_P2","SWLB_clone_at_base_P2","SWLB_clone_aa_base_P2","SWLB_clone_aa_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// Clone2_InfSentry
	[[[["SWLB_clone_assault_base_P2","SWLB_clone_base_P2"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// Clone2_ReconTeam
	[[[["SWLB_clone_recon_officer_base_P2","SWLB_clone_recon_nco_base_P2","SWLB_clone_recon_medic_base_P2","SWLB_clone_recon_at_base_P2","SWLB_clone_recon_base_P2","SWLB_clone_recon_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","CORPORAL","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// Clone2_ReconPatrol
	[[[["SWLB_clone_recon_nco_base_P2","SWLB_clone_recon_base_P2","SWLB_clone_recon_base_P2","SWLB_clone_recon_medic_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// Clone2_ReconSentry
	[[[["SWLB_clone_recon_base_P2","SWLB_clone_recon_base_P2"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// clone2_sniper
	[[[["SWLB_clone_sniper_base_P2","SWLB_clone_base_P2"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],
	// Clone2_Security
	[[[["SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_RTO_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// Clone2HQ_SecurityTeam
	[[[["SWLB_clone_lieutenant_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_RTO_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone_arc
	[[[["SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone_arc_squad
	[[[["SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2","SWLB_clone_arc_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	// clone_specops
	[[[["SWLB_clone_commando_sl_base","SWLB_clone_commando_tech_base","SWLB_clone_commando_sniper_base","SWLB_clone_commando_eod_base"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_aiwha
	[[[["SWLB_AiwhaSarge","SWLB_AiwhaDikut","SWLB_AiwhaTyto","SWLB_AiwhaZag"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_bravo
	[[[["SWLB_BravoRam","SWLB_Bravo2","SWLB_Bravo3","SWLB_Bravo4"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_delta
	[[[["SWLB_DeltaBoss","SWLB_DeltaFixer","SWLB_DeltaScorch","SWLB_DeltaSev"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_omega
	[[[["SWLB_OmegaNiner","SWLB_OmegaAtin","SWLB_OmegaDarman","SWLB_OmegaFi"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// clone_spec_yayax
	[[[["SWLB_YayaxCov","SWLB_YayaxDev","SWLB_YayaxJind","SWLB_YayaxYover"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// Clone_Support_ENG
	[[[["SWLB_clone_base_P1","SWLB_clone_engineer_base_P2","SWLB_clone_engineer_base_P2","SWLB_clone_engineer_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-5,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// Clone_Support_MG
	[[[["SWLB_clone_base_P1","SWLB_clone_sg_base_P1","SWLB_clone_sg_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// Clone2_Support_ENG
	[[[["SWLB_clone_base_P2","SWLB_clone_engineer_base_P2","SWLB_clone_engineer_base_P2","SWLB_clone_engineer_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-5,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// Clone2_Support_MG
	[[[["SWLB_clone_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_sg_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// Clone_MotInf_Reinforce
	[[[["SWLG_tanks_tx130","SWLB_clone_sergeant_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_RTO_base_P1","SWLB_clone_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_base_P1","SWLB_clone_base_P1","SWLB_clone_at_base_P1","SWLB_clone_base_P1","SWLB_clone_sg_base_P1","SWLB_clone_at_base_P1","SWLB_clone_medic_base_P1","SWLB_clone_medic_base_P1"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT"]]],0.5],
	// Clone2_MotInf_Reinforce
	[[[["SWLG_tanks_tx130","SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_RTO_base_P2","SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_base_P2","SWLB_clone_base_P2","SWLB_clone_at_base_P2","SWLB_clone_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_at_base_P2","SWLB_clone_medic_base_P2","SWLB_clone_medic_base_P2"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0]],["SERGEANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT"]]],0.5],
	// Clone_MechInfSquad
	[[[["SWLG_tanks_tx130","SWLB_clone_sergeant_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_at_base_P1","SWLB_clone_base_P1","SWLB_clone_base_P1","SWLB_clone_sg_base_P1","SWLB_clone_RTO_base_P1","SWLB_clone_medic_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	// Clone_MechInf_AT
	[[[["SWLG_tanks_tx130","SWLB_clone_sergeant_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_RTO_base_P1","SWLB_clone_at_heavy_P1","SWLB_clone_at_heavy_P1","SWLB_clone_at_heavy_P1","SWLB_clone_at_heavy_P1","SWLB_clone_at_heavy_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.2],
	// Clone_MechInf_AA
	[[[["SWLG_tanks_tx130","SWLB_clone_sergeant_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_RTO_base_P1","SWLB_clone_aa_base_P1","SWLB_clone_aa_base_P1","SWLB_clone_aa_base_P1","SWLB_clone_aa_base_P1","SWLB_clone_aa_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.05],
	// Clone_MechInf_Support
	[[[["SWLG_tanks_tx130","SWLB_clone_sergeant_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_RTO_base_P1","SWLB_clone_engineer_base_P2","SWLB_clone_medic_base_P1","SWLB_clone_base_P1","SWLB_clone_assault_base_P1","SWLB_clone_sg_base_P1"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.05],
	// Clone2_MechInfSquad
	[[[["SWLG_tanks_tx130","SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_at_base_P2","SWLB_clone_base_P2","SWLB_clone_base_P2","SWLB_clone_sg_base_P2","SWLB_clone_RTO_base_P2","SWLB_clone_medic_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.05],
	// Clone2_MechInf_AT
	[[[["SWLG_tanks_tx130","SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_RTO_base_P2","SWLB_clone_at_heavy_P2","SWLB_clone_at_heavy_P2","SWLB_clone_at_heavy_P2","SWLB_clone_at_heavy_P2","SWLB_clone_at_heavy_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.05],
	// Clone2_MechInf_AA
	[[[["SWLG_tanks_tx130","SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_RTO_base_P2","SWLB_clone_aa_base_P2","SWLB_clone_aa_base_P2","SWLB_clone_aa_base_P2","SWLB_clone_aa_base_P2","SWLB_clone_aa_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.05],
	// Clone2_MechInf_Support
	[[[["SWLG_tanks_tx130","SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_RTO_base_P2","SWLB_clone_engineer_base_P2","SWLB_clone_medic_base_P2","SWLB_clone_base_P2","SWLB_clone_assault_base_P2","SWLB_clone_sg_base_P2"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],["LIEUTENANT","SERGEANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.05]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "SWLB_group_GAR", _arr,
	[3000,9999999], [-999,999],
	[]
] call gosa_fnc_map_groups_add;


//--- Guer
_arr = [
	// saxon_infantry_squad
	[[[["ls_mandalorian_sergeant_saxon","ls_mandalorian_at_saxon","ls_mandalorian_assault_saxon","ls_mandalorian_assault_saxon","ls_mandalorian_heavy_saxon","ls_mandalorian_assault_saxon","ls_mandalorian_rto_saxon","ls_mandalorian_medic_saxon"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// saxon_weapons_squad
	[[[["ls_mandalorian_sergeant_saxon","ls_mandalorian_support_saxon","ls_mandalorian_assault_saxon","ls_mandalorian_aa_saxon","ls_mandalorian_heavy_saxon","ls_mandalorian_heavyAT_saxon","ls_mandalorian_rto_saxon","ls_mandalorian_medic_saxon"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// saxon_infantry_team
	[[[["ls_mandalorian_sergeant_saxon","ls_mandalorian_at_saxon","ls_mandalorian_assault_saxon","ls_mandalorian_assault_saxon"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// saxon_at_team
	[[[["ls_mandalorian_sergeant_saxon","ls_mandalorian_heavyAT_saxon","ls_mandalorian_at_saxon","ls_mandalorian_at_saxon"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// saxon_aa_team
	[[[["ls_mandalorian_sergeant_saxon","ls_mandalorian_at_saxon","ls_mandalorian_aa_saxon","ls_mandalorian_aa_saxon"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// saxon_support_team
	[[[["ls_mandalorian_sergeant_saxon","ls_mandalorian_assault_saxon","ls_mandalorian_medic_saxon","ls_mandalorian_medic_saxon"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// saxon_eod_team
	[[[["ls_mandalorian_sergeant_saxon","ls_mandalorian_demo_saxon","ls_mandalorian_demo_saxon","ls_mandalorian_demo_saxon"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// saxon_mg_team
	[[[["ls_mandalorian_sergeant_saxon","ls_mandalorian_support_saxon","ls_mandalorian_support_saxon"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.2],
	// saxon_infantry_sentry
	[[[["ls_mandalorian_sergeant_saxon","ls_mandalorian_assault_saxon"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// saxon_sniper_team
	[[[["ls_mandalorian_marksman_saxon","ls_mandalorian_heavy_saxon"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, resistance, "ls_groups_greenfor_mandalorians", _arr,
	[3000,9999999], [-999,159],
	[]
] call gosa_fnc_map_groups_add;

_arr = [
	// traditional_infantry_squad
	[[[["ls_mandalorian_heavy_traditional","ls_mandalorian_at_traditional","ls_mandalorian_assault_traditional","ls_mandalorian_assault_traditional","ls_mandalorian_heavy_traditional","ls_mandalorian_assault_traditional","ls_mandalorian_rto_traditional","ls_mandalorian_medic_traditional"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// traditional_weapons_squad
	[[[["ls_mandalorian_heavy_traditional","ls_mandalorian_support_traditional","ls_mandalorian_assault_traditional","ls_mandalorian_aa_traditional","ls_mandalorian_heavy_traditional","ls_mandalorian_heavyAT_traditional","ls_mandalorian_rto_traditional","ls_mandalorian_medic_traditional"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// traditional_infantry_team
	[[[["ls_mandalorian_heavy_traditional","ls_mandalorian_at_traditional","ls_mandalorian_assault_traditional","ls_mandalorian_assault_traditional"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// traditional_at_team
	[[[["ls_mandalorian_heavy_traditional","ls_mandalorian_heavyAT_traditional","ls_mandalorian_at_traditional","ls_mandalorian_at_traditional"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// traditional_aa_team
	[[[["ls_mandalorian_heavy_traditional","ls_mandalorian_at_traditional","ls_mandalorian_aa_traditional","ls_mandalorian_aa_traditional"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// traditional_support_team
	[[[["ls_mandalorian_heavy_traditional","ls_mandalorian_assault_traditional","ls_mandalorian_medic_traditional","ls_mandalorian_medic_traditional"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// traditional_eod_team
	[[[["ls_mandalorian_heavy_traditional","ls_mandalorian_demo_traditional","ls_mandalorian_demo_traditional","ls_mandalorian_demo_traditional"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// traditional_mg_team
	[[[["ls_mandalorian_heavy_traditional","ls_mandalorian_support_traditional","ls_mandalorian_support_traditional"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// traditional_infantry_sentry
	[[[["ls_mandalorian_heavy_traditional","ls_mandalorian_assault_traditional"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// traditional_sniper_team
	[[[["ls_mandalorian_marksman_traditional","ls_mandalorian_heavy_traditional"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],

	// ordo_infantry_squad
	[[[["ls_mandalorian_sergeant_ordo","ls_mandalorian_at_ordo","ls_mandalorian_assault_ordo","ls_mandalorian_assault_ordo","ls_mandalorian_heavy_ordo","ls_mandalorian_assault_ordo","ls_mandalorian_rto_ordo","ls_mandalorian_medic_ordo"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// ordo_weapons_squad
	[[[["ls_mandalorian_sergeant_ordo","ls_mandalorian_support_ordo","ls_mandalorian_assault_ordo","ls_mandalorian_aa_ordo","ls_mandalorian_heavy_ordo","ls_mandalorian_heavyAT_ordo","ls_mandalorian_rto_ordo","ls_mandalorian_medic_ordo"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// ordo_infantry_team
	[[[["ls_mandalorian_sergeant_ordo","ls_mandalorian_at_ordo","ls_mandalorian_assault_ordo","ls_mandalorian_assault_ordo"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// ordo_at_team
	[[[["ls_mandalorian_sergeant_ordo","ls_mandalorian_heavyAT_ordo","ls_mandalorian_at_ordo","ls_mandalorian_at_ordo"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// ordo_aa_team
	[[[["ls_mandalorian_sergeant_ordo","ls_mandalorian_at_ordo","ls_mandalorian_aa_ordo","ls_mandalorian_aa_ordo"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// ordo_support_team
	[[[["ls_mandalorian_sergeant_ordo","ls_mandalorian_assault_ordo","ls_mandalorian_medic_ordo","ls_mandalorian_medic_ordo"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// ordo_eod_team
	[[[["ls_mandalorian_sergeant_ordo","ls_mandalorian_demo_ordo","ls_mandalorian_demo_ordo","ls_mandalorian_demo_ordo"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// ordo_mg_team
	[[[["ls_mandalorian_sergeant_ordo","ls_mandalorian_support_ordo","ls_mandalorian_support_ordo"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.2],
	// ordo_infantry_sentry
	[[[["ls_mandalorian_sergeant_ordo","ls_mandalorian_assault_ordo"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// ordo_sniper_team
	[[[["ls_mandalorian_marksman_ordo","ls_mandalorian_heavy_ordo"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],

	// eldar_infantry_squad
	[[[["ls_mandalorian_sergeant_eldar","ls_mandalorian_at_eldar","ls_mandalorian_assault_eldar","ls_mandalorian_assault_eldar","ls_mandalorian_heavy_eldar","ls_mandalorian_assault_eldar","ls_mandalorian_rto_eldar","ls_mandalorian_medic_eldar"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// eldar_weapons_squad
	[[[["ls_mandalorian_sergeant_eldar","ls_mandalorian_support_eldar","ls_mandalorian_assault_eldar","ls_mandalorian_aa_eldar","ls_mandalorian_heavy_eldar","ls_mandalorian_heavyAT_eldar","ls_mandalorian_rto_eldar","ls_mandalorian_medic_eldar"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// eldar_infantry_team
	[[[["ls_mandalorian_sergeant_eldar","ls_mandalorian_at_eldar","ls_mandalorian_assault_eldar","ls_mandalorian_assault_eldar"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// eldar_at_team
	[[[["ls_mandalorian_sergeant_eldar","ls_mandalorian_heavyAT_eldar","ls_mandalorian_at_eldar","ls_mandalorian_at_eldar"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// eldar_aa_team
	[[[["ls_mandalorian_sergeant_eldar","ls_mandalorian_at_eldar","ls_mandalorian_aa_eldar","ls_mandalorian_aa_eldar"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// eldar_support_team
	[[[["ls_mandalorian_sergeant_eldar","ls_mandalorian_assault_eldar","ls_mandalorian_medic_eldar","ls_mandalorian_medic_eldar"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// eldar_eod_team
	[[[["ls_mandalorian_sergeant_eldar","ls_mandalorian_demo_eldar","ls_mandalorian_demo_eldar","ls_mandalorian_demo_eldar"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// eldar_mg_team
	[[[["ls_mandalorian_sergeant_eldar","ls_mandalorian_support_eldar","ls_mandalorian_support_eldar"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.2],
	// eldar_infantry_sentry
	[[[["ls_mandalorian_sergeant_eldar","ls_mandalorian_assault_eldar"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// eldar_sniper_team
	[[[["ls_mandalorian_marksman_eldar","ls_mandalorian_heavy_eldar"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1],

	// vizsla_infantry_squad
	[[[["ls_mandalorian_sergeant_vizsla","ls_mandalorian_at_vizsla","ls_mandalorian_assault_vizsla","ls_mandalorian_assault_vizsla","ls_mandalorian_heavy_vizsla","ls_mandalorian_assault_vizsla","ls_mandalorian_rto_vizsla","ls_mandalorian_medic_vizsla"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// vizsla_weapons_squad
	[[[["ls_mandalorian_sergeant_vizsla","ls_mandalorian_support_vizsla","ls_mandalorian_assault_vizsla","ls_mandalorian_aa_vizsla","ls_mandalorian_heavy_vizsla","ls_mandalorian_heavyAT_vizsla","ls_mandalorian_rto_vizsla","ls_mandalorian_medic_vizsla"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// vizsla_infantry_team
	[[[["ls_mandalorian_sergeant_vizsla","ls_mandalorian_at_vizsla","ls_mandalorian_assault_vizsla","ls_mandalorian_assault_vizsla"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.3],
	// vizsla_at_team
	[[[["ls_mandalorian_sergeant_vizsla","ls_mandalorian_heavyAT_vizsla","ls_mandalorian_at_vizsla","ls_mandalorian_at_vizsla"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.4],
	// vizsla_aa_team
	[[[["ls_mandalorian_sergeant_vizsla","ls_mandalorian_at_vizsla","ls_mandalorian_aa_vizsla","ls_mandalorian_aa_vizsla"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// vizsla_support_team
	[[[["ls_mandalorian_sergeant_vizsla","ls_mandalorian_assault_vizsla","ls_mandalorian_medic_vizsla","ls_mandalorian_medic_vizsla"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// vizsla_eod_team
	[[[["ls_mandalorian_sergeant_vizsla","ls_mandalorian_demo_vizsla","ls_mandalorian_demo_vizsla","ls_mandalorian_demo_vizsla"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],
	// vizsla_mg_team
	[[[["ls_mandalorian_sergeant_vizsla","ls_mandalorian_support_vizsla","ls_mandalorian_support_vizsla"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.2],
	// vizsla_infantry_sentry
	[[[["ls_mandalorian_sergeant_vizsla","ls_mandalorian_assault_vizsla"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// vizsla_sniper_team
	[[[["ls_mandalorian_marksman_vizsla","ls_mandalorian_heavy_vizsla"],[[0,0,0],[5,-5,0]],["SERGEANT","CORPORAL"]]],0.1]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, resistance, "ls_groups_greenfor_mandalorians", _arr,
	[3000,9999999], [160,999],
	[]
] call gosa_fnc_map_groups_add;
