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
		// FIXME: нет смысла, только лишняя перезапись
		// player setVariable ["gosa_assignedVehicle", nil];
	// } else {
		_vehVar = player getVariable "gosa_assignedVehicle";
		if (isNil {_vehVar}) then {
			player setVariable ["gosa_assignedVehicle", _veh, true];
		} else {
			if (_veh != _vehVar) then {
				player setVariable ["gosa_assignedVehicle", _veh, true];
			};
		};
	};
	sleep 0.5;
};
