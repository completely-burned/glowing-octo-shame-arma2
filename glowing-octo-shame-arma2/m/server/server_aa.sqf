while {true} do {
	{
		_veh = _x;

		if (_veh isKindOf "LandVehicle") then {
			if ( ({_x call fnc_isPlayer} count units _veh == 0) && canFire _veh) then {

				_magazines = magazines _veh;
				_weapons = weapons _veh;
				_weaponsAA = [];
				_magazinesAA = [];


				{ //_magazines
					_magazine = _x;
					_cfgAmmo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
					if (
						(getNumber (configFile >> "CfgAmmo" >> _cfgAmmo >> "irLock") == 1)
						&&
						(getNumber (configFile >> "CfgAmmo" >> _cfgAmmo >> "airLock") == 1)
					) then {
						_magazinesAA set [count _magazinesAA, _magazine];
					};
				} forEach _magazines;

				{ //_weapons
					_weapon = _x;
					_cfgMags = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
					if ( {
						_x in _magazinesAA
						&&
						(
							getNumber (configFile >> "CfgMagazines" >> _x >> "count")/2  > (2 min (_veh ammo getText (configFile >> "CfgMagazines" >> _x >> "ammo")))
						)
					} count _cfgMags > 0) then {
						_weaponsAA set [count _weaponsAA, _weapon];
					};
				} forEach _weapons;

				if (count _weaponsAA > 0) then {

					_targets = [];

					{
						if (_x isKindOf "Air" && side _veh getFriend side _x < 0.6 && alive _x && getNumber (configFile >> "CfgVehicles" >> typeof _x >> "irTarget") == 1) then {
							_targets set [count _targets, _x];
						};
					} forEach vehicles;

					if (count _targets > 0) then {

						_target = _targets call BIS_fnc_selectRandom;

						if (!isNull _target) then {
							_targetPos = ([_veh, 20, [_veh, _target] call BIS_fnc_dirTo] call BIS_fnc_relPos);
							_targetPos set [2, 30];
							_veh doWatch _targetPos;
							_veh reveal _target;
							sleep 3;
							_handle = _veh fireAtTarget [_target, _weaponsAA call BIS_fnc_selectRandom];
							_veh doWatch objNull;
						};
					};



				};

			};
		};

	} forEach vehicles;

	sleep 30 + random 30;

};
