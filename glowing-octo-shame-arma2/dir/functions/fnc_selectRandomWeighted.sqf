private ["_array","_weights","_chunks","_total","_weight","_index","_s","_r"];

_array = _this select 0;
_weights = _this select 1;

_chunks = [];
_total = 0;

for "_i" from 0 to ((count _weights) - 1) do {

	// кусок должен быть целым числом
	// TODO: множитель нужно сделать динимическим, не работает с _weight меньше 0.0001
	_weight = (_weights select _i) * 10000; 

	_total = _total + _weight;
	_chunks set [count _chunks, _weight];

};

_index = floor random _total;
diag_log format ["Log: [fnc_selectRandomWeighted] total %1, index %2, count chunks %3", _total, _index, count _chunks];

/* допустим есть 4 элемента [0, 0.5, 0.5, 0]
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

	if (_chunks select _i != 0) then {
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
