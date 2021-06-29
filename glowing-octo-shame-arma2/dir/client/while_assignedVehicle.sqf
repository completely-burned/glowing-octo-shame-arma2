/*assignedVehicle работает только локально, поэтому будет использоваться глобальная переменная.
 * При перерождении на мертвом теле остается переменная.
 * TODO: На мервом теле нужно удалять переменную.
 * Может лучше переписать это на event handler?
 */

private["_veh","_vehVar"];

while{true}do{

	_veh = assignedVehicle player;
	if (isNull _veh) then {
		if (vehicle player != player) then {
			_veh = vehicle player;
		};
	};

	if (!isNull _veh) then {
		// player setVariable ["assignedVehicle", nil]; // FIXME: нет смысла, только лишняя перезапись
	// } else {
		_vehVar = player getVariable "assignedVehicle";
		if (isNil {_vehVar}) then {
			player setVariable ["assignedVehicle", _veh, true];
		} else {
			if (_veh != _vehVar) then {
				player setVariable ["assignedVehicle", _veh, true];
			};
		};
	};
	sleep 0.5;
};
