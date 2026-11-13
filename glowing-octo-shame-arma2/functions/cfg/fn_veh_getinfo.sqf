/*
 * FIXME: В функции проверяются реальные модели ТС, а не их типы из игры.
 * FIXME: т.е. проверка вроде getText(_cfgVeh >> _type >> "dlc") == "VN" не приемлема.
 * Дата завершения эксклюзивная, <, до.
 */

#define __date_us_iraq_exit 2021
// VN FIXME: Вьетнамская война 1957-1976
#define __vn_start 1957
#define __vn_end 1980
#define __date_ww2_end 1947
#define __date_emr 2009
#define __importer 15
#ifdef __ARMA3__
	#define toLower toLowerANSI
	#define toUpper toUpperANSI
	#define == isEqualTo
#endif

private ["_type","_date","_cfgVeh","_faction","_n","_fnc_date_update","_arr",
	"_type0","_str","_cfgWea"];

_type0 = _this select 0;
if (typeName _type0 == typeName objNull) then {
	_type0 = typeOf _type0;
};
_cfgVeh = LIB_cfgVeh;
_cfgWea = LIB_cfgWea;
//_cfgVeh = configFile >> "CfgVehicles";
//_cfgVeh = configFile >> "CfgWeapons";

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

	//--- Вермахт
	// PzKpfw III Ausf.J: 1941 (бронебойная модернизация к Барбароссе)
		// PzKpfw III Ausf.L/M/N: 1942
		if ([[_type], ["SPE_PzKpfwIII_L","SPE_PzKpfwIII_M","SPE_PzKpfwIII_N"]] call gosa_fnc_CheckIsKindOfArray) then {
			[1942, __date_ww2_end] call _fnc_date_update;
		};
		// SPE_PzKpfwIII_J
		case (_type isKindOf "SPE_PzKpfwIII_Base"): {
			[1941, __date_ww2_end] call _fnc_date_update;
		};
		// StuG III Ausf. G: 1942
		case (_type isKindOf "LIB_StuG_III_G_base"): {
			[1942, __date_ww2_end] call _fnc_date_update;
		};
	// PzKpfw IV Ausf.G: 1942 (Ausf.F - 1941, Ausf.H - 1943)
		case (_type isKindOf "SPE_PzKpfwIV_G_base"): {
			[1942, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "LIB_FlakPanzerIV_Wirbelwind"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "LIB_PzKpfwIV_H_base"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
	// Tiger (PzKpfw VI Ausf.H1): 1942
		case (_type isKindOf "SPE_PzKpfwVI_H1_base"): {
			[1942, __date_ww2_end] call _fnc_date_update;
		};
		// FIXME: Ausf.E.2 это поздняя версия?
		case (_type isKindOf "LIB_PzKpfwVI_E_1"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
		// FIXME: Ausf.E это переименованный Ausf.H1?
		case (_type isKindOf "LIB_PzKpfwVI_E_base"): {
			[1942, __date_ww2_end] call _fnc_date_update;
		};
		// Tiger2
		case (_type isKindOf "LIB_PzKpfwVI_B_base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
	// Panther (PzKpfw V Ausf.G): 1944 (Ausf.D - 1943)
		// "SPE_PzKpfwV_G","SPE_PzKpfwV_base"
		case (_type isKindOf "SPE_PzKpfwV_G"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "SPE_PzKpfwV_base"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
		// Ausf.A: 1943
		case (_type isKindOf "LIB_PzKpfwV_base"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
	// StuG III Ausf.G (ранняя): 1942
		// StuG III Ранняя G (угловатая маска, без фартуков): декабрь 1942
		// StuG III Поздняя G (угловатая маска + Schürzen): фартуки с осени 1943
		// StuG III SKB (литая маска Saukopfblende): с октября-ноября 1943
		// StuH 42: с октября 1942
		// "SPE_StuG_III_G_Early","SPE_StuG_III_G_Early_base","SPE_StuG_III_G_base","SPE_StuG_III_base","SPE_Tank_base"
		// "SPE_StuG_III_G_Late","SPE_StuG_III_G_Late_base","SPE_StuG_III_G_base","SPE_StuG_III_base","SPE_Tank_base"
		// "SPE_StuG_III_G_SKB","SPE_StuG_III_G_SKB_base","SPE_StuG_III_G_base","SPE_StuG_III_base","SPE_Tank_base"
		// "SPE_StuH_42","SPE_StuH_42_base","SPE_StuG_III_G_Early_base","SPE_StuG_III_G_base","SPE_StuG_III_base","SPE_Tank_base"
		case (_type isKindOf "SPE_StuH_42_base"): {
			[1942, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "SPE_StuG_III_G_Early"): {
			[1942, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "SPE_StuG_III_G_Late"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "SPE_StuG_III_G_SKB"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "SPE_StuG_III_base"): {
			[1942, __date_ww2_end] call _fnc_date_update;
		};
	// Nashorn (Sd.Kfz. 164): 1943
		case (_type isKindOf "LIB_SdKfz124_base"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
	// Jagdpanther (Sd.Kfz. 173): 1944
		// "SPE_Jagdpanther_G1","SPE_Jagdpanther_G1_base","SPE_Tank_base"
		case (_type isKindOf "SPE_Jagdpanther_G1_base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
	// Sd.Kfz. 250: 1941
		// Sd.Kfz. 251: Ausf.C - 1942, Ausf.D - 1943
		// "SPE_SdKfz250_base","SPE_WheeledTracked_APC_base","SPE_Truck_base"
		// "LIB_SdKfz_7_base","LIB_WheeledTracked_APC_base","LIB_Truck_base","Truck_F","Car_F","Car"
		case (_type isKindOf "SPE_SdKfz250_base"): {
			[1941, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "LIB_SdKfz_7_base"): {
			[1938, __date_ww2_end] call _fnc_date_update;
		};
	// Opel Blitz: 1937
		// "SPE_OpelBlitz_base","SPE_Truck_base"
		case (_type isKindOf "SPE_OpelBlitz_base"): {
			[1937, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "LIB_OpelBlitz_base"): {
			[1937, __date_ww2_end] call _fnc_date_update;
		};
	// Kubelwagen: 1940
	// Fw 190 F-8: 1944
		// "LIB_FW190F8","LIB_GER_Plane_base","LIB_Plane_base"
		case (_type isKindOf "SPE_FW190F8"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
		case (_type isKindOf "LIB_FW190F8"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
	// Junkers Ju 87: 1936
		// Ju 87 D-5: 1943
		case (_type isKindOf "LIB_Ju87"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};

	//--- Британцы/коммонвельт (SPEX)
	// Bedford MWD: 1939
	// Humber LRC: 1941, Humber Mk.II: 1942, Humber Mk.IV: 1943
	// Horsa Glider: 1942
	// Sherman II — британское имя M4A1 с литым корпусом, воевал от Туниса до Нормандии; с октября 1942
		// Sherman II Late — поздняя версия M4A1 у британцев: большие люки, улучшенная броня и укладка боекомплекта; массово в Нормандии с июня 1944, активно воевал в 1944–1945 (Италия, Франция, Германия); с 1944 и до конца войны
		case (_type isKindOf "SPEX_Sherman_II_Late_Base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
		// Sherman II Early — ранние литые машины с узкими люками, Тунис против Роммеля; примерно с 1942 по 1943
		if ([[_type], ["SPEX_CW_Trop_Sherman_II","SPEX_CW_Sherman_II_Early"]] call gosa_fnc_CheckIsKindOfArray) then {
			[1942, 1944] call _fnc_date_update;
		};
		// "SPEX_Sherman_II_Late_Base","SPEX_Sherman_II_Base","SPEX_Sherman_I_Base","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		case (_type isKindOf "SPEX_Sherman_II_Base"): {
			[1942, __date_ww2_end] call _fnc_date_update;
		};
	// Sherman V — британское имя M4A4 с пятиблочным мотором Chrysler A57 и удлинённым корпусом, любимец польской 1-й бронетанковой дивизии; с 1943 и до конца войны
		// Sherman V Early — ранние серии, Италия 1943; примерно с 1943 по 1944
		case (_type isKindOf "SPEX_Sherman_V_Early_Base"): {
			[1943, 1945] call _fnc_date_update;
		};
		// "SPEX_Sherman_V_Early_Base","SPEX_Sherman_V_Base","SPEX_Sherman_I_Base","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		case (_type isKindOf "SPEX_Sherman_V_Base"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
	// Sherman I — британское имя M4, массовый ленд-лиз, Эль-Аламейн в октябре 1942; примерно с 1942 по 1943, далее вытеснялся поздними типами
		// Sherman I Early — ранние серии с прямой прорезью водителя и составной башней, Северная Африка 1942–1943; примерно с 1942 по 1943
		case (_type isKindOf "SPEX_Sherman_I_Early_Base"): {
			[1942, 1944] call _fnc_date_update;
		};
		// Sherman I Hybrid — композитный корпус, узкое окно выпуска август 1943 – январь 1944; в боях с Нормандии 1944, встречался ограниченно
		case (_type isKindOf "SPEX_Sherman_I_Hybrid_Base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
		// "SPEX_Sherman_I_Early_Base","SPEX_Sherman_I_Base","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		// "SPEX_Sherman_I_Hybrid_Base","SPEX_Sherman_I_Base","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		case (_type isKindOf "SPEX_Sherman_I_Base"): {
			[1942, 1944] call _fnc_date_update;
		};
	// Sherman VC Firefly — Firefly на базе длинного M4A4, самый массовый вариант Firefly; с Нормандии июня 1944 и до конца войны
		// "SPEX_Sherman_Vc_Base","SPEX_Sherman_Ic_Base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		case (_type isKindOf "SPEX_Sherman_Vc_Base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
	// Sherman IC Firefly — 17-фунтовка в обычном M4, единственный западный танк, бивший Tiger лоб в лоб; немцы охотились за ним в первую очередь, на взвод один; с Нормандии июня 1944 и до конца войны
	// Sherman IC Hybrid Firefly — Firefly на композитном корпусе, редкая комбинация; с Нормандии 1944, встречался ограниченно
		// "SPEX_Sherman_Ic_Hybrid_Base","SPEX_Sherman_Ic_Base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		case (_type isKindOf "SPEX_Sherman_Ic_Base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
	// Cromwell Mk VI Type C — 95-мм гаубичная версия огневой поддержки, аналог M4(105); с Нормандии 1944 и до конца войны
		// "SPEX_Cromwell_Mk6_Base","SPEX_Cromwell_Base","SPE_Tank_base"
		case (_type isKindOf "SPEX_Cromwell_Mk6_Base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
	// Cromwell Mk V Type C — самый быстрый британский танк войны, около 64 км/ч, крещение 14 июня 1944 в Нормандии у 7-й бронетанковой «Desert Rats»; с 1944 и до конца войны
		case (_type isKindOf "SPEX_Cromwell_Base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
	// M10 «Ахиллес» — ленд-лизовский M10 с британской 17-фунтовкой, около 1100 переоборудованных машин; базовая версия с Италии 1943, Ахиллес — с 1944 и до конца войны

	//--- США
	// Willys MB: 1941
	// M3 Halftrack: 1941
		// "SPE_US_M16_Halftrack_base","SPE_Halftrack_base","SPE_WheeledTracked_APC_base","SPE_Truck_base","Truck_F","Car_F","Car","LandVehicle"
		case (_type isKindOf "SPE_Halftrack_base"): {
			[1941, __date_ww2_end] call _fnc_date_update;
		};
	// M4 базовый — стандартный сварной корпус, основной средний танк США 1942–1943; с конца 1942 по 1943
		// M4 Composite — литая передняя часть плюс сварная задняя, выпускался Детройтским арсеналом с августа 1943 по январь 1944; в боях с Нормандии 1944, редкая машина
		case (_type isKindOf "SPE_M4A0_composite"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
		// M4(105) — штурмовая гаубица огневой поддержки, аналог StuH 42; с Нормандии лета 1944 и до конца войны
		case (_type isKindOf "SPE_M4A0_105"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
		// M4 поздний — большие люки и усиленная защита, типичная машина Италии и Нормандии; с 1943
		case (_type isKindOf "SPE_M4A0_75"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
		// M4A0 75 Early — первый «Шерман», дебют у британцев под Эль-Аламейном в октябре 1942, у американцев — Тунис в декабре 1942; применялись примерно с 1942 по 1943
		case (_type isKindOf "SPE_M4A0_75_Early"): {
			[1942, 1944] call _fnc_date_update;
		};
		// "SPE_M4A0_composite","SPE_M4A0_75","SPE_M4A0_75_Early","SPE_M4A1_75","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		// "SPE_M4A0_105","SPE_M4A0_75","SPE_M4A0_75_Early","SPE_M4A1_75","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
	// M4A3(75)W — «мокрый» БК, основной танк пехотных дивизий в Арденнах; с лета 1944 и до конца войны
		// M4A3(76)W — лучший баланс пушки и защиты среди 75-76-мм Шерманов, Зигфридская линия и Рур; с осени 1944 и до конца войны
		// M4A3(105) — гаубичная версия на шасси M4A3, подавление укреплений; с Нормандии 1944 и до конца войны
		// M4A3 с T34 Calliope — та же установка на M4A3, Саар и Рур в 1945; реальные бои с декабря 1944
		// "SPE_M4A3_T34_Calliope","SPE_M4A3_Sherman_HullMG_base","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		case (_type isKindOf "SPE_M4A3_Sherman_HullMG_base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
	// M4A1 — литой корпус, «круглый Шерман», первый бой — операция «Torch» в ноябре 1942; с 1942 и до конца войны
		// M4A1 ранний — узкие люки и ранняя маска, машины Туниса 1943, немцы прозвали их «Tommy cooker»; примерно с 1942 по 1943
		case (_type isKindOf "SPE_M4A1_75_erla"): {
			[1942, 1944] call _fnc_date_update;
		};
		case (_type isKindOf "SPEX_M4A1_75_DV"): {
			[1942, 1944] call _fnc_date_update;
		};
		// M4A1 поздний — большие люки, те Шерманы, что высаживались в Нормандии в июне 1944; с 1944
		case (_type isKindOf "SPE_M4A1_75"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
		// M4A1(76)W — 76-мм пушка и «мокрый» боекомплект, ответ на Tiger и Panther; единичные бои летом 1944, массово с осени 1944 и до конца войны
		case (_type isKindOf "SPE_M4A1_76"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
		// M4A1 с T34 Calliope — РСЗО из 60 труб, прозванная в честь духового органа за звук залпа; реальные бои только с декабря 1944 (Арденны), всего около 100 машин
		case (_type isKindOf "SPE_M4A1_T34_Calliope"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};
		// "SPE_M4A1_75_erla","SPE_M4A1_75","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		// "SPE_M4A1_76","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		// "SPE_M4A1_T34_Calliope","SPE_M4A1_Sherman_HullMG_base","SPE_M4A1_Sherman_base","SPE_Sherman_base","SPE_Tank_base"
		case (_type isKindOf "SPE_M4A1_Sherman_base"): {
			[1942, __date_ww2_end] call _fnc_date_update;
		};

	// M10 — истребитель танков с открытой башней по доктрине tank destroyer, первый бой — Тунис в марте 1943; к 1945 вытеснен M36
		// "SPE_M10_base","SPE_Tank_base"
		case (_type isKindOf "SPE_M10_base"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
	// M18 Hellcat — самый быстрый истребитель войны, около 72 км/ч, дебют под Анцио в феврале 1944; с 1944 и до конца войны
		// "SPE_M18_Hellcat_Base","SPE_Tank_base"
		case (_type isKindOf "SPE_M18_Hellcat_Base"): {
			[1944, __date_ww2_end] call _fnc_date_update;
		};

	// M8 Greyhound — лёгкий разведывательный бронеавтомобиль Ford, 6×6, 37-мм пушка в башне, до 90 км/ч; создан в 1941–1942 по заказу противотанкового управления, серийно с марта 1943, всего 8523 машины; первые бои — Сицилия в июле 1943, далее высадка в Италии, Нормандия и Арденны; в конце войны зенитный пулемёт стал штатным не сразу — с апреля 1944 утвердили шкворневую установку; служил до конца войны, затем в Корее и по всему миру
		// "SPE_M8_LAC_base","SPE_ArmoredCar_base"
		case (_type isKindOf "SPE_M8_LAC_base"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
	// M20 Armored Utility Car — безбашенный вариант M8 под командира и корректировщика: открытый корпус, радиостанции, скамьи и зенитный M2 Browning на кольцевой турели; разрабатывался как разведчик M10, но переименован, чтобы не путать с истребителем танков M10; выпуск с июля 1943 по июнь 1945, 3791 машина, почти все на заводе в Чикаго; с 1943 до конца войны в Европе, также санитарные, грузовые и разведывательные роли; знаменитая личная машина Паттона с двойными клаксонами и сиреной — её было слышно за несколько километров
		// "SPE_M20_AUC_Base","SPE_ArmoredCar_base"
		case (_type isKindOf "SPE_M20_AUC_Base"): {
			[1943, __date_ww2_end] call _fnc_date_update;
		};
	// C-47 Skytrain: 1936
	// Waco CG-4 (гайдропланер): 1943
	case (_type isKindOf "SPE_P47"): {
		[1943, __date_ww2_end] call _fnc_date_update;
	};

	case (_type isKindOf "SPE_US_Soldier_base_late"): {
		[1944, __date_ww2_end] call _fnc_date_update;
	};
	case (toLower getText(_cfgVeh >> _type >> "editorSubcategory") in ["spe_edsubcat_us_late"]): {
		[1944, __date_ww2_end] call _fnc_date_update;
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
	#ifdef __ARMA3__
		_arr = getArray(_cfgVeh >> _type >> "weapons");
		for "_i" from 0 to (count _arr -1) do {
			_str = (_arr select _i);
			if (_str isKindOf ["LIB_Faustpatrone", _cfgWea]) exitwith {
				[1942,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_Faustpatrone", _cfgWea]) exitwith {
				[1942,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["LIB_PzFaust_60m", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_PzFaust_60m", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["LIB_PzFaust_30m", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_PzFaust_30m", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_RPzB_43", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_RPzB_54", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["LIB_RPzB", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_M9_Bazooka", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			// m1 42g, m1a1 43g
			if (_str isKindOf ["LIB_M1A1_Bazooka", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_M1A1_Bazooka", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["LIB_PIAT", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPEX_PIAT", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};

			// Нет смысла устанавливать начальные даты <=1942 года для обычного оружия из SPE.
			// "LIB_M44","LIB_M9130","LIB_RIFLE","Rifle_Base_F"
			// Мосина М44
			if (_str isKindOf ["LIB_M44", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			//if (_str isKindOf ["LIB_G3340", _cfgWea]) exitwith {
				//[1940,__date_ww2_end] call _fnc_date_update;
			//};
			// K98 44г, у всех по умолчанию.
			//if (_str isKindOf ["LIB_K98_Late", _cfgWea]) exitwith {
				//[1944,__date_ww2_end] call _fnc_date_update;
			//};
			//if (_str isKindOf ["SPE_K98_Late", _cfgWea]) exitwith {
				//[1944,__date_ww2_end] call _fnc_date_update;
			//};
			if (_str isKindOf ["LIB_FG42G", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_FG42_E", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			//if (_str isKindOf ["LIB_G41", _cfgWea]) exitwith {
				//[1942,__date_ww2_end] call _fnc_date_update;
			//};
			if (_str isKindOf ["LIB_G43", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_G43", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["LIB_MP44", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_STG44", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["LIB_MG42", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_MG42", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["LIB_M3_GreaseGun", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_M3_GreaseGun", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			// "LIB_M1928_Thompson","LIB_M1A1_Thompson","LIB_SMG","Rifle_Short_Base_F"
			//if (_str isKindOf ["SPE_M1A1_Thompson", _cfgWea]) exitwith {
				//[1942,__date_ww2_end] call _fnc_date_update;
			//};
			if (_str isKindOf ["SPE_Flamethrower_base", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["LIB_Sten_Mk5", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPEX_Sten_Mk5", _cfgWea]) exitwith {
				[1944,__date_ww2_end] call _fnc_date_update;
			};
			// Браунинг
			if (_str isKindOf ["LIB_M1919A6", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_M1919A6", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};
			//if (_str isKindOf ["SPE_M1919A4", _cfgWea]) exitwith {
				//[1940,__date_ww2_end] call _fnc_date_update;
			//};
			if (_str isKindOf ["LIB_DELISLE", _cfgWea]) exitwith {
				[1943,__date_ww2_end] call _fnc_date_update;
			};

			if (_str isKindOf ["LIB_LAUNCHER", _cfgWea]) exitwith {
				[1942,__date_ww2_end] call _fnc_date_update;
			};
			if (_str isKindOf ["SPE_LAUNCHER", _cfgWea]) exitwith {
				[1942,__date_ww2_end] call _fnc_date_update;
			};
		};
	#endif
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
