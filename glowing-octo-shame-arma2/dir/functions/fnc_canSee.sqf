/*
 * проверка возможности видить в темноте
 * проверяет приборы ночного видения и тепловизоров
 * TODO: наличие подобных прицелов
 * наличие осветительных ракет
 * устанавливает уровень
 * TODO: в данный момент до 7 максимум
 * TODO: проверять нужно по внутренним параметрам игры
 * TODO: так-же можно проверять фонари, пожар и прочие источники света
 */
private ["_magazines","_max","_ammo","_mag","_arr","_str",
	"_cfgMag","_cfgAmm"];

if ("NVGoggles" in weapons _this) exitwith {6};

// В A3 с cdlc GM при 0.96 хуже видно, чем при 0.1 в A2OA.
#ifndef __ARMA3__
if (moonIntensity >= 0.3) exitwith {4};
if (moonIntensity >= 0.1) exitwith {3};
#endif

_cfgMag = configfile >> "cfgMagazines";
_cfgAmm = LIB_cfgAmm;

_magazines = magazines _this;
_max = 0;
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

_max;
