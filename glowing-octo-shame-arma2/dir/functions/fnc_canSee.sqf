/*
 * FIXME: Имя функции вводит в заблуждение.
 * проверка возможности видить в темноте
 * проверяет приборы ночного видения и тепловизоров
 * TODO: наличие подобных прицелов
 * наличие осветительных ракет
 * устанавливает уровень
 * TODO: в данный момент до 7 максимум
 * TODO: проверять нужно по внутренним параметрам игры
 * TODO: так-же можно проверять фонари, пожар и прочие источники света
 */
private ["_magazines","_max","_ammo","_mag","_arr","_str","_obj","_type",
	"_cfgMag","_cfgAmm","_cfgVeh","_cfgWea","_crew","_exit"];

if (typeName _this == typeName "") then {
	_type = _this;
}else{
	_obj = _this;
	_type = typeOf _obj;
};

_cfgVeh = LIB_cfgVeh;
_cfgWea = LIB_cfgWea;
if (getNumber(_cfgVeh >> _type >> "isMan") <= 0) then {
	_crew = getText(_cfgVeh >> _type >> "crew");
};

//- ПНВ.
if (isNil "_crew") then {
	if (isNil "_obj") then {
		#ifdef __ARMA3__
		if ([_cfgWea, getArray(_cfgVeh >> _type >> "linkedItems"), "simulation", "NVGoggles"] call gosa_fnc_check_config_use) then
		#else
		if ([_cfgWea, getArray(_cfgVeh >> _type >> "weapons"), "simulation", "NVGoggles"] call gosa_fnc_check_config_use) then
		#endif
		{
			diag_log format ["Log: [fnc_canSee] 6, NVGoggles, %1", _type];
			_exit = 6;
		};
	}else{
		#ifdef __ARMA3__
		if ([_cfgWea, [hmd _obj], "simulation", "NVGoggles"] call gosa_fnc_check_config_use) then
		#else
		if ([_cfgWea, weapons _obj, "simulation", "NVGoggles"] call gosa_fnc_check_config_use) then
		#endif
		{
			diag_log format ["Log: [fnc_canSee] 6, NVGoggles, %1", _obj];
			_exit = 6;
		};
	};
}else{
	#ifdef __ARMA3__
	if ([_cfgWea, getArray(_cfgVeh >> _crew >> "linkedItems"), "simulation", "NVGoggles"] call gosa_fnc_check_config_use) then
	#else
	if ([_cfgWea, getArray(_cfgVeh >> _crew >> "weapons"), "simulation", "NVGoggles"] call gosa_fnc_check_config_use) then
	#endif
	{
			diag_log format ["Log: [fnc_canSee] 6, NVGoggles, %1", _type];
			_exit = 6;
	};
};
if !(isNil "_exit") exitwith {_exit};

//- Луна.
// FIXME: Эта проверка должна быть не на объекте, а в другой функции.
// В A3 с cdlc GM при 0.96 хуже видно, чем при 0.1 в A2OA.
#ifndef __ARMA3__
	if !(_type isKindOf "Air") then {
		if (moonIntensity >= 0.3) exitwith {
			diag_log format ["Log: [fnc_canSee] 4, moonIntensity %1", moonIntensity];
			_exit = 4;
		};
		if (moonIntensity >= 0.1) exitwith {
			diag_log format ["Log: [fnc_canSee] 3, moonIntensity %1", moonIntensity];
			_exit = 3;
		};
	};
	if !(isNil "_exit") exitwith {_exit};
#endif

_max = 0;
if !(_type isKindOf "Air") then {
	_cfgMag = configfile >> "cfgMagazines";
	_cfgAmm = LIB_cfgAmm;
	if (isNil "_crew") then {
		if (isNil "_obj") then {
			_magazines = getArray(_cfgVeh >> _type >> "magazines");
		}else{
			_magazines = magazines _this;
		};
	}else{
			_magazines = getArray(_cfgVeh >> _crew >> "magazines");
	};

	for "_iM" from 0 to (count _magazines -1) do {
		_mag = (_magazines select _iM);
		_ammo = getText (_cfgMag >> _mag >> "ammo");

		_arr = getArray (_cfgAmm >> _ammo >> "submunitionAmmo");
		if (count _arr > 0) then {
			_ammo = _arr select 0;
		};
		_str = toLower getText (_cfgAmm >> _ammo >> "simulation");
		if (_str == "shotilluminating") then {_max = _max max 2};
	};
};

diag_log format ["Log: [fnc_canSee] %1", _max];
_max;
