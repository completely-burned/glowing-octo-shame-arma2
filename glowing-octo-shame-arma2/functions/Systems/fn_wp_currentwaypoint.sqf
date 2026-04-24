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

private ["_grp","_n","_currentWP","_return","_fix"];
_grp = _this select 0;

_fix = true;
_currentWP = currentWaypoint _grp;
{
	if (_x select 1 == _currentWP) exitWith {
		_fix = false;
		_return = _x;
		diag_log format ["Log: [fnc_wp_currentWaypoint] %1, %2, _return %3", _grp, waypoints _grp, _return];
	};
} forEach waypoints _grp;

if (_fix) then {
	{
		if (_x select 1 == (_currentWP -1)) exitWith {
			_fix = false;
			_return = _x;
			diag_log format ["Log: [fnc_wp_currentWaypoint] %1, %2, _return %3", _grp, waypoints _grp, _return];
		};
	} forEach waypoints _grp;
};

if (_fix) then {
	//_return = [_grp, _currentWP];
	_return = [_grp, 0];
	{
		if (waypointType _x != "") exitWith {
			_return = _x;
			_grp setCurrentWaypoint _x;
			diag_log format ["Log: [fnc_wp_currentWaypoint] %1, %2, %3, currentWaypoint fix %4", _grp, waypoints _grp, [_grp, _currentWP], _return];
		};
	} forEach waypoints _grp;
};

_return;
