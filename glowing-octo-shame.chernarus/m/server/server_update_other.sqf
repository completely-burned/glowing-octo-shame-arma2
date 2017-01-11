while{true}do{
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
	private ["_objects"];
	_objects = allMissionObjects _x;
	{
		private ["_obj"];
		_obj = _x;
		{
			if( isNil {_x getVariable "_noDelete"} )then{
				if(!alive _x)then{
					deleteVehicle _x;
				}else{
					if(_obj distance _x < 10)then{
						if (({alive _x} count crew _x)==0) then{
							deleteVehicle _x;
						};
					};
				};
			};
		} forEach nearestObjects [getPos _obj, ["AllVehicles","Strategic"], 50]
	} forEach _objects;
} forEach HQ;
	
(_deleteList) call fnc_cleanup;
	sleep 1;
};
