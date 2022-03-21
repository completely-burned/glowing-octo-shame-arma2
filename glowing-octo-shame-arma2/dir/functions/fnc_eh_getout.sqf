// vehicle: Object - Vehicle the event handler is assigned to
// position: String - Can be either "driver", "gunner", "commander" or "cargo"
// unit: Object - Unit that leaved the vehicle

private ["_vehicle","_position","_unit","_driver","_grp","_newGrp","_type"];
_vehicle = _this select 0;
_position = _this select 1;
_unit = _this select 2;
_type = typeOf _vehicle;

diag_log format ["Log: [fnc_eh_getout.sqf] %1 %2", _this, _type];

_driver = driver _vehicle;
_grp = group _unit;

// временная остановка транспорта чтобы не задавить
if(isNil {_driver getVariable "gosa_disableAIMove"} && _position != "driver" && _type isKindOf "LandVehicle")then{
	_driver spawn {

		diag_log format ["Log: [fnc_eh_getout.sqf]: %1 disableAIMove, временная остановка транспорта", _this];

		_this setVariable ["gosa_disableAIMove", true];
		_this disableAI "Move";
		sleep 10;
		_this enableAI "Move";
		_this setVariable ["gosa_disableAIMove", nil];

		diag_log format ["Log: [fnc_eh_getout.sqf]: %1 enableAIMove", _this];
	};
};


// приказы ии командира
[_unit] allowGetin false;
if(_unit call gosa_fnc_isPlayer)then{
	diag_log format ["Log: [fnc_eh_getout.sqf] unassignVehicle %1", _unit];
	unassignVehicle _unit;
};
