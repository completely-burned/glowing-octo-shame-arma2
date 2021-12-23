#define __A2OA__

/*

	private["_ok"]; _ok = [this] execVM "dir\functions\gosa_fnc_reweapon.sqf";

*/

diag_log format ["Log: [fnc_reweapon] in %1", _this];

// if(isNil "LIB_ahAvail")then{
	// LIB_ahAvail = false;
	// if (configName(configFile >> "CfgVehicles" >> "TK_Soldier_Officer_EP1") != "") then {LIB_ahAvail = true};
// };

private["_isPlayer","_z","_return","_night"];
if(count _this > 1)then{
	_isPlayer = _this select 1;
}else{
	_isPlayer = false;
};

private["_Bombs"];
if(_isPlayer)then{
	_Bombs=true;
}else{
	_Bombs=false;
};

_night = call gosa_fnc_isNight;
_return = [];

// if (LIB_ahAvail) then { _Bombs=true;};
// private["_LaserBombs"];
// _LaserBombs=false;

private["_flyInHeight","_pos"];

{

	private["_type","_veh"];

	if (typeName _x == typeName objNull) then {

	_veh = _x;
	_type = TypeOf _veh;
	diag_log format ["Log: [fnc_reweapon] %1 %2", _veh, _type];

	_pos = getPos _veh;

#ifdef __A2OA__
	if(_isPlayer)then{
		_veh allowCrewInImmobile true;
	};
#endif

	_veh setSkill ["reloadSpeed", 1];

	/// --- Man ---
	if (getNumber(configFile >> "CfgVehicles" >> _type >> "isMan") == 1) then {
		private["_weapons"];
		private["_weapon"];
		// _weapons = (getArray(configFile >> "CfgVehicles" >> _type >> "weapons"));
		// _weapon = (currentWeapon _veh);
		_weapons = weapons _veh;
		diag_log format ["Log: [fnc_reweapon] %1 %2", _veh, _weapons];
		_weapon = toLower (_weapons select 0);

		// бинокль командиру
		if ( _veh == leader _veh && random 10 > 8) then {
			if !([LIB_cfgWea,_weapons,"simulation","Binocular"] call gosa_fnc_check_config_use) then {
					_veh addWeapon "Binocular";
			};
		};

		if ( ACE_Avail ) then {
			if (random 10 > 9) then {
				if ( _weapon in ["ace_ak74m_pso"] ) then {
					_veh removeWeapon _weapon;
					_weapon = "ace_ak74m_tws_fl";
					_veh addWeapon _weapon;
				};
			};
			if !(daytime > 3 && daytime < 20) then {
				if ("NVGoggles" in _weapons) then {
					if ( _weapon in ["ace_ak74m_pso"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "ace_ak74m_pso_fl";
						_veh addWeapon _weapon;
					};
					if ( _weapon in ["ace_ak74m_kobra"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "ace_ak74m_kobra_fl";
						_veh addWeapon _weapon;
					};
					// if ( _weapon in ["ACE_AK74M_GL_Kobra"] ) then {
						// _veh removeWeapon _weapon;
						// _weapon = "ACE_AK74M_PSO_FL";
						// _veh addWeapon _weapon;
						// _veh selectWeapon _weapon;
					// };
				};
			};
		};
		if (LIB_ahAvail) then {
				// if (random 10 > 8) then {
					// if (_type isKindOf "TK_Soldier_SL_EP1" || _type isKindOf "TK_Special_Forces_EP1") then {
						// if ( _weapon in ["FN_FAL","FN_FAL_ANPVS4"] ) then {
							// _veh removeWeapon _weapon;
							// _veh removeMagazines "20Rnd_762x51_FNFAL";
							// for "_i" from 1 to 6 do { _veh addMagazine "30Rnd_545x39_AK"};
							// _weapon = "AKS_74_GOSHAWK";
							// _veh addWeapon _weapon;
							// _veh selectWeapon _weapon;
						// };
					// };
				// };
				if (random 100 > 95) then {
					if ( _weapon in ["aks_74_kobra","aks_74_pso"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "aks_74_goshawk";
						_veh addWeapon _weapon;
					};
					if ( _weapon in ["m107"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "m107_TWS_EP1";
						_veh addWeapon _weapon;
					};
				};
				if (random 10 > 8) then {
					if ( _weapon in ["m240"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "m240_scoped_EP1";
						_veh addWeapon _weapon;
						_veh selectWeapon _weapon;
					};
					if ( _weapon in ["m249"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "m249_m145_ep1"; // [["M249_m145_EP1", "M249_TWS_EP1"],[0.5,0.1]] call BIS_fnc_selectRandomWeighted;
						_veh addWeapon _weapon;
					};
				};
				if (random 10 > 7) then {
					if (_night) then {

						if !([LIB_cfgWea,_weapons,"simulation","NVGoggles"] call gosa_fnc_check_config_use) then {
								_veh addWeapon "NVGoggles";
						};

						if ( _weapon in ["aks_74_kobra","aks_74_pso"] ) then {
							_veh removeWeapon _weapon;
							_weapon = "aks_74_nspu";
							_veh addWeapon _weapon;
						};
						if ( _weapon in ["svd","svd_des_ep1","svd_camo"] ) then {
							_veh removeWeapon _weapon;
							_weapon = "svd_nspu_ep1";
							_veh addWeapon _weapon;
						};
						if ( _weapon in ["fn_fal"] ) then {
							_veh removeWeapon _weapon;
							_weapon = "fn_fal_anpvs4";
							_veh addWeapon _weapon;
						};
					};
				};
				///--- USMC
				if (_type isKindOf "USMC_Soldier2") then {
					_z = "8rnd_b_beneli_74slug";
					{
						if (toLower _x == _z) then {
							_veh removeMagazine _z;
							_veh addMagazine "8Rnd_B_Beneli_Pellets"
						};
					} forEach magazines _veh; // TODO: нужно заменять только часть магазинов
				};
				///--- Saiga12
				if (_type isKindOf "RU_Soldier2") then {
					_z = "8rnd_b_saiga12_74slug";
					{
						if (toLower _x == _z) then {
							_veh removeMagazine _z;
							_veh addMagazine "8Rnd_B_Saiga12_Pellets"
						};
					} forEach magazines _veh;
				};
			///--- Aziz
			if (_type isKindOf "TK_Aziz_EP1") then {
				for "_i" from 1 to 3 do { _veh addMagazine "30Rnd_545x39_AK"};
				_weapon = "aks_74_goshawk";
				_veh addWeapon _weapon;
			};
		};
		///--- Bardak
		if (_type isKindOf "Ins_Bardak") then{
			for "_i" from 1 to 3 do { _veh addMagazine "30Rnd_762x39_AK47"};
			_weapon = "aks_gold";
			_veh addWeapon _weapon;
		};
		if (_type isKindOf "RUS_Soldier_TL") then{
			// if ( _weapon in ["AKS_74_U"] ) then {
				// _veh removeWeapon _weapon;
				// _weapon = "AKS_74_NSPU";
				// _veh addWeapon _weapon;
				// _veh selectWeapon _weapon;
			// };
		};
	};

			/// --- Air ---
	if (_type isKindOf "Air") then{
		_veh setSkill ["commanding", 1];
		_veh setSkill ["spotDistance", 1];
		if (worldName == "FDF_Isle1_a")then {_veh flyInHeight 200};
		if (_type isKindOf "Plane") then {
			if(getNumber(LIB_cfgWea >> currentWeapon _veh >> "enableAttack") > 0)then{
				_veh flyInHeight 300 + random 300;
			};
			// _veh forceSpeed 10000;
		};
		if (_type isKindOf "UAV") then {
			// if(!isNil "BIS_uav_0")then{ BIS_uav_0 synchronizeObjectsAdd [_veh] };
			// if (_type isKindOf "MQ9PredatorB" && _LaserBombs) then{
				_veh removeMagazines "8Rnd_Hellfire";
				_veh removeWeapon "HellfireLauncher";
				_veh addMagazine "4Rnd_GBU12";
				_veh addMagazine "4Rnd_GBU12";
				_veh addWeapon "BombLauncherA10";
			// };
			if (LIB_ahAvail) then {
				_veh call (compile "_this allowCrewInImmobile true;"); // OA
			};
			_veh setVehicleLock "LOCKED";
			_veh addEventHandler ["GetOut", { deleteVehicle (_this Select 2) }];

			_flyInHeight = 400 + random 300;
			_veh flyInHeight _flyInHeight;
			_veh setPos [_pos select 0, _pos select 1, _flyInHeight];
			_veh setVelocity [50 * (sin getDir _veh), 50 * (cos getDir _veh), 0];

		};
		if (_type isKindOf "Ka137_Base_PMC") then{
			if !("Laserdesignator_mounted" in weapons _veh) then {
				_veh addmagazine "laserbatteries";
				_veh addweapon "laserdesignator_mounted";
			};
			if (LIB_ahAvail) then {
				_veh call (compile "_this allowCrewInImmobile true;"); // OA
			};
			_veh setVehicleLock "LOCKED";
			_veh addEventHandler ["GetOut", { deleteVehicle (_this Select 2) }];

			_flyInHeight = 400 + random 300;
			_veh flyInHeight _flyInHeight;
		};

		if(!_Bombs)then{
			///--- AV8B2
			if ((_type isKindOf "AV8B2")&&!(_type isKindOf "AV8B")) then{
				_veh removeWeapon "Mk82BombLauncher_6";
				_veh removeMagazine "6Rnd_Mk82";
				_veh addMagazine "2Rnd_Maverick_A10";
				_veh addMagazine "2Rnd_Maverick_A10";
				_veh addMagazine "2Rnd_Maverick_A10";
				_veh addWeapon "MaverickLauncher";
				_veh removeMagazine "2Rnd_Sidewinder_AH1Z";
				_veh addMagazine "2Rnd_Sidewinder_AH1Z";
			};
			///--- Su25
			if (_type isKindOf "Su25_base") then{
				_veh flyInHeight 150 + random 150;
				if !(_type isKindOf "Su39") then{
					_veh removeWeapon "AirBombLauncher";
					_veh removeMagazine "4Rnd_FAB_250";
					_veh addMagazine "4Rnd_Ch29";
					_veh addWeapon "Ch29Launcher";
					_veh removeMagazine "2Rnd_R73"; // внешний вид
					_veh addMagazine "2Rnd_R73";
				};
			};
		};
		///--- Mi24_P
		/*
		if (_type isKindOf "Mi24_P") then{
			if(!_Bombs)then
			{
				_veh removeMagazines "2Rnd_FAB_250";
				// if (LIB_ahAvail) then{
					// _veh addMagazine ["2Rnd_FAB_250",0];
				// };
				_veh removeWeapon "HeliBombLauncher";
				_veh addMagazine "2Rnd_R73";
				_veh addWeapon "R73Launcher_2";
			};
			_veh removeMagazine "4Rnd_AT9_Mi24P"; // внешний вид
			_veh addMagazine "4Rnd_AT9_Mi24P";
		};
		*/
		///--- AV8B
		if (_type isKindOf "AV8B") then{
			_veh removeWeapon "BombLauncher";
			_veh removeMagazine "6Rnd_GBU12_AV8B";
			_veh addMagazine "2Rnd_Maverick_A10";
			_veh addMagazine "2Rnd_Maverick_A10";
			_veh addWeapon "MaverickLauncher";
			_veh addMagazine "2Rnd_Sidewinder_AH1Z";
			_veh addWeapon "SidewinderLaucher_AH1Z";
		};
		if (_type isKindOf "F35B") then{
			_veh removeWeapon "BombLauncherF35";
			_veh removeMagazine "2Rnd_GBU12";
			// if (random 10 > 1) then	{
				_veh addMagazine "2Rnd_Maverick_A10";
				_veh addWeapon "MaverickLauncher";
			// }else{
				// _veh addMagazine "2Rnd_Sidewinder_F35";
			// };
		};
		if (_type isKindOf "A10") then{
			_veh flyInHeight 150 + random 150;
			_veh removeWeapon "BombLauncherA10";
			_veh removeMagazine "4Rnd_GBU12";
				if((random 10 > 8)&&(LIB_ahAvail))then{
					_veh addMagazine "4Rnd_Hellfire";
					_veh addWeapon "HellfireLauncher_AH6";
				}
				else{
					_veh addMagazine "2Rnd_Maverick_A10";
					_veh addMagazine "2Rnd_Maverick_A10";
				};
		};
		if (LIB_ahAvail) then {
			if (_type isKindOf "Su34") then{
				if!(_isPlayer)then{
					// _veh removeMagazine "180Rnd_30mm_GSh301"; // целится не правильно
				};
				//_veh addMagazine ["180Rnd_30mm_GSh301",0];
			};
		};
	};
	if (_type isKindOf "LandVehicle") then {
		_veh setSkill ["commanding", 1];
	};

	} else {

		_type = _x;

		private["_typeL","_typeR"];
		_typeL = toLower _type;

		if (_night) then {
			if (_typeL == "ka52") then {
				_typeR = "ka52black";
			};
		};

		if (isNil "_typeR") then {
			_return set [count _return, _type];
		}else{
			_return set [count _return, _typeR];
		};

	};

}forEach (_this select 0);

diag_log format ["Log: [fnc_reweapon] out %1", _return];

_return;
