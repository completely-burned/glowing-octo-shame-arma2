#define __A2OA__

#ifdef __A2OA__

/*
TODO: слишком много allMissionObjects нагружает цп
*/

private ["_deleteList","_r_base"];

_r_base = missionNamespace getVariable "respawn";
	if (_r_base == 0) then {
		_r_base = true;
	} else {
		_r_base = false;
	};


{
	_x allowDamage false;
	_x setVariable ["_noDelete",true];
}forEach(allMissionObjects 'MASH')+(allMissionObjects 'ReammoBox')+(allMissionObjects 'WarfareBCamp');

{
	_x allowDamage false;
	//_x spawn gosa_fnc_mobileHQ_init;
	_x setVariable ["_noDelete",true];
}forEach (allMissionObjects "Warfare_HQ_base_unfolded");

while{true}do{

	diag_log format ["Log: [server_update_other] performance start %1", time];

	_deleteList=[];

	{
		if ( isNil {_x getVariable "_noDelete"} ) then {
			if (!alive _x) then {
			_deleteList set [count _deleteList,_x];
			};
		}else{
			if (!alive _x) then {
				Private ["_type","_pos","_dir","_veh"];
				_type = typeOf _x;
				_pos = getPos _x;
				_pos resize 2;
				_dir = getDir _x;
				deleteVehicle _x;
				_veh = createVehicle [_type, [0,0], [], 0, "NONE"];
				_veh allowDamage false;
				_veh setDir _dir;
				_veh setPos _pos;
				_veh setVariable ["_noDelete",true];
			};
		};
	}
	forEach (allMissionObjects 'MASH');

	diag_log format ["Log: [server_update_other] performance MASH %1", time];

	{
		private["_box"];
		_box = _x;
		if (!alive _box) then {
			if ( isNil {_box getVariable "_noDelete"} ) then {
				deleteVehicle _box;
			}else{
				Private ["_type","_pos","_dir","_veh"];
				_type = typeOf _box;
				_pos = getPos _box;
				_pos resize 2;
				_dir = getDir _box;
				deleteVehicle _box;
				_veh = createVehicle [_type, [0,0], [], 0, "NONE"];
				_veh allowDamage false;
				_veh setDir _dir;
				_veh setPos _pos;
				_veh setVariable ["_noDelete",true];
			};
		}else{
			if (getNumber (configFile >> "CfgVehicles" >> typeOf _box >> "showweaponcargo") == 1 or getText (configFile >> "CfgVehicles" >> typeOf _box >> "vehicleclass") == "Backpacks") then {
				_deleteList set [count _deleteList,_box];
			}else{
				if ( isNil {_box getVariable "_noDelete"} ) then {
					_deleteList set [count _deleteList,_box];
				};
				_box call gosa_fnc_updateReammoBox;
			};
		};
	}
	forEach (allMissionObjects 'ReammoBox');

	diag_log format ["Log: [server_update_other] performance ReammoBox %1", time];

	{
		_x setAmmoCargo 1;
		_x setRepairCargo 1;
		_x setFuelCargo 1;
	}
	forEach (allMissionObjects "Base_WarfareBVehicleServicePoint");

	{
		if (!alive _x) then {
			deleteVehicle _x;
		};
	} forEach (allMissionObjects "WarfareBBaseStructure")+(allMissionObjects "Warfare_HQ_base_unfolded")+(allMissionObjects "BASE_WarfareBFieldhHospital");

	diag_log format ["Log: [server_update_other] performance WarfareBBaseStructure %1", time];

	if (_r_base) then {
		//--- очистка места возрождения
		{
			private ["_obj"];
			_obj = _x;
			// TODO: нужно оптимизировать код
			if ({alive _x} count nearestObjects [getPos _obj, HQ, respawnSafeDistance] > 0) then {
				if( isNil {_obj getVariable "_noDelete"} )then{
					if(!alive _obj)then{
						deleteVehicle _obj;
					}else{
						if (({alive _x} count crew _obj)==0) then{
							deleteVehicle _obj;
						};
					};
				};
			};
		// TODO: нужно оптимизировать код
		} forEach vehicles+(allMissionObjects 'ReammoBox');
	};

	diag_log format ["Log: [server_update_other] performance respawnSafe %1", time];

	(_deleteList) call gosa_fnc_cleanup;

	diag_log format ["Log: [server_update_other] performance end %1", time];

	sleep 15 + random 5;
};

#endif
