#define __A2OA__
/*
 * Скрипт меняет точность юнитам.
 * TODO: Рефакторинг.
 */


private["_type","_veh","_target","_weapons","_weapon","_n","_b",
	"_str","_type_weapon","_z","_aimAcc","_mags_he","_def_aimAcc"];
private["_diag_log"]; _diag_log = [];
_veh = _this select 0;

_type = TypeOf _veh;

// _reloadSpeed = 1;
_mags_he = ["rockets","heat"];

scopename "scope1";

if (true) then {

	// --- Man
	if (getNumber(configFile >> "CfgVehicles" >> _type >> "isMan") == 1) then {
		if (vehicle _veh == _veh) then {

			// _weapons = (getArray(configFile >> "CfgVehicles" >> _type >> "weapons"));
			// _weapon = (currentWeapon _veh);
			_weapons = weapons _veh;
			if (count _weapons > 0) then {
				_weapon = (_weapons select 0);

				if (ACE_Avail) then {
					_type_weapon=getNumber (LIB_cfgWea >> _weapon >> "ace_sys_weapons_TYPE");
				}else{
					_type_weapon=getNumber (LIB_cfgWea >> _weapon >> "type");
				};
				if (_type_weapon == 5) then {
					if (getNumber (LIB_cfgWea >> _weapon >> "autoFire") != 1) then {
						_aimAcc = 1;
						_diag_log = _diag_log + [format ["Log: [fnc_dynSkill] %1 %2 снайпер %3 %4", _veh, _type, _weapon, _aimAcc]];
						breakOut "scope1";
					}else{
						if (([[_weapon],["M1014","Saiga12K","AA12_PMC"]] call gosa_fnc_CheckIsKindOfArray)) then {
							_aimAcc = 0.09;
							_diag_log = _diag_log + [format ["Log: [fnc_dynSkill] %1 %2 дробь %3 %4", _veh, _type, _weapon, _aimAcc]];
							breakOut "scope1";
						//}else{
							//_aimAcc = 0.75;
						};

						// восстанавливает экипажу вне
						_z = _veh getVariable "gosa_skill_aimAcc_def";
						if (!isNil{_z}) then {
							//_z = _veh skill "aimingAccuracy";
							//if (_z != _def_aimAcc) then {
								_aimAcc = +_z;
								_diag_log = _diag_log + [format ["Log: [fnc_dynSkill] %1 %2 вне машины, восстановление %3", _veh, _type, _aimAcc]];
								breakOut "scope1";
							//};
						};
					};
				};
			};
		};

	}else{
	// --- в машине

		//--- перманентное значение
		_z = _veh getVariable "gosa_skill_aimAcc_static";
		if (!isNil {_z}) exitWith {
			_aimAcc = +_z;
			breakOut "scope1";
		};

		//if (vehicle _veh != _veh) then {
			if (_type isKindOf "Air") then{

				//--- низкая точность если рядом с целью нет союзников
				_z = assignedTarget _veh;
				_b = false;
				if (isNull _z) then {
					_b = true;
				}else{
					if (_veh countFriendly (_z nearEntities 75) <= 0) then {
						_b = true;
					};
				};
				if (_b) then {
					_aimAcc = 0.1;
					_diag_log = _diag_log + [format ["Log: [fnc_dynSkill] %1 %2 рядом с целью нет союзников %3 %4", _veh, _type, _z, _aimAcc]];
					breakOut "scope1";
				};

				#ifdef __A2OA__
				// магазины пилота отличаются от основных
				_z = _veh magazinesTurret [-1];

				//--- средняя точность для нар
				if ({getText(configFile >> "CfgMagazines" >> _x >> "nameSound") in _mags_he} count _z > 0) then{
					_aimAcc = 0.4;
					_diag_log = _diag_log + [format ["Log: [fnc_dynSkill] %1 %2 нар %3 %4", _veh, _type, _z, _aimAcc]];
					breakOut "scope1";
				};
				#endif

				if (_type isKindOf "Helicopter") then{

					/*
					/--- низкая точность если рядом с целью нет союзников
					//_z = assignedTarget _veh;
					if (isNull _z or {_veh countFriendly (_z nearEntities 75) == 0}) then {
						_aimAcc = 0.1;
						diag_log format ["Log: [fnc_dynSkill] %1 %2 рядом с целью нет союзников %3 %4", _veh, _type, _z, _aimAcc];
						breakOut "scope1";
					};
					*/


					/*
					//--- смешанное вооружение
						if (_type isKindOf "Mi17_base") then{
							if ("128Rnd_57mm" in _z or "192Rnd_57mm" in _z) then{
							//if ({getText(configFile >> "CfgMagazines" >> _x >> "nameSound") == "rockets"} count _z > 0) then{
								_aimAcc = 0.4;
							}else{
								_aimAcc = 0.1;
							};
							breakOut "scope1";
						};

						if (_type isKindOf "UH1Y") then {
							if ("14Rnd_FFAR" in _z) then{
								_aimAcc = 0.4;
							}else{
								_aimAcc = 0.1;
							};
							breakOut "scope1";
						};
					*/

					//--- низкая точность, пулеметы, вооружение неизменно
						if (_type isKindOf "Ka137_Base_PMC") then{
							_aimAcc = 0.1;
							_veh setVariable ["gosa_skill_aimAcc_static", _aimAcc];
							breakOut "scope1";
						};

						if (_type isKindOf "UH60_Base") then{
							_aimAcc = 0.1;
							_veh setVariable ["gosa_skill_aimAcc_static", _aimAcc];
							breakOut "scope1";
						};

						if (_type isKindOf "CH47_base_EP1") then{
							_aimAcc = 0.1;
							_veh setVariable ["gosa_skill_aimAcc_static", _aimAcc];
							breakOut "scope1";
						};

						if (_type isKindOf "UH1H_base") then{
							_aimAcc = 0.1;
							_veh setVariable ["gosa_skill_aimAcc_static", _aimAcc];
							breakOut "scope1";
						};

				};

				/*
				//--- низкая точность если рядом с целью нет союзников
				_z = assignedTarget _veh;
				if (isNull _z or {_veh countFriendly (_z nearEntities 75) == 0}) then {
					_aimAcc = 0.1;
					diag_log format ["Log: [fnc_dynSkill] %1 %2 рядом с целью нет союзников %3 %4", _veh, _type, _z, _aimAcc];
					breakOut "scope1";
				};
				*/

				_aimAcc = 0.4;
				_diag_log = _diag_log + [format ["Log: [fnc_dynSkill] %1 %2 вне учета %3", _veh, _type, _aimAcc]];

			};

			if (_type isKindOf "LandVehicle") then {

				// _veh engineOn true;
				/*
				if (_type isKindOf "2S6M_Tunguska" || _type isKindOf "ZSU_Base" || _type isKindOf "Ural_ZU23_Base" || _type isKindOf "HMMWV_Avenger") then {
					_aimAcc = 0.1;
					breakOut "scope1";
				};
				*/

				_z = assignedTarget _veh;
				// по танкам лучше не промахиваться
				if (_z isKindOf "Tank") then {
					_aimAcc = 0.7;
					_diag_log = _diag_log + [format ["Log: [fnc_dynSkill] %1 %2 цель %3 %4", _veh, _type, [_z, typeOf _Z], _aimAcc]];
					breakOut "scope1";
				};

				/*if (_type isKindOf "T34" || _type isKindOf "T55") then {
					_aimAcc = 0.1;
					breakOut "scope1";
				};

				if (_type isKindOf "AAV") then {
					_aimAcc = 0.1;
					breakOut "scope1";
				};

				if (_type isKindOf "StrykerBase_EP1") then{
					_aimAcc = 0.1;
					breakOut "scope1";
				};

				if (_type isKindOf "GAZ_Vodnik_HMG") then{
					_aimAcc = 0.1;
					breakOut "scope1";
				};

				if (_type isKindOf "UAZ_AGS30_Base") then{
					_aimAcc = 0.1;
					breakOut "scope1";
				};

				if (_type isKindOf "UAZ_MG_Base") then{
					_aimAcc = 0.1;
					breakOut "scope1";
				};

				if (_type isKindOf "Offroad_DSHKM_Gue" || _type isKindOf "Offroad_DSHKM_Gue" || _type isKindOf "Pickup_PK_base") then{
					_aimAcc = 0.1;
					breakOut "scope1";
				};

				if (_type isKindOf "HMMWV_Base" && !(_type isKindOf "HMMWV_TOW")) then{
					_aimAcc = 0.1;
					breakOut "scope1";
				};*/

				_aimAcc = 0.1;
				_diag_log = _diag_log + [format ["Log: [fnc_dynSkill] %1 %2 вне учета %3", _veh, _type, _aimAcc]];
			};
		//};

	};

};

if !(isNil "_aimAcc") then {

	_efc = effectiveCommander _veh;

	_str = "aimingAccuracy";
	_n = ([_str, _efc skill _str] call gosa_fnc_skill_normalize_CfgAISkill);
	if (isNil{_efc getVariable "gosa_skill_aimAcc_def"}) then {
		_efc setVariable ["gosa_skill_aimAcc_def", _n];
		diag_log format ["Log: [fnc_dynSkill] %1 %2 default aimingAccuracy %3", _efc, _type, _n];
	};

	// _z = _efc getVariable "gosa_skill_aimAcc";
	if (_n != _aimAcc) then {
		_efc setSkill [_str, _aimAcc];
		// _efc setVariable ["gosa_skill_aimAcc", _aimAcc];
		{diag_log _x} forEach _diag_log;
		diag_log format ["Log: [fnc_dynSkill] %1 %2 set_aimAcc %3", _efc, _type, _aimAcc];
	};
};
