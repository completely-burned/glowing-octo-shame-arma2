private ["_arr","_arr0","_arr1","_str","_cfgveh"];

_cfgveh = LIB_cfgVeh;

//--- 
_arr = [
	// [side, реальный тип, виртуальный тип].
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
	_str = configName (_cfgVeh >> (_arr select _i select 1));
	if (_str != "") then {
		_arr0 set [count _arr0, _arr select _i];
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

	[resistance,	"rhsgref_ins_g_gaz66_r142",	nil],
	[resistance,	"rhsgref_cdf_gaz66_r142",	nil],
	[resistance,	"rhsgref_BRDM2UM_ins_g",	nil],
	[resistance,	"rhsgref_BRDM2UM",	nil],
	[resistance,	"rhsgref_BRDM2_HQ_ins_g",	nil],
	[resistance,	"rhsgref_BRDM2_HQ",	nil],

	[east,	"i44_truck_g_command_wh",		"i44_hq_g_unfolded"],
	[west,	"i44_truck_a_command_army",		"i44_hq_a_unfolded"]
];
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_str = configName (_cfgVeh >> ((_arr select _i select 1) call gosa_fnc_fixType));
	if (_str != "") then {
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
