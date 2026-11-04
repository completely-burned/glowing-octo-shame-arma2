/*
 * FIXME: В функции проверяются реальные модели ТС, а не их типы из игры.
 * FIXME: т.е. проверка вроде getText(_cfgVeh >> _type >> "dlc") == "VN" не приемлема.
 */

#define __date_us_iraq_exit 2021
// VN FIXME: Вьетнамская война 1957-1976
#define __vn_start 1957
#define __vn_end 1979
#define __date_emr 2009
#define __importer 15
#ifdef __ARMA3__
	#define toLower toLowerANSI
	#define toUpper toUpperANSI
	#define == isEqualTo
#endif

private ["_type","_date","_cfgVeh","_faction","_n","_fnc_date_update","_type0"];

_type0 = _this select 0;
if (typeName _type0 == typeName objNull) then {
	_type0 = typeOf _type0;
};
_cfgVeh = LIB_cfgVeh;
//_cfgVeh = configFile >> "CfgVehicles";

_faction = toLower getText(_cfgVeh >> _type0 >> "faction");

_date = [nil, nil];

_fnc_date_update = {
	if !(isNil {_this select 0}) then {
		if (isNil {_date select 0}) then {
			_date set [0, _this select 0];
		}else{
			_date set [0, (_this select 0) max (_date select 0)];
		};
	};
	if !(isNil {_this select 1}) then {
		if (isNil {_date select 1}) then {
			_date set [1, _this select 1];
		}else{
			_date set [1, (_this select 1) min (_date select 1)];
		};
	};
};

//_n = if (getNumber(_cfgVeh >> _type >> "isMan") > 0) then {1} else {0};
_n = getNumber(_cfgVeh >> _type0 >> "isMan");

for "_i" from _n to 1 do {
	if (_i <= 0) then {
		_type = toLower getText(_cfgVeh >> _type0 >> "crew");
	}else{
		_type = _type0;
	};
	diag_log format ["Log: [fn_veh_getinfo] chk %1", _type];

switch (true) do {
	// t80, важен порядок cfgVehicles
	case (_type isKindOf "rhs_t80u45m"): {
		[2009,2020] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_t80um"): {
		[1992,2015] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_t80u"): {
		[1985,2015] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_t80ue1"): {
		[2005,2020] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_t80a"): {
		[1982,1984] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_t80bv"): {
		[1984,2015] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_t80"): {
		[1976,2005] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_t80b"): {
		[1978,2010] call _fnc_date_update;
	};
	// t72b3 g.2016
	case (_type isKindOf "rhs_t72be_tv"): {
		[2016,2030] call _fnc_date_update;
	};
	// t72b3 g.2012
	case (_type isKindOf "rhs_t72bd_tv"): {
		[2012,2025] call _fnc_date_update;
	};
	// t72b g.1989
	case (_type isKindOf "rhs_t72bc_tv"): {
		[1989,2020] call _fnc_date_update;
	};
	// t72b g.1985
	case (_type isKindOf "rhs_t72bb_tv"): {
		[1985,2015] call _fnc_date_update;
	};
	// t72b g.1984
	case (_type isKindOf "rhs_t72ba_tv"): {
		[1984,2015] call _fnc_date_update;
	};
	// t90sa g.2016
	case (_type isKindOf "rhs_t90sab_tv"): {
		[2016,2035] call _fnc_date_update;
	};
	// t90sa g.2004
	case (_type isKindOf "rhs_t90saa_tv"): {
		[2004,2025] call _fnc_date_update;
	};
	// t90a
	case (_type isKindOf "rhs_t90a_tv"): {
		[2006,2025] call _fnc_date_update;
	};
	// t90sm
	case (_type isKindOf "rhs_t90sm_tv"): {
		[2020,2050] call _fnc_date_update;
	};
	// t90am
	case (_type isKindOf "rhs_t90am_tv"): {
		[2020,2050] call _fnc_date_update;
	};
	// t90
	case (_type isKindOf "rhs_t90_tv"): {
		[1992,2010] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_t14_base"): {
		[2021,2050] call _fnc_date_update;
	};
	/*
	// SEPv2 2008
	// tusk ii 2008
	// tusk i 2006
	// sep 99
	// m1a1fep 99
	// m1a1aim 95
	// m1a1 85
	*/
	// SEPv2
	case (_type isKindOf "rhsusf_m1a2sep2_base"): {
		[2008,2050] call _fnc_date_update;
	};
	// m1a2sep1tuskii
	case (_type isKindOf "rhsusf_m1a2sep1tuskiiwd_usarmy"): {
		[2008,2030] call _fnc_date_update;
	};
	// m1a2sep1tuski
	case (_type isKindOf "rhsusf_m1a2sep1tuskid_usarmy"): {
		[2006,2025] call _fnc_date_update;
	};
	// m1a2 sep1
	case (_type isKindOf "rhsusf_m1a2tank_base"): {
		[1999,2020] call _fnc_date_update;
	};
	// aim tusk i
	case (_type isKindOf "rhsusf_m1a1aim_tuski_wd"): {
		[2006,2015] call _fnc_date_update;
	};
	// m1a1fep 99-25
	case (_type isKindOf "rhsusf_m1a1fep_d"): {
		[1999,2025] call _fnc_date_update;
	};
	// m1a1aim 95-10
	case ([[_type], ["rhsusf_m1a1aimd_usarmy","rhsusf_m1a1aimwd_usarmy"]] call gosa_fnc_CheckIsKindOfArray): {
		[1995,2010] call _fnc_date_update;
	};
	// m1a1 85-95

	case (_type isKindOf "rhs_bmp3tank_base"): {
		[1987,2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_bmp2_vdv"): {
		[1986,2030] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_bmp2e_vdv"): {
		[1980,2020] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_bmp1_vdv"): {
		[1966,1995] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_bmd4m_vdv"): {
		[2015,2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_bmd4_vdv"): {
		[2004,2015] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_bmd2"): {
		[1985,2020] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_bmd1"): {
		[1969,2000] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_M2A3_BUSKIII"): {
		[2015,2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_M2A3_BUSKI"): {
		[2006,2030] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_M2A3"): {
		[2000,2020] call _fnc_date_update;
	};
	// >1991 ods
	case (_type isKindOf "RHS_M2A2_BUSKI"): {
		[2006,2025] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_M2A2"): {
		[1991,2011] call _fnc_date_update;
	};
	// m113a3 >1987
	case (_type isKindOf "rhsusf_m113tank_base"): {
		[1987,__date_us_iraq_exit] call _fnc_date_update;
	};

	case (_type isKindOf "rhs_btr80a_msv"): {
		[1990,2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_btr80_msv"): {
		[1982,2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_btr70_vmf"): {
		[1972,1995] call _fnc_date_update;
	};
	// btr60pb
	case (_type isKindOf "rhs_btr60_vmf"): {
		[1964,1990] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_stryker_base"): {
		[2003,2020] call _fnc_date_update;
	};

	case (_type isKindOf "RHS_Ural_Base"): {
		[1973,2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_gaz66_vmf"): {
		[1964,2000] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_RG33L_base"): {
		[2007,2020] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_RG33_base"): {
		[2007,2020] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_M1083A1P2_fmtv_usarmy"): {
		[1996,2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_M1078A1P2_fmtv_usarmy"): {
		[1991,2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_fmtv_base"): {
		[1991,2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_HEMTT_A4_base"): {
		[2005,2050] call _fnc_date_update;
	};
	// m1025 > 1995
	case (_type isKindOf "rhsusf_m1025_w"): {
		[1985,__date_us_iraq_exit] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_m998_w_2dr"): {
		[1985,__date_us_iraq_exit] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_2s3tank_base"): {
		[1973,2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_2s1tank_base"): {
		[1970,2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_BM21_MSV_01"): {
		[1963,2050] call _fnc_date_update;
	};

	// GM 1990
	case (_type isKindOf "gm_dk_army_sf_base_90_m84"): {
		[1990,2000] call _fnc_date_update;
	};
	case (_type isKindOf "gm_dk_army_sf_base_90_win"): {
		[1990,2000] call _fnc_date_update;
	};
	case (_type isKindOf "gm_dk_army_rifleman_90_m84_base"): {
		[1990,2000] call _fnc_date_update;
	};
	case (_type isKindOf "gm_dk_army_rifleman_90_win_base"): {
		[1990,2000] call _fnc_date_update;
	};

	case (_type isKindOf "gm_ge_army_rifleman_90_base"): {
		[1990,2000] call _fnc_date_update;
	};
	case (_type isKindOf "gm_ge_army_rifleman_90_win_base"): {
		[1990,2000] call _fnc_date_update;
	};

	case (_type isKindOf "gm_man_base"): {
		[1980,1990] call _fnc_date_update;
	};

	case (_type isKindOf "gm_wheeled_base"): {
		[1980,2000] call _fnc_date_update;
	};
	case (_type isKindOf "gm_tracked_base"): {
		[1980,2000] call _fnc_date_update;
	};

	case (_type isKindOf "RHS_Mi24D_Base"): {
		[1973, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhsgref_mi24g_base"): {
		[1980, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_Mi24V_Base"): {
		[1976, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_Mi24P_VVS_Base"): {
		[1980, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_mi8mtv3_base"): {
		[1990, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_mi28_base"): {
		[1996, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_Ka52_base"): {
		[1997, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_Mi24_base"): {
		[1970, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_mi8amt_base"): {
		[1989, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_Mi8mt_vvs"): {
		[1977, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_Mi8_base"): {
		[1968, 2050] call _fnc_date_update;
	};

	case (_type isKindOf "RHS_AH1Z_base"): {
		[2003, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_CH53E_USMC"): {
		[1990, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_UH1Y_base"): {
		[2001, 2050] call _fnc_date_update;
	};

	case (_type isKindOf "RHS_L39_base"): {
		[1968, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_L159_base"): {
		[1997, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHSGREF_A29_Base"): {
		[1985, 2050] call _fnc_date_update;
	};

	// >1973
	case (toLower getText(_cfgVeh >> _type >> "vehicleClass") == "rhs_vehclass_infantry_flora"): {
		[1973, __date_emr] call _fnc_date_update;
	};
	// >2009
	case (toLower getText(_cfgVeh >> _type >> "vehicleClass") in ["rhs_vehclass_infantry_emr","rhs_vehclass_infantry_emr_des"]): {
		[__date_emr, 2050] call _fnc_date_update;
	};

	case (_type isKindOf "RHS_Su25SM_vvs"): {
		[2012, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_su25_base"): {
		[1981, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_mig29s_base"): {
		[1995, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhs_mig29_base"): {
		[1983, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "RHS_T50_base"): {
		[2011, 2050] call _fnc_date_update;
	};

	case (_type isKindOf "RHS_A10"): {
		[1977, 2050] call _fnc_date_update;
	};
	case (_type isKindOf "rhsusf_f22"): {
		[2001, 2050] call _fnc_date_update;
	};


	// Кхмеры 70,75
	// "vn_o_men_kr_75_base","vn_o_men_kr_70_base"
	case (_type isKindOf "vn_o_men_kr_75_base"): {
		[1975, __vn_end] call _fnc_date_update;
	};
	case (_type isKindOf "vn_o_men_kr_70_base"): {
		[1970, 1975] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_o_men_kr_70"]): {
		[1970, 1975] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_o_men_kr_75"]): {
		[1975, __vn_end] call _fnc_date_update;
	};

	// Проверки нужны тут, иначе уйдут в "vn_o_men_nva_base"
	// "vn_o_men_aircrew_base","vn_o_men_nva_base"
	case (_type isKindOf "vn_o_men_aircrew_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};

	// Вьетконг, оружие старое
	case (_type isKindOf "vn_o_men_vc_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};
	// Лао, оружие старое
	case (_type isKindOf "vn_o_men_pl_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};

	// ВНА 65,68
	// "vn_o_men_aircrew_base","vn_o_men_nva_base"
	case (_type isKindOf "vn_o_men_aircrew_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};
	// "vn_o_men_nva_marine_base","vn_o_men_nva_navy_base","vn_o_men_nva_base"
	case (_type isKindOf "vn_o_men_nva_navy_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};
	// "vn_o_men_nva_dc_base","vn_o_men_nva_base"
	case (_type isKindOf "vn_o_men_nva_dc_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};
	case (_type isKindOf "vn_o_men_nva_65_base"): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_o_men_nva_65","vn_o_armor_nva_65","vn_o_static_artillery_nva_65","vn_o_apc_nva_65","vn_o_cars_nva_65","vn_o_men_nva_65_d","vn_o_static_aa_nva_65","vn_o_static_weapons_nva_65"]): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (_type isKindOf "vn_o_men_nva_base"): {
		[1968, __vn_end] call _fnc_date_update;
	};


	// fank 70,71
	// "vn_i_men_fank_70_base","vn_i_men_fank_71_base","vn_i_men_army_base"
	case (_type isKindOf "vn_i_men_fank_70_base"): {
		[1970, 1971] call _fnc_date_update;
	};
	case (_type isKindOf "vn_i_men_fank_71_base"): {
		[1971, __vn_end] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_i_men_fank_70"]): {
		[1970, 1971] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_i_men_fank_71"]): {
		[1971, __vn_end] call _fnc_date_update;
	};

	// "vn_i_men_aircrew_base"
	case (_type isKindOf "vn_i_men_aircrew_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};

	// Лаос, FIXME: старое оружие?
	// "vn_i_men_rla_base","vn_i_men_army_base"
	case (_type isKindOf "vn_i_men_rla_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};

	// APB, оружие как у MACV army
	// "vn_i_men_sf_base","vn_i_men_ranger_base","vn_i_men_army_base"
	case (_type isKindOf "vn_i_men_army_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};


	// "vn_b_men_aircrew_base"
	case (_type isKindOf "vn_b_men_aircrew_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};

	// Республика Корея 65,68
	// "vn_b_men_rok_army_65_base","vn_b_men_rok_army_68_base","vn_b_men_army_base","vn_b_men_sog_base"
	case (_type isKindOf "vn_b_men_rok_army_65_base"): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_rok_army_68_base"): {
		[1968, __vn_end] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_rok_army_65"]): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_rok_army_68"]): {
		[1968, __vn_end] call _fnc_date_update;
	};

	// Новая Зеландия 66,68,70
	// "vn_b_men_nz_sas_70_base","vn_b_men_nz_sas_66_base","vn_b_men_aus_sas_66_base","vn_b_men_sog_base"
	case (_type isKindOf "vn_b_men_nz_sas_70_base"): {
		[1970, __vn_end] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_nz_sas_66_base"): {
		[__vn_start, 1970] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_nz_sas_66"]): {
		[__vn_start, 1970] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_nz_sas_70"]): {
		[1970, __vn_end] call _fnc_date_update;
	};
	// "vn_b_men_nz_army_70_base","vn_b_men_nz_army_66_base","vn_b_men_aus_army_66_base","vn_b_men_sog_base"
	case (_type isKindOf "vn_b_men_nz_army_70_base"): {
		[1970, __vn_end] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_nz_army_68_base"): {
		[1968, 1970] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_nz_army_66_base"): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_nz_army_66"]): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_nz_army_68"]): {
		[1968, 1970] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_nz_army_70"]): {
		[1970, __vn_end] call _fnc_date_update;
	};

	// Австралия 66,68,70
	//"vn_b_men_aus_army_68_base","vn_b_men_aus_army_66_base","vn_b_men_sog_base"
	//"vn_b_men_aus_army_70_base","vn_b_men_aus_army_66_base","vn_b_men_sog_base"
	case (_type isKindOf "vn_b_men_aus_army_68_base"): {
		[1968, 1970] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_aus_army_70_base"): {
		[1970, __vn_end] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_aus_army_66_base"): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_aus_army_66"]): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_aus_army_68"]): {
		[1968, 1970] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_aus_army_70"]): {
		[1970, __vn_end] call _fnc_date_update;
	};
	// "vn_b_men_aus_sas_70_base","vn_b_men_aus_sas_66_base","vn_b_men_sog_base"
	case (_type isKindOf "vn_b_men_aus_sas_70_base"): {
		[1970, __vn_end] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_aus_sas_66_base"): {
		[__vn_start, 1970] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_aus_sas_66"]): {
		[__vn_start, 1970] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_aus_sas_70"]): {
		[1970, __vn_end] call _fnc_date_update;
	};

	// MACV usmc 66,68,70
	case (_type isKindOf "vn_b_men_usmc_66_base"): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_usmc_68_base"): {
		[1968, 1970] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_usmc_70_base"): {
		[1970, __vn_end] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_usmc_66"]): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_usmc_68"]): {
		[1968, 1970] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_usmc_70"]): {
		[1970, __vn_end] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_usmc_recon_66_base"): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_usmc_recon_68_base"): {
		[1968, 1970] call _fnc_date_update;
	};
	case (_type isKindOf "vn_b_men_usmc_recon_70_base"): {
		[1970, __vn_end] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_usmc_recon_66"]): {
		[__vn_start, 1968] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_usmc_recon_68"]): {
		[1968, 1970] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["vn_b_men_usmc_recon_70"]): {
		[1970, __vn_end] call _fnc_date_update;
	};

	// FIXME: MACV army,sog,sf,diver 66?
	// "vn_b_men_army_base","vn_b_men_sog_base"
	// "vnx_b_men_usaf_thai_base","vnx_b_men_usaf_base","vn_b_men_sog_base"
	// "vn_b_men_navy_base","vn_b_men_army_base","vn_b_men_sog_base"
	// "vn_b_men_sf_base","vn_b_men_sog_base"
	// "vn_b_men_seal_base","vn_b_men_sog_base"
	// "vn_b_men_cidg_viet_base","vn_b_men_cidg_base","vn_b_men_sog_base"
	// "vn_b_men_lrrp_base","vn_b_men_sog_base"
	// "vn_b_men_sog_asian_base","vn_b_men_sog_viet_base","vn_b_men_sog_base"
	// "vn_b_men_seal_diver_base","vn_b_men_seal_base","vn_b_men_sog_base"
	case (_type isKindOf "vn_b_men_sog_base"): {
		[__vn_start, __vn_end] call _fnc_date_update;
	};


	/*
		UCP 2004-2019
		FROG-MARPAT 2005-2014
		OEF-CP 2010-2019
		OCP 2015-2019

		usarmy wd
		vehicleClass = "rhs_vehclass_infantry_ucp";
		vehicleClass = "rhs_vehclass_infantry_ucp_arb";
		usarmy d
		vehicleClass = "rhs_vehclass_infantry_ocp";
		usmc wd
		uniformClass = "rhs_uniform_FROG01_wd";
		usmc d
		uniformClass = "rhs_uniform_FROG01_d";
	*/
	case (toLower getText(_cfgVeh >> _type >> "vehicleClass") in ["rhs_vehclass_infantry_ocp","rhs_vehclass_infantry_ocp_arb"]): {
		[2015, 2050] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "vehicleClass") in ["rhs_vehclass_infantry_ucp","rhs_vehclass_infantry_ucp_arb"]): {
		[2004, __date_us_iraq_exit] call _fnc_date_update;
	};
	// FROG-MARPAT 2005-2014
	case (toLower getText(_cfgVeh >> _type >> "uniformClass") in ["rhs_uniform_frog01_wd","rhs_uniform_frog01_d"]): {
		[2005, 2014] call _fnc_date_update;
	};

	default {
	};
};
};

// Для совместимости.
if ({isNil {_x}} count _date > 0) then {
	diag_log format ["Log: [fn_veh_getinfo] _date == %1, resize 0", _date];
	_date resize 0;
};

if (count _date >= 2) then {
	// Страны-импортеры имеют более длительный срок эксплуатации.
	if !(_faction in ["blu_f","opf_f","ind_f","blu_t_f","blu_ctrg_f",
		"opf_t_f","opf_v_f","ind_e_f","blu_w_f","opf_r_f",

		"b_macv","b_cia","b_medt",
		// FIXME: Австралия и Новая Зеландия вооружение сразу обновляют?
		"b_aus","b_nz",

		"rhs_faction_msv","rhs_faction_vdv","rhs_faction_vdv_45",
		"rhs_faction_vmf","rhs_faction_vv","rhs_faction_tv","rhs_faction_vpvo",
		"rhs_faction_vvs","rhs_faction_vvs_c","rhs_faction_rva",
		"rhs_faction_usarmy","rhs_faction_usmc","rhs_faction_usarmy_wd",
		"rhs_faction_usarmy_d","rhs_faction_usmc_wd","rhs_faction_usmc_d",
		"rhs_faction_usaf","rhs_faction_usn","rhs_faction_socom"] or
		// В CDLC VN даты точные
		toUpper getText(_cfgVeh >> _type >> "dlc") == "VN") then
	{
		_date set [1, (_date select 1) + __importer];
	};
};

diag_log format ["Log: [fn_veh_getinfo] %1, _r %2", _this, [_date]];

[_date];
