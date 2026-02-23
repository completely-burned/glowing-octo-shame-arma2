private ["_arr"];
#ifdef __ARMA3__
	#define toLower toLowerANSI
	_arr = date call BIS_fnc_sunriseSunsetTime;
	//[-1,0] - polar winter (i.e., no sunrise)
	if (_arr select 0 < 0) exitWith {true};
	//[0,-1] - polar summer (i.e., no sunset)
	if (_arr select 1 < 0) exitWith {false};
#else
	// FIXME: Для a2 нужно?
	if (toLower worldName in ["hyde_sark","mcn_neaville"]) exitWith {
		if (_this select 0 > 15.85 || _this select 0 < 7.5) then {true} else {false};
	};
	_arr = [5.5, 18.5];
#endif

if (_this select 0 < (_arr select 0) || _this select 0 > (_arr select 1)) then {true} else {false};
