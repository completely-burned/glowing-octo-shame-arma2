private["_t","_z"];

_t = [];

{

	scopeName "scope1";


	_z = "Plane";
	if (!(_z in _t) && {_x isKindOf _z}) then {
		_t set [count _t, _z];
	};

	_z = "Air";
	if (!(_z in _t) && {_x isKindOf _z}) then {
		_t set [count _t, _z];
	};

	_z = "Ship";
	if (!(_z in _t) && {_x isKindOf _z}) then {
		_t set [count _t, _z];
	};

	_z = "StaticWeapon";
	if (!(_z in _t) && {_x isKindOf _z}) then {
		_t set [count _t, _z];
	};

	_z = "Tank";
	if (!(_z in _t) && {_x isKindOf _z}) then {
		_t set [count _t, _z];
	};

	_z = "Tracked_APC";
	if (!(_z in _t) && {_x isKindOf _z}) then {
		_t set [count _t, _z];
	};

	_z = "Wheeled_APC";
	if (!(_z in _t) && {_x isKindOf _z}) then {
		_t set [count _t, _z];
	};

	_z = "Car";
	if (!(_z in _t) && {_x isKindOf _z}) then {
		_t set [count _t, _z];
	};

	_z = "Helicopter";
	if (!(_z in _t) && {_x isKindOf _z}) then {
		_t set [count _t, _z];
	};

	_z = "UAV";
	if !(_z in _t) then {
		if(_x isKindOf _z) then {
			_t set [count _t, _z];
		}else{
			if(getNumber (LIB_cfgVeh >> typeOf _x >> "isUav") == 1)then{
				_t set [count _t, _z];
			};
		};
	};

	_z = "SUPPORT";
	if !(_z in _t) then {
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "attendant") == 1 && _x isKindOf "LandVehicle")then{
			_t set [count _t, _z];
			breakOut "scope1";
		};
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportfuel") == 1)then{
			_t set [count _t, _z];
			breakOut "scope1";
		};
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportammo") == 1)then{
			_t set [count _t, _z];
			breakOut "scope1";
		};
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportrepair") == 1)then{
			_t set [count _t, _z];
			breakOut "scope1";
		};
	};

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
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "artilleryScanner") == 1)then{
			_t set [count _t, _z];
		};
	};


} forEach _this;

_t;
