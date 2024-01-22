
#include "..\include\ranks.hpp"

_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"IND_E_F");
if (_tmp > 0 or (_tmp == -1 && _d >= 1980)) then {
if (_tmp > 0 or (_tmp == -1 && (_n >= 160 && _n < 250))) then {

_guer=_guer+[
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
	"PRIVATE"]]],0.5],
// configName I_E_InfSentry
[[[["I_E_soldier_GL_F","I_E_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
// configName I_E_InfTeam
[[[["I_E_soldier_TL_F",
	"I_E_soldier_AR_F","I_E_soldier_GL_F",
	"I_E_RadioOperator_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
	["SERGEANT",
	"CORPORAL","PRIVATE",
	"PRIVATE"]]],0.5]
];

};
};
