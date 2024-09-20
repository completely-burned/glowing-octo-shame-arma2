private ["_areas","_str","_islands"];
_islands = [];

// Проверять от поздних к ранним лучше.
// этот метод позволяет использовать незавершенную разметку и улучшать её в дальнейшем.
for "_iZ" from 999 to -1 step -1 do {
	_areas = [];
	_islands set [count _islands, _areas];

	if (_iZ < 0) then {
		_str = "gosa_islandR";
		if !(isNil _str) then {
			_areas set [count _areas, call compile _str];
		};
	} else {
		_str = format["gosa_islandR%1", _iZ];
		if !(isNil _str) then {
			_areas set [count _areas, call compile _str];
		};
		_str = format["gosa_islandR_%1", _iZ];
		if !(isNil _str) then {
			_areas set [count _areas, call compile _str];
		};

		for "_i" from 0 to 999 do {
			_str = format["gosa_islandR%1_%2", _iZ, _i];
			if !(isNil _str) then {
				_areas set [count _areas, call compile _str];
			};
			_str = format["gosa_islandR_%1_%2", _iZ, _i];
			if !(isNil _str) then {
				_areas set [count _areas, call compile _str];
			};
		};
	};

	if (count _areas <= 0) then {
		_islands resize (count _islands -1);
	};
};

// Чтобы проверять от ранних к поздним нужно завершить разметку островов на 100%,
// Этот метод обьявлен устаревшим, рекомендую использовать метод выше с буквой R (recursive).
for "_iZ" from -1 to 999 do {
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

		for "_i" from 0 to 999 do {
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
