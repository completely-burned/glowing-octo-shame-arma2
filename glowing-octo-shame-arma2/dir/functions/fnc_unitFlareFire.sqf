/*
 * Юнит стреляет осветительной ракетой.
 * TODO: есть проблемы с напревлением выстрела
 * FIXME: работает только на локальных ии
 */

diag_log format["Log: [fnc_unitFlareFire] %1", _this];

private["_units","_u","_w"];

_units = _this select 0;

scopename "scope1";

// поиск юнита для выстрела
for "_i" from 0 to (count _units -1) do {

	_u = _units select _i;

	if (_u == vehicle _u && !(_u call gosa_fnc_isPlayer)) then {

		_w = primaryWeapon _u;

		diag_log format["Log: [fnc_unitFlareFire] %1", [_u, _w, getArray(configFile >> "cfgWeapons" >> _w >> "muzzles")]];

		{
			if (_x in getArray(configFile >> "cfgWeapons" >> _w >> "muzzles")) then {
				diag_log format["Log: [fnc_unitFlareFire] %1 fire and exit", _u];
				_u addMagazine "FlareWhite_GP25";
				_u fire [_x, _x, "FlareWhite_GP25"];
				breakTo "scope1";
			};
		// TODO: проверять нужно по внутренним параметрам игры
		} forEach ["GP25Muzzle"];

		{
			if (_x in getArray(configFile >> "cfgWeapons" >> _w >> "muzzles")) then {
				diag_log format["Log: [fnc_unitFlareFire] %1 fire and exit", _u];
				_u addMagazine "FlareWhite_M203";
				_u fire [_x, _x, "FlareWhite_M203"];
				breakTo "scope1";
			};
		// TODO: проверять нужно по внутренним параметрам игры
		} forEach ["M203Muzzle", "XM320Muzzle"];

	}else{
		diag_log format["Log: [fnc_unitFlareFire] %1 in vehicle or isPlayer", vehicle _u];
	};

};
