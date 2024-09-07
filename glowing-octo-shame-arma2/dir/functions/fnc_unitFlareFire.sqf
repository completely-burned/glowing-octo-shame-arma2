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

#ifdef __ARMA3__
	#define == isEqualTo
#endif

diag_log format["Log: [fnc_unitFlareFire] %1", _this];

private["_cfgWea","_cfgAmm","_magazines","_weapons","_mag",
	"_target","_grp","_muzzle","_muzzles","_iW_to","_n",
	"_arr0","_blacklist",
	"_u_mags","_obj","_height","_windX","_windZ","_velocity",
	"_units","_u","_w","_arr","_ammo","_m","_item","_str"];

_cfgWea = LIB_cfgWea;
_cfgAmm = LIB_cfgAmm;

_units = _this select 0;
if (count _this > 1) then {
	_blacklist = _this select 1;
}else{
	_blacklist = [];
};

_target = objNull;
_grp = grpNull;
_windX = wind select 0;
_windZ = wind select 1;
#ifdef __ARMA3__
	_iW_to = 2;
	if (_windX isEqualTo 0) then {_windX = random [-0.5, 0.1, 0.5];};
#else
	_iW_to = 1;
#endif
_velocity = [_windX, _windZ, 30];

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
							if ({_ammo isKindOf _x} count _blacklist <= 0) then {
								_str = toLower getText (_cfgAmm >> _ammo >> "simulation");
								if (_str == "shotilluminating") then {
									if (true) then {
										// TODO: Звук запуска ракеты.
										#ifdef __ARMA3__
											_arr = ([_u, 50 + random 100, getDir _u -45 +random 90] call BIS_fnc_relPos);
											_height = (100 + random 50);
										#else
											_arr = ([_u, 50, getDir _u] call BIS_fnc_relPos);
											_height = (140 + random 20);
										#endif
										_arr set [2, _height];
										_obj = createVehicle [_ammo, _arr, [], 0, "FLY"];
										_obj setVelocity _velocity;
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
		// TODO: Случайность.
		// TODO: Учитывать яркость свечения.
		_arr0 = ["SPE_40mm_White","gm_flare_illum_wht","ACE_40mm_Flare_white","F_40mm_White"];
			for "_i" from 0 to (count _arr0 -1) do {
				_ammo = _arr0 select _i;
				if (configName(_cfgAmm >> _ammo) != "") then {
					if (_ammo in ["gm_shell_122x447mm_illum_s463","gm_shell_155mm_illum_m485","gm_rocket_84x245mm_ILLUM_DM16","gm_flare_illum_wht"]) then {
						// Светят очень ярко.
						if (random 10 >= 1) then {
							breakTo "scope1";
						};
						_arr set [2, 200 + random 100];
						_arr set [0, (_arr select 0) -500 +random 1000];
						_arr set [1, (_arr select 1) -500 +random 1000];
					};
			// Pick a random altitude between 100 and 150m
			_arr set [2, 100 + random 50];
			_arr set [0, (_arr select 0) -250 +random 500];
			_arr set [1, (_arr select 1) -250 +random 500];
			/*
			private _sound = "SN_Flare_Fired_4";
			private _soundSourceClass = "SoundFlareLoop_F";
			private _minDist = _options getOrDefault [QUOTE(PARAM_NAME(mindist)), 300];
			*/

			// Spawn the flare projectile
			_obj = createVehicle [_ammo, _arr, [], 0, "FLY"];
					//_projectile setPos _pos;
					_obj setVelocity _velocity;
					diag_log format["Log: [fnc_unitFlareFire] %1 fire and exit", [_u, _ammo, _obj, _arr]];
					breakTo "scope1";
			/*
			// Play the flare sound lighting up
			[[_projectile,_sound,"say3D"],"bis_fnc_sayMessage"] call bis_fnc_mp;
			// Create sound source of burning sound and attach to projectile
			private _soundSource = createSoundSource [_soundSourceClass, _pos, [], 0];
			_soundSource attachTo [_projectile, [0, 0, 0]];
			// Trigger is used as a data structure as we cannot store variables in projectiles and sound sources
			private _trigger = createTrigger ["EmptyDetector", _pos];
			_trigger attachTo [_projectile, [0, 0, 0]];
			_trigger setVariable [QUOTE(PARAM_NAME(soundSource)), _soundSource];
			_trigger setVariable [QUOTE(PARAM_NAME(projectile)), _projectile];
			*/
			};
		};
	};
};

if (isNil "_obj") then {
	_obj = objNull;
};
_obj;
