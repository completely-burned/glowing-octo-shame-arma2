// vehicle: Object - Vehicle the event handler is assigned to
// position: String - Can be either "driver", "gunner", "commander" or "cargo"
// unit: Object - Unit that leaved the vehicle

private ["_vehicle","_position","_unit"];
_vehicle = _this select 0;
_position = _this select 1;
_unit = _this select 2;

private ["_driver","_grp"];
_driver = driver _vehicle;
_grp = group _unit;

// временная остановка транспорта
if(isNil {_driver getVariable "disableAIMove"} && _position != "driver")then{
	_driver spawn {
		_this setVariable ["disableAIMove", true];
		_this disableAI "Move";
		sleep 10;
		_this enableAI "Move";
		_this setVariable ["disableAIMove", nil];
	};
};

// пехота отходит от транспорта



