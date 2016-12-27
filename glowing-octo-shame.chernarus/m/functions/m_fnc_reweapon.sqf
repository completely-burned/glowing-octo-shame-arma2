/*

	private["_ok"]; _ok = [this] execVM "m\functions\m_fnc_reweapon.sqf";

*/

// if(isNil "LIB_ahAvail")then{
	// LIB_ahAvail = false;
	// if (configName(configFile >> "CfgVehicles" >> "TK_Soldier_Officer_EP1") != "") then {LIB_ahAvail = true};
// };

private["_isPlayer"];
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

// if (LIB_ahAvail) then { _Bombs=true;};
// private["_LaserBombs"];
// _LaserBombs=false;

{
	private["_type","_veh"];
	_veh = _x;
	_type = TypeOf _veh;

	if(_isPlayer)then{
		_veh allowCrewInImmobile true;
	};

	/// --- ������� --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// 
	if (_type isKindOf "Air") then{
		_veh setSkill ["aimingAccuracy", 0.4];
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
			_veh flyInHeight 400 + random 300;
			// if(!isNil "BIS_uav_0")then{ BIS_uav_0 synchronizeObjectsAdd [_veh] };
			// if (_type isKindOf "MQ9PredatorB" && _LaserBombs) then{
				// _veh removeMagazines "8Rnd_Hellfire";
				// _veh removeWeapon "HellfireLauncher";
				// _veh addMagazine "4Rnd_GBU12";
				// _veh addMagazine "4Rnd_GBU12";
				// _veh addWeapon "BombLauncherA10";
			// };
			if (LIB_ahAvail) then {
				_veh call (compile "_this allowCrewInImmobile true;"); // OA
			};
			_veh setVehicleLock "LOCKED";
			_veh addEventHandler ["GetOut", { deleteVehicle (_this Select 2) }];
		};
		if (_type isKindOf "Ka137_Base_PMC") then{
			if !("Laserdesignator_mounted" in weapons _veh) then {
				_veh addmagazine "laserbatteries";
				_veh addweapon "laserdesignator_mounted";
				_veh selectweapon "laserdesignator_mounted";
			};
			if (LIB_ahAvail) then {
				_veh call (compile "_this allowCrewInImmobile true;"); // OA
			};
			_veh setSkill ["aimingAccuracy", 0.1];
			_veh setVehicleLock "LOCKED";
			_veh addEventHandler ["GetOut", { deleteVehicle (_this Select 2) }];
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
					_veh removeMagazine "2Rnd_R73";
					_veh addMagazine "2Rnd_R73";
				};
			};
		};
		if (_type isKindOf "Ka52") then {
			if (LIB_ahAvail) then {
				_veh call (compile "_this loadMagazine [[0],'2A42','230Rnd_30mmHE_2A42']");
			};
		};
		///--- Mi24_P
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
			_veh removeMagazine "4Rnd_AT9_Mi24P";
			_veh addMagazine "4Rnd_AT9_Mi24P";
		};
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
			_veh forceSpeed 10000;
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
					_veh removeMagazine "180Rnd_30mm_GSh301";
				};
				//_veh addMagazine ["180Rnd_30mm_GSh301",0];
			};
		};
		if (_type isKindOf "Mi17_base") then{
			_veh setSkill ["aimingAccuracy", 0.1];
			if (_type isKindOf "Mi17_rockets_RU") then{
				_veh setSkill ["aimingAccuracy", 0.4];
			};
		};
		if (_type isKindOf "UH60_Base") then{
			_veh setSkill ["aimingAccuracy", 0.1];
		};
		if (_type isKindOf "CH47_base_EP1") then{
			_veh setSkill ["aimingAccuracy", 0.1];
		};
		if (_type isKindOf "UH1H_base") then{
			_veh setSkill ["aimingAccuracy", 0.1];
		};
	};
	if (_type isKindOf "LandVehicle") then {
		// _veh engineOn true;
		if (_type isKindOf "2S6M_Tunguska" || _type isKindOf "ZSU_Base" || _type isKindOf "Ural_ZU23_Base") then {
			_veh setSkill ["aimingAccuracy", 0.1];
			if (_type isKindOf "2S6M_Tunguska") then {
				_veh removeWeapon "2A38M";
				_veh addWeapon "2A38M";
			};
		}else{
			_veh setSkill ["aimingAccuracy", 0.7];
		};
		if (_type isKindOf "T34") then {
			_veh setSkill ["aimingAccuracy", 0.55];
			if (LIB_ahAvail) then {
				_veh call (compile "_this loadMagazine [[0],'ZiS_S_53','33Rnd_85mmHE']");
			};
		};
		_veh setSkill ["commanding", 1];
		// _veh setSkill ["aimingShake", 1];
		// _veh engineOn false;
	};
	
	
	/// --- ���� --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// --- /// 
	if (getNumber(configFile >> "CfgVehicles" >> _type >> "isMan") == 1) then {
		private["_weapons"];
		private["_weapon"];
		// _weapons = (getArray(configFile >> "CfgVehicles" >> _type >> "weapons"));
		// _weapon = (currentWeapon _veh);
		_weapons = weapons _veh;
		_weapon = (_weapons select 0);
		if ( _veh == leader _veh ) then {
			if !([LIB_cfgWea,_weapons,"simulation","Binocular"] call m_fnc_check_config_use) then {
					_veh addWeapon "Binocular";
			};
		};
		if ( ACE_Avail ) then {
			if (random 10 > 9) then {
				if ( _weapon in ["ACE_AK74M_PSO"] ) then {
					_veh removeWeapon _weapon;
					_weapon = "ACE_AK74M_TWS_FL";
					_veh addWeapon _weapon;
					_veh selectWeapon _weapon;
				};
			};
			if !(daytime > 3 && daytime < 20) then {
				if ("NVGoggles" in _weapons) then {
					if ( _weapon in ["ACE_AK74M_PSO"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "ACE_AK74M_PSO_FL";
						_veh addWeapon _weapon;
						_veh selectWeapon _weapon;
					};
					if ( _weapon in ["ACE_AK74M_Kobra"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "ACE_AK74M_Kobra_FL";
						_veh addWeapon _weapon;
						_veh selectWeapon _weapon;
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
			if ((getNumber(configFile >> "CfgWeapons" >> _weapon >> "type")) == 1) then {
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
				if (random 10 > 7) then {
					if ( _weapon in ["AKS_74_kobra","AKS_74_pso"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "AKS_74_GOSHAWK";
						_veh addWeapon _weapon;
						_veh selectWeapon _weapon;
					};
					if ( _weapon in ["m107"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "m107_TWS_EP1";
						_veh addWeapon _weapon;
						_veh selectWeapon _weapon;
					};
				};
				if (random 10 > 6.5) then {
					if ( _weapon in ["M240"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "m240_scoped_EP1";
						_veh addWeapon _weapon;
						_veh selectWeapon _weapon;
					};
					if ( _weapon in ["M249"] ) then {
						_veh removeWeapon _weapon;
						_weapon = "M249_m145_EP1"; // [["M249_m145_EP1", "M249_TWS_EP1"],[0.5,0.1]] call BIS_fnc_selectRandomWeighted;
						_veh addWeapon _weapon;
						_veh selectWeapon _weapon;
					};
				};
				if (random 10 > 7) then {
					if !(daytime > 3 && daytime < 20) then {
						if ( _weapon in ["AKS_74_kobra","AKS_74_pso"] ) then {
							_veh removeWeapon _weapon;
							_weapon = "AKS_74_NSPU";
							_veh addWeapon _weapon;
							_veh selectWeapon _weapon;
						};
						if ( _weapon in ["SVD","SVD_des_EP1","SVD_CAMO"] ) then {
							_veh removeWeapon _weapon;
							_weapon = "SVD_NSPU_EP1";
							_veh addWeapon _weapon;
							_veh selectWeapon _weapon;
						};
						if ( _weapon in ["FN_FAL"] ) then {
							_veh removeWeapon _weapon;
							_weapon = "FN_FAL_ANPVS4";
							_veh addWeapon _weapon;
							_veh selectWeapon _weapon;
						};
					};
				};
				///--- ����� USMC
				if (_type isKindOf "USMC_Soldier2") then {
					_veh removeMagazines "8Rnd_B_Beneli_74Slug";
					for "_i" from 1 to 8 do { _veh addMagazine "8Rnd_B_Beneli_Pellets"};
				};
				///--- Saiga12
				if (_type isKindOf "RU_Soldier2") then {
					_veh removeMagazines "8Rnd_B_Saiga12_74Slug";
					for "_i" from 1 to 8 do { _veh addMagazine "8Rnd_B_Saiga12_Pellets"};
				};
			};
			///--- Aziz
			if (_type isKindOf "TK_Aziz_EP1") then {
				for "_i" from 1 to 3 do { _veh addMagazine "30Rnd_545x39_AK"};
				_weapon = "AKS_74_GOSHAWK";
				_veh addWeapon _weapon;
				_veh selectWeapon "revolver_gold_EP1";
			};
		};
		///--- Bardak
		if (_type isKindOf "Ins_Bardak") then{
			for "_i" from 1 to 3 do { _veh addMagazine "30Rnd_762x39_AK47"};
			_weapon = "AKS_GOLD";
			_veh addWeapon _weapon;
			_veh selectWeapon _weapon;
		};
		if (_type isKindOf "RUS_Soldier_TL") then{
			// if ( _weapon in ["AKS_74_U"] ) then {
				// _veh removeWeapon _weapon;
				// _weapon = "AKS_74_NSPU";
				// _veh addWeapon _weapon;
				// _veh selectWeapon _weapon;
			// };
		};
		///--- �������� �������� �� ��������
		private["_type_weapon"];
		if (ACE_Avail) then {
			_type_weapon=getNumber (LIB_cfgWea >> _weapon >> "ace_sys_weapons_TYPE");
		}else{
			_type_weapon=getNumber (LIB_cfgWea >> _weapon >> "type");
		};
		if (_type_weapon == 5) then {
			if (getNumber (LIB_cfgWea >> _weapon >> "autoFire") != 1) then {
				_veh setSkill ["aimingAccuracy", 1];
			}else{
				if (([[_weapon],["M1014","Saiga12K","AA12_PMC"]] call m_fnc_CheckIsKindOfArray)) then {
					_veh setSkill ["aimingAccuracy", 0.09];
				}else{
					_veh setSkill ["aimingAccuracy", 0.75];
				};
				// _veh setSkill ["aimingShake", 0.5];
			};
		};
	};
	// _veh setSkill ["aimingSpeed",1];
	// _veh setSkill ["spotDistance", 1];
	// _veh setSkill ["spotTime", 1];
}forEach (_this select 0);
