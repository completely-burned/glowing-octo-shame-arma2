#define __date_us_iraq_exit 2021
#define __date_emr 2009
#ifdef __ARMA3__
	#define toLower toLowerANSI
	#define == isEqualTo
#endif

private ["_type","_date","_cfgVeh"];
_type = _this select 0;
if (typeName _type == typeName objNull) then {
	_type = typeOf _type;
};
_cfgVeh = LIB_cfgVeh;

switch (true) do {
	// t80, важен порядок cfgVehicles
	case (_type isKindOf "rhs_t80u45m"): {
		_date = [2009,2020];
	};
	case (_type isKindOf "rhs_t80um"): {
		_date = [1992,2015];
	};
	case (_type isKindOf "rhs_t80u"): {
		_date = [1985,2015];
	};
	case (_type isKindOf "rhs_t80ue1"): {
		_date = [2005,2020];
	};
	case (_type isKindOf "rhs_t80a"): {
		_date = [1982,1984];
	};
	case (_type isKindOf "rhs_t80bv"): {
		_date = [1984,2015];
	};
	case (_type isKindOf "rhs_t80"): {
		_date = [1976,2005];
	};
	case (_type isKindOf "rhs_t80b"): {
		_date = [1978,2010];
	};
	// t72b3 g.2016
	case (_type isKindOf "rhs_t72be_tv"): {
		_date = [2016,2030];
	};
	// t72b3 g.2012
	case (_type isKindOf "rhs_t72bd_tv"): {
		_date = [2012,2025];
	};
	// t72b g.1989
	case (_type isKindOf "rhs_t72bc_tv"): {
		_date = [1989,2020];
	};
	// t72b g.1985
	case (_type isKindOf "rhs_t72bb_tv"): {
		_date = [1985,2015];
	};
	// t72b g.1984
	case (_type isKindOf "rhs_t72ba_tv"): {
		_date = [1984,2015];
	};
	// t90sa g.2016
	case (_type isKindOf "rhs_t90sab_tv"): {
		_date = [2016,2035];
	};
	// t90sa g.2004
	case (_type isKindOf "rhs_t90saa_tv"): {
		_date = [2004,2025];
	};
	// t90a
	case (_type isKindOf "rhs_t90a_tv"): {
		_date = [2006,2025];
	};
	// t90sm
	case (_type isKindOf "rhs_t90sm_tv"): {
		_date = [2020,2050];
	};
	// t90am
	case (_type isKindOf "rhs_t90am_tv"): {
		_date = [2020,2050];
	};
	// t90
	case (_type isKindOf "rhs_t90_tv"): {
		_date = [1992,2010];
	};
	case (_type isKindOf "rhs_t14_base"): {
		_date = [2021,2050];
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
		_date = [2008,2050];
	};
	// m1a2sep1tuskii
	case (_type isKindOf "rhsusf_m1a2sep1tuskiiwd_usarmy"): {
		_date = [2008,2030];
	};
	// m1a2sep1tuski
	case (_type isKindOf "rhsusf_m1a2sep1tuskid_usarmy"): {
		_date = [2006,2025];
	};
	// m1a2 sep1
	case (_type isKindOf "rhsusf_m1a2tank_base"): {
		_date = [1999,2020];
	};
	// aim tusk i
	case (_type isKindOf "rhsusf_m1a1aim_tuski_wd"): {
		_date = [2006,2015];
	};
	// m1a1fep 99-25
	case (_type isKindOf "rhsusf_m1a1fep_d"): {
		_date = [1999,2025];
	};
	// m1a1aim 95-10
	case ([[_type], ["rhsusf_m1a1aimd_usarmy","rhsusf_m1a1aimwd_usarmy"]] call gosa_fnc_CheckIsKindOfArray): {
		_date = [1995,2010];
	};
	// m1a1 85-95

	case (_type isKindOf "rhs_bmp3tank_base"): {
		_date = [1987,2050];
	};
	case (_type isKindOf "rhs_bmp2_vdv"): {
		_date = [1986,2030];
	};
	case (_type isKindOf "rhs_bmp2e_vdv"): {
		_date = [1980,2020];
	};
	case (_type isKindOf "rhs_bmp1_vdv"): {
		_date = [1966,1995];
	};
	case (_type isKindOf "rhs_bmd4m_vdv"): {
		_date = [2015,2050];
	};
	case (_type isKindOf "rhs_bmd4_vdv"): {
		_date = [2004,2015];
	};
	case (_type isKindOf "rhs_bmd2"): {
		_date = [1985,2020];
	};
	case (_type isKindOf "rhs_bmd1"): {
		_date = [1969,2000];
	};
	case (_type isKindOf "RHS_M2A3_BUSKIII"): {
		_date = [2015,2050];
	};
	case (_type isKindOf "RHS_M2A3_BUSKI"): {
		_date = [2006,2030];
	};
	case (_type isKindOf "RHS_M2A3"): {
		_date = [2000,2020];
	};
	// >1991 ods
	case (_type isKindOf "RHS_M2A2_BUSKI"): {
		_date = [2006,2025];
	};
	case (_type isKindOf "RHS_M2A2"): {
		_date = [1991,2011];
	};
	// m113a3
	case (_type isKindOf "rhsusf_m113tank_base"): {
		_date = [1987,__date_us_iraq_exit];
	};

	case (_type isKindOf "rhs_btr80a_msv"): {
		_date = [1990,2050];
	};
	case (_type isKindOf "rhs_btr80_msv"): {
		_date = [1982,2050];
	};
	case (_type isKindOf "rhs_btr70_vmf"): {
		_date = [1972,1995];
	};
	// btr60pb
	case (_type isKindOf "rhs_btr60_vmf"): {
		_date = [1964,1990];
	};
	case (_type isKindOf "rhsusf_stryker_base"): {
		_date = [2003,2020];
	};

	case (_type isKindOf "RHS_Ural_Base"): {
		_date = [1973,2050];
	};
	case (_type isKindOf "rhs_gaz66_vmf"): {
		_date = [1964,2000];
	};
	case (_type isKindOf "rhsusf_RG33L_base"): {
		_date = [2007,2020];
	};
	case (_type isKindOf "rhsusf_RG33_base"): {
		_date = [2007,2020];
	};
	case (_type isKindOf "rhsusf_M1083A1P2_fmtv_usarmy"): {
		_date = [1996,2050];
	};
	case (_type isKindOf "rhsusf_M1078A1P2_fmtv_usarmy"): {
		_date = [1991,2050];
	};
	case (_type isKindOf "rhsusf_fmtv_base"): {
		_date = [1991,2050];
	};
	case (_type isKindOf "rhsusf_HEMTT_A4_base"): {
		_date = [2005,2050];
	};
	case (_type isKindOf "rhsusf_m1025_w"): {
		_date = [1995,__date_us_iraq_exit];
	};
	case (_type isKindOf "rhsusf_m998_w_2dr"): {
		_date = [1985,__date_us_iraq_exit];
	};
	case (_type isKindOf "rhs_2s3tank_base"): {
		_date = [1973,2050];
	};
	case (_type isKindOf "rhs_2s1tank_base"): {
		_date = [1970,2050];
	};
	case (_type isKindOf "RHS_BM21_MSV_01"): {
		_date = [1963,2050];
	};

	// GM 1990
	case (_type isKindOf "gm_dk_army_sf_base_90_m84"): {
		_date = [1990,2000];
	};
	case (_type isKindOf "gm_dk_army_sf_base_90_win"): {
		_date = [1990,2000];
	};
	case (_type isKindOf "gm_dk_army_rifleman_90_m84_base"): {
		_date = [1990,2000];
	};
	case (_type isKindOf "gm_dk_army_rifleman_90_win_base"): {
		_date = [1990,2000];
	};

	case (_type isKindOf "gm_ge_army_rifleman_90_base"): {
		_date = [1990,2000];
	};
	case (_type isKindOf "gm_ge_army_rifleman_90_win_base"): {
		_date = [1990,2000];
	};

	case (_type isKindOf "gm_man_base"): {
		_date = [1980,1990];
	};

	case (_type isKindOf "gm_wheeled_base"): {
		_date = [1980,2000];
	};
	case (_type isKindOf "gm_tracked_base"): {
		_date = [1980,2000];
	};

	// >1973
	case (toLower getText(_cfgVeh >> _type >> "vehicleClass") == "rhs_vehclass_infantry_flora"): {
		_date = [1970, __date_emr];
	};
	// >2009
	case (toLower getText(_cfgVeh >> _type >> "vehicleClass") == "rhs_vehclass_infantry_emr"): {
		_date = [__date_emr, 2050];
	};

	default {
		_date = []
	};
};

[_date];
