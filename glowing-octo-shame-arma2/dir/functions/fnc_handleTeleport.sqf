while {true} do{
	// [] call gosa_fnc_teleport;
	if (isnil {vehicle player getvariable "_teleport_action"} && !isnull player) then {
		private ["_action"];
		_action = vehicle player addaction ["Teleport", "dir\functions\action_teleport.sqf", '#USER:teleport_0', 0.5, false, false, "","_target == vehicle player"];
		vehicle player setvariable ["_teleport_action",_action];
	};
	sleep 0.5;
};
