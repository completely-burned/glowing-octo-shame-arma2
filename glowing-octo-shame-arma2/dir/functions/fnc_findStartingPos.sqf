/*
 * Поиск стартовой позиции.
 */
private ["_worldSize","_minDistance","_maxGradient","_maxGradientRadius",
	"_overLandOrWater","_attempts","_attempts_max","_testPos"];

_worldSize = _this select 0;

_minDistance = 15;
// FIXME: Gradient не понимаю.
_maxGradient = 0.75;
_maxGradientRadius = 5;
_overLandOrWater = 0;
_attempts = 0;
_attempts_max = 1000;

// TODO: Чёрный список.
// TODO: Чтение предустановленных локаций карты.
// TODO: Чтение размещенных пользователем локаций.
// TODO: Поиск позиций у дорог.
// Случайные позиции.
while {true} do {
	if (_attempts >= _attempts_max) exitWith {
		diag_log format ["Log: [fnc_findStartingPos] попытки закончились", nil];
		_testPos = [];
	};

	_testPos = [random (_worldSize select 0), random (_worldSize select 1)];
	_testPos = (_testPos isFlatEmpty [
		_minDistance, -1, _maxGradient, _maxGradientRadius, _overLandOrWater]);
	if (count _testPos > 0) exitWith {
		_testPos resize 2;
	};

	_attempts = _attempts + 1;
};

_testPos;
