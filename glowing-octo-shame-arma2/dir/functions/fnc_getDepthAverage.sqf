#define __A2OA__
#ifdef __A2OA__
private ["_worldSize","_n","_min","_max"];
_worldSize = gosa_worldSize;
_n = 0;
_min = 0;
_max = 0;

for "_i" from 0 to 9999 do {
	_arr = ASLToATL [
		//random (_worldSize select 0),
		//random (_worldSize select 1),
		// x2
		((_worldSize select 0) * -2) + random ((_worldSize select 0)*4),
		((_worldSize select 1) * -2) + random ((_worldSize select 1)*4),
		0
	];
	_min = _min min (_arr select 2);
	_max = _max max (_arr select 2);
	_n = _n + (_arr select 2);
};

_n = (_n/10000);

diag_log format ["Log: [fnc_getDepthAverage] avg %1, min %2, max %3", _n, _min, _max];
[_n, _min, _max];
#else
	[50, 50, 50];
#endif
