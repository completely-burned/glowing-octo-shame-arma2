{
	private["_veh"];
	_veh=_x;
	if(alive  _veh) then {
		// if ( [ _veh, [
			// "ATV_Base_EP1", 
			// "BTR40_base_EP1",
			// "HMMWV",
			// "HMMWV_M1035_DES_EP1", 
			// "Kamaz", 
			// "LandRover_CZ_EP1", 
			// "MTVR", 
			// "Motorcycle", 
			// "SUV_Base_EP1", 
			// "UAZ_Unarmed_Base", 
			// "Ural_Base", 
			// "V3S_Base"
			// "GAZ_Vodnik", 
			// "Pickup_PK_base", 
			// "Volha_TK_CIV_Base_EP1", 
		// ]] call m_fnc_CheckIsKindOfArray) then {
			// ([AssignedDriver _veh]+(AssignedCargo _veh)+[assignedCommander _veh]+[assignedGunner _veh]) AllowGetIn false;
		// }else{
			// {unassignVehicle _x}foreach(AssignedCargo _veh);
			(AssignedCargo _veh) AllowGetIn false;
			private["_driver"];
			_driver = Driver _veh;
			_driver DoMove GetPos _veh;
			// _driver DisableAI "Move";
			// _driver Spawn {Sleep 30; _this EnableAI "Move";};
		// };
	};
}foreach _this;
