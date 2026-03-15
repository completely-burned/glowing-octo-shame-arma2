#define __A2OA__
#ifdef __A2OA__
	private ["_worldSize1","_n","_c","_arr"];

	// TODO: Учитывать _worldSize0
	//_worldSize0 = _this select 0;
	_worldSize1 = _this select 1;
	_n = 0;
	_c = 10000;
	for "_i" from 1 to _c do {
		_arr = ASLToATL [
			random (_worldSize1 select 0),
			random (_worldSize1 select 1),
			0
		];
		if (_arr select 2 > 3) then {
			_n = _n +1;
		};
	};
	_n = (_n/_c);

	diag_log format ["Log: [fn_getWaterAverage] avg %1", _n];
	[_n];
#else
	[0.5];
#endif
