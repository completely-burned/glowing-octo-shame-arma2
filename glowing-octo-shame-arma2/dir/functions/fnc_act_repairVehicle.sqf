private["_a"];

if ([[_this select 1],["LandVehicle","Air"]] call gosa_fnc_CheckIsKindOfArray) then {
	if (isNil {_this select 0 getVariable "gosa_repairAction"}) then {
		_a = _this select 0 addAction [
			format ["%1 %2","repair",
				getText (configFile >> "CfgVehicles" >> (_this select 1) >> "displayName")],
			'dir\actions\act_repairVehicle.sqf',[],0, false
		];
		_this select 0 setVariable ["gosa_repairAction", _a];
	};
};
