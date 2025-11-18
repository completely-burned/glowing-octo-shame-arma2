private ["_arr","_arr0","_arr1","_str","_cfgveh","_item"];

_cfgveh = LIB_cfgVeh;

//--- 
_arr = [
	// [side, реальный тип, виртуальный тип].
	
	[west,			"SPE_OpelBlitz",		"SPE_OpelBlitz_Command"],
	[west,			"SPE_ST_OpelBlitz",		"SPE_ST_OpelBlitz_Command"],
	[west,			"SPEX_DAK_OpelBlitz",	"SPEX_DAK_OpelBlitz_Command"],
	[resistance,	"SPE_CCKW_353",			"SPE_CCKW_353_Command"],
	[resistance,	"SPE_FR_CCKW_353",		"SPE_FR_CCKW_353_Command"],
	[resistance,	"SPEX_PL_CCKW_353",		"SPEX_PL_CCKW_353_Command"],

	[west,	"gm_ge_army_kat1_454_cargo"],
	[west,	"gm_dk_army_u1300l_container"],
	[east,	"gm_gc_army_2p16"],
	[east,	"gm_gc_army_btr60pu12"],
	[east,	"gm_gc_army_ural44202"],
	[east,	"gm_pl_army_2p16"],
	[east,	"gm_gc_pol_p601"],
	[civilian,	"gm_ge_civ_u1300l"],
	[east,	"bmp2_hq_ins_unfolded",			"i44_hq_g_unfolded"],
	[west,	"bmp2_hq_cdf_unfolded",			"i44_hq_a_unfolded"],
	[east,			"o_truck_03_covered_f",	"o_truck_03_command_f"],
	[west,			"b_truck_01_covered_f",	"b_truck_01_command_f"],
	[resistance,	"i_truck_02_covered_f",	"i_truck_02_command_f"],
	[civilian,		"c_truck_02_covered_f",	"c_truck_02_command_f"],
	[east,	"i44_truck_g_kfz305_gray_wh",	"i44_truck_g_command_wh"],
	[west,	"i44_truck_a_gmc_cckw_army",	"i44_truck_a_command_army"]
];
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_item = _arr select _i;
	_str = configName (_cfgVeh >> (_item select 1));
	if (_str != "") then {
		_item set [1, toLower (_item select 1)];
		if (count _item <= 2) then {
			_item set [2, (_item select 1 + "_command_gosa")];
		}else{
			_item set [2, toLower (_item select 2)];
		};
		_arr0 set [count _arr0, _item];
	};
};
_arr = (_arr0 call gosa_fnc_arr_sorting0);
gosa_types_virt = _arr;
gosa_types_mhq_virt = _arr;
diag_log format ["Log: [cfg_mhq]: gosa_types_virt %1", _arr];
publicVariable "gosa_types_virt";
publicVariable "gosa_types_mhq_virt";


//--- 
_arr = [
	// [side, мобильный тип, разложенный тип].
	[west,	"m1130_cv_ep1",	"m1130_hq_unfolded_ep1"],
	[east,	"btr90_hq",		"btr90_hq_unfolded"],
	[west,	"lav25_hq",		"lav25_hq_unfolded"],
	[east,	"bmp2_hq_tk_ep1",	"bmp2_hq_tk_unfolded_ep1"],
	[east,	"bmp2_hq_ins",		"bmp2_hq_ins_unfolded"],
	[west,	"bmp2_hq_cdf",		"bmp2_hq_cdf_unfolded"],
	[resistance, "brdm2_hq_tk_gue_ep1",	"brdm2_hq_tk_gue_unfolded_ep1"],
	[resistance, "brdm2_hq_gue",		"brdm2_hq_gue_unfolded"],

	[east,			"o_truck_03_device_f",	nil],
	[east,			"o_t_truck_03_device_ghex_f",	nil],
	[west,			"b_truck_01_mover_f",	nil],
	[west,			"b_t_truck_01_mover_f",	nil],
	[west,			"b_gen_offroad_01_comms_f",	nil],
	[resistance,	"i_e_offroad_01_comms_f",	nil],
	[civilian,		"c_offroad_01_comms_f",	nil],
	[civilian,		"c_idap_van_02_vehicle_f",	nil],

	[east,			"o_truck_03_command_f",	nil],
	[west,			"b_truck_01_command_f",	nil],
	[resistance,	"i_truck_02_command_f",	nil],
	[civilian,		"c_truck_02_command_f",	nil],

	[east,	"gm_gc_army_brdm2um",	nil],
	[west,	"gm_ge_army_fuchsa0_command",	nil],
	[west,	"gm_ge_army_m113a1g_command",	nil],
	[west,	"gm_dk_army_m113a1dk_command",	nil],

	[east,	"CSLA_AZU_R2",	nil],
	[east,	"CSLA_AZU_R2_des",	nil],
	[west,	"AFMC_M1008_S250",	nil],
	[west,	"US85_M1008_S250",	nil],
	[west,	"US85_M923a1_s280",	nil],
	[west,	"US85_M1008_S250_DES",	nil],
	[west,	"US85_M923a1_s280_DES",	nil],

	[east,			"rhs_gaz66_r142_msv",	nil],
	[east,			"rhs_gaz66_r142_vmf",	nil],
	[east,			"rhs_gaz66_r142_vdv",	nil],
	[east,			"rhs_gaz66_r142_vv",	nil],
	[east,			"rhsgref_ins_gaz66_r142",	nil],
	[east,			"rhsgref_BRDM2UM_msv",	nil],
	[east,			"rhsgref_BRDM2UM_ins",	nil],
	[east,			"rhsgref_BRDM2UM_vdv",	nil],
	[east,			"rhsgref_BRDM2UM_vmf",	nil],
	[east,			"rhsgref_BRDM2_HQ_msv",	nil],
	[east,			"rhsgref_BRDM2_HQ_ins",	nil],
	[east,			"rhsgref_BRDM2_HQ_vdv",	nil],
	[east,			"rhsgref_BRDM2_HQ_vmf",	nil],

	[west,			"rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy",	nil],
	[west,			"rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy",	nil],
	[west,			"rhsusf_m1152_sicps_usarmy_d",	nil],
	[west,			"rhsusf_m1152_sicps_usarmy_wd",	nil],
	[west,			"rhsgref_BRDM2UM_b",	nil],
	[west,			"rhsgref_BRDM2_HQ_b",	nil],

	[resistance,	"rhsgref_ins_g_gaz66_r142",	nil],
	[resistance,	"rhsgref_cdf_gaz66_r142",	nil],
	[resistance,	"rhsgref_BRDM2UM_ins_g",	nil],
	[resistance,	"rhsgref_BRDM2UM",	nil],
	[resistance,	"rhsgref_BRDM2_HQ_ins_g",	nil],
	[resistance,	"rhsgref_BRDM2_HQ",	nil],

	[east,	"CUP_O_BMP_HQ_sla",	nil],
	[east,	"CUP_O_BRDM2_HQ_SLA",	nil],
	[east,	"CUP_O_BMP_HQ_TKA",	nil],
	[east,	"CUP_O_BRDM2_HQ_TKA",	nil],
	[east,	"CUP_O_M113A3_HQ_TKA",	nil],
	[east,	"CUP_O_BMP_HQ_RU",	nil],
	[east,	"CUP_O_BRDM2_HQ_RUS",	nil],
	[east,	"CUP_O_BTR90_HQ_RU",	nil],
	[east,	"CUP_O_BMP_HQ_CHDKZ",	nil],
	[east,	"CUP_O_BRDM2_HQ_CHDKZ",	nil],
	[east,	"CUP_O_BMP_HQ_CSAT",	nil],
	[east,	"CUP_O_BRDM2_HQ_CSAT",	nil],
	[east,	"CUP_O_BMP_HQ_CSAT_T",	nil],
	[east,	"CUP_O_BRDM2_HQ_CSAT_T",	nil],

	[west,	"CUP_B_BMP_HQ_CZ",	nil],
	[west,	"CUP_B_BMP_HQ_CZ_Des",	nil],
	[west,	"CUP_B_BRDM2_HQ_CZ",	nil],
	[west,	"CUP_B_BRDM2_HQ_CZ_Des",	nil],
	[west,	"CUP_B_M113A1_HQ_USA",	nil],
	[west,	"CUP_B_M113A1_HQ_desert_USA",	nil],
	[west,	"CUP_B_M113A1_HQ_olive_USA",	nil],
	[west,	"CUP_B_M113A3_HQ_USA",	nil],
	[west,	"CUP_B_M113A3_HQ_desert_USA",	nil],
	[west,	"CUP_B_M113A3_HQ_olive_USA",	nil],
	[west,	"CUP_B_M113A3_HQ_GER",	nil],
	[west,	"CUP_B_AAV_Unarmed_USMC",	nil],
	[west,	"CUP_B_LAV25_HQ_USMC",	nil],
	[west,	"CUP_B_LAV25_HQ_desert_USMC",	nil],
	[west,	"CUP_B_LAV25_HQ_green",	nil],
	[west,	"CUP_B_BMP_HQ_CDF",	nil],
	[west,	"CUP_B_BRDM2_HQ_CDF",	nil],

	[resistance,	"CUP_I_AAV_Unarmed_RACS",	nil],
	[resistance,	"CUP_I_LAV25_HQ_RACS",	nil],
	[resistance,	"CUP_I_BRDM2_HQ_TK_Gue",	nil],
	[resistance,	"CUP_I_BMP_HQ_NAPA",	nil],
	[resistance,	"CUP_I_BRDM2_HQ_NAPA",	nil],
	[resistance,	"CUP_I_BMP_HQ_UN",	nil],
	[resistance,	"CUP_I_BRDM2_HQ_UN",	nil],
	[resistance,	"CUP_I_M113A3_HQ_UN",	nil],
	[resistance,	"CUP_I_M113A3_HQ_AAF",	nil],

	[east,	"i44_truck_g_command_wh",		"i44_hq_g_unfolded"],
	[west,	"i44_truck_a_command_army",		"i44_hq_a_unfolded"]
];
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_str = configName (_cfgVeh >> ((_arr select _i select 1) call gosa_fnc_fixType));
	_arr select _i set [1, toLower (_arr select _i select 1)];
	_arr select _i set [2, toLower (_arr select _i select 2)];
	if (_str == "") then {
		if (_arr select _i select 1 in (gosa_types_mhq_virt select 1) or _str in (gosa_types_mhq_virt select 2)) then {
			_arr0 set [count _arr0, _arr select _i];
		};
	}else{
		_arr0 set [count _arr0, _arr select _i];
	};
};
_arr = (_arr0 call gosa_fnc_arr_sorting0);
gosa_types_mhq = _arr;
diag_log format ["Log: [cfg_mhq]: gosa_types_mhq %1", _arr];
publicVariable "gosa_types_mhq";


//--- Стороны у которых есть КШМ.
if (gosa_pvp) then {
	_arr1 = [east,west,resistance,civilian];
}else{
	_arr1 = gosa_friendlyside;
};
_arr0 = [];
{
	if (_x in (_arr select 0)) then {
		_arr0 set [count _arr0, _x];
	};
} forEach _arr1;
gosa_sides_mhq = _arr0;
diag_log format ["Log: [cfg_mhq]: gosa_sides_mhq %1", _arr0];
publicVariable "gosa_sides_mhq";
