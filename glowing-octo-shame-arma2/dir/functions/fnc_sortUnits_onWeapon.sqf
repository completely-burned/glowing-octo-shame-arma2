/*
 * Упорядочить юнитов по приоритету оружия игрока.
 */

private ["_prioHigh","_prioMedium","_prioLow","_unit","_n",
	"_prioWeaponHigh","_prioWeaponMedium","_prioWeaponLow"];

_units = _this select 0;

_prioWeaponHigh = gosa_squadOnW;
_prioWeaponMedium = [];
_prioWeaponLow = gosa_squadOffW;

_prioHigh = [];
_prioMedium = [];
_prioLow = [];

for "_i" from 0 to (count _units -1) do {
	_unit = _units select _i;
	_n = [_unit] call gosa_fnc_getUnitClass;
	if ({_x in _n} count _prioWeaponLow > 0) then {
		_prioLow set [count _prioLow, _unit];
	} else {
		if ({_x in _n} count _prioWeaponHigh > 0) then {
			_prioHigh set [count _prioHigh, _unit];
		} else {
			_prioMedium set [count _prioMedium, _unit];
		};
	};
};

diag_log format ["Log: [fnc_sortUnits_onWeapon] _prioHigh %1", _prioHigh];
diag_log format ["Log: [fnc_sortUnits_onWeapon] _prioMedium %1", _prioMedium];
diag_log format ["Log: [fnc_sortUnits_onWeapon] _prioLow %1", _prioLow];

[_prioHigh, _prioMedium, _prioLow];
