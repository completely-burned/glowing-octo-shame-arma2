/*
 * Функция возвращает приоритет группы, и юнитов отсортированных по приоритету.
 */
private ["_units","_grp","_arr","_n","_arr0","_n0","_n1","_n2","_obj"];
_units = _this select 0;
_grp = _this select 1;

_arr = ([_units] call gosa_fnc_sortUnits_onWeapon);

_n = count _units;

// Требуется DLC.
_n0 = 0;
#ifdef __ARMA3__
	for "_i" from 0 to (_n -1) do {
		_arr0 = getAssetDLCInfo (_units select _i);
		if !(_arr0 select 1) then {
			_n0 = _n0 +1;
			_obj = _units select _i call gosa_fnc_assignedVeh;
			if (_units select _i isNotEqualTo _obj && !isNull _obj) then {
				_arr0 = getAssetDLCInfo _obj;
				if !(_arr0 select 1) then {
					_n0 = _n0 +2;
				};
			};
		};
	};
#endif

_n1 = count (_arr select 0) - count (_arr select 2);

if (_n > 0) then {
	_n2 = 100 * (_n0/_n)
} else {
	_n2 = 0;
};

[_grp, _n1 -_n2,
	_arr select 0, _arr select 1, _arr select 2, _n, _n0, _n1, _n2];
