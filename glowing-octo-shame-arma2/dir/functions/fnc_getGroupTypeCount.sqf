#define __A2OA__
/*
 * TODO: Использовать switch.
 */

diag_log format ["Log: [fnc_getGroupTypeCount] %1", _this];

#define ADD _n = (_t find _z); if (_n >= 0) then {_c set [_n, (_c select _n) +1]}else{_t set [count _t, _z]; _c set [count _c, 1]};

private["_t","_z","_str","_cfgVeh","_entry","_return","_c","_n","_units",
	"_obj","_Loiter"];
_units = _this select 0;
_cfgVeh = LIB_cfgVeh;
_Loiter = gosa_vehiclesKindOf_Loiter;
_t = [];
_c = [];
_return = [_t, _c];

for "_i" from 0 to (count _units -1) do {
	_obj = _units select _i;
	if (typeName _obj == typeName objNull) then {
		_str = typeOf _obj;
	}else{
		_str = _obj;
	};
	_entry = _cfgVeh >> _str;

	scopeName "scope1";


	_z = "Man";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "Plane";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "Air";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "Ship";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "LandLehicle";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "StaticWeapon";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "Tank";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "Tracked_APC";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "Wheeled_APC";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "Car";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "Helicopter";
	if(_obj isKindOf _z) then {
		ADD
	};

	_z = "UAV";
	if(_obj isKindOf _z) then {
		ADD
	}else{
		if (getNumber (_entry >> "isUav") > 0) then {
			ADD
		};
	};

	_z = "Frigate";
	if (true) then {
		if (_obj isKindOf "CUP_ZUBR_Base") then {
			ADD
			breakOut "scope1";
		};
		if (_obj isKindOf "CUP_Frigate_Base") then {
			ADD
			breakOut "scope1";
		};
	};

	_z = "SUPPORT";
	if !("Frigate" in _t) then {
		if (getNumber(_entry >> "attendant") > 0 && _obj isKindOf "LandVehicle") then {
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

		if(_obj isKindOf "ZSU_Base") then {
			ADD
			breakOut "scope1";
		};
		if(_obj isKindOf "2S6M_Tunguska") then {
			ADD
			breakOut "scope1";
		};
		if(_obj isKindOf "HMMWV_Avenger") then {
			ADD
			breakOut "scope1";
		};
		if(_obj isKindOf "M6_EP1") then {
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
		if (_obj isKindOf (_Loiter select _i0)) then {
			ADD
			breakOut "scope1";
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
