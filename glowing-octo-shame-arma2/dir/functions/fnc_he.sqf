#ifdef __A2OA__
	private["_veh","_type","_entry","_turrets","_turret","_mags_he","_mag","_ammo","_indirectHitRange","_weapon","_mag_he","_mags","_he"];
	{

		_veh = _x;

		_type = typeOf _veh;

		if (_type isKindOf "Tank" && !(effectiveCommander _veh call gosa_fnc_isPlayer)) then {


			_entry = configFile >> "CfgVehicles" >> _type;

			_turrets = ([_entry >> "turrets",[]] call gosa_fnc_returnVehicleTurrets);

			{
				_turret = _x;

				// подходящие магазины
				_mags = [];
				// подходящие офс магазины
				_mags_he = [];
				{ // weapons turret

					// оружие
					_weapon = _x;


					{ // magazines turret

						_mag = _x;


						// магазин подходит оружию
						if ({_mag == _x } count getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines") > 0) then {

							// добавить в список подходящих магазинов
							_mags set [count _mags, [_turret, _weapon, _mag]];

							// тип снаряда
							_ammo = getText (configFile >> "CfgMagazines" >> _mag >> "ammo");

							// офс снаряд
							_indirectHitRange = getNumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
							if (_indirectHitRange > 2) then {

								// добавить в список подходящих офс магазинов
								_mags_he set [count _mags_he, [_turret, _weapon, _mag]];

							};
						};

					} forEach (_veh magazinesTurret _turret);




				} forEach (_veh weaponsTurret _turret);

				// есть офс магазины
				if (count _mags_he > 0) then {

					// выбрать магазин офс

					_he = true;
					{

						if (_x select 1 isKindOf "Tank" && _x select 3 > 1.5) exitWith {
							_he = false;
						};
					} forEach (_veh nearTargets 2000);

					// использовать офс
					if (_he) then {
						// зарядить офс магазин
						_mag_he = (_mags_he select 0);
					}else{
						// зарядить первый подходящий магазин
						_mag_he = (_mags select 0);
					};
					_veh loadMagazine [_mag_he select 0, _mag_he select 1, _mag_he select 2];


				};


			} forEach _turrets;

		};
	} forEach (_this select 0);
#endif
