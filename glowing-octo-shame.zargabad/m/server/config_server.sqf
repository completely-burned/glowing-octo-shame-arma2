m_friendlySide = [west];
if(toLower worldname in ["zargabad", "takistan", "utes", "chernarus"])then{m_friendlySide = [east]};
if(toLower worldname in ["shapur_baf", "mountains_acr"])then{m_friendlySide = [west]};
if(toLower worldname in ["fdf_isle1_a"])then{m_friendlySide = [resistance]};

/// listCrew + listMHQ ///

private ["_i"];
listCrew = [];
listMHQ=["BRDM2_HQ_Base","BMP2_HQ_Base"];
if ( LIB_a2Avail ) then {
	listMHQ=listMHQ+[
		"BTR90_HQ",
		"LAV25_HQ"
	];
	listCrew=listCrew+[
		"USMC_Soldier_Crew", 
		"USMC_Soldier_Pilot", 
		"CDF_Soldier_Crew", 
		"CDF_Soldier_Pilot", 
		"RU_Soldier_Crew", 
		"RU_Soldier_Pilot", 
		"Ins_Soldier_Crew", 
		"Ins_Soldier_Pilot", 
		"GUE_Soldier_Crew", 
		"GUE_Soldier_Pilot"
	];
};
if ( LIB_ahAvail ) then {
	listMHQ=listMHQ+[
		"M1130_CV_EP1"
	];
	listCrew=listCrew+[
		"US_Soldier_Crew_EP1", 
		"US_Soldier_Pilot_EP1", 
		"TK_Soldier_Crew_EP1", 
		"TK_Soldier_Pilot_EP1", 
		"UN_CDF_Soldier_Crew_EP1", 
		"UN_CDF_Soldier_Pilot_EP1",
		"Soldier_Crew_PMC", 
		"Soldier_Pilot_PMC",
		"BAF_crewman_MTP", 
		"BAF_crewman_w",
		"BAF_Pilot_MTP"
	];
};
if ( configName(configFile >> "CfgMods" >> "ACR") != "" ) then {
	listCrew=listCrew+[
		"CZ_Soldier_Crew_Dst_ACR",
		"CZ_Soldier_Crew_Wdl_ACR",
		"CZ_Soldier_Pilot_EP1"
	];
};
/// listCrew + listMHQ ///


/// silvieManager ///
silvieManagerBlacklist=[
	"Land_sloup_vn_dratZ",
	"Land_sloup_vn",
	"Land_Farm_WTower",
	"land_nav_pier_c",
	"land_nav_pier_c2",
	"land_nav_pier_c2_end",
	"land_nav_pier_c_270",
	"land_nav_pier_c_90",
	"land_nav_pier_c_big",
	"land_nav_pier_C_L",
	"land_nav_pier_C_L10",
	"land_nav_pier_C_L30",
	"land_nav_pier_C_R",
	"land_nav_pier_C_R10",
	"land_nav_pier_C_R30",
	"land_nav_pier_c_t15",
	"land_nav_pier_c_t20",
	"land_nav_pier_F_17",
	"land_nav_pier_F_23",
	"land_nav_pier_m",
	"land_nav_pier_m_1",
	"land_nav_pier_m_end",
	"land_nav_pier_M_fuel",
	"land_nav_pier_pneu",
	"land_nav_pier_uvaz",

	"WarfareBDepot",
	"WarfareBAirport",
	"USMC_WarfareBBarracks",
	"RU_WarfareBBarracks",
	"CDF_WarfareBBarracks",
	"Ins_WarfareBBarracks",
	"Gue_WarfareBBarracks",
	"USMC_WarfareBLightFactory",
	"RU_WarfareBLightFactory",
	"CDF_WarfareBLightFactory",
	"Ins_WarfareBLightFactory",
	"Gue_WarfareBLightFactory",
	"USMC_WarfareBHeavyFactory",
	"RU_WarfareBHeavyFactory",
	"CDF_WarfareBHeavyFactory",
	"Ins_WarfareBHeavyFactory",
	"Gue_WarfareBHeavyFactory",
	"USMC_WarfareBAircraftFactory",
	"RU_WarfareBAircraftFactory",
	"CDF_WarfareBAircraftFactory",
	"WarfareBAircraftFactory_CDF",
	"INS_WarfareBAircraftFactory",
	"WarfareBAircraftFactory_Ins",
	"GUE_WarfareBAircraftFactory",
	"WarfareBAircraftFactory_Gue",
	"USMC_WarfareBAntiAirRadar",
	"RU_WarfareBAntiAirRadar",
	"CDF_WarfareBAntiAirRadar",
	"INS_WarfareBAntiAirRadar",
	"GUE_WarfareBAntiAirRadar",
	"USMC_WarfareBArtilleryRadar",
	"RU_WarfareBArtilleryRadar",
	"CDF_WarfareBArtilleryRadar",
	"Ins_WarfareBArtilleryRadar",
	"Gue_WarfareBArtilleryRadar",
	"USMC_WarfareBUAVterminal",
	"RU_WarfareBUAVterminal",
	"CDF_WarfareBUAVterminal",
	"INS_WarfareBUAVterminal",
	"GUE_WarfareBUAVterminal",
	"USMC_WarfareBVehicleServicePoint",
	"RU_WarfareBVehicleServicePoint",
	"CDF_WarfareBVehicleServicePoint",
	"INS_WarfareBVehicleServicePoint",
	"GUE_WarfareBVehicleServicePoint",
	"Base_WarfareBBarrier5x",
	"Base_WarfareBBarrier10x",
	"Base_WarfareBBarrier10xTall",
	"BRDM2_HQ_Gue_unfolded",
	"BTR90_HQ_unfolded",
	"LAV25_HQ_unfolded",
	"BMP2_HQ_INS_unfolded",
	"BMP2_HQ_CDF_unfolded"
];
silvieManagerVehicles = [];
for [{_i = 0}, {_i < count (configfile >> "cfgVehicles")}, {_i = _i + 1}] do {
	private "_actual";
	_actual = (configfile >> "cfgVehicles") select _i;
	if (isclass _actual) then {
		private ["_class","_vehicleclass"];
		_class = configname _actual;
		_vehicleclass = gettext (configfile >> "cfgvehicles" >> _class >> "vehicleClass");
		if !(_vehicleclass in ["Sounds","Mines"]) then {
			private ["_scope","_side"];
			_scope = getnumber (_actual >> "scope");
			_side = getnumber (_actual >> "side");
			if (_class iskindof "LandVehicle" && _scope == 2 && _side == 3) then {
				silvieManagerVehicles = silvieManagerVehicles + [_class];
			};
		};
	};
};
/// silvieManager ///
