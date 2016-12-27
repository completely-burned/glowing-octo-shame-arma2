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

{
	_x call m_fnc_vehInit;
}forEach vehicles;

{
	_x call m_fnc_vehInit;
}forEach allUnits;

{
	_x allowDamage false;
	_x setVariable ["_noDelete",true];
}forEach(allMissionObjects 'MASH')+(allMissionObjects 'ReammoBox')+(allMissionObjects 'WarfareBCamp'); 

{
	_x allowDamage false;
	//_x spawn m_fnc_mobileHQ_init;
}forEach (allMissionObjects "Warfare_HQ_base_unfolded");
