//--- East
_cfg = (configfile >> "CfgGroups" >> "East" >> "ls_imperial" >> "imperial_baseInfantry_ISB");
_arr = [
	[[[_cfg >> "base_imperial_mudtroopers_fireteam"]], -1, 0.3],
	[[[_cfg >> "base_imperial_mudtroopers_sentry"]], -1, 0.2],
	[[[_cfg >> "base_imperial_mudtroopers_squad"]], 1],
	[[[_cfg >> "base_imperial_mudtroopers_at"]], -1, 0.4],
	[[[_cfg >> "base_imperial_mudtroopers_aa"]], -1, 0.2],
	[[[_cfg >> "base_imperial_mudtroopers_marksmanPair"]], -1, 0.1],
	[[[_cfg >> "base_imperial_mudtroopers_mgTeam"]], -1, 0.3]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_imperial", _arr,
	[3000,9999999], [-999,150-1],
	[]
] call gosa_fnc_map_groups_add;
_cfg = (configfile >> "CfgGroups" >> "East" >> "ls_imperial" >> "imperial_baseInfantry_mudtroopers");
_arr = [
	[[[_cfg >> "base_imperial_mudtroopers_fireteam"]], -1, 0.3],
	[[[_cfg >> "base_imperial_mudtroopers_sentry"]], -1, 0.2],
	[[[_cfg >> "base_imperial_mudtroopers_squad"]], 1],
	[[[_cfg >> "base_imperial_mudtroopers_at"]], -1, 0.4],
	[[[_cfg >> "base_imperial_mudtroopers_aa"]], -1, 0.2],
	[[[_cfg >> "base_imperial_mudtroopers_marksmanPair"]], -1, 0.1],
	[[[_cfg >> "base_imperial_mudtroopers_mgTeam"]], -1, 0.3]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_imperial", _arr,
	[3000,9999999], [150,250-1],
	[]
] call gosa_fnc_map_groups_add;
_cfg = (configfile >> "CfgGroups" >> "East" >> "ls_imperial" >> "imperial_baseInfantry");
_arr = [
	[[[_cfg >> "base_imperial_fireteam"]], -1, 0.3],
	[[[_cfg >> "base_imperial_sentry"]], -1, 0.2],
	[[[_cfg >> "base_imperial_squad"]], 1],
	[[[_cfg >> "base_imperial_at"]], -1, 0.4],
	[[[_cfg >> "base_imperial_aa"]], -1, 0.2],
	[[[_cfg >> "base_imperial_marksmanPair"]], -1, 0.1],
	[[[_cfg >> "base_imperial_mgTeam"]], -1, 0.3]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_imperial", _arr,
	[3000,9999999], [250,275-1],
	[]
] call gosa_fnc_map_groups_add;
_cfg = (configfile >> "CfgGroups" >> "East" >> "ls_imperial" >> "imperial_baseInfantry_blackcamo");
_arr = [
	[[[_cfg >> "base_imperial_blackcamo_fireteam"]], -1, 0.3],
	[[[_cfg >> "base_imperial_blackcamo_sentry"]], -1, 0.2],
	[[[_cfg >> "base_imperial_blackcamo_squad"]], 1],
	[[[_cfg >> "base_imperial_blackcamo_at"]], -1, 0.4],
	[[[_cfg >> "base_imperial_blackcamo_aa"]], -1, 0.2],
	[[[_cfg >> "base_imperial_blackcamo_marksmanPair"]], -1, 0.1],
	[[[_cfg >> "base_imperial_blackcamo_mgTeam"]], -1, 0.3]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_imperial", _arr,
	[3000,9999999], [275,999],
	[]
] call gosa_fnc_map_groups_add;

_cfg = (configfile >> "CfgGroups" >> "East" >> "ls_cis" >> "cis_baseInfantry");
_arr = [
	[[[_cfg >> "base_b1_fireteam"]], -1, 0.3],
	[[[_cfg >> "base_security_team"]], -1, 0.2],
	[[[_cfg >> "base_b1_squad"]], 1],
	[[[_cfg >> "base_b1_at"]], -1, 0.4],
	[[[_cfg >> "base_b1_aa"]], -1, 0.2],
	[[[_cfg >> "base_b1_sentry"]], -1, 0.1],
	[[[_cfg >> "base_b1_marksmanPair"]], -1, 0.1],
	[[[_cfg >> "base_b1_mgTeam"]], -1, 0.3],
	[[[configfile >> "CfgGroups" >> "East" >> "ls_cis" >> "cis_mechanized" >> "cis_mechanized_raptorPack"]], -1, 0.5]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_groups_cis", _arr,
	[3000,9999999], [-999,224],
	[]
] call gosa_fnc_map_groups_add;
[_groups_map, east, "ls_groups_cis", _arr,
	[3000,9999999], [250,299],
	[]
] call gosa_fnc_map_groups_add;

_cfg = (configfile >> "CfgGroups" >> "East" >> "ls_cis" >> "cis_geonosisInfantry");
_arr = [
	[[[_cfg >> "geonosis_b1_fireteam"]], -1, 0.3],
	[[[_cfg >> "geonosis_b1_squad"]], 1],
	[[[_cfg >> "geonosis_b1_at"]], -1, 0.4],
	[[[_cfg >> "geonosis_b1_aa"]], -1, 0.2],
	[[[_cfg >> "geonosis_b1_sentry"]], -1, 0.1],
	[[[_cfg >> "geonosis_b1_marksmanPair"]], -1, 0.1],
	[[[_cfg >> "geonosis_b1_mgTeam"]], -1, 0.3]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_groups_cis", _arr,
	[3000,9999999], [225,249],
	[]
] call gosa_fnc_map_groups_add;
[_groups_map, east, "ls_groups_cis", _arr,
	[3000,9999999], [300,999],
	[]
] call gosa_fnc_map_groups_add;

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
_cfg = (configfile >> "CfgGroups" >> "East" >> "ls_cis" >> "mandalorian_deathwatchInfantry");
_arr = [
	[[[_cfg >> "deathwatch_infantry_squad"]], 1],
	[[[_cfg >> "deathwatch_weapons_squad"]], 1],
	[[[_cfg >> "deathwatch_infantry_team"]], -1, 0.2],
	[[[_cfg >> "deathwatch_at_team"]], -1, 0.4],
	[[[_cfg >> "deathwatch_aa_team"]], -1, 0.2],
	[[[_cfg >> "deathwatch_support_team"]], -1, 0.1],
	[[[_cfg >> "deathwatch_eod_team"]], -1, 0.1],
	[[[_cfg >> "deathwatch_mg_team"]], -1, 0.3],
	[[[_cfg >> "deathwatch_infantry_sentry"]], -1, 0.3],
	[[[_cfg >> "deathwatch_sniper_team"]], -1, 0.3]
]; [_arr] call gosa_fnc_groups_convNormal;
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
_cfg = (configfile >> "CfgGroups" >> "West" >> "ls_orsf" >> "orsf_baseInfantry");
_arr = [
	[[[_cfg >> "ORSF_infantry_squad"]], 1],
	[[[_cfg >> "ORSF_weapons_squad"]], 1],
	[[[_cfg >> "ORSF_infantry_team"]], -1, 0.2],
	[[[_cfg >> "ORSF_at_team"]], -1, 0.4],
	[[[_cfg >> "ORSF_aa_team"]], -1, 0.2],
	[[[_cfg >> "ORSF_support_team"]], -1, 0.1],
	[[[_cfg >> "ORSF_eod_team"]], -1, 0.1],
	[[[_cfg >> "ORSF_mg_team"]], -1, 0.3],
	[[[_cfg >> "ORSF_infantry_sentry"]], -1, 0.3],
	[[[_cfg >> "ORSF_sniper_team"]], -1, 0.3]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr append [
	//[[[["ls_cis_hmp","ls_cis_hmp"],[[0,0,0],[20,-20,0]],["CAPTAIN","LIEUTENANT"]]],0.5],
	[[[["ls_ground_aat","ls_ground_aat","ls_ground_aat","ls_ground_aat"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","SERGEANT","CORPORAL"]]],0.5],
	[[[["ls_ground_aat","ls_ground_aat"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.5]
];
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, west, "ls_orsf", _arr,
	[3000,9999999], [-999,999],
	[]
] call gosa_fnc_map_groups_add;


//--- Guer
_cfg = (configfile >> "CfgGroups" >> "Indep" >> "ls_mandalorians" >> "mandalorian_saxonInfantry");
_arr = [
	[[[_cfg >> "saxon_infantry_squad"]], 1],
	[[[_cfg >> "saxon_weapons_squad"]], 1],
	[[[_cfg >> "saxon_infantry_team"]], -1, 0.2],
	[[[_cfg >> "saxon_at_team"]], -1, 0.4],
	[[[_cfg >> "saxon_aa_team"]], -1, 0.2],
	[[[_cfg >> "saxon_support_team"]], -1, 0.1],
	[[[_cfg >> "saxon_eod_team"]], -1, 0.1],
	[[[_cfg >> "saxon_mg_team"]], -1, 0.3],
	[[[_cfg >> "saxon_infantry_sentry"]], -1, 0.3],
	[[[_cfg >> "saxon_sniper_team"]], -1, 0.3]
]; [_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, resistance, "ls_groups_greenfor_mandalorians", _arr,
	[3000,9999999], [-999,159],
	[]
] call gosa_fnc_map_groups_add;

_cfg = (configfile >> "CfgGroups" >> "Indep" >> "ls_mandalorians" >> "mandalorian_traditionalInfantry");
_arr = ([[
	[[[_cfg >> "traditional_infantry_squad"]], 1],
	[[[_cfg >> "traditional_weapons_squad"]], 1],
	[[[_cfg >> "traditional_infantry_team"]], -1, 0.2],
	[[[_cfg >> "traditional_at_team"]], -1, 0.4],
	[[[_cfg >> "traditional_aa_team"]], -1, 0.2],
	[[[_cfg >> "traditional_support_team"]], -1, 0.1],
	[[[_cfg >> "traditional_eod_team"]], -1, 0.1],
	[[[_cfg >> "traditional_mg_team"]], -1, 0.3],
	[[[_cfg >> "traditional_infantry_sentry"]], -1, 0.3],
	[[[_cfg >> "traditional_sniper_team"]], -1, 0.3]
]] call gosa_fnc_groups_convNormal);
_cfg = (configfile >> "CfgGroups" >> "Indep" >> "ls_mandalorians" >> "mandalorian_ordoInfantry");
_arr append ([[
	[[[_cfg >> "ordo_infantry_squad"]], 1],
	[[[_cfg >> "ordo_weapons_squad"]], 1],
	[[[_cfg >> "ordo_infantry_team"]], -1, 0.2],
	[[[_cfg >> "ordo_at_team"]], -1, 0.4],
	[[[_cfg >> "ordo_aa_team"]], -1, 0.2],
	[[[_cfg >> "ordo_support_team"]], -1, 0.1],
	[[[_cfg >> "ordo_eod_team"]], -1, 0.1],
	[[[_cfg >> "ordo_mg_team"]], -1, 0.3],
	[[[_cfg >> "ordo_infantry_sentry"]], -1, 0.3],
	[[[_cfg >> "ordo_sniper_team"]], -1, 0.3]
]] call gosa_fnc_groups_convNormal);
_cfg = (configfile >> "CfgGroups" >> "Indep" >> "ls_mandalorians" >> "mandalorian_eldarInfantry");
_arr append ([[
	[[[_cfg >> "eldar_infantry_squad"]], 1],
	[[[_cfg >> "eldar_weapons_squad"]], 1],
	[[[_cfg >> "eldar_infantry_team"]], -1, 0.2],
	[[[_cfg >> "eldar_at_team"]], -1, 0.4],
	[[[_cfg >> "eldar_aa_team"]], -1, 0.2],
	[[[_cfg >> "eldar_support_team"]], -1, 0.1],
	[[[_cfg >> "eldar_eod_team"]], -1, 0.1],
	[[[_cfg >> "eldar_mg_team"]], -1, 0.3],
	[[[_cfg >> "eldar_infantry_sentry"]], -1, 0.3],
	[[[_cfg >> "eldar_sniper_team"]], -1, 0.3]
]] call gosa_fnc_groups_convNormal);

_cfg = (configfile >> "CfgGroups" >> "Indep" >> "ls_mandalorians" >> "mandalorian_vizslaInfantry");
_arr append ([[
	[[[_cfg >> "vizsla_infantry_squad"]], 1],
	[[[_cfg >> "vizsla_weapons_squad"]], 1],
	[[[_cfg >> "vizsla_infantry_team"]], -1, 0.2],
	[[[_cfg >> "vizsla_at_team"]], -1, 0.4],
	[[[_cfg >> "vizsla_aa_team"]], -1, 0.2],
	[[[_cfg >> "vizsla_support_team"]], -1, 0.1],
	[[[_cfg >> "vizsla_eod_team"]], -1, 0.1],
	[[[_cfg >> "vizsla_mg_team"]], -1, 0.3],
	[[[_cfg >> "vizsla_infantry_sentry"]], -1, 0.3],
	[[[_cfg >> "vizsla_sniper_team"]], -1, 0.3]
]] call gosa_fnc_groups_convNormal);
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, resistance, "ls_groups_greenfor_mandalorians", _arr,
	[3000,9999999], [160,999],
	[]
] call gosa_fnc_map_groups_add;
