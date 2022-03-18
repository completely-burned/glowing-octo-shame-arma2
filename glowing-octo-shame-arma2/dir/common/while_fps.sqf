/*скрипт считает примерное колличество фреймов cделанное за отведенное время
 * FIXME: не правильно работает в режиме ускоренного времени
 * За 1 минуту 60fps будет 3600 фреймов
 */

diag_log format ["Log: [while_fps.sqf] started %1", time];

private["_f","_a","_l","_d","_n","_s","_c","_lt","_t1"];

sleep 15;

// время жизни статистики
_lt = gosa_server_diag_fps_interval;
// промежуток времени между сборами статистики
_s = 1;
// TODO: нужна проверка на целое число
_c = _lt/_s; 

_f = 0;
_a = [];
_l = diag_frameno;

// при высокой нагрузке проходит больше времени чем в sleep, в итоге колличество фреймов завышено
_t1 = time;

for "_i" from 1 to _c do {
	// FIXME: может лучше учитывать time? оба варианта неточны на самом деле
	sleep _s; 
	_n = diag_frameno;
	_d = _s/(time-_t1)*(_n - _l);
	_t1 = time;

	_a set [count _a, _d];
	_l = _n;

	_f = _f + _d;
	gosa_framesAVG = (_f/_i)*_c;

};



while{true}do{

	sleep _s;
	_n = diag_frameno;
	_d = _s/(time-_t1)*(_n - _l);
	_t1 = time;

	_a set [count _a, _d];
	_l = _n;

	_f = _f - (_a select 0) + _d;
	gosa_framesAVG = _f;

	_a set [0, 0];
	_a = _a - [0];
	
	diag_log format ["Log: [while_fps.sqf] time %1, %2 frames for %3", time, _f, _lt];

};
