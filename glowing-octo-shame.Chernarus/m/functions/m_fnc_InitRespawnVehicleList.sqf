respawnVehicleList=[];
{
	private ["_respawnVehicle"];
	_respawnVehicle = (_x getVariable "respawnVehicle");
	if (!isNil "_respawnVehicle") then {
		private ["_type"]; 
		_type = _x getVariable "respawnType"; 
		if(isNil "_type")then{
			_type = typeOf _x;
		}else{
			deleteVehicle _x;
		}; 
		respawnVehicleList = respawnVehicleList + [[_x, [getPos _x, getDir _x], _type]];
		_x setVehicleLock "UNLOCKED";
	};
		// _x addEventHandler ["GetIn",{_this call m_fnc_EH_GetIn}];
}forEach vehicles;
