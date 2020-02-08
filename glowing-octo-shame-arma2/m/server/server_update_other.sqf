{
	_x allowDamage false;
	_x setVariable ["_noDelete",true];
}forEach(allMissionObjects 'MASH')+(allMissionObjects 'ReammoBox')+(allMissionObjects 'WarfareBCamp');

{
	_x allowDamage false;
	//_x spawn m_fnc_mobileHQ_init;
	_x setVariable ["_noDelete",true];
}forEach (allMissionObjects "Warfare_HQ_base_unfolded");

Private ["_deleteList"];
while{true}do{
_deleteList=[];

{
	if ( isNil {_x getVariable "_noDelete"} ) then {
		_deleteList set [count _deleteList,_x];
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
			if ({alive _x} count (nearestObjects [_box, draga_objectsReammo, draga_distanceReammo]) > 0) then {
				// _box call m_fnc_updateReammoBox; // переполнение
			};
		};
	};
}
forEach (allMissionObjects 'ReammoBox');

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

{
	private ["_obj"];
	_obj = _x;
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
} forEach vehicles+(allMissionObjects 'ReammoBox');

(_deleteList) call fnc_cleanup;
	sleep 1;
};
