#define __A2OA__

#ifdef __A2OA__

/*
TODO: слишком много allMissionObjects нагружает цп
*/

private ["_deleteList","_r_base","_arr","_box","_type","_pos","_dir",
	"_var_noDelete","_veh","_cfgVeh","_entry"];

_cfgVeh = LIB_cfgVeh;
_var_noDelete = "_noDelete";

_r_base = missionNamespace getVariable "respawn";
	if (_r_base == 0) then {
		_r_base = true;
	} else {
		_r_base = false;
	};


{
	_x allowDamage false;
	_x setVariable [_var_noDelete, true];
}forEach(allMissionObjects 'MASH')+(allMissionObjects 'ReammoBox')+(allMissionObjects 'WarfareBCamp');

{
	_x allowDamage false;
	//_x spawn gosa_fnc_mobileHQ_init;
	_x setVariable [_var_noDelete, true];
}forEach (allMissionObjects "Warfare_HQ_base_unfolded");

while{sleep 12 + random 5; true}do{

	diag_log format ["Log: [server_update_other] performance start %1", time];

	_deleteList=[];

	{
		if ( isNil {_x getVariable _var_noDelete} ) then {
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
				_veh setVariable [_var_noDelete, true];
			};
		};
	}
	forEach (allMissionObjects 'MASH');

	diag_log format ["Log: [server_update_other] performance MASH %1", time];

	//-- ReammoBox
	_arr = (allMissionObjects 
		#ifdef __ARMA3__
			"ReammoBox_F"
		#else
			"ReammoBox"
		#endif
	);
	sleep 3;
	for "_i" from 0 to (count _arr -1) do {
		_box = _arr select _i;
		_type = typeOf _box;
		_entry = _cfgVeh >> _type;
		if (alive _box) then {
			if (getNumber (_entry >> "showweaponcargo") > 0 or 
				toLower getText (_entry >> "vehicleclass") == "backpacks") then
			{
				_deleteList set [count _deleteList, _box];
			}else{
				if ( isNil {_box getVariable _var_noDelete} ) then {
					_deleteList set [count _deleteList, _box];
				};
				_box call gosa_fnc_updateReammoBox;
			};
		}else{
			if ( isNil {_box getVariable _var_noDelete} ) then {
				deleteVehicle _box;
			}else{
				_pos = getPos _box;
				//_pos resize 2;
				_dir = getDir _box;
				deleteVehicle _box;
				_box = createVehicle [_type, [0 + random 100, 0 + random 100], [], 0, "NONE"];
				_box allowDamage false;
				_box setDir _dir;
				_box setPos _pos;
				_box setVariable [_var_noDelete, true];
			};
		};
	};

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

	// TODO: Очистка места возрождения.

	diag_log format ["Log: [server_update_other] performance respawnSafe %1", time];

	(_deleteList) call gosa_fnc_cleanup;

	diag_log format ["Log: [server_update_other] performance end %1", time];
};

#endif
