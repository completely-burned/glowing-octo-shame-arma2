/*
	Среднее значение FPS.
	TODO: Нужна проверка.
*/

diag_log format ["Log: [gosa_FPS_init] started %1", time];

gosa_FPS_array = [[time, diag_frameno]];

gosa_FPS_add = {
	private["_a","_c","_l"];
	// Копия, чтобы `_a set [0,-1];` не влиял на глобальную переменную. TODO: Нужно оптимизировать.
	_a =+ gosa_FPS_array;
	_c = count _a;
	_l = _a select (_c -1);

	// Можно не добавлять если разница во времени очень мала.
	if ((_l select 0)+0.01 < (_this select 0)) then {
		diag_log format ["Log: [gosa_FPS_add] На добавление %1, всего %2", _this, _c];

		private["_s"];
		// `2^n` поск использует `/2`.
		_s = 2048;
		if (_c >= _s) then {
			_a set [0,-1];
			_a = _a -[-1];
			_c = _c -1;
		};

		//-- Добавляем в конец.
		_a set [_c, _this];
		gosa_FPS_array = _a;
	}else{
		diag_log format ["Log: [gosa_FPS_add] Не добавлен %1, разница во времени мала", _this];
	};
};

gosa_FPS_getAVG = {
	private["_r","_a","_c","_n","_chunk","_chunk_last","_time_admit","_time_lost"];

	//-- Время, которое Нужно учитывать.
	_time_admit = _this select 0;

	_a = gosa_FPS_array;
	_c = count _a;
	_n = _c -1;

	diag_log format ["Log: [gosa_FPS_getAVG] %1 %2", _this, _c];

	//-- Куски, первый и последний.
	_chunk = _a select 0;
	_chunk_last = _a select _n;

	//-- Время, которое Можно учитывать.
	_time_lost = ((_chunk_last select 0) - (_chunk select 0));

	// Ошибки данных.
	if (_time_admit >= _time_lost or _time_admit < 0 or _time_lost <= 0) then {
		diag_log format ["Log: [gosa_FPS_getAVG] Данные ошибочны или недостаточно статистики собранно, времени запрошенно %1, времени собранно %2", _time_admit, _time_lost];
		_r = [_time_lost, (_chunk_last select 1) - (_chunk select 1)];

	}else{
		private["_time_first"];
		//_n = round (_c - (_c*(_time_admit/_time_lost)));
			// Так с первой попытки нужный кусок найдется, нет.

		//-- Время, которое должно быть у начального куска.
			//-- Точное _time_first отсутствует в массиве _a обычно,
			//-- оно чуть меньше/больше начального куска.
		_time_first = ((_chunk_last select 0) - _time_admit);

		//-- Ищем начальный кусок.
			// Проблемы:
				// 1. Это проблема логики, ее можно игнорировать.
					// Последний четный кусок, может оказаться более точным,
					// но будет выбран нечетный передпоследний.
					// Цикл будет выполнятся до step 1.
				// 1.2. Это проблема логики, ее можно игнорировать.
					// При достижении step 2,
					// может быть выбран кусок который менене точнен чем рядом.
		while {isNil "_r"} do {
			_chunk = _a select round _n;
			diag_log format ["Log: [gosa_FPS_getAVG] Поиск %1, шаг %2, кусок 1+%3 %4", _time_first, _c, [round _n, _n], _chunk];

			// TODO: Улучшить точность.
			if (_c > 1) then {
				_c = (_c/2);
				if (_time_first < (_chunk select 0)) then {
					_n = _n-_c;
				}else{
					_n = _n+_c;
				};
			}else{
				_r = [(_chunk_last select 0) - (_chunk select 0),
							(_chunk_last select 1) - (_chunk select 1)];
			};

		}; // while

	};

	diag_log format ["Log: [gosa_FPS_getAVG] return %1", _r];
	_r;
};

private["_nic"];
while{true}do{

	sleep 0.01;
	[time,diag_frameno] call gosa_FPS_add;
	_nic = [300] call gosa_FPS_getAVG;
	_nic = [120] call gosa_FPS_getAVG;
	_nic = [60] call gosa_FPS_getAVG;
};
