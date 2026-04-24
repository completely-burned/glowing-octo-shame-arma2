// Жандармерия.
[_groups_map, west, "B_GEN", [[
	// lxWS
	[[[["B_GEN_APC_Wheeled_02_hmg_lxWS","B_GEN_Commander_F",
		"B_GEN_Soldier_F","B_GEN_Soldier_F","B_GEN_Soldier_F"],[[0,0],[0,5],[1,5],[-1,5],[1,6]],
		["SERGEANT","LIEUTENANT",
		"PRIVATE","PRIVATE", "PRIVATE"],[],1]],0.01],

	[[[["B_GEN_Commander_F",
		"B_GEN_Soldier_F","B_GEN_Soldier_F",
		"B_GEN_Van_02_vehicle_F"],[[0,2.5],[0,-2.5],[2.5,0],[0,0]],
		["LIEUTENANT",
		"PRIVATE","PRIVATE",
		"PRIVATE"]]],0.01],

	[[[["B_GEN_Commander_F","B_GEN_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.01],
	[[[["B_GEN_Offroad_01_gen_F","B_GEN_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.01]
], _copyRef] call gosa_fnc_filtering_squads_byAvail_v2,
[2020,2100], [160,999],
["O_GEN", "I_GEN"]
] call gosa_fnc_map_groups_add;
