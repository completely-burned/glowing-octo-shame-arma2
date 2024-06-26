#define __A2OA__

diag_log format ["Log: [fnc_getGroupType] %1", _this];

#ifdef __A2OA__
	#define ADD if (!(_z in _t) && {_x isKindOf _z}) then {_t set [count _t, _z]};
#else
	#define ADD if (!(_z in _t) && (_x isKindOf _z)) then {_t set [count _t, _z]};
#endif

private["_t","_z","_str"];

_t = [];

{
	if (typeName _x == typeName objNull) then {
		_str = typeOf _x;
	}else{
		_str = _x;
	};

	scopeName "scope1";


	_z = "Man";
	ADD

	_z = "Plane";
	ADD

	_z = "Air";
	ADD

	_z = "Ship";
	ADD

	_z = "LandLehicle";
	ADD

	_z = "StaticWeapon";
	ADD

	_z = "Tank";
	ADD

	_z = "Tracked_APC";
	ADD

	_z = "Wheeled_APC";
	ADD

	_z = "Car";
	ADD

	_z = "Helicopter";
	ADD

	_z = "UAV";
	if !(_z in _t) then {
		if(_x isKindOf _z) then {
			_t set [count _t, _z];
		}else{
			if(getNumber (LIB_cfgVeh >> _str >> "isUav") == 1)then{
				_t set [count _t, _z];
			};
		};
	};

	_z = "Frigate";
	if !(_z in _t) then {
		if(_x isKindOf "CUP_B_Frigate_ANZAC") then {
			_t set [count _t, _z];
		};
	};

	_z = "SUPPORT";
	if (!(_z in _t) && !("Frigate" in _t)) then {
		if(getNumber(LIB_cfgVeh >> _str >> "attendant") > 0 && _x isKindOf "LandVehicle")then{
			_t set [count _t, _z];
			breakOut "scope1";
		};
		if(getNumber(LIB_cfgVeh >> _str >> "transportfuel") > 0)then{
			_t set [count _t, _z];
			breakOut "scope1";
		};
		if(getNumber(LIB_cfgVeh >> _str >> "transportammo") > 0)then{
			_t set [count _t, _z];
			breakOut "scope1";
		};
		if(getNumber(LIB_cfgVeh >> _str >> "transportrepair") > 0)then{
			_t set [count _t, _z];
			breakOut "scope1";
		};
	};

	// TODO: нужно проверять по типу боеприпаса
	_z = "AA";
	if !(_z in _t) then {
		if(_x isKindOf "ZSU_Base") then {
			_t set [count _t, _z];
			breakOut "scope1";
		};
		if(_x isKindOf "2S6M_Tunguska") then {
			_t set [count _t, _z];
			breakOut "scope1";
		};
		if(_x isKindOf "HMMWV_Avenger") then {
			_t set [count _t, _z];
			breakOut "scope1";
		};
		if(_x isKindOf "M6_EP1") then {
			_t set [count _t, _z];
			breakOut "scope1";
		};
	};

	_z = "Artillery";
	if !(_z in _t) then {
		if(getNumber(LIB_cfgVeh >> _str >> "artilleryScanner") == 1)then{
			_t set [count _t, _z];
		};
	};

	#ifdef __ARMA3__
		_z = "MenDiver";
		if !(_z in _t) then {
			if (toLowerANSI getText(LIB_cfgVeh >> _str >> "vehicleClass") isEqualTo toLowerANSI _z) then {
				_t set [count _t, _z];
			};
		};
	#endif

} forEach _this;

diag_log format ["Log: [fnc_getGroupType] r %1", _t];
_t;
