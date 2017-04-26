
if(isServer && isMultiplayer)then{

	private["_unit","_vehicle"];
	_vehicle = _this select 0;
	// _position = _this select 1;
	_unit = _this select 2;
	
	if(!local _unit)then{
		_unit setVariable ["assignedVehicle",[_this select 0],true];
	};

	Private["_time","_time2"];
	_time = (_vehicle getVariable "time");
	if ( isNil "_time" ) then {
		_time = time;
	};
	_time2 = (time + (2.5*60) + 60 + (getNumber (missionConfigFile/"respawnDelay")));
	if ( _time < _time2)then {
		_vehicle setVariable ["time", _time2+60+60];
	};
	
	// group _unit addVehicle _vehicle;
	
};