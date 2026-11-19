private ["_cfg","_g","_k","_TTL"];
_cfg = LIB_cfgAmm >> _this;
_g = 9.81;
_TTL = getNumber(_cfg >> "timeToLive");
#ifdef __ARMA3__
	_k = abs getNumber(_cfg >> "flareAirFriction");
	//_trg = getNumber(_cfg >> "triggerTime") max 0;
	if (_k <= 0) exitWith { 0.5 * _g * _TTL * _TTL };
#else
	_k = 0.2;
#endif
sqrt(_g / _k) * _TTL;
