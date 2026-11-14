private ["_array","_weights","_chunks","_total","_weight","_index","_s","_r",
	"_m","_n","_m0"];

_array = _this select 0;
_weights = _this select 1;

_chunks = [];
_total = 0;

// Находим минимум в 0-1
for "_i" from 0 to (count _weights -1) do {
    _n = _weights select _i;
    if (_n < 1 && _n > 0) then {
		if (isNil "_m") then {
        	_m = _n;
		}else{
			if (_n < _m) then {
				_m = _n;
			};
		};
    };
};

if !(isNil "_m") then {
	// Считаем множитель через ceil. 
	// Если m = 0.2, то 1/0.2 = 5, ceil(5) = 5. Вес станет 1.0.
	// Если m = 0.23, то 1/0.23 ≈ 4.34, ceil(4.34) = 5. Вес станет 1.15 (≥ 1).
	_m = ceil(1 / _m);
	// Жёсткий потолок: множитель не будет больше этого числа.
	_m = _m min 1000000000;
};

for "_i" from 0 to (count _weights -1) do {
	_weight = _weights select _i;

	if (_weight < 0) then {
		_weight = 0;
	}else{
		if !(isNil "_m") then {
			if (_weight > 0) then {
				_weight = (_weight * _m) max 1;
			};
		};
	};

	_total = _total + _weight;
	#ifdef __ARMA3__
		_chunks pushBack _weight;
	#else
		_chunks set [count _chunks, _weight];
	#endif
};

_index = floor random _total;
diag_log format ["Log: [fnc_selectRandomWeighted] total %1, index %2, count chunks %3", _total, _index, count _chunks];

/*
 * допустим есть 4 элемента [0, 0.5, 0.5, 0]
 * в итоге должно быть 50% 2 или 3, но не 1 или 4
 * при _total 100 будет _index 0-99, floor целые цисла
 * _chunks будет [0,50,50,0]
 * при _index  0-49, донжно выбрать 2
 * при _index 50-99, донжно выбрать 3
 *
 *
 * допустим _index 0
 * 1 кусок, пропускается, 0
 * 2 кусок, _s 50, {_index < _s}, true, возвращаем 2
 *
 * допустим _index 49
 * 1 кусок, пропускается, 0
 * 2 кусок, _s 50, {_index < _s}, true, возвращаем 2
 *
 * допустим _index 50
 * 1 кусок, пропускается, 0
 * 2 кусок, _s 50,  {_index < _s}, false
 * 3 кусок, _s 100, {_index < _s}, true, возвращаем 3
 *
 * допустим _index 99
 * 1 кусок, пропускается, 0
 * 2 кусок, _s 50,  {_index < _s}, false
 * 3 кусок, _s 100, {_index < _s}, true, возвращаем 3
 */

scopename "scope1";
_s = 0;
for "_i" from 0 to ((count _chunks) - 1) do {

	if (_chunks select _i > 0) then {
		_s = _s + (_chunks select _i);
		if (_index < _s) then {
			diag_log format ["Log: [fnc_selectRandomWeighted] _index %2, _s %3, _i %1", _i, _index, _s];
			_r = _array select _i;
			breakTo "scope1";
		};
	};

};

if (isNil "_r") then {
	diag_log format ["Log: [fnc_selectRandomWeighted] _r isNil ", nil];
	nil;
}else{
	diag_log format ["Log: [fnc_selectRandomWeighted] _r %1", _r];
	_r;
};
