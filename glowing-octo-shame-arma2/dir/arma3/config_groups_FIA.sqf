//-- BLU_G_F Guerilla
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"BLU_G_F");
if (_tmp > 50 or (_d >= 1990 && _tmp > 0)) then {
	if (_tmp > 50 or _n >= 300) then {
	_west append [
		[[[["B_G_soldier_SL_F","B_G_soldier_TL_F","B_G_soldier_F","B_G_soldier_LAT_F","B_G_Soldier_M_F","B_G_soldier_AR_F","B_G_Soldier_A_F","B_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_soldier_SL_F","B_G_soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_soldier_LAT_F","B_G_soldier_LAT_F","B_G_soldier_A_F","B_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_TL_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_GL_F","B_G_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_M_F","B_G_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_G_Sharpshooter_F","B_G_Soldier_M_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
		[[[["B_G_Soldier_SL_F","B_G_Sharpshooter_F","B_G_Soldier_AR_F","B_G_Soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],

		[[[["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F","B_G_medic_F","B_G_Soldier_F","B_G_Offroad_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"],[[0,0,0],[10,-10,0],[-10,-10,0]],["PRIVATE","PRIVATE","PRIVATE"]]],0.5],

		[[[["B_G_Offroad_01_repair_F"],[],["PRIVATE"],[["B_G_engineer_F"]]]],0.01],
		[[[["B_G_Van_01_fuel_F"],[],["PRIVATE"]]],0.01]

		//[[[["B_G_Mortar_01_F"],[],["PRIVATE"]]],0.05]
	];
}};

//-- OPF_G_F
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"OPF_G_F");
if (_tmp > 50 or (_d >= 1990 && _tmp > 0)) then {
	if (_tmp > 50 or _n >= 300) then {
	_east append [
		// configName O_G_InfSquad_Assault
		[[[["O_G_Soldier_SL_F","O_G_soldier_AR_F","O_G_soldier_GL_F","O_G_soldier_LAT2_F","O_G_soldier_M_F","O_G_soldier_F","O_G_soldier_F","O_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
		// configName O_G_InfTeam_Light
		[[[["O_G_soldier_TL_F","O_G_soldier_AR_F","O_G_soldier_F","O_G_soldier_LAT2_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],

		[[[["O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F","O_G_medic_F","O_G_Soldier_F","O_G_Offroad_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
		[[[["O_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F"],[[0,0,0],[10,-10,0],[-10,-10,0]],["PRIVATE","PRIVATE","PRIVATE"]]],0.5],

		[[[["O_G_Offroad_01_repair_F"],[],["PRIVATE"],[["O_G_engineer_F"]]]],0.01],
		[[[["O_G_Van_01_fuel_F"],[],["PRIVATE"]]],0.01]

		//[[[["O_G_Mortar_01_F"],[],["PRIVATE"]]],0.05]
	];
}};

//-- IND_G_F
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"IND_G_F");
if (_tmp > 50 or (_d >= 1990 && _tmp > 0)) then {
	if (_tmp > 50 or _n >= 300) then {
	_guer append [
		// configName I_G_InfSquad_Assault
		[[[["I_G_Soldier_SL_F","I_G_soldier_AR_F","I_G_soldier_GL_F","I_G_soldier_LAT2_F","I_G_soldier_M_F","I_G_soldier_F","I_G_soldier_F","I_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","PRIVATE","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
		// configName I_G_InfTeam_Light
		[[[["I_G_soldier_TL_F","I_G_soldier_AR_F","I_G_soldier_F","I_G_soldier_LAT2_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],

		[[[["I_G_Offroad_01_repair_F"],[],["PRIVATE"],[["I_G_engineer_F"]]]],0.01],
		[[[["I_G_Van_01_fuel_F"],[],["PRIVATE"]]],0.01]
		//[[[["I_G_Mortar_01_F"],[],["PRIVATE"]]],0.05]
	];
}};
