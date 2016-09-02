Private "_deleteList";
_deleteList=[];

{
	if ( isNil {_x getVariable "_noDelete"} ) then {
		_deleteList set [count _deleteList,_x];
	};
}
forEach (allMissionObjects 'MASH'); 

{
	if (!alive _x) then {
		deleteVehicle _x;
	}else{
		if (getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "showweaponcargo") == 1) then {
			_deleteList set [count _deleteList,_x];
		}else{
			if ( isNil {_x getVariable "_noDelete"} ) then {
				_deleteList set [count _deleteList,_x];
			};
			_x call m_fnc_updateReammoBox;
			sleep 1;
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
		private["_veh"];
		_veh = _x;
		if( isNil {_veh getVariable "_noDelete"} )then{
			if (({alive _x} count crew _veh)==0) then{
				deleteVehicle _veh;
			};
		};
	} forEach (nearestObjects [getMarkerPos "respawn_guerrila", ["AllVehicles","Strategic"], safeDistance])+(nearestObjects [getMarkerPos "respawn_civilian", ["AllVehicles","Strategic"], safeDistance])+(nearestObjects [getMarkerPos "respawn_west", ["AllVehicles","Strategic"], safeDistance])+(nearestObjects [getMarkerPos "respawn_east", ["AllVehicles","Strategic"], safeDistance]);
	
(_deleteList) call fnc_cleanup;
