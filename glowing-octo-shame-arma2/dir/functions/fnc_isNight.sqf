#ifdef __ARMA3__
	#define toLower toLowerANSI
#endif
if (toLower worldName in ["hyde_sark","mcn_neaville"]) exitWith {
	if (_this select 0 > 15.85 || _this select 0 < 7.5) then {true} else {false};
};

if (_this select 0 > 18.5 || _this select 0 < 5.5) then {true} else {false};
