/*скрипт считает примерное колличество фреймов cделанное за отведенное время
 * FIXME: не правильно работает в режиме ускоренного времени
 * За 1 минуту 60fps будет 3600 фреймов
 */

diag_log format ["Log: [while_fps.sqf] started %1", time];

private["_f","_a","_l","_d","_n","_s","_c","_t"];

// время жизни статистики
_t = gosa_server_diag_fps_interval;
// промежуток времени между сборами статистики
_s = 30;
_c = _t/_s; // TODO: нужна проверка на целое число

_f = 0;
_a = [];
_l = diag_frameno;
for "_i" from 1 to _c do {
	sleep _s;
	_d = diag_frameno - _l;
	_a set [count _a, _d];
	_f = _f + _d;
	_l = diag_frameno;
	gosa_framesAVG = _f/_c;
};



while{true}do{

	sleep _s;
	_n = diag_frameno;
	_d = _n - _l;
	_a set [count _a, _d];
	_l = _n;

	_f = _f - (_a select 0) + _d;
	gosa_framesAVG = _f;

	_a set [0, 0];
	_a = _a - [0];
	
	diag_log format ["Log: [while_fps.sqf] %1, %2", time, _f];

};
