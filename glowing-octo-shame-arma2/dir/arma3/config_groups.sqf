/*
 * Не рекомендуется забивать грузовики до отказа
 * иначе боты дольше тупят.
 * Оригинальные отряды лучше не изменять,
 * они хорошо сбалансированы.
 * 
 * 	rankId
 * 		0 - Private
 * 		1 - Corporal
 * 		2 - Sergeant
 * 		3 - Lieutenant
 * 		4 - Captain
 * 		5 - Major
 * 		6 - Colonel
 * 
 * TODO: FIA можно сделать либо за игроков или против, но не за обе стороны.
 * TODO: Корректировка даты.
 * TODO: UGV без оружия с артиллерией должен работать или использовать лазерный указатель.
 * TODO: Союзы, VN_ARVN (Армия Республики Вьетнам) и VN_MACV (Командование военной помощи Вьетнама) не должны быть противниками.
 */

// define ранга.
#include "..\include\ranks.sqf"

private ["_west","_east","_guer","_groups_map","_n","_d","_pvp","_landing",
	"_westN","_eastN","_guerN","_westD","_eastD","_guerD","_depth",
	"_arr","_cfg_factions_def","_groups_use","_factions_blocked",
	"_grp","_groups_failover","_factions_used","_climate","_date",
	"_groups_failover_map","_sides_friendly","_copyRef",
	"_groups_enabled","_factions_enabled","_groups_enabled_map",
	"_groups_pending_map","_str","_param_default","_side",
	"_sl","_tl","_steep_date","_steep_climate","_arr1","_n0",
	"_alliances","_alliances_enabled","_alliance","_sides",
	"_default_east","_default_west","_default_guer"];

_pvp = gosa_pvp;
_landing = missionNamespace getVariable "gosa_landing";

waitUntil{!isNil "availableVehicles"};
_copyRef = availableVehicles;

_west=[];_east=[];_guer=[];
// Ночь.
_westN=[];_eastN=[];_guerN=[];
// День.
_westD=[];_eastD=[];_guerD=[];
// Отказоустойчивые отряды
_default_east=[];_default_west=[];_default_guer=[];

_climate = (gosa_IslandType select 0);
_date = (gosa_IslandType select 1);
_depth = call gosa_fnc_getDepthAverage;
_depth = ((_depth select 0) / 100);
_groups_map = [];
_groups_enabled = [];
_factions_enabled = [];
_factions_blocked = [];
_factions_used = [];
_groups_use = [];
_groups_enabled_map = [];
_groups_pending_map = [];
_groups_failover = [];
_groups_failover_map = [];
_alliances = [
	["LIB_RKKA","LIB_UK_ARMY","LIB_US_ARMY","SPE_US_ARMY","SPE_FFI"],
	["LIB_WEHRMACHT","SPE_STURM","SPE_WEHRMACHT"],
	["VN_MACV","VN_ARVN"]
];
_alliances_enabled = [];
_param_default = -1;
// O,B,R,C
_cfg_factions_def = [["OPF_F"],["BLU_F"],["IND_F"]];

_steep_date = 10;
_steep_climate = 10;


#include "config_groups_LS.sqf"

#include "config_groups_SPE.sqf"
#include "config_groups_WW2.sqf"

#include "config_groups_CSLA.sqf"
#include "config_groups_VN.sqf"
#include "config_groups_GM.sqf"

#include "config_groups_BWA3.sqf"

#include "config_groups_RHS.sqf"
#include "config_groups_CUP.sqf"

#include "config_groups_EF.sqf"
#include "config_groups_lxWS.sqf"

#include "config_groups_Enoch.sqf"
#include "config_groups_Apex.sqf"
#include "config_groups_GEN.sqf"
#include "config_groups_FIA.sqf"


//////////////////////////////
//--- A3 ---
//////////////////////////////
//-- BLU_F NATO
_default_west=[
	// BUS_AirInf_Reinforce_RF
	[
		[
			[["B_Heli_EC_04_military_RF"],[],["LIEUTENANT"]],
			[["B_soldier_SL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F","B_soldier_repair_F","B_support_CMort_RF"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[5,-16,0],[5,-18,0]],			["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]],
			[["B_soldier_SL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F","B_soldier_repair_F","B_support_CMort_RF"],[[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0],[-5,-16,0],[-5,-18,0]],	["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.5
	],
	// BUS_Support_Mort_RF
	[[[["B_soldier_TL_F","B_support_CMort_RF","B_support_CMort_RF"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
	// BUS_MotInf_AA_RF
	[[[["B_Pickup_aat_rf","B_soldier_AA_F","B_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],
	// BUS_MotInf_mmg_rf
	[[[["B_Pickup_mmg_rf","B_Soldier_TL_F","B_Soldier_GL_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
	// BUS_QRFSquad_RF
	[[[["B_QRF_Soldier_SL_RF","B_QRF_Sharpshooter_RF","B_QRF_medic_RF","B_QRF_Soldier_RF","B_QRF_soldier_LAT2_RF","B_QRF_Soldier_AR_RF","B_QRF_soldier_UAV_RF","B_QRF_Soldier_GL_RF"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL"]]],1],

	[[[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["B_soldier_SL_F","B_soldier_AR_F","B_soldier_GL_F","B_soldier_M_F","B_soldier_AT_F","B_soldier_AAT_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["B_Soldier_TL_F","B_Soldier_AR_F","B_soldier_GL_F","B_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["B_Soldier_TL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["B_Soldier_TL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	[[[["B_soldier_GL_F","B_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	[[[["B_Soldier_SL_F","B_soldier_AR_F","B_HeavyGunner_F","B_soldier_AAR_F","B_soldier_M_F","B_Sharpshooter_F","B_soldier_LAT_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// B_InfTeam_Light
	[[[["B_soldier_TL_F","B_soldier_AR_F","B_soldier_F","B_soldier_LAT2_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// Combat Patrol
	[[[["B_Patrol_Soldier_TL_F",
		"B_Patrol_Soldier_AR_F","B_Patrol_Soldier_MG_F",
		"B_Patrol_Soldier_A_F","B_Patrol_Soldier_M_F",
		"B_Patrol_Soldier_M_F","B_Patrol_Soldier_AT_F",
		"B_Patrol_Medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
		["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],
		0.5],
	// разведка
	[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_LAT_F","B_recon_JTAC_F","B_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_recon_M_F","B_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_F","B_recon_LAT_F","B_recon_JTAC_F","B_recon_exp_F","B_Recon_Sharpshooter_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_sniper_F","B_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// водолазы
	[[[["B_diver_TL_F","B_diver_exp_F","B_diver_F","B_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
	// корабль
	// Маршруты неисправны.
	//[[[["B_Boat_Transport_01_F","B_Soldier_AR_F","B_soldier_GL_F","B_soldier_LAT_F","B_soldier_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[["B_Soldier_TL_F"]]]],0.5],
	//[[[["B_diver_TL_F","B_diver_exp_F","B_diver_F","B_diver_F","B_SDV_01_F","B_SDV_01_F"],[[-5,-5,0],[10,-10,0],[-10,-10,0],[0,-10,0],[5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// колесный
	[[[["B_soldier_AR_F","B_soldier_LAT_F","B_MRAP_01_gmg_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_soldier_AR_F","B_soldier_LAT_F","B_MRAP_01_hmg_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F","B_MRAP_01_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F","B_MRAP_01_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
		// BUS_MotInf_Reinforce
		[[[["B_Truck_01_transport_F",
			"B_soldier_SL_F","B_soldier_F",
			"B_soldier_LAT_F","B_soldier_M_F",
			"B_soldier_TL_F","B_soldier_AR_F",
			"B_soldier_A_F","B_medic_F",
			"B_soldier_SL_F","B_soldier_F",
			"B_soldier_LAT_F","B_soldier_M_F",
			"B_soldier_TL_F","B_soldier_AR_F",
			"B_soldier_A_F","B_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],
			["SERGEANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.3],
		[[[["B_Truck_01_covered_F",
			"B_soldier_SL_F","B_soldier_F",
			"B_soldier_LAT_F","B_soldier_M_F",
			"B_soldier_TL_F","B_soldier_AR_F",
			"B_soldier_A_F","B_medic_F",
			"B_soldier_SL_F","B_soldier_F",
			"B_soldier_LAT_F","B_soldier_M_F",
			"B_soldier_TL_F","B_soldier_AR_F",
			"B_soldier_A_F","B_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],
			["SERGEANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.2],
	[[[["B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_LSV_01_unarmed_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_soldier_AR_F","B_soldier_LAT_F""B_LSV_01_armed_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
	// FIXME: Может разумнее сделать командиром экипаж APC т.к. у них есть приборы наблюдения и радиостанция?
	// бтр
		// BUS_MechInfSquad
		[[[["B_APC_Wheeled_01_cannon_F",
			"B_soldier_SL_F","B_soldier_F",
			"B_soldier_LAT_F","B_soldier_M_F",
			"B_soldier_TL_F","B_soldier_AR_F",
			"B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.5],
		// BUS_MechInf_Support
		[[[["B_APC_Wheeled_01_cannon_F",
			"B_soldier_SL_F","B_soldier_TL_F",
			"B_soldier_repair_F","B_engineer_F",
			"B_medic_F","B_soldier_AR_F",
			"B_soldier_exp_F","B_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.5],
		// BUS_D_MechInf_AT_lxWS
		[[[["APC_Wheeled_01_atgm_base_lxWS",
			"B_soldier_SL_F","B_soldier_AR_F",
			"B_soldier_AT_F","B_soldier_AT_F",
			"B_soldier_AT_F","B_soldier_AAT_F",
			"B_soldier_AAT_F","B_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],
			0.5],

	[[[["B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.2],
	[[[["B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.2],
	[[[["B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.2],
	[[[["B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.2],
	// гусеничный
		// BUS_MechInf_AT
		[[[["B_APC_Tracked_01_rcws_F",
			"B_soldier_SL_F","B_soldier_AR_F",
			"B_soldier_AT_F","B_soldier_AT_F",
			"B_soldier_AT_F","B_soldier_AAT_F",
			"B_soldier_AAT_F","B_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.5],
		// BUS_MechInf_AA
		[[[["B_APC_Tracked_01_aa_F",
			"B_soldier_SL_F","B_soldier_AR_F",
			"B_soldier_AA_F","B_soldier_AA_F",
			"B_soldier_AA_F","B_soldier_AAA_F",
			"B_soldier_AAA_F","B_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.1],
	// Экипаж покидает тс.
	//[[[["B_APC_Tracked_01_CRV_F"],[[0,0,0]],["SERGEANT"]]],0.5],
	// танки
	[[[["B_MBT_01_cannon_F","B_MBT_01_cannon_F","B_MBT_01_cannon_F","B_MBT_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_cannon_F","B_APC_Tracked_01_aa_F","B_MBT_01_cannon_F","B_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.1],
	[[[["B_MBT_01_cannon_F","B_MBT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_TUSK_F","B_MBT_01_TUSK_F","B_MBT_01_TUSK_F","B_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_TUSK_F","B_APC_Tracked_01_aa_F","B_MBT_01_TUSK_F","B_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.1],
	[[[["B_MBT_01_TUSK_F","B_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	// lxWS
	[[[["APC_Wheeled_01_atgm_base_lxWS","APC_Wheeled_01_atgm_base_lxWS"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	// авиация
	[[
		[["B_T_VTOL_01_infantry_F"],[[0,0,0]],["LIEUTENANT"]],
		[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	[[
		[["B_Heli_Transport_03_F"],[[0,0,0]],["LIEUTENANT"]],
		[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// поддержка
	[[[["B_Truck_01_medical_F"],[],["PRIVATE"],[["B_medic_F"]]]],0.02],
	[[[["B_Truck_01_Repair_F"],[],["PRIVATE"],[["B_engineer_F"]]]],0.02],
	[[[["B_Truck_01_fuel_F"],[],["PRIVATE"]]],0.01],
	[[[["B_Truck_01_ammo_F"],[],["PRIVATE"]]],0.02]
	// турели
	/*
	[[[["B_GMG_01_F"],[],["PRIVATE"]]],0.1],
	[[[["B_HMG_01_A_F"],[],["PRIVATE"]]],0.1],
	[[[["B_HMG_01_high_F"],[],["PRIVATE"]]],0.1],
	[[[["B_static_AA_F"],[],["PRIVATE"]]],0.1],
	[[[["B_static_AT_F"],[],["PRIVATE"]]],0.1],
	[[[["B_HMG_01_F"],[],["PRIVATE"]]],0.1],
	[[[["B_GMG_01_A_F"],[],["PRIVATE"]]],0.1],
	[[[["B_GMG_01_high_F"],[],["PRIVATE"]]],0.1],
	[[[["B_Mortar_01_F"],[],["PRIVATE"]]],0.05],
	*/
];
_arr = _default_west;
	if (count gosa_zone_lighthouse > 0) then {
		_arr append [
			[[[["CUP_B_Frigate_ANZAC"],[],["CAPTAIN"]]], _depth min 0.5]
		];
	};
	_arr append [
		[[[["B_Soldier_TL_F","B_soldier_GL_F","B_soldier_AR_F","B_soldier_F","B_Boat_Transport_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],
			["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
		],0.1],
		[[[["B_Boat_Armed_01_minigun_F"],[],["LIEUTENANT"]],
				[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[30,30,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
				["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.1],
		[[[["B_Boat_Armed_01_minigun_F"],[],["LIEUTENANT"]],
				[["B_soldier_SL_F","B_soldier_AR_F","B_soldier_GL_F","B_soldier_M_F","B_soldier_AT_F","B_soldier_AAT_F","B_soldier_A_F","B_medic_F"],[[30,30,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
				["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.1]
	];
	// Arty.
	if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
		_arr append [
			[[[["APC_Wheeled_01_mortar_base_lxWS","APC_Wheeled_01_mortar_base_lxWS"],[[0,0,0],[10,-10,0]],["LIEUTENANT","SERGEANT"]]],0.05],
			[[[["B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.05],
			[[[["B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.05],
			[[[["B_MBT_01_mlrs_F","B_MBT_01_mlrs_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.05]
		];
	};
[_groups_map, west, "BLU_F", _arr,
[2020,2100], [250,999],
["BLU_NATO_lxWS","BLU_T_F","CUP_B_US_Army","CUP_B_USMC","BLU_W_F"]
] call gosa_fnc_map_groups_add;

// Авиация
_arr = [
	//[[[["B_T_VTOL_01_armed_F"],[],["LIEUTENANT"]]],0.5],
	[[[["B_Plane_CAS_01_F","B_Plane_CAS_01_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["B_Heli_Light_01_armed_F","B_Heli_Light_01_armed_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["B_Heli_Attack_01_F","B_Heli_Attack_01_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["B_Heli_Transport_03_F","B_Heli_Transport_03_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.1],
	[[[["B_Heli_Transport_01_F","B_Heli_Transport_01_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.1]
];
// jets
_arr append [
	[[[["B_Plane_Fighter_01_F","B_Plane_Fighter_01_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["B_Plane_Fighter_01_Stealth_F","B_Plane_Fighter_01_Stealth_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.1]
	//[[[["B_Radar_System_01_F","B_SAM_System_03_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
];
[_groups_map, west, "BLU_NATO_lxWS", _arr,
[2020,2100], [300,999],
["CUP_B_US_Army","CUP_B_USMC"]
] call gosa_fnc_map_groups_add;
[_groups_map, west, "BLU_W_F", _arr,
[2020,2100], [160,224],
["CUP_B_US_Army","CUP_B_USMC"]
] call gosa_fnc_map_groups_add;
[_groups_map, west, "BLU_T_F", _arr,
[2020,2100], [225,249],
["CUP_B_US_Army","CUP_B_USMC"]
] call gosa_fnc_map_groups_add;
[_groups_map, west, "BLU_F", _arr,
[2020,2100], [250,299],
["CUP_B_US_Army","CUP_B_USMC"]
] call gosa_fnc_map_groups_add;

// Беспилотники
	_arr = [
		[[[["B_UAV_02_lxWS"],[],["CORPORAL"]]],0.02],
		//[[[["B_UGV_01_rcws_F"],[],["CORPORAL"]]],0.02],
		[[[["B_UAV_06_F"],[],["CORPORAL"]]],0.01],
		// TODO: Частота B_UAV_05_F от уровня океана должна зависить.
		[[[["B_UAV_05_F"],[],["LIEUTENANT"]]],0.01],
		// TODO: Частота B_T_UAV_03_F от уровня земли должна зависить, наоборот.
		[[[["B_T_UAV_03_F"],[],["LIEUTENANT"]]],0.01],
		[[[["B_UAV_02_F"],[],["CORPORAL"]]],0.01],
		[[[["B_UAV_02_CAS_F"],[],["CORPORAL"]]],0.02],
		[[[["B_UAV_01_F"],[],["CORPORAL"]]],0.02]
	];
	[_groups_map, west, "BLU_NATO_lxWS", _arr,
	[2020,2100], [300,999],
	[]
	] call gosa_fnc_map_groups_add;
	[_groups_map, west, "BLU_T_F", _arr,
	[2020,2100], [-999,249],
	[]
	] call gosa_fnc_map_groups_add;
	[_groups_map, west, "BLU_F", _arr,
	[2020,2100], [250,299],
	[]
	] call gosa_fnc_map_groups_add;


//-- OPF_F CSAT
_default_east=[
	// OIA_Support_Mort_RF
	[[[["O_Soldier_TL_F","O_support_CMort_RF","O_support_CMort_RF"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
	// OIA_QRFSquad_RF
	[[[["O_QRF_Soldier_SL_RF","O_QRF_soldier_M_RF","O_QRF_medic_RF","O_QRF_Soldier_RF","O_QRF_Soldier_HAT_RF","O_QRF_Soldier_AR_RF","O_QRF_Soldier_UAV_RF","O_QRF_Soldier_GL_RF"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","CORPORAL"]]],1],

	// пехота
		// OIA_GuardSquad
		[[[["O_soldierU_SL_F",
			"O_soldierU_F","O_soldierU_LAT_F",
			"O_soldierU_M_F","O_soldierU_TL_F",
			"O_soldierU_AR_F","O_soldierU_A_F",
			"O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["SERGEANT",
			"PRIVATE","CORPORAL",
			"PRIVATE","SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.1],
		// OIA_GuardTeam
		[[[["O_soldierU_TL_F",
			"O_soldierU_AR_F","O_soldierU_GL_F",
			"O_soldierU_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.1],
		// OIA_GuardSentry
		[[[["O_soldierU_GL_F","O_soldierU_F"],[[0,0,0],[5,-5,0]],
			["CORPORAL","PRIVATE"]]],0.05],
		// OI_support_CLS
		[[[["O_soldier_TL_F",
			"O_soldier_AR_F","O_medic_F",
			"O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.1],
		// OI_support_EOD
		[[[["O_soldier_TL_F",
			"O_engineer_F","O_soldier_exp_F",
			"O_soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.1],
		// OI_support_ENG
		[[[["O_soldier_TL_F",
			"O_engineer_F","O_engineer_F",
			"O_soldier_repair_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.1],
		// OI_support_MG
		[[[["O_soldier_TL_F",
			"O_support_MG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0.1],
		// OI_support_GMG
		[[[["O_soldier_TL_F",
			"O_support_GMG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0.1],
		// OI_support_Mort
		[[[["O_soldier_TL_F",
			"O_support_Mort_F","O_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0.1],
		//
	[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["O_soldier_SL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_M_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["O_soldier_TL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["O_soldier_TL_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["O_soldier_TL_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	[[[["O_soldier_GL_F","O_soldier_F"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0.1],
	[[[["O_Soldier_SL_F","O_Soldier_AR_F","O_HeavyGunner_F","O_Soldier_AAR_F","O_soldier_M_F","O_Sharpshooter_F","O_Soldier_LAT_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],1],
	// O_InfTeam_AT_Heavy
	[[[["O_soldier_TL_F","O_soldier_HAT_F","O_soldier_HAT_F","O_soldier_AHAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
		["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],
		1],
	// разведка
		// OI_recon_EOD
		[[[["O_recon_TL_F",
			"O_recon_exp_F","O_recon_exp_F",
			"O_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.5],
	[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_LAT_F","O_recon_JTAC_F","O_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_recon_M_F","O_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_F","O_recon_LAT_F","O_recon_JTAC_F","O_recon_exp_F","O_Pathfinder_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_sniper_F","O_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.025],
	[[[["O_ghillie_ard_F","O_ghillie_ard_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.025],
	[[[["O_ghillie_sard_F","O_ghillie_sard_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.025],
	[[[["O_ghillie_lsh_F","O_ghillie_lsh_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.025],
	[[[["O_V_Soldier_TL_hex_F","O_V_Soldier_JTAC_hex_F","O_V_Soldier_M_hex_F","O_V_Soldier_Exp_hex_F","O_V_Soldier_LAT_hex_F","O_V_Soldier_Medic_hex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// A
	[[[["O_A_Soldier_TL_lxWS",
		"O_A_Soldier_lxWS","O_A_Soldier_LAT_lxWS",
		"O_A_Soldier_AR_lxWS","O_A_Soldier_GL_lxWS",
		"O_A_HeavyGunner_lxWS","O_A_Soldier_LAT_lxWS",
		"O_A_medic_lxWS"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_A_Soldier_TL_lxWS",
		"O_A_Soldier_AR_lxWS","O_A_Soldier_GL_lxWS",
		"O_A_Soldier_LAT_lxWS"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
		["SERGEANT",
		"CORPORAL","PRIVATE",
		"PRIVATE"]]],0.5],
	// водолазы
	[[[["O_diver_TL_F","O_diver_exp_F","O_diver_F","O_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
	// корабль
	// Маршруты неисправны.
	//[[[["O_Boat_Transport_01_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[["O_soldier_TL_F"]]]],0.5],
	//[[[["O_diver_TL_F","O_diver_exp_F","O_diver_F","O_diver_F","O_SDV_01_F","O_SDV_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// колесный
		// OIA_MotInf_Team
		[[[["O_MRAP_02_GMG_F",
			"O_soldier_AR_F","O_soldier_AT_F"],[[0,0,0],[-5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0.5],
		// OIA_MotInf_AT
		[[[["O_MRAP_02_F",
			"O_soldier_AT_F","O_soldier_AT_F",
			"O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.5],
		// OIA_MotInf_AA
		[[[["O_MRAP_02_F",
			"O_soldier_AA_F","O_soldier_AA_F",
			"O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.1],
		// OIA_MotInf_MGTeam
		[[[["O_MRAP_02_F",
			"O_soldier_TL_F","O_support_MG_F",
			"O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE"],[],1]],0.5],
		// OIA_MotInf_GMGTeam
		[[[["O_MRAP_02_F",
			"O_soldier_TL_F","O_support_GMG_F",
			"O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE"],[],1]],0.5],
		// OIA_MotInf_MortTeam
		[[[["O_MRAP_02_F",
			"O_soldier_TL_F","O_support_Mort_F",
			"O_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[0,-10,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE"],[],1]],0.5],
		// OIA_MotInf_Reinforce
		[[[["O_Truck_03_transport_F",
			"O_soldier_SL_F","O_soldier_F",
			"O_soldier_LAT_F","O_soldier_M_F",
			"O_soldier_TL_F","O_soldier_AR_F",
			"O_soldier_A_F","O_medic_F",
			"O_soldier_TL_F","O_soldier_AR_F",
			"O_soldier_GL_F","O_soldier_LAT_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0]],
			["SERGEANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.3],
		[[[["O_Truck_03_covered_F",
			"O_soldier_SL_F","O_soldier_F",
			"O_soldier_LAT_F","O_soldier_M_F",
			"O_soldier_TL_F","O_soldier_AR_F",
			"O_soldier_A_F","O_medic_F",
			"O_soldier_TL_F","O_soldier_AR_F",
			"O_soldier_GL_F","O_soldier_LAT_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0]],
			["SERGEANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.2],
		/*
		Не проверенно.
		// O_MotInf_ReconViperTeam
		[[[["O_LSV_02_unarmed_viper_F",
			"O_V_Soldier_TL_hex_F","O_V_Soldier_JTAC_hex_F",
			"O_V_Soldier_M_hex_F","O_V_Soldier_Exp_hex_F",
			"O_V_Soldier_LAT_hex_F","O_V_Soldier_Medic_hex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"PRIVATE","PRIVATE"]]],0.5],
		// O_MotInf_AssaultViperTeam
		[[[["O_LSV_02_armed_viper_F",
			"O_V_Soldier_TL_hex_F","O_V_Soldier_JTAC_hex_F",
			"O_V_Soldier_M_hex_F","O_V_Soldier_Exp_hex_F",
			"O_V_Soldier_LAT_hex_F","O_V_Soldier_Medic_hex_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0]],
			["SERGEANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"PRIVATE","PRIVATE"]]],0.5],
		*/
	[[[["O_soldier_TL_F","O_soldier_AR_F","O_soldier_AT_F","O_MRAP_02_hmg_F"],[[-5,-5,0],[-5,-5,0],[5,5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	/*
	[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_F","O_soldier_F","O_soldier_F","O_medic_F","O_Truck_02_transport_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[0,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_F","O_soldier_F","O_soldier_F","O_medic_F","O_Truck_02_covered_F"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[-5,-8,0],[-5,-10,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[0,0,0]],["CAPTAIN","LIEUTENANT","LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	*/
	[[[["O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_LSV_02_unarmed_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_soldier_AR_F","O_soldier_LAT_F","O_LSV_02_armed_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
	// бтр
		// OIA_MechInfSquad
		[[[["O_APC_Wheeled_02_rcws_v2_F",
			"O_soldier_SL_F","O_soldier_F",
			"O_soldier_LAT_F","O_soldier_M_F",
			"O_soldier_TL_F","O_soldier_AR_F",
			"O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.5],
		// OIA_MechInf_Support
		[[[["O_APC_Wheeled_02_rcws_v2_F",
			"O_soldier_SL_F","O_soldier_TL_F",
			"O_soldier_repair_F","O_engineer_F",
			"O_medic_F","O_soldier_AR_F",
			"O_soldier_exp_F","O_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.5],
		// A MechInfSquad_Wheeled
		[[[["O_APC_Wheeled_02_hmg_lxWS","O_A_Soldier_TL_lxWS",
			"O_A_Soldier_lxWS","O_A_Soldier_LAT_lxWS",
			"O_A_Soldier_AR_lxWS","O_A_Soldier_GL_lxWS",
			"O_A_HeavyGunner_lxWS","O_A_Soldier_LAT_lxWS",
			"O_A_medic_lxWS"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT","LIEUTENANT",
			"PRIVATE","CORPORAL",
			"PRIVATE","SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"],[["O_A_crew_lxWS","O_A_crew_lxWS","O_A_crew_lxWS"]],1]],0.5],
	// гусеничный
		// OSFIA_MechInf_AT
		[[[["O_APC_Tracked_02_30mm_lxWS","O_Soldier_TL_F","O_Soldier_AR_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AT_F","O_Soldier_AAT_F","O_Soldier_AAT_F","O_Soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.5],
		// OSFIA_MechInf_AA
		[[[["O_APC_Tracked_02_30mm_lxWS","O_Soldier_TL_F","O_Soldier_AR_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AA_F","O_Soldier_AAA_F","O_Soldier_AAA_F","O_Soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT","SERGEANT","CORPORAL","PRIVATE","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"],[],1]],0.1],
		// OIA_MechInf_AT
		[[[["O_APC_Tracked_02_cannon_F",
			"O_soldier_SL_F","O_soldier_AR_F",
			"O_soldier_AT_F","O_soldier_AT_F",
			"O_soldier_AT_F","O_soldier_AAT_F",
			"O_soldier_AAT_F","O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.5],
		// OIA_MechInf_AA
		[[[["O_APC_Tracked_02_cannon_F",
			"O_soldier_SL_F","O_soldier_AR_F",
			"O_soldier_AA_F","O_soldier_AA_F",
			"O_soldier_AA_F","O_soldier_AAA_F",
			"O_soldier_AAA_F","O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.1],
		// A MechInfSquad
		[[[["O_APC_Tracked_02_30mm_lxWS","O_A_Soldier_TL_lxWS",
			"O_A_Soldier_lxWS","O_A_Soldier_LAT_lxWS",
			"O_A_Soldier_AR_lxWS","O_A_Soldier_GL_lxWS",
			"O_A_HeavyGunner_lxWS","O_A_Soldier_LAT_lxWS",
			"O_A_medic_lxWS"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT","LIEUTENANT",
			"PRIVATE","CORPORAL",
			"PRIVATE","SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"],[["O_A_crew_lxWS","O_A_crew_lxWS","O_A_crew_lxWS"]],1]],0.5],
	// танки
		// OIA_TankPlatoon
		[[[["O_MBT_02_cannon_F",
			"O_MBT_02_cannon_F","O_MBT_02_cannon_F",
			"O_MBT_02_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL"]]],0.5],
		// OIA_TankPlatoon_AA
		[[[["O_MBT_02_cannon_F",
			"O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F",
			"O_APC_Tracked_02_AA_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL"]]],0.1],
		// OIA_TankSection
		[[[["O_MBT_02_cannon_F","O_MBT_02_cannon_F"],[[0,0,0],[10,-10,0]],
			["LIEUTENANT","SERGEANT"]]],0.5],
		// O_TankPlatoon_Heavy
		[[[["O_MBT_04_command_F",
			"O_MBT_04_cannon_F","O_MBT_04_cannon_F",
			"O_MBT_04_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL"]]],0.2],
		// O_TankSection_Heavy
		[[[["O_MBT_04_cannon_F","O_MBT_04_cannon_F"],[[0,0,0],[10,-10,0]],
			["LIEUTENANT","SERGEANT"]]],0.2],
	// авиация
	[[
		[["O_Heli_Transport_04_covered_F"],[[0,0,0]],["LIEUTENANT"]],
		[["O_soldierU_SL_F","O_soldierU_TL_F","O_soldierU_F","O_soldierU_LAT_F","O_soldierU_M_F","O_soldierU_AR_F","O_soldierU_A_F","O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	[[
		[["O_T_VTOL_02_infantry_dynamicLoadout_F"],[[0,0,0]],["LIEUTENANT"]],
		[["O_soldierU_SL_F","O_soldierU_TL_F","O_soldierU_F","O_soldierU_LAT_F","O_soldierU_M_F","O_soldierU_AR_F","O_soldierU_A_F","O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	// поддержка
	[[[["O_Truck_03_medical_F"],[],["PRIVATE"],[["O_medic_F"]]]],0.01],
	[[[["O_Truck_03_repair_F"],[],["PRIVATE"],[["O_engineer_F"]]]],0.01],
	[[[["O_Truck_03_fuel_F"],[],["PRIVATE"]]],0.01],
	[[[["O_Truck_03_ammo_F"],[],["PRIVATE"]]],0.02],
	[[[["O_Truck_02_medical_F"],[],["PRIVATE"],[["O_medic_F"]]]],0.01],
	[[[["O_Truck_02_box_F"],[],["PRIVATE"],[["O_engineer_F"]]]],0.01],
	// [[[["O_Truck_02_Ammo_F"],[],["PRIVATE"]]],0.5],
	[[[["O_Truck_02_fuel_F"],[],["PRIVATE"]]],0.01]
	// турели
	/*
	[[[["O_GMG_01_F"],[],["PRIVATE"]]],0.1],
	[[[["O_HMG_01_A_F"],[],["PRIVATE"]]],0.1],
	[[[["O_HMG_01_high_F"],[],["PRIVATE"]]],0.1],
	[[[["O_static_AA_F"],[],["PRIVATE"]]],0.1],
	[[[["O_static_AT_F"],[],["PRIVATE"]]],0.1],
	[[[["O_HMG_01_F"],[],["PRIVATE"]]],0.1],
	[[[["O_GMG_01_A_F"],[],["PRIVATE"]]],0.1],
	[[[["O_GMG_01_high_F"],[],["PRIVATE"]]],0.1],
	[[[["O_Mortar_01_F"],[],["PRIVATE"]]],0.05],
	*/
];
_arr = _default_east;
	// boat
	if (count gosa_zone_lighthouse > 0) then {
		_arr append [
			[[[["CUP_O_ZUBR_CSAT_T"],[],["CAPTAIN"]]], _depth min 0.5]
		];
	};
	_arr append [
		[[[["O_Soldier_TL_F","O_soldier_GL_F","O_soldier_AR_F","O_soldier_F","O_Boat_Transport_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],
			["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
		],0.1],
		[[[["O_Boat_Armed_01_hmg_F"],[],["LIEUTENANT"]],
				[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F"],[[30,30,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
				["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.1],
		[[[["O_Boat_Armed_01_hmg_F"],[],["LIEUTENANT"]],
				[["O_soldier_SL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_M_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_A_F","O_medic_F"],[[30,30,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
				["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
		],0.1]
	];
	_arr append [
		// авиация
		[[[["O_Heli_Attack_02_black_F","O_Heli_Attack_02_black_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["O_Heli_Light_02_F","O_Heli_Light_02_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["O_Plane_CAS_02_F","O_Plane_CAS_02_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
	];
	// jets
	_arr append [
		[[[["O_Plane_Fighter_02_F","O_Plane_Fighter_02_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["O_Plane_Fighter_02_Stealth_F","O_Plane_Fighter_02_Stealth_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.1]
		//[[[["O_Radar_System_02_F","O_SAM_System_04_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
	];
	// Рельсотрон
	_arr append [
		[[[["O_MBT_02_railgun_F","O_MBT_02_railgun_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.01]
	];
	// Arty.
	if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
		_arr append [
			// OIA_SPGPlatoon_Scorcher
			[[[["O_MBT_02_arty_F","O_MBT_02_arty_F","O_MBT_02_arty_F","O_MBT_02_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.1],
			// OIA_SPGSection_Scorcher
			[[[["O_MBT_02_arty_F","O_MBT_02_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.1]
		];
	};
	_arr append [
		[[[["CUP_O_T90MS_CSAT",
			"CUP_O_T90MS_CSAT","CUP_O_T90MS_CSAT",
			"CUP_O_T90MS_CSAT"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL"]]],0.2],
		[[[["CUP_O_T90MS_CSAT","CUP_O_T90MS_CSAT"],[[0,0,0],[10,-10,0]],
			["LIEUTENANT","SERGEANT"]]],0.2],
		[[[["CUP_O_T90MS_CSAT","CUP_O_T72_CSAT","CUP_O_T72_CSAT"],[[0,0,0],[10,-10,0],[-10,-10,0]],
			["LIEUTENANT","SERGEANT","SERGEANT"]]],0.2],
		[[[["CUP_O_SU34_CSAT","CUP_O_SU34_CSAT"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.1]
	];
[_groups_map, east, "OPF_F", _arr,
[2020,2100], [250,999],
[]
] call gosa_fnc_map_groups_add;

// Беспилотники
	_arr = [
		[[[["O_UAV_02_lxWS"],[],["CORPORAL"]]],0.02],
		//[[[["O_UGV_01_rcws_F"],[],["CORPORAL"]]],0.02],
		[[[["O_UAV_06_F"],[],["CORPORAL"]]],0.01],
		[[[["O_T_UAV_04_CAS_F"],[],["LIEUTENANT"]]],0.02],
		[[[["O_UAV_02_F"],[],["CORPORAL"]]],0.01],
		[[[["O_UAV_02_CAS_F"],[],["CORPORAL"]]],0.02],
		[[[["O_UAV_01_F"],[],["CORPORAL"]]],0.02]
	];
	[_groups_map, east, "OPF_F", _arr,
	[2020,2100], [250,999],
	[]
	] call gosa_fnc_map_groups_add;
	[_groups_map, east, "OPF_T_F", _arr,
	[2020,2100], [-999,249],
	[]
	] call gosa_fnc_map_groups_add;


//-- IND_F AAF
_default_guer=[
	// HAF_AirInf_Reinforce_RF
	[
		[
			[["I_Heli_EC_01A_military_RF"],[],["LIEUTENANT"]],
			[["I_soldier_SL_F",
				"I_soldier_F","I_soldier_LAT_F",
				"I_soldier_M_F","I_soldier_TL_F",
				"I_soldier_AR_F","I_soldier_A_F",
				"I_medic_F","I_soldier_repair_F",
				"I_support_CMort_RF"],[[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[5,-16,0],[5,-18,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
			],
			[["I_soldier_SL_F",
				"I_soldier_F","I_soldier_LAT_F",
				"I_soldier_M_F","I_soldier_TL_F",
				"I_soldier_AR_F","I_soldier_A_F",
				"I_medic_F","I_soldier_repair_F",
				"I_support_CMort_RF"],[[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0],[-5,-16,0],[-5,-18,0]],["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]
			]
		],0.5
	],
	// HAF_Support_Mort_RF
	[[[["I_soldier_TL_F","I_support_CMort_RF","I_support_CMort_RF"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.5],
	// HAF_MotInf_AA_RF
	[[[["I_Pickup_aat_rf","I_soldier_AA_F","I_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],["SERGEANT","CORPORAL","PRIVATE"]]],0.1],

	// пехота
		// HAF_InfSquad
		[[[["I_soldier_SL_F",
			"I_soldier_F","I_soldier_LAT_F",
			"I_soldier_M_F","I_soldier_TL_F",
			"I_soldier_AR_F","I_soldier_A_F",
			"I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
		// HAF_InfSquad_Weapons
		[[[["I_soldier_SL_F",
			"I_soldier_AR_F","I_soldier_GL_F",
			"I_soldier_M_F","I_soldier_AT_F",
			"I_soldier_AAT_F","I_soldier_A_F",
			"I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["SERGEANT",
			"PRIVATE","CORPORAL",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"PRIVATE"]]],1],
	[[[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_GL_F","I_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["I_Soldier_TL_F","I_Soldier_AT_F","I_Soldier_AT_F","I_Soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["I_Soldier_TL_F","I_Soldier_AA_F","I_Soldier_AA_F","I_Soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],1],
	[[[["I_Soldier_GL_F","I_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.1],
	// I_InfTeam_Light
	[[[["I_soldier_TL_F","I_soldier_AR_F","I_soldier_F","I_soldier_LAT2_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],1],
	// разведка
	[[[["I_Sniper_F","I_Spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.25],
	[[[["I_ghillie_ard_F","I_ghillie_ard_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.25],
	[[[["I_ghillie_lsh_F","I_ghillie_lsh_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.25],
	[[[["I_ghillie_sard_F","I_ghillie_sard_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.25],
	// водолазы
	[[[["I_diver_TL_F","I_diver_exp_F","I_diver_F","I_diver_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.01],
	// корабль
	// Маршруты неисправны.
	//[[[["I_Boat_Transport_01_F","I_Soldier_AR_F","I_Soldier_GL_F","I_soldier_LAT_F","I_soldier_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[["I_Soldier_TL_F"]]]],0.5],
	//[[[["I_diver_TL_F","I_diver_exp_F","I_diver_F","I_diver_F","I_SDV_01_F","I_SDV_01_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// колесный
	[[[["I_Soldier_AR_F","I_MRAP_03_gmg_F"],[[5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE"]]],0.5],
	[[[["I_Soldier_LAT_F","I_MRAP_03_hmg_F"],[[5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE"]]],0.5],
	[[[["I_Soldier_AT_F","I_Soldier_AAT_F","I_MRAP_03_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["I_Soldier_AA_F","I_Soldier_AAA_F","I_MRAP_03_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.1],
	[[[["I_soldier_TL_F","I_A_Truck_02_aa_lxWS",
		"I_Soldier_AA_F","I_Soldier_AAA_F"],[[5,-5,0],[0,0,0],[-5,-5,0],[0,-10,0]],["SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.1],

		// HAF_MotInf_Reinforce
		[[[["I_Truck_02_transport_F",
			"I_soldier_SL_F","I_soldier_F",
			"I_soldier_LAT_F","I_soldier_M_F",
			"I_soldier_TL_F","I_soldier_AR_F",
			"I_soldier_A_F","I_medic_F",
			"I_soldier_SL_F","I_soldier_F",
			"I_soldier_LAT_F","I_soldier_M_F",
			"I_soldier_TL_F","I_soldier_AR_F",
			"I_soldier_A_F","I_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],
			["SERGEANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.3],
		// TODO: Можно менять динамически, в завиимости от погоды.
		[[[["I_Truck_02_covered_F",
			"I_soldier_SL_F","I_soldier_F",
			"I_soldier_LAT_F","I_soldier_M_F",
			"I_soldier_TL_F","I_soldier_AR_F",
			"I_soldier_A_F","I_medic_F",
			"I_soldier_SL_F","I_soldier_F",
			"I_soldier_LAT_F","I_soldier_M_F",
			"I_soldier_TL_F","I_soldier_AR_F",
			"I_soldier_A_F","I_medic_F"],[[0,0,0],[5,0,0],[5,-2,0],[5,-4,0],[5,-6,0],[5,-8,0],[5,-10,0],[5,-12,0],[5,-14,0],[-5,0,0],[-5,-2,0],[-5,-4,0],[-5,-6,0],[-5,-8,0],[-5,-10,0],[-5,-12,0],[-5,-14,0]],
			["SERGEANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.2],
	// бтр
		// HAF_MechInfSquad
		[[[["I_APC_Wheeled_03_cannon_F",
			"I_soldier_SL_F","I_soldier_F",
			"I_soldier_LAT_F","I_soldier_M_F",
			"I_soldier_TL_F","I_soldier_AR_F",
			"I_soldier_A_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","PRIVATE",
			"CORPORAL","PRIVATE",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.5],
		// HAF_MechInf_Support
		[[[["I_APC_Wheeled_03_cannon_F",
			"I_soldier_SL_F","I_soldier_TL_F",
			"I_soldier_repair_F","I_engineer_F",
			"I_medic_F","I_soldier_AR_F",
			"I_soldier_exp_F","I_soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0],[-20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE","CORPORAL",
			"PRIVATE","PRIVATE"],[],1]],0.5],
	// гусеничный
		// HAF_MechInf_AT
		[[[["I_APC_tracked_03_cannon_F",
			"I_soldier_SL_F","I_soldier_AT_F",
			"I_soldier_AT_F","I_soldier_AT_F",
			"I_soldier_AAT_F","I_soldier_AAT_F",
			"I_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"PRIVATE","PRIVATE",
			"PRIVATE"],[],1]],0.5],
		// HAF_MechInf_AA
		[[[["I_APC_tracked_03_cannon_F",
			"I_soldier_SL_F","I_soldier_AA_F",
			"I_soldier_AA_F","I_soldier_AA_F",
			"I_soldier_AAT_F","I_soldier_AAA_F",
			"I_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","CORPORAL",
			"PRIVATE","PRIVATE",
			"PRIVATE","PRIVATE",
			"PRIVATE"],[],1]],0.1],
	// танки
	[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_MBT_03_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[0,-15,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["I_LT_01_cannon_F","I_LT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.2],
	//[[[["I_LT_01_scout_F","I_LT_01_AA_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.1],
	[[[["I_LT_01_AT_F","I_LT_01_AT_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.2],
	[[[["I_LT_01_AA_F","I_LT_01_AA_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.1],
	// авиация
	[[
		[["I_Heli_light_03_dynamicLoadout_F"],[[0,0,0]],["LIEUTENANT"]],
		[["I_Soldier_SL_F","I_Soldier_AR_F","I_Soldier_M_F","I_Soldier_AT_F","I_Soldier_AAT_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.1],
	[[[["I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_CAS_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["I_Heli_light_03_F","I_Heli_light_03_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	// артиллерия
	/*
	[[[["I_Truck_02_MRL_F","I_Truck_02_MRL_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	*/
	// поддержка
	[[[["I_Truck_02_medical_F"],[],["PRIVATE"],[["I_medic_F"]]]],0.02],
	[[[["I_Truck_02_box_F"],[],["PRIVATE"],[["I_engineer_F"]]]],0.02],
	[[[["I_Truck_02_fuel_F"],[],["PRIVATE"]]],0.01],
	[[[["I_Truck_02_ammo_F"],[],["PRIVATE"]]],0.02]
	// турели
	/*
	[[[["I_GMG_01_F"],[],["PRIVATE"]]],0.1],
	[[[["I_HMG_01_A_F"],[],["PRIVATE"]]],0.1],
	[[[["I_HMG_01_high_F"],[],["PRIVATE"]]],0.1],
	[[[["I_static_AA_F"],[],["PRIVATE"]]],0.1],
	[[[["I_static_AT_F"],[],["PRIVATE"]]],0.1],
	[[[["I_HMG_01_F"],[],["PRIVATE"]]],0.1],
	[[[["I_GMG_01_A_F"],[],["PRIVATE"]]],0.1],
	[[[["I_GMG_01_high_F"],[],["PRIVATE"]]],0.1],
	[[[["I_Mortar_01_F"],[],["PRIVATE"]]],0.05],
	*/
];
_arr = _default_guer;
		// boat
	if (count gosa_zone_lighthouse > 0) then {
		_arr append [
			[[[["CUP_I_Frigate_AAF"],[],["CAPTAIN"]]], _depth min 0.5]
		];
	};
		_arr append [
			[[[["I_Soldier_TL_F","I_soldier_GL_F","I_soldier_AR_F","I_soldier_F","I_Boat_Transport_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[0,-10,0],[0,0,0]],
				["SERGEANT","CORPORAL","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1],
			// HAF_InfSquad
			[[[["I_Boat_Armed_01_minigun_F"],[],["LIEUTENANT"]],
					[["I_soldier_SL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F"],[[30,30,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
					["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]
			],0.1],
			// HAF_InfSquad_Weapons
			[[[["I_Boat_Armed_01_minigun_F"],[],["LIEUTENANT"]],
					[["I_soldier_SL_F","I_soldier_AR_F","I_soldier_GL_F","I_soldier_M_F","I_soldier_AT_F","I_soldier_AAT_F","I_soldier_A_F","I_medic_F"],[[30,30,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
					["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
			],0.1]
		];
		// jets
		_arr append [
			[[[["I_Plane_Fighter_04_F","I_Plane_Fighter_04_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.2]
		];
		_arr append [
			[[[["CUP_I_AH1Z_Dynamic_AAF","CUP_I_AH1Z_Dynamic_AAF"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.2]
		];
		// Arty.
		if !(isNil "lambs_wp_fnc_taskArtilleryRegister") then {
			_arr append [
				[[[["I_Truck_02_MRL_F","I_Truck_02_MRL_F","I_Truck_02_MRL_F","I_Truck_02_MRL_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.1],
				[[[["I_Truck_02_MRL_F","I_Truck_02_MRL_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.1]
			];
		};
[_groups_map, resistance, "IND_F", _arr,
[2020,2100], [250,999],
[]
] call gosa_fnc_map_groups_add;

// Беспилотники
	_arr = [
		[[[["I_UAV_02_lxWS"],[],["CORPORAL"]]],0.02],
		//[[[["I_UGV_01_rcws_F"],[],["CORPORAL"]]],0.02],
		// TODO: Мед. Беспилотники должны приземляться.
		[[[["I_UAV_06_medical_F"],[],["CORPORAL"]]],0.01],
		[[[["I_UAV_06_F"],[],["CORPORAL"]]],0.01],
		[[[["I_UAV_02_F"],[],["CORPORAL"]]],0.01],
		[[[["I_UAV_02_CAS_F"],[],["CORPORAL"]]],0.02],
		[[[["I_UAV_01_F"],[],["CORPORAL"]]],0.02]
	];
	[_groups_map, resistance, "IND_F", _arr,
	[2020,2100], [-999,999],
	[]
	] call gosa_fnc_map_groups_add;


//////////////////////////////

{
	_side = _x;
	_n = 0; _n0 = 0;
	_b = true;
	while {_b} do {
		diag_log format ["Log: [config_groups.sqf] Формирование списка отрядов для %1, допустимое отклонение %2", _side, [_n, _n0]];
		_arr1 = [_groups_map, [_side], [_date, _climate], 
			[[-_n, _n], [-_n0, _n0]]
		] call gosa_fnc_map_groups_filtering;

		_arr = [];
		for "_i" from 0 to (count _arr1 -1) do {
			_arr0 = _arr1 select _i;
			if (_arr0 select 0 isEqualTo _side) then {
				_arr append (_arr0 select 2);
			};
		};
		if (count _arr > 0 or _n > 999 or _n0 > 999) then {
			_b = false;
		}else{
			_n = _n + _steep_date;
			_n0 = _n0 + _steep_climate;
		};
	};

	switch (_side) do {
		case east: {
			_groups_enabled_map_east = _arr1;
		};
		case west: {
			_groups_enabled_map_west = _arr1;
		};
		case resistance: {
			_groups_enabled_map_guer = _arr1;
		};
		default {};
	};

	for "_i" from 0 to (count _arr1 -1) do {
		_arr = _arr1 select _i;
		if (_arr1 select _i select 0 isEqualTo _side) then {
			_groups_enabled_map pushBack _arr;
			switch (_arr select 0) do {
				case east: {_east append (_arr select 2)};
				case west: {_west append (_arr select 2)};
				case resistance: {_guer append (_arr select 2)};
				default {};
			};
		};
	};
} forEach [east, west, resistance];

//- Союзы.
// TODO: Баланс PvP.
if !(_pvp) then {
{
	_alliance = _x;
	_n = 0;
	_sides = [];
	{
		_str = _x;
		{
			_arr = _x;
			if (count (_x select 2) > 0) then {
				if (_x select 1 == _str) then {
					_n = _n +1;
					_sides set [count _sides, _x select 0];
				};
			};
		} forEach _groups_enabled_map;
	} forEach _alliance;
	if (_n > 1) then {
		_alliances_enabled set [count _alliances_enabled, [_alliance,_sides]];
	};
} forEach _alliances;
};
diag_log format ["Log: [config_groups.sqf] alliances %1", _alliances_enabled];
gosa_Groups_alliances = _alliances_enabled;


if (count _east <= 0) then {
	diag_log format ["Log: [config_groups.sqf] count _east %1", count _east];
	_east = [_default_east select 2];
	/*
	#ifdef __ARMA3__
		["wrong_groups", false] call BIS_fnc_endMission;
	#else
		failMission "LOSER";
	#endif
	// После BIS_fnc_endMission скрипт должен быть завершен.
	waitUntil {time > 60};
	*/
};
if (count _west <= 0) then {
	diag_log format ["Log: [config_groups.sqf] count _west %1", count _west];
	_west = [_default_west select 2];
	/*
	#ifdef __ARMA3__
		["wrong_groups", false] call BIS_fnc_endMission;
	#else
		failMission "LOSER";
	#endif
	waitUntil {time > 60};
	*/
};
if (count _guer <= 0) then {
	diag_log format ["Log: [config_groups.sqf] count _guer %1", count _guer];
	_guer = [_default_guer select 2];
	/*
	#ifdef __ARMA3__
		["wrong_groups", false] call BIS_fnc_endMission;
	#else
		failMission "LOSER";
	#endif
	waitUntil {time > 60};
	*/
};

//////////////////////////////

//#include "config_groups_TEST.sqf"

_eastN = [_eastN, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
_westN = [_westN, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
_guerN = [_guerN, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;

_east = [_east, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
_west = [_west, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
_guer = [_guer, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;

gosa_Groups_Night = [];
gosa_Groups_Night set [0, _eastN call gosa_fnc_arrSorting_confGroups];
gosa_Groups_Night set [1, _westN call gosa_fnc_arrSorting_confGroups];
gosa_Groups_Night set [2, _guerN call gosa_fnc_arrSorting_confGroups];

gosa_Groups_common = [];
gosa_Groups_common set [0, _east call gosa_fnc_arrSorting_confGroups];
gosa_Groups_common set [1, _west call gosa_fnc_arrSorting_confGroups];
gosa_Groups_common set [2, _guer call gosa_fnc_arrSorting_confGroups];

// Для совместимости с устаревшим кодом.
AllGroupsEast = (gosa_Groups_common select 0);
AllGroupsWest = (gosa_Groups_common select 1);
AllGroupsGuer = (gosa_Groups_common select 2);

diag_log format ["Log: [config_groups.sqf] end %1", time];

			// пехота
			// разведка
			// водолазы
			// корабль
			// колесный
			// бтр
			// гусеничный
			// танки
			// беспилотники
			// авиация
			// артиллерия
			// поддержка
