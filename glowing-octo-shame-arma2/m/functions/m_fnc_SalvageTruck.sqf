private["_veh"];
if ([[_this], listSalvageTruck] call m_fnc_CheckIsKindOfArray) then {
	if (alive driver _this) then {
		{
			_veh = _x;
			if ( !alive _veh or ( !canMove _veh && ( {alive _x} count crew _veh == 0) ) ) then {
				deleteVehicle _veh;
			};
		} forEach nearestObjects [getPos _this, ["AllVehicles"], 10];
	};
};
