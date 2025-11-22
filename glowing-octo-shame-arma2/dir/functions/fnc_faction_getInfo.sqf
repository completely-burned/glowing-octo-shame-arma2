/*
_cfg = (configfile >> "CfgFactionClasses");
_arr = [];
for "_i" from 0 to (count _cfg -1) do {
    if (isClass (_cfg select _i)) then {
        _arr pushBack configName (_cfg select _i)
    };
};
_arr;
*/


private ["_f","_date"];
_f = _this select 0;
if (typeName _f == typeName objNull) then {
	_f = toLower faction _f;
}else{
	_f = toLower getText (LIB_cfgVeh >> _f >> "faction");
};

switch (true) do {
	// WW2 1944
	case (_f in ["spe_wehrmacht","spe_sturm","spe_milice",
		"spe_us_army","spe_fr_army","spe_ffi","spe_civ","spex_cw_army",
		"spex_cw_army_trop","spex_pl_army","spex_ger_dak","spe_effects",
		"spe_ordnance","spe_paradrop","spe_ambientwarsounds_category",
		"spe_supports","spe_modules"]): {
			_date = [1930,1957];
	};
	// VN 1968
	case (_f in ["vn_vietnammodules","vn_vietnamcinematics","b_macv",
		"b_aus","b_nz","b_rok","o_pavn","o_vc","o_pl","o_cam","i_arvn",
		"i_lao","i_cam","c_viet","b_cia","b_medt"]): {
			_date = [1957,1976];
	};
	// GM 1983 
	case (_f in [
		"gm_fc_bu","gm_fc_bu_bgs","gm_fc_bu_civ","gm_fc_cs","gm_fc_cs_bgs",
		"gm_fc_cs_civ","gm_fc_gc","gm_fc_gc_bgs","gm_fc_gc_civ","gm_fc_hu",
		"gm_fc_hu_bgs","gm_fc_hu_civ","gm_fc_pl","gm_fc_pl_bgs","gm_fc_pl_civ",
		"gm_fc_ro","gm_fc_ro_bgs","gm_fc_ro_civ","gm_fc_ur","gm_fc_ur_bgs",
		"gm_fc_ur_civ","gm_fc_be","gm_fc_be_bgs","gm_fc_be_civ","gm_fc_ca",
		"gm_fc_ca_bgs","gm_fc_ca_civ","gm_fc_dk","gm_fc_dk_bgs","gm_fc_dk_civ",
		"gm_fc_fr","gm_fc_fr_bgs","gm_fc_fr_civ","gm_fc_ic","gm_fc_ic_bgs",
		"gm_fc_ic_civ","gm_fc_it","gm_fc_it_bgs","gm_fc_it_civ","gm_fc_lu",
		"gm_fc_lu_bgs","gm_fc_lu_civ","gm_fc_nl","gm_fc_nl_bgs","gm_fc_nl_civ",
		"gm_fc_no","gm_fc_no_bgs","gm_fc_no_civ","gm_fc_po","gm_fc_po_bgs",
		"gm_fc_po_civ","gm_fc_uk","gm_fc_uk_bgs","gm_fc_uk_civ","gm_fc_us",
		"gm_fc_us_bgs","gm_fc_us_civ","gm_fc_gr","gm_fc_gr_bgs","gm_fc_gr_civ",
		"gm_fc_tu","gm_fc_tu_bgs","gm_fc_tu_civ","gm_fc_ge","gm_fc_ge_bgs",
		"gm_fc_ge_civ","gm_fc_sp","gm_fc_sp_bgs","gm_fc_sp_civ","gm_fc_au",
		"gm_fc_au_bgs","gm_fc_au_civ","gm_fc_sz","gm_fc_sz_bgs","gm_fc_sz_civ",
		"gm_fc_fi","gm_fc_fi_bgs","gm_fc_fi_civ","gm_fc_sw","gm_fc_sw_bgs",
		"gm_fc_sw_civ","gm_fc_xx"]): {
			_date = [1980,2000];
	};
	// CSLA 1986
	case (_f in ["csla","csla_des","us85","us85_des","afmc","fia_civ",
		"fia_des","csla_civ"]): {
			_date = [1980,1990];
	};
	// RHS >VN >WW2
	case (_f in ["rhs_faction_msv","rhs_faction_vdv","rhs_faction_vdv_45",
		"rhs_faction_vmf","rhs_faction_vv","rhs_faction_tv","rhs_faction_vpvo",
		"rhs_faction_vvs","rhs_faction_vvs_c","rhs_faction_rva",
		"rhs_faction_usarmy","rhs_faction_usmc","rhs_faction_usarmy_wd",
		"rhs_faction_usarmy_d","rhs_faction_usmc_wd","rhs_faction_usmc_d",
		"rhs_faction_usaf","rhs_faction_usn","rhs_faction_socom",
		"rhs_faction_insurgents","rhsgref_faction_cdf_ground",
		"rhsgref_faction_cdf_ground_b","rhsgref_faction_cdf_air",
		"rhsgref_faction_cdf_air_b","rhsgref_faction_cdf_ng",
		"rhsgref_faction_cdf_ng_b","rhsgref_faction_un",
		"rhsgref_faction_nationalist","rhsgref_faction_chdkz",
		"rhsgref_faction_chdkz_g","rhsgref_faction_hidf","rhsgref_faction_tla",
		"rhsgref_faction_tla_g","rhssaf_faction_army",
		"rhssaf_faction_army_opfor","rhssaf_faction_airforce",
		"rhssaf_faction_airforce_opfor","rhssaf_faction_un"]): {
			_date = [1970,2020];
	};
	// A2 2008
	// A2OA 2012
	// A3 2035
	// SW
	case (_f in ["ls_gar","ls_jedi","ls_csf","ls_orsf",
		"ls_cis","ls_mandalorians","ls_civilians","ls_osrf","ls_pirates",
		"ls_mercenaries","ls_memefor","ls_jabiim","ls_imperial","ls_rebel",
		"ls_newrepublic","ls_gar_legions","lsb_modules","ls_modules",
		"lsi_impa","lsi_strmc","lsi_impn","lsi_ran","lsi_agf"]): {
			_date = [2900,9999];
	};
	default {_date = []};
};
diag_log format ["Log: [fnc_faction_getInfo] %1, %2, %3", _f, _this, _date];

[_date];
