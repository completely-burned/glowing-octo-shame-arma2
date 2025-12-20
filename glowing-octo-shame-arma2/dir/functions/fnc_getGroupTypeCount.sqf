#define __A2OA__
/*
 * TODO: Использовать switch.
 */

diag_log format ["Log: [fnc_getGroupTypeCount] %1", _this];

#define ADD _n = (_t find _z); if (_n >= 0) then {_c set [_n, (_c select _n) +1]}else{_t set [count _t, _z]; _c set [count _c, 1]};

private["_t","_z","_str","_cfgVeh","_entry","_return","_c","_n","_units",
	"_obj","_Loiter","_LCVP","_Police","_veh","_veh_str"];
_units = _this select 0;
_cfgVeh = LIB_cfgVeh;
_Loiter = gosa_vehiclesKindOf_Loiter;
_LCVP = gosa_vehiclesKindOf_LCVP;
_Police = gosa_vehiclesKindOf_Police;
_t = [];
_c = [];
_return = [_t, _c];

for "_i" from 0 to (count _units -1) do {
	_obj = _units select _i;
	if (typeName _obj == typeName objNull) then {
		_veh = vehicle _obj;
		_veh_str = typeOf _veh;
		_str = typeOf _obj;
	}else{
		_str = _obj;
		_veh_str = _str;
	};
	_entry = _cfgVeh >> _veh_str;

	scopeName "scope1";


	_z = "Man";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "Plane";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "Air";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "Ship";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "LandLehicle";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "StaticWeapon";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "Tank";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "Tracked_APC";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "Wheeled_APC";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "Car";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "Helicopter";
	if(_veh_str isKindOf _z) then {
		ADD
	};

	_z = "UAV";
	if(_veh_str isKindOf _z) then {
		ADD
	}else{
		if (getNumber (_entry >> "isUav") > 0) then {
			ADD
		};
	};

	_z = "Frigate";
	if (true) then {
		if (_veh_str isKindOf "CUP_ZUBR_Base") then {
			ADD
			breakOut "scope1";
		};
		if (_veh_str isKindOf "CUP_Frigate_Base") then {
			ADD
			breakOut "scope1";
		};
	};

	_z = "SUPPORT";
	if !("Frigate" in _t) then {
		if (getNumber(_entry >> "attendant") > 0 && _veh_str isKindOf "LandVehicle") then {
			ADD
			breakOut "scope1";
		};
		if (getNumber(_entry >> "transportfuel") > 0) then {
			ADD
			breakOut "scope1";
		};
		// "CUP_B_LAV25_USMC" >> "transportAmmo" == 100
		if (getNumber(_entry >> "transportAmmo") > 100) then {
			ADD
			breakOut "scope1";
		};
		if (getNumber(_entry >> "transportrepair") > 0) then {
			ADD
			breakOut "scope1";
		};
	};

	// TODO: нужно проверять по типу боеприпаса
	_z = "AA";
	if (true) then {
		#ifdef __ARMA3__
			if (toLowerANSI getText(_entry >> "editorSubcategory") isEqualTo
				toLowerANSI getText(configfile >> "CfgVehicles" >> "B_APC_Tracked_01_AA_F" >> "editorSubcategory")) then
			{
				ADD
				breakOut "scope1";
			};
		#endif

		if(_veh_str isKindOf "ZSU_Base") then {
			ADD
			breakOut "scope1";
		};
		if(_veh_str isKindOf "2S6M_Tunguska") then {
			ADD
			breakOut "scope1";
		};
		if(_veh_str isKindOf "HMMWV_Avenger") then {
			ADD
			breakOut "scope1";
		};
		if(_veh_str isKindOf "M6_EP1") then {
			ADD
			breakOut "scope1";
		};
	};

	_z = "Artillery";
	if (getNumber(_entry >> "artilleryScanner") > 0) then {
		ADD
	};

	_z = "Loiter";
	for "_i0" from 0 to (count _Loiter -1) do {
		if (_veh_str isKindOf (_Loiter select _i0)) then {
			ADD
			breakOut "scope1";
		};
	};
	_z = "LCVP";
	for "_i0" from 0 to (count _LCVP -1) do {
		if (_veh_str isKindOf (_LCVP select _i0)) then {
			ADD
			breakOut "scope1";
		};
	};
	_z = "Police";
	for "_i0" from 0 to (count _Police -1) do {
		if (_veh_str isKindOf (_Police select _i0)) then {
			ADD
			breakOut "scope1";
		}else{
			if (_veh_str isKindOf getText(_cfgVeh >> (_Police select _i0) >> "crew")) then {
				ADD
				breakOut "scope1";
			};
		};
	};

	

	#ifdef __ARMA3__
		_z = "MenDiver";
		if (toLowerANSI getText(_entry >> "vehicleClass") isEqualTo toLowerANSI _z) then {
			ADD
		};
	#endif

};

diag_log format ["Log: [fnc_getGroupTypeCount] r %1", _return];
_return;
