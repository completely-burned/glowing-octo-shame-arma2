private ["_areas","_str","_islands"];
_islands = [];

for "_iZ" from -1 to 99 do {
	_areas = [];
	_islands set [count _islands, _areas];

	if (_iZ < 0) then {
		_str = "gosa_island";
		if !(isNil _str) then {
			_areas set [count _areas, call compile _str];
		};

	} else {
		_str = format["gosa_island%1", _iZ];
		if !(isNil _str) then {
			_areas set [count _areas, call compile _str];
		};
		_str = format["gosa_island_%1", _iZ];
		if !(isNil _str) then {
			_areas set [count _areas, call compile _str];
		};

		for "_i" from 0 to 99 do {
			_str = format["gosa_island%1_%2", _iZ, _i];
			if !(isNil _str) then {
				_areas set [count _areas, call compile _str];
			};
			_str = format["gosa_island_%1_%2", _iZ, _i];
			if !(isNil _str) then {
				_areas set [count _areas, call compile _str];
			};
		};
	};

	if (count _areas <= 0) then {
		_islands resize (count _islands -1);
	};
};

diag_log format ["Log: [fnc_zone_init] _islands %1", _islands];

[_islands];
