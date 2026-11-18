/*
 * Юнит стреляет осветительной ракетой.
 * TODO: есть проблемы с напревлением выстрела
 * FIXME: работает только на локальных ии
 * FIXME: В A3 ИИ не поднимает оружие перед выстрелом.
 * FIXME: В A3 и a2oa ИИ не стреляет во время передвижения.
 * TODO: Лучше заменить на сохданный объект, без выстрела.
 * FIXME: Некоторые ракеты горят, но света почти не излучают.
 * TODO: Рандомизация.
 * В общем это была неудачная попытка заставить юнитов использовать осветительные ракеты из своих карманов.
 */

#ifdef __ARMA3__
	#define == isEqualTo
#endif

diag_log format["Log: [fnc_unitFlareFire] %1", _this];

private["_cfgWea","_cfgAmm","_magazines","_weapons","_mag",
	"_target","_grp","_muzzle","_muzzles","_iW_to","_n","_flareHeightOffset",
	"_arr0","_blacklist","_flare_failover","_n0",
	"_intensity_required",
	"_u_mags","_obj","_height","_windX","_windZ","_velocity",
	"_units","_u","_w","_arr","_ammo","_m","_item","_str"];

_cfgWea = LIB_cfgWea;
_cfgAmm = LIB_cfgAmm;
_intensity_required = gosa_flare_intensity_required;

_units = _this select 0;
if (count _this > 1) then {
	_blacklist = _this select 1;
}else{
	_blacklist = [];
};
if (count _this > 2) then {
	_flare_failover = _this select 2;
}else{
	if (isNil "gosa_flare_Weighted") then {
		_flare_failover = [];
	}else{
		_flare_failover = gosa_flare_Weighted;
	};
};

_flareHeightOffset = 80;
_target = objNull;
_grp = grpNull;
#ifdef __ARMA3__
	_iW_to = 2;
#else
	_iW_to = 1;
#endif

scopename "scope1";

// поиск юнита для выстрела
for "_iW" from 0 to _iW_to do {
	for "_i" from 0 to (count _units -1) do {
		_u = _units select _i;
		//  && speed _u < 1
		if (_u == vehicle _u) then {
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
							_n = getNumber (_cfgAmm >> _ammo >> "intensity");
							if (_n >= _intensity_required) then {
							if ({_ammo isKindOf _x} count _blacklist <= 0) then {
								_str = toLower getText (_cfgAmm >> _ammo >> "simulation");
								if (_str == "shotilluminating") then {
									if (true) then {
										#ifdef __ARMA3__
											_arr = ([_u, 50 + random 100, getDir _u -45 +random 90] call BIS_fnc_relPos);
											_height = _ammo call gosa_fnc_flareHeight;
											_height = _height + _flareHeightOffset + random (_height/3);
										#else
											_arr = ([_u, 50, getDir _u] call BIS_fnc_relPos);
											_height = (140 + random 20);
										#endif
										_arr set [2, _height];
										_obj = [_arr, _ammo] call gosa_fnc_createFlare;
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
				};
			};
		}else{//diag_log
			diag_log format["Log: [fnc_unitFlareFire] %1 in vehicle or isPlayer", vehicle _u];
		};
	};
};

if (isNil "_obj") then {
	scopename "scope10";

	if (count _units > 0) then {
		for "_i" from 0 to (count _units -1) do {
			_u = _units select _i;
			_arr = getPos _u;
			if !(isNull _u) then {
				//_arr resize 0;
			//}else{
				breakTo "scope10";
			};

		};
	}else{
		_u = objNull;
	};

	if !(isNull _u) then {
		// TODO: Учитывать яркость свечения.
		if (count _flare_failover > 0) then {
			if (typeName (_flare_failover select 0) == typeName []) then {
				if (count (_flare_failover select 0) > 0) then {
					_ammo = _flare_failover call gosa_fnc_selectRandomWeighted;
				}else{
					diag_log format["Log: [fnc_unitFlareFire] breakTo scope1, _flare_failover %1", _flare_failover];
					breakTo "scope1";
				};
			}else{
				_ammo = _flare_failover call BIS_fnc_selectRandom;
			};

			if (isNil "_ammo") then {
				diag_log format["Log: [fnc_unitFlareFire] breakTo scope1, _ammo %1", _ammo];
				breakTo "scope1";
			}else{
				if (typeName _ammo != typeName "") then {
					diag_log format["Log: [fnc_unitFlareFire] breakTo scope1, _ammo %1", _ammo];
					breakTo "scope1";
				}else{
					if (_ammo == "") then {
						diag_log format["Log: [fnc_unitFlareFire] breakTo scope1, _ammo %1", _ammo];
						breakTo "scope1";
					};
				};
			};

			if (_ammo in ["gm_shell_122x447mm_illum_s463","gm_shell_155mm_illum_m485","gm_rocket_84x245mm_illum_dm16","gm_flare_illum_wht"]) then {
				// Светят очень ярко.
				if (random 10 >= 1) then {
					diag_log format["Log: [fnc_unitFlareFire] breakTo scope1, _ammo %1", _ammo];
					breakTo "scope1";
				};
			};

			_obj = [_arr, _ammo, _flareHeightOffset] call gosa_fnc_spawnFlare;
		};
	};
};

if (isNil "_obj") then {
	_obj = objNull;
};
_obj;
