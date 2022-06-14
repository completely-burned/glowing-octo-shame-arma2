/*
Может _this select 0 успешно атаковать _this select 1?
TODO: Бои нужно сделать на выбор эпичными, сложными, простыми
*/
private ["_r","_attack","_victim","_attack_ammo","_victim_ammo","_victim_t",
	"_z"];

_attack = vehicle (_this select 0);
_victim = vehicle (_this select 1);

// авиация пусть просто летает
	if (_attack isKindOf "Air") exitWith {
		diag_log format ["Log: [fnc_canAttack] a %1, %2", typeOf _attack, false];
		false;
	};
// корабли должны выгрузить десант
	if (_attack isKindOf "Ship") exitWith {
		diag_log format ["Log: [fnc_canAttack] a %1, %2", typeOf _attack, false];
		false;
	};

_r = false;

_victim_t = typeOf _victim;
_attack_t = typeOf _attack;
diag_log format ["Log: [fnc_canAttack] %1", [_attack, _attack_t, _victim, _victim_t]];

//---
if (getNumber(configFile >> "CfgVehicles" >> _victim_t >> "isMan") == 1) then {
	// TODO: Исключить, до пехоты в лесу транспорту не добраться.
	diag_log format ["Log: [fnc_canAttack] v isMan", _victim_t];
	_r = true;
} else {
	// TODO: Учитывать тс без вооружения.

	//-- не гонятся за авиацией
	if (_victim_t isKindOf "Air") exitWith {
		_r = false;
		diag_log format ["Log: [fnc_canAttack] v %1, %2", _victim_t, _r];
	};

	// Машины почти всегда уязвимы ко всем типам вооружения,
	// кроме лодок и транспортных вертолетов.
	// TODO: Учитывать мотоциклы.
	if (_victim_t isKindOf "Car" && !(_victim_t isKindOf "Wheeled_APC")) exitWith {
		_r = true;
		diag_log format ["Log: [fnc_canAttack] v %1, %2", _victim_t, _r];
	};

	_attack_ammo = [];
		{
			_attack_ammo set [count _attack_ammo,
				getText(configFile >> "CfgMagazines" >> _x >> "ammo")];
		} forEach magazines _attack;
		diag_log format ["Log: [fnc_canAttack] a %1", _attack_ammo];

	//-- пт на танк бтр бмп
	_z = (configFile >> "CfgAmmo");
		if ((
				_victim_t isKindOf "Tank" or
				_victim_t isKindOf "Wheeled_APC" or
				_victim_t isKindOf "Tracked_APC"
			)&&
			(
				{
					getText(_z >> _x >> "effectsMissile") in ["missile2","missile4"] or
					#ifdef __A2OA__
					{getNumber(_z >> _x >> "irLock") == 1}
					#else
					(getNumber(_z >> _x >> "irLock") == 1)
					#endif
				} count _attack_ammo > 0
			)&&
			{
				{getNumber(_z >> _x >> "airLock") == 1} count _attack_ammo == 0
			}
		) exitWith {
				_r = true;
				diag_log format ["Log: [fnc_canAttack] v %1 irLock, %2", _victim_t, _r];
		};

	/*_victim_ammo = [];
		{
			_victim_ammo set [count _victim_ammo,
				getText(configFile >> "CfgMagazines" >> _x >> "ammo")];
		} forEach magazines _victim;
		diag_log format ["Log: [fnc_canAttack] v %1", _victim_ammo];

	// авиация на аа
	if (_attack_t isKindOf "Air"
			&& {getNumber(configFile >> "CfgAmmo" >> _x >> "airLock") == 1}
				count _victim_ammo > 0) exitWith {
		_r = false;
	};*/

	// TODO: исключить, в лесу транспорту не добраться.
	if (_victim_t isKindOf "StaticWeapon") exitWith {
		_r = true;
		diag_log format ["Log: [fnc_canAttack] v %1, %2", _victim_t, _r];
	};

	_r = false;
};

diag_log format ["Log: [fnc_canAttack] %1 %2", _this, _r];
_r;
