private ["_i","_ii","_E","_players","_side","_arr","_n"];

_arr = [] call gosa_fnc_init_side_balance;

[] call compile preprocessFileLineNumbers "dir\server\cfg_mhq.sqf";

/// silvieManager ///
silvieManagerBlacklist=[
	"Land_sloup_vn",
	"Land_rails_bridge_40",
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

_arr = [] call gosa_fnc_zone_init;
gosa_zone_islands = _arr select 0;
publicVariable "gosa_zone_islands";

// Зоны запрещающие швартовку.
_arr = [];
_str = "gosa_limit_berthing";
if !(isNil _str) then {
	_arr set [count _arr, call compile _str];
};
for "_i" from 0 to 999 do {
	_str = format["gosa_limit_berthing_%1", _i];
	if !(isNil _str) then {
		_arr set [count _arr, call compile _str];
	};
};
gosa_zone_limit_berthing = _arr;
publicVariable "gosa_zone_limit_berthing";

_woodland=false; _deserted=false;
if(toLower worldname in ["zargabad", "takistan", "desert_e", "shapur_baf", "mountains_acr"])then{_deserted=true};
if(toLower worldname in ["chernarus", "utes", "fdf_isle1_a",  "woodland_acr","namalsk","bootcamp_acr"])then{_woodland=true};

airTransportsWest=[];airTransportsEast=[];airTransportsGuer=[];
airTransportsWest=airTransportsWest+["MV22","UH1Y"];
airTransportsWest=airTransportsWest+["Mi171Sh_CZ_EP1","Mi171Sh_rockets_CZ_EP1","Mi24_D_CZ_ACR"];
airTransportsWest=airTransportsWest+["AW159_Lynx_BAF","BAF_Merlin_HC3_D","CH_47F_BAF"];
airTransportsEast=airTransportsEast+["Mi24_V","Mi24_P","Mi17_rockets_RU","Mi17_Ins","Mi24_D_TK_EP1","Mi17_TK_EP1","UH1H_TK_EP1"];
airTransportsGuer=airTransportsGuer+["Ka60_PMC","Ka60_GL_PMC"];
if(!_deserted)then{
	airTransportsWest=airTransportsWest+["Mi24_D","Mi17_CDF"];
};
if(!_woodland)then{
	airTransportsWest=airTransportsWest+["CH_47F_EP1","MH6J_EP1","UH60M_EP1"];
};
if(!_woodland)then{
	airTransportsGuer=airTransportsGuer+["Mi17_UN_CDF_EP1","UH1H_TK_GUE_EP1"];
};

{
	if(configName(configfile >> "cfgVehicles" >> _x) == "")then{airTransportsWest=airTransportsWest-[_x]};
}forEach airTransportsWest;
{
	if(configName(configfile >> "cfgVehicles" >> _x) == "")then{airTransportsEast=airTransportsEast-[_x]};
}forEach airTransportsEast;
{
	if(configName(configfile >> "cfgVehicles" >> _x) == "")then{airTransportsGuer=airTransportsGuer-[_x]};
}forEach airTransportsGuer;

// бункеры
gosa_constructedList = [];
[] call compile preprocessFileLineNumbers "dir\server\config_compositions.sqf";
gosa_rangeSizeModifier = 0;
gosa_rangeModifier = gosa_rangeSizeModifier * 25;
