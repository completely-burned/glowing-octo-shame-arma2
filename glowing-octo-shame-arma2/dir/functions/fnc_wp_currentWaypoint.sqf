// Индекс +1 от завершенного маршрута.
// a3: Индекс будет 0
// если удалить маршруты.
// a3: Индекс будет 0
// если удалить все маршруты и один создать в далеке.
// a3: Индекс будет 2
// если удалить все маршруты и создать у игрока два и еще два в далеке.
// a3: Индекс будет 1
// если удалить все маршруты и один создать у игрока.
// FIXME: не правильный текущий номер маршрута

private ["_grp","_n","_currentWP"];
_grp = _this select 0;

_currentWP = currentWaypoint _grp;
_n = count waypoints _grp;
if (_n > 0) then {
	if (_currentWP > _n) then {
		diag_log format ["Log: [fnc_wp_currentWaypoint] %1, %2, %3, currentWaypoint fix %4", _grp, waypoints _grp, _currentWP, _n -1];
		_currentWP = _n -1;
		_grp setCurrentWaypoint [_grp, _currentWP];
		_currentWP = currentWaypoint _grp;
	};
};

[_grp, _currentWP];
