/*
 * Юнит стреляет осветительной ракетой.
 * TODO: есть проблемы с напревлением выстрела
 * FIXME: работает только на локальных ии
 * FIXME: В A3 ИИ не поднимает оружие перед выстрелом.
 * FIXME: В A3 и a2oa ИИ не стреляет во время передвижения.
 * TODO: Лучше заменить на сохданный объект, без выстрела.
 * FIXME: Некоторые ракеты горят, но света почти не излучают.
 * TODO: Рандомизация.
 */

diag_log format["Log: [fnc_unitFlareFire] %1", _this];

private["_cfgWea","_cfgAmm","_magazines","_weapons","_mag",
	"_target","_grp","_muzzle","_muzzles","_iW_to","_n",
	"_u_mags","_obj","_height",
	"_units","_u","_w","_arr","_ammo","_m","_item","_str"];

_cfgWea = LIB_cfgWea;
_cfgAmm = LIB_cfgAmm;

_units = _this select 0;

_target = objNull;
_grp = grpNull;
#ifdef __ARMA3__
	_iW_to = 2;
	_height = (90 + random 20);
#else
	_iW_to = 1;
	_height = 150;
#endif

scopename "scope1";

// поиск юнита для выстрела
for "_iW" from 0 to _iW_to do {
	for "_i" from 0 to (count _units -1) do {
		_u = _units select _i;
		if (_u == vehicle _u && speed _u < 1) then {
			switch (_iW) do {
				#ifdef __ARMA3__
					case 1: {_w = secondaryWeapon _u};
					case 2: {_w = primaryWeapon _u};
					default {_w = handgunWeapon _u};
				#else
				case 1: {_w = secondaryWeapon _u};
				default {_w = primaryWeapon _u};
				#endif
			};

			if (_w != "") then {
				if !(_u call gosa_fnc_isPlayer) then {
					_muzzles = getArray(_cfgWea >> _w >> "muzzles");
					for "_i_muzzles" from 0 to (count _muzzles -1) do {
						_muzzle = _muzzles select _i_muzzles;
						if (toLower _muzzle == "this") then {
							_magazines = getArray(_cfgWea >> _w >> "magazines");
						} else {
							_magazines = getArray(_cfgWea >> _w >> _muzzle >> "magazines");
						};

						for "_iM" from 0 to (count _magazines -1) do {
							_mag = toLower (_magazines select _iM);
							_ammo = getText (configfile >> "cfgMagazines" >> _mag >> "ammo");

							_arr = getArray (_cfgAmm >> _ammo >> "submunitionAmmo");
							if (count _arr > 0) then {
								_ammo = _arr select 0;
							};
							_str = toLower getText (_cfgAmm >> _ammo >> "simulation");

							if (_str == "shotilluminating") then {
								if (true) then {
									// TODO: Звук запуска ракеты.
									_arr = ([_u, 50, getDir _u] call BIS_fnc_relPos);
									_arr set [2, _height];
									_obj = createVehicle [_ammo, _arr, [], 0, "FLY"];
									#ifdef __ARMA3__
										// Без этого ракета замирает на месте.
										_obj setVelocity [0, 0, -0.01];
									#endif
									diag_log format["Log: [fnc_unitFlareFire] %1 fire and exit", [_u, _ammo, _mag, _obj, _arr]];
								}else{
								_u_mags = magazines _u;
								_n = ({toLower _x == _mag} count _u_mags);
								#ifdef __ARMA3__
									if (_n <= 0) then {_u addMagazineGlobal _mag};
									_u selectWeapon _w;
									_arr = ([_u, 30, getDir _u] call BIS_fnc_relPos);
									_arr set [2, 30];
									_u doWatch _arr;
									/*
										if (isNull _target) then {
											_target = "B_TargetSoldier" createVehicleLocal _arr;
											//_target = _grp createUnit ["B_TargetSoldier", _arr, [], 0, "CAN_COLLIDE"];
										};
										_target setPos _arr;
									*/
									sleep 3;
									diag_log format["Log: [fnc_unitFlareFire] %1 fire and exit", [_u, _w, _mag, _target, _arr]];
									//_u fireAtTarget [_target, _w];
									[_u, _w] call BIS_fnc_fire;
									//deleteVehicle _target;
									_u doWatch objNull;
									sleep 1;
									if (({toLower _x == _mag} count magazines _u) > _n) then {_u removeMagazineGlobal _mag};
								#else
									_u addMagazine _mag;
									if (_n <= 0) then {_u addMagazine _mag};
									diag_log format["Log: [fnc_unitFlareFire] %1 fire and exit", [_u, _w, _mag]];
									_u fire [_muzzle, _muzzle, _mag];
									sleep 1;
									if (({toLower _x == _mag} count magazines _u) > _n) then {_u removeMagazine _mag};
								#endif
								};
								breakTo "scope1";
							};
						};
					};
				};
			};
		}else{//diag_log
			diag_log format["Log: [fnc_unitFlareFire] %1 in vehicle or isPlayer", vehicle _u];
		};
	};
};
