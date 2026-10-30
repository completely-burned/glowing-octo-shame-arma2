#define __date_us_iraq_exit 2021

private ["_type","_date"];
_type = _this select 0;
if (typeName _type == typeName objNull) then {
	_type = typeOf _type;
};

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
	case ([[_type], ["rhsgref_hidf_m113a3_m2","rhsgref_hidf_m113a3_mk19","rhsgref_hidf_m113a3_unarmed"]] call gosa_fnc_CheckIsKindOfArray): {
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
	case (_type isKindOf "RHS_Ural_Base"): {
		_date = [1973,2050];
	};
	case (_type isKindOf "rhs_gaz66_vmf"): {
		_date = [1964,2000];
	};
	case (_type isKindOf "rhsusf_m1025_w"): {
		_date = [1995,__date_us_iraq_exit];
	};
	case (_type isKindOf "rhsusf_m998_w_2dr"): {
		_date = [1985,__date_us_iraq_exit];
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

	default {
		_date = []
	};
};

[_date];
