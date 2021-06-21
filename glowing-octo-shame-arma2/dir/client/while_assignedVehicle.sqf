// assignedVehicle работает только локально, поэтому будет использоваться глобальная переменная

while{true}do{

	_assignedVehicle = assignedVehicle player;

	if (isNull _assignedVehicle) then {
		if (vehicle player != player) then {
			_assignedVehicle = vehicle player;
		};
	};

	if (isNull _assignedVehicle) then {
		player setVariable ["assignedVehicle", nil];
	} else {
		_assignedVehicleVar = player getVariable "assignedVehicle";
		if (!isNil {_assignedVehicleVar}) then {
			if (_assignedVehicle != _assignedVehicleVar) then {
				player setVariable ["assignedVehicle", _assignedVehicle, true];
			};
		};
	};
	sleep 0.5;
};
