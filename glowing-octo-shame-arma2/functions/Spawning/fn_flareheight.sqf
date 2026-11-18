private ["_h","_g","_k","_TTL"];
_g = 9.81;
_k = 0.2;
_TTL = getNumber(LIB_cfgAmm >> _this >> "timeToLive");

_h = sqrt(_g / _k) * _TTL;

_h;
