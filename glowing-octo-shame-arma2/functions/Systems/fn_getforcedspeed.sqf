#define __A2OA__

#ifdef __ARMA3__
	#undef __A2OA__
	#undef __ARMA2__
	[getForcedSpeed _this];
#endif

#ifdef __A2OA__
	#undef __ARMA2__
	_this getVariable ["gosa_forceSpeed_v2", [-1]];
#endif

#ifdef __ARMA2__
	private ["_arr"];
	_arr = _this getVariable "gosa_forceSpeed_v2";
	if (isNil "_n") then {[-1]} else {_arr};
#endif
