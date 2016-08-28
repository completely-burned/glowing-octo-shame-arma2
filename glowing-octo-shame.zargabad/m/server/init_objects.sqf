processInitCommands;

// if !(LIB_ahAvail) then {
	// {
		// // нужно чтоб трупы удалялись, только в A2, в OA используется allDead
		// _x addEventHandler ["killed", {[_this select 0] call BIS_GC_trashItFunc;}];		
		// if !(alive _x) then {
			// // deleteVehicle _x;
			// [_x] call BIS_GC_trashItFunc;
		// };
	// } ForEach ( allUnits - playableUnits);//  + vehicles
// };

respawnVehicleList=[];
{
	private ["_respawnVehicle"];
	_respawnVehicle = (_x getVariable "respawnVehicle");
	if (!isNil "_respawnVehicle") then {
		private ["_type"]; 
		_type = _x getVariable "respawnType"; 
		if(isNil "_type")then{
			_type = typeOf _x;
		// }else{
			// deleteVehicle _x;
		}; 
		respawnVehicleList = respawnVehicleList + [[_x, [getPos _x, getDir _x], _type]];
		_x setVehicleLock "UNLOCKED";
	};
	// _x addEventHandler ["GetIn",{_this call m_fnc_EH_GetIn}];
	_x call m_fnc_vehInit;
}forEach vehicles;

{
	_x call m_fnc_vehInit;
}forEach allUnits;

{
	_x allowDamage false;
	_x setVariable ["_noDelete",true];
}forEach(allMissionObjects 'MASH')+(allMissionObjects 'ReammoBox'); 

{
	_x allowDamage false;
	//_x spawn m_fnc_mobileHQ_init;
}forEach (allMissionObjects "Warfare_HQ_base_unfolded");
