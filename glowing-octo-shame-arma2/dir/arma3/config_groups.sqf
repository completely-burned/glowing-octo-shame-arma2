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
 */

// define ранга.
#include "..\include\ranks.hpp"

private ["_west","_east","_guer","_woodland","_deserted","_n","_d",
	"_westN","_eastN","_guerN","_westD","_eastD","_guerD",
	"_default_east","_default_west","_default_guer"];
_west=[];_east=[];_guer=[];
// Ночь.
_westN=[];_eastN=[];_guerN=[];
// День.
_westD=[];_eastD=[];_guerD=[];
// Отказоустойчивые отряды
_default_east=[];_default_west=[];_default_guer=[];

_woodland=false; _deserted=false;
if(toLower worldname in ["altis","vr"])then{_deserted=true};
if(toLower worldname in ["tanoa"])then{_woodland=true};
_n = (gosa_IslandType select 0);
_d = (gosa_IslandType select 1);


//////////////////////////////
//--- A3 ---
//////////////////////////////
//-- BLU_F NATO
_default_west=[
	[[[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_soldier_SL_F","B_soldier_AR_F","B_soldier_GL_F","B_soldier_M_F","B_soldier_AT_F","B_soldier_AAT_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_Soldier_TL_F","B_Soldier_AR_F","B_soldier_GL_F","B_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_Soldier_TL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_Soldier_TL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_soldier_GL_F","B_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
	[[[["B_Soldier_SL_F","B_soldier_AR_F","B_HeavyGunner_F","B_soldier_AAR_F","B_soldier_M_F","B_Sharpshooter_F","B_soldier_LAT_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_G_soldier_SL_F","B_G_soldier_TL_F","B_G_soldier_F","B_G_soldier_LAT_F","B_G_Soldier_M_F","B_G_soldier_AR_F","B_G_Soldier_A_F","B_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_G_soldier_SL_F","B_G_soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_soldier_LAT_F","B_G_soldier_LAT_F","B_G_soldier_A_F","B_G_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_G_Soldier_TL_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_G_Soldier_GL_F","B_G_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
	[[[["B_G_Soldier_M_F","B_G_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
	[[[["B_G_Sharpshooter_F","B_G_Soldier_M_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
	[[[["B_G_Soldier_SL_F","B_G_Sharpshooter_F","B_G_Soldier_AR_F","B_G_Soldier_A_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	// разведка
	[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_LAT_F","B_recon_JTAC_F","B_recon_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_recon_M_F","B_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
	[[[["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_F","B_recon_LAT_F","B_recon_JTAC_F","B_recon_exp_F","B_Recon_Sharpshooter_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_sniper_F","B_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
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
	[[[["B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F","B_MRAP_01_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
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
	[[[["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F","B_G_medic_F","B_G_Soldier_F","B_G_Offroad_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"],[[0,0,0],[10,-10,0],[-10,-10,0]],["PRIVATE","PRIVATE","PRIVATE"]]],0.5],
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
	[[[["B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_AFV_Wheeled_01_up_cannon_F","B_AFV_Wheeled_01_up_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
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
			"PRIVATE","PRIVATE"],[],1]],0.5],
	// Экипаж покидает тс.
	//[[[["B_APC_Tracked_01_CRV_F"],[[0,0,0]],["SERGEANT"]]],0.5],
	// танки
	[[[["B_MBT_01_cannon_F","B_MBT_01_cannon_F","B_MBT_01_cannon_F","B_MBT_01_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_cannon_F","B_APC_Tracked_01_aa_F","B_MBT_01_cannon_F","B_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_cannon_F","B_MBT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_TUSK_F","B_MBT_01_TUSK_F","B_MBT_01_TUSK_F","B_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_TUSK_F","B_APC_Tracked_01_aa_F","B_MBT_01_TUSK_F","B_APC_Tracked_01_aa_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_TUSK_F","B_MBT_01_TUSK_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	// артиллерия
	/*
	[[[["B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_arty_F","B_MBT_01_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["B_MBT_01_mlrs_F","B_MBT_01_mlrs_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	*/
	// авиация
	[[
		[["B_T_VTOL_01_infantry_F"],[[0,0,0]],["LIEUTENANT"]],
		[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.5],
	[[
		[["B_Heli_Transport_03_F"],[[0,0,0]],["LIEUTENANT"]],
		[["B_soldier_SL_F","B_soldier_TL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.5],
	// поддержка
	[[[["B_Truck_01_medical_F"],[],["PRIVATE"],[["B_medic_F"]]]],0.02],
	[[[["B_Truck_01_Repair_F"],[],["PRIVATE"],[["B_engineer_F"]]]],0.02],
	[[[["B_Truck_01_fuel_F"],[],["PRIVATE"]]],0.01],
	[[[["B_Truck_01_ammo_F"],[],["PRIVATE"]]],0.02],
	[[[["B_G_Offroad_01_repair_F"],[],["PRIVATE"],[["B_G_engineer_F"]]]],0.01],
	[[[["B_G_Van_01_fuel_F"],[],["PRIVATE"]]],0.01]
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
	[[[["B_G_Mortar_01_F"],[],["PRIVATE"]]],0.05]
	*/
];
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"BLU_F");
if (_tmp > 0 or (_d >= 1990 && _tmp == -1)) then {
	if ((_n <= 160 or _n >= 250) or _tmp > 0) then {
		_west append _default_west;
	};
};
if(true)then{
	_west=_west+[
		// беспилотники
		/*
		[[[["B_UAV_01_F"],[],["CORPORAL"]]],0.5],
		[[[["B_UAV_02_F"],[],["CORPORAL"]]],0.5],
		[[[["B_UAV_02_CAS_F"],[],["CORPORAL"]]],0.5],
		[[[["B_T_UAV_03_dynamicLoadout_F"],[],["LIEUTENANT"]]],0.5],
		[[[["B_UGV_01_rcws_F"],[],["CORPORAL"]]],0.5],
		*/
		// авиация
		[[[["B_T_VTOL_01_armed_F"],[],["LIEUTENANT"]]],0.5],
		[[[["B_Plane_CAS_01_F","B_Plane_CAS_01_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["B_Heli_Light_01_armed_F","B_Heli_Light_01_armed_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["B_Heli_Attack_01_F","B_Heli_Attack_01_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["B_Heli_Transport_03_F","B_Heli_Transport_03_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
		[[[["B_Heli_Transport_01_F","B_Heli_Transport_01_F"],[[0,20,0],[20,0,0]],["LIEUTENANT","LIEUTENANT"]]],0.5]
	];
};

//-- OPF_F CSAT
_default_east=[
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
			"PRIVATE"]]],0.5],
		// OIA_GuardTeam
		[[[["O_soldierU_TL_F",
			"O_soldierU_AR_F","O_soldierU_GL_F",
			"O_soldierU_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.5],
		// OIA_GuardSentry
		[[[["O_soldierU_GL_F","O_soldierU_F"],[[0,0,0],[5,-5,0]],
			["CORPORAL","PRIVATE"]]],0.5],
		// OI_support_CLS
		[[[["O_soldier_TL_F",
			"O_soldier_AR_F","O_medic_F",
			"O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.5],
		// OI_support_EOD
		[[[["O_soldier_TL_F",
			"O_engineer_F","O_soldier_exp_F",
			"O_soldier_exp_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.5],
		// OI_support_ENG
		[[[["O_soldier_TL_F",
			"O_engineer_F","O_engineer_F",
			"O_soldier_repair_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE",
			"PRIVATE"]]],0.5],
		// OI_support_MG
		[[[["O_soldier_TL_F",
			"O_support_MG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0.5],
		// OI_support_GMG
		[[[["O_soldier_TL_F",
			"O_support_GMG_F","O_support_AMG_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0.5],
		// OI_support_Mort
		[[[["O_soldier_TL_F",
			"O_support_Mort_F","O_support_AMort_F"],[[0,0,0],[5,-5,0],[-5,-5,0]],
			["SERGEANT",
			"CORPORAL","PRIVATE"]]],0.5],
		//
	[[[["O_soldier_SL_F","O_soldier_TL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_soldier_SL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_M_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_A_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_soldier_TL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_soldier_TL_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_soldier_TL_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_soldier_GL_F","O_soldier_F"],[[0,0,0],[5,-2,0]],["CORPORAL","PRIVATE"]]],0.5],
	[[[["O_Soldier_SL_F","O_Soldier_AR_F","O_HeavyGunner_F","O_Soldier_AAR_F","O_soldier_M_F","O_Sharpshooter_F","O_Soldier_LAT_F","O_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
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
	[[[["O_recon_M_F","O_recon_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
	[[[["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_F","O_recon_LAT_F","O_recon_JTAC_F","O_recon_exp_F","O_Pathfinder_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_sniper_F","O_spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
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
			"PRIVATE"]]],0.5],
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
	[[[["O_soldier_AR_F","O_soldier_LAT_F""O_LSV_02_armed_F"],[[5,-5,0],[-5,-5,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F","O_G_medic_F","O_G_Soldier_F","O_G_Offroad_01_F"],[[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["O_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F"],[[0,0,0],[10,-10,0],[-10,-10,0]],["PRIVATE","PRIVATE","PRIVATE"]]],0.5],
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
	// гусеничный
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
			"PRIVATE","PRIVATE"],[],1]],0.5],
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
			"CORPORAL"]]],0.5],
		// OIA_TankSection
		[[[["O_MBT_02_cannon_F","O_MBT_02_cannon_F"],[[0,0,0],[10,-10,0]],
			["LIEUTENANT","SERGEANT"]]],0.5],
		// O_TankPlatoon_Heavy
		[[[["O_MBT_04_command_F",
			"O_MBT_04_cannon_F","O_MBT_04_cannon_F",
			"O_MBT_04_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],
			["LIEUTENANT",
			"SERGEANT","SERGEANT",
			"CORPORAL"]]],0.5],
		// O_TankSection_Heavy
		[[[["O_MBT_04_cannon_F","O_MBT_04_cannon_F"],[[0,0,0],[10,-10,0]],
			["LIEUTENANT","SERGEANT"]]],0.5],
	// артиллерия
	/*
	[[[["O_MBT_02_arty_F","O_MBT_02_arty_F","O_MBT_02_arty_F","O_MBT_02_arty_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["O_MBT_02_arty_F","O_MBT_02_arty_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	*/
	// авиация
	[[
		[["O_Heli_Transport_04_covered_F"],[[0,0,0]],["LIEUTENANT"]],
		[["O_soldierU_SL_F","O_soldierU_TL_F","O_soldierU_F","O_soldierU_LAT_F","O_soldierU_M_F","O_soldierU_AR_F","O_soldierU_A_F","O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.5],
	[[
		[["O_T_VTOL_02_infantry_dynamicLoadout_F"],[[0,0,0]],["LIEUTENANT"]],
		[["O_soldierU_SL_F","O_soldierU_TL_F","O_soldierU_F","O_soldierU_LAT_F","O_soldierU_M_F","O_soldierU_AR_F","O_soldierU_A_F","O_soldierU_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.5],
	// поддержка
	[[[["O_Truck_03_medical_F"],[],["PRIVATE"],[["O_medic_F"]]]],0.01],
	[[[["O_Truck_03_repair_F"],[],["PRIVATE"],[["O_engineer_F"]]]],0.01],
	[[[["O_Truck_03_fuel_F"],[],["PRIVATE"]]],0.01],
	[[[["O_Truck_03_ammo_F"],[],["PRIVATE"]]],0.02],
	[[[["O_Truck_02_medical_F"],[],["PRIVATE"],[["O_medic_F"]]]],0.01],
	[[[["O_Truck_02_box_F"],[],["PRIVATE"],[["O_engineer_F"]]]],0.01],
	// [[[["O_Truck_02_Ammo_F"],[],["PRIVATE"]]],0.5],
	[[[["O_Truck_02_fuel_F"],[],["PRIVATE"]]],0.01],
	[[[["O_G_Offroad_01_repair_F"],[],["PRIVATE"],[["O_G_engineer_F"]]]],0.01],
	[[[["O_G_Van_01_fuel_F"],[],["PRIVATE"]]],0.01]
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
	[[[["O_G_Mortar_01_F"],[],["PRIVATE"]]],0.05]
	*/
];
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"OPF_F");
if (_tmp > 0 or (_d >= 1990 && _tmp == -1)) then {
	if ((_n <= 160 or _n >= 250) or _tmp > 0) then {
		_east append _default_east;
	};
};
if(true)then{
	_east=_east+[
		// беспилотники
		/*
		[[[["O_UAV_01_F"],[],["CORPORAL"]]],0.5],
		[[[["O_UAV_02_F"],[],["CORPORAL"]]],0.5],
		[[[["O_UAV_02_CAS_F"],[],["CORPORAL"]]],0.5],
		[[[["O_T_UAV_04_CAS_F"],[],["LIEUTENANT"]]],0.5],
		[[[["O_UGV_01_rcws_F"],[],["CORPORAL"]]],0.5],
		*/
		// авиация
		[[[["O_Heli_Attack_02_black_F","O_Heli_Attack_02_black_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["O_Heli_Light_02_F","O_Heli_Light_02_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
		[[[["O_Plane_CAS_02_F","O_Plane_CAS_02_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
	];
};

//-- IND_F AAF
_default_guer=[
	// пехота
		// HAF_InfSquad
		[[[["I_soldier_SL_F",
			"I_soldier_F","I_soldier_LAT_F",
			"I_soldier_M_F","I_soldier_TL_F",
			"I_soldier_AR_F","I_soldier_A_F",
			"I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0],[-15,-15,0],[20,-20,0]],
			["SERGEANT","PRIVATE","CORPORAL","PRIVATE","SERGEANT","CORPORAL","PRIVATE","PRIVATE"]]],0.5],
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
			"PRIVATE"]]],0.5],
	[[[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_GL_F","I_soldier_LAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["I_Soldier_TL_F","I_Soldier_AT_F","I_Soldier_AT_F","I_Soldier_AAT_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["I_Soldier_TL_F","I_Soldier_AA_F","I_Soldier_AA_F","I_Soldier_AAA_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
	[[[["I_Soldier_GL_F","I_soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
	// разведка
	[[[["I_Sniper_F","I_Spotter_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.5],
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
	[[[["I_Soldier_AA_F","I_Soldier_AAA_F","I_MRAP_03_F"],[[5,-5,0],[-5,-5,0],[0,-10,0],[0,0,0]],["LIEUTENANT","PRIVATE","PRIVATE","PRIVATE"]]],0.5],
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
			"PRIVATE"],[],1]],0.5],
	// танки
	[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_MBT_03_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[20,-20,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F"],[[0,0,0],[10,-10,0],[-10,-10,0],[0,-15,0]],["LIEUTENANT","LIEUTENANT","LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["I_MBT_03_cannon_F","I_MBT_03_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["I_LT_01_cannon_F","I_LT_01_cannon_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["I_LT_01_scout_F","I_LT_01_AA_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["I_LT_01_AT_F","I_LT_01_AT_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	[[[["I_LT_01_AA_F","I_LT_01_AA_F"],[[0,0,0],[10,-10,0]],["LIEUTENANT","LIEUTENANT"]]],0.5],
	// беспилотники
	/*
	[[[["I_UAV_01_F"],[],["PRIVATE"]]],0.5],
	[[[["I_UAV_02_F"],[],["PRIVATE"]]],0.5],
	[[[["I_UAV_02_CAS_F"],[],["PRIVATE"]]],0.5],
	[[[["I_UGV_01_rcws_F"],[],["PRIVATE"]]],0.5],
	*/
	// авиация
	[[
		[["I_Heli_light_03_dynamicLoadout_F"],[[0,0,0]],["LIEUTENANT"]],
		[["I_Soldier_SL_F","I_Soldier_AR_F","I_Soldier_M_F","I_Soldier_AT_F","I_Soldier_AAT_F","I_medic_F"],[[0,0,0],[5,-5,0],[-5,-5,0],[10,-10,0],[-10,-10,0],[15,-15,0]],["SERGEANT","PRIVATE","PRIVATE","PRIVATE","PRIVATE","PRIVATE"]]
	],0.5],
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
	[[[["I_Truck_02_ammo_F"],[],["PRIVATE"]]],0.02],
	[[[["I_G_Offroad_01_repair_F"],[],["PRIVATE"],[["I_engineer_F"]]]],0.01],
	[[[["I_G_Van_01_fuel_F"],[],["PRIVATE"]]],0.01]
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
	[[[["I_G_Mortar_01_F"],[],["PRIVATE"]]],0.05]
	*/
];
_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"IND_F");
if (_tmp > 0 or (_d >= 1990 && _tmp == -1)) then {
	if ((_n <= 160 or _n >= 250) or _tmp > 0) then {
		_guer append _default_guer;
	};
};

//////////////////////////////
// жандармерия
_west=_west+[
	[[[["B_GEN_Commander_F","B_GEN_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.01],
	[[[["B_GEN_Offroad_01_gen_F","B_GEN_Soldier_F"],[[0,0,0],[5,-5,0]],["CORPORAL","PRIVATE"]]],0.01]
];

// laws of war
/*
_west=_west+[
	[[[["B_UAV_06_F"],[],["PRIVATE"]]],0.5],
	[[[["B_UAV_06_medical_F"],[],["PRIVATE"]]],0.5]
];
*/
_west=_west+[
	[[[["B_GEN_Commander_F",
		"B_GEN_Soldier_F","B_GEN_Soldier_F",
		"B_GEN_Van_02_vehicle_F"],[[0,2.5],[0,-2.5],[2.5,0],[0,0]],
		["LIEUTENANT",
		"PRIVATE","PRIVATE",
		"PRIVATE"]]],0.01]
];
// laws of war
/*
_east=_east+[
	[[[["O_UAV_06_F"],[],["PRIVATE"]]],0.5],
	[[[["O_UAV_06_medical_F"],[],["PRIVATE"]]],0.5]
];
*/
// laws of war
/*
_guer=_guer+[
	[[[["I_UAV_06_F"],[],["PRIVATE"]]],0.5],
	[[[["I_UAV_06_medical_F"],[],["PRIVATE"]]],0.5]
];
*/

// jets
_west=_west+[
	//[[[["B_UAV_05_F"],[],["PRIVATE"]]],0.5],
	[[[["B_Plane_Fighter_01_F","B_Plane_Fighter_01_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["B_Plane_Fighter_01_Stealth_F","B_Plane_Fighter_01_Stealth_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
	//[[[["B_Radar_System_01_F","B_SAM_System_03_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
];
// jets
_east=_east+[
	[[[["O_Plane_Fighter_02_F","O_Plane_Fighter_02_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5],
	[[[["O_Plane_Fighter_02_Stealth_F","O_Plane_Fighter_02_Stealth_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
	//[[[["O_Radar_System_02_F","O_SAM_System_04_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
];
// jets
_guer=_guer+[
	[[[["I_Plane_Fighter_04_F","I_Plane_Fighter_04_F"],[[0,20,0],[20,0,0]],["CAPTAIN","CAPTAIN"]]],0.5]
];

// дистанционный целеуказатель
/*
_west=_west+[
	[[[["B_Static_Designator_01_F"],[],["PRIVATE"]]],0.5]
];
_east=_east+[
	[[[["O_Static_Designator_02_F"],[],["PRIVATE"]]],0.5]
];
*/

#include "config_groups_Apex.sqf"
#include "config_groups_Enoch.sqf"

#include "config_groups_GM.sqf"

#include "config_groups_CUP.sqf"
#include "config_groups_RHS.sqf"

// _west=[
// ];
// _east=[
// ];
// _guer=[
// ];

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
