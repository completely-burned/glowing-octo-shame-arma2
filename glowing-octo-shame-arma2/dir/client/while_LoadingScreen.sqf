#define __A2OA__
/*
 * Перемещает игрока после подключения на стартовую позицию.
 */
private ["_timeOut","_script"];
_timeOut = ((_this select 2) +time);
//waitUntil {time > 0};

// При любой ошибке в коде он не доходит до endLoadingScreen, поэтому используется scriptDone spawn
_script = _this spawn {
	private ["_timeOut","_resource","_condition","_progress_conditions","_arr",
		"_progress","_progress_step","_code","_time_start","_n"];
	_resource = _this select 0;
	// {}
	_condition = _this select 1;
	_timeOut = _this select 2;
	// [{}, {}]
	_progress_conditions = _this select 3;

	// TODO: Проверить на отказоустойчивость.
	if !(call _condition) then {
		// Брифинг уже должен быть закрыт.
		waitUntil {time > 0};

		startLoadingScreen _resource;
		diag_log format ["Log: [LoadingScreen] %1, startLoadingScreen %2", time, _this];
		_progress = 0;

		_time_start = time;
		_timeOut = _time_start + _timeOut;

		_progress_step = (1 / (count _progress_conditions +1));
		_arr = [];
		for "_i" from 0 to (count _progress_conditions -1) do {
			_arr set [_i, false];
		};

		while {!(call _condition)} do {
			sleep 0.1;
			if (time >= _timeOut) then {
				diag_log format ["Log: [LoadingScreen] %1, _timeOut", time];
				_condition = {true};
			}else{
				_n = (time - _time_start)/_timeOut;
				if (_progress < _n) then {
					progressLoadingScreen _n;
				};
				
				for "_i" from 0 to (count _progress_conditions -1) do {
					if !(_arr select _i) then {
						_code = _progress_conditions select _i;
						if (call _code) then {
							_arr set [_i, true];
							diag_log format ["Log: [LoadingScreen] %1, _progress %2, done %3", time, _progress, _code];
							_progress = _progress + _progress_step;
							progressLoadingScreen _progress;
						};
					};
				};
			};
		};
	};
};

waitUntil {scriptDone _script or time >= _timeOut};
diag_log format ["Log: [LoadingScreen] %1, endLoadingScreen", time];
endLoadingScreen;
