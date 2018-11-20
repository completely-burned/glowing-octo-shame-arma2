if ([[_this], listSalvageTruck] call m_fnc_CheckIsKindOfArray) then {
	if (alive driver _this) then {
		{
			if (!alive _x or !canMove _x) then {
				deleteVehicle _x;
			};
		} forEach nearestObjects [getPos _this, ["AllVehicles"], 10];
	};
};
