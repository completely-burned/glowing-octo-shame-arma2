/*
 * Возвращает все осветительные пули и их актуальность.
 */
private ["_intensity_best","_cfgAmm","_entry","_arr","_return","_n",
	"_intensity_max"];

_return = [[],[]];
if (count _this > 0) then {
	_intensity_best = _this select 0;
};

_cfgAmm = LIB_cfgAmm;
for "_i" from 0 to (count _cfgAmm -1) do {
	_entry = _cfgAmm select _i;
	if (isClass _entry) then {
		if (getNumber (_entry >> "useFlare") > 0) then {
			// "F_40mm_White" >> "timeToLive" = 25;
			if (getNumber (_entry >> "timeToLive") <= 600) then {
				_arr = getArray (_entry >> "lightColor");
				if ({_x > 0} count _arr >= count _arr) then {
					if (isNil "_intensity_best") then {
						_n = 1;
					}else{
						_n = getNumber (_entry >> "intensity");
						if (_n > _intensity_best) then {
							if (isNil "_intensity_max") then {
								_intensity_max = _n;
							} else {
								_intensity_max = _intensity_max max _n;
							};
						};
					};
					_return select 0 set [count (_return select 1), configName _entry];
					_return select 1 set [count (_return select 1), _n];
				};
			};
		};
	};
};

if !(isNil "_intensity_max") then {
	_arr = _return select 1;
	if (_intensity_max > (_intensity_best*2)) then {
		// FIXME: Не должно быть линейным, значение _intensity_max может оказаться неадекватно большим.
		_n = (_intensity_best*2/(_intensity_max+1));
		for "_i" from 0 to (count _arr -1) do {
			if (_arr select _i > _intensity_best) then {
				_arr set [_i,
					_intensity_best - (((_arr select _i)*_n) - _intensity_best)
				];
			};
		};
	} else {
		for "_i" from 0 to (count _arr -1) do {
			if (_arr select _i > _intensity_best) then {
				_arr set [_i,
					_intensity_best - ((_arr select _i) - _intensity_best)
				];
			};
		};
	};
};

_return;
