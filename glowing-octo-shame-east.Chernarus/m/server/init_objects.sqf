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
