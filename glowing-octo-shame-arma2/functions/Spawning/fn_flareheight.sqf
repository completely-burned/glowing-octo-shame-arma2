private ["_n"];
_n = getNumber(LIB_cfgAmm >> _this >> "timeToLive");
// Без учета сопротивления воздуха.
0.5 * 9.81 * _n * _n;
