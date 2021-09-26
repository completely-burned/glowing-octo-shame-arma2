private["_obj","_a","_t"];

while {true} do {
	_obj = nearestObject [getPos player, "All"];
	_t = typeOf _obj;
	if ([[_t],["LandVehicle","Air"]] call gosa_fnc_CheckIsKindOfArray) then {
		if (isNil {_obj getVariable "gosa_repairAction"}) then {
			_a = _obj addAction [
				format ["%1 %2","repair",
					getText (configFile >> "CfgVehicles" >> _t >> "displayName")],
				'dir\actions\act_repairVehicle.sqf',[],0, false
			];
			_obj setVariable ["gosa_repairAction", _a];
		};
	};
	sleep 5;
};

