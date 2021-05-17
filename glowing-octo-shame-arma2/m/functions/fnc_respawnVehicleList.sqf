if(isServer)then{
	respawnVehicleList = [];
	{
		private ["_type"]; 
		// _type = _x getVariable "respawnType"; 
		// if(isNil _type)then{
			_type = typeOf _x;
		// }else{
			// deleteVehicle _x;
		// }; 
		respawnVehicleList = respawnVehicleList + [[_x, [getPosATL _x, getDir _x], _type]]; 
	} forEach synchronizedObjects _this
};