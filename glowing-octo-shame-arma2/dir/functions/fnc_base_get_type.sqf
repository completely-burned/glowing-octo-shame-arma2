#ifdef __ARMA3__
	#define toLower toLowerANSI
	#define == isEqualTo
#endif

private ["_logic","_n"];
_logic = _this select 0;
_n = _logic getVariable "gosa_Location_type";
scopeName "root";

if (isNil "_n") then {
	if (_logic isKindOf "LocationLogicAirport") then {
		_n = 1;
		breakTo "root";
	};
	if (toLower typeOf _logic == toLower "LocationBase_F") then {
		_n = 0;
		breakTo "root";
	};

	if (count _this > 1) then {
		_n = _this select 1;
	}else{
		_n = -1;
	};
};
diag_log format ["Log: [fnc_base_get_type] %1, %2", _logic, _n];
_n;
