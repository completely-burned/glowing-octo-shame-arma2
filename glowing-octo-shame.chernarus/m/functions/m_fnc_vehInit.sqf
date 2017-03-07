if (getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isMan") == 1) then {
	if({isPlayer _x} count units _this > 0)then{
		[nil, _this, "per", rAddEventHandler, "handledamage", {_this call m_FirstAid_handleDamage}] call RE;
		[nil, _this, "per", rAddEventHandler, "handleheal", {_this spawn m_FirstAid_handleHeal}] call RE;
	};
}else{
	[nil, _this, "per", rAddEventHandler, "HandleDamage", {_this call draga_fnc_vehicleHandleDamage}] call RE;
	[nil, _this, "per", rAddEventHandler, "GetIn", {
		if (isServer) then {
			private["_veh"];
			_veh = _this select 0;
			if (({!isNull _x} count crew _veh)>0) then{
				private["_time"];
				_time = (_veh getVariable "time");
				if ( isNil "_time" ) then {
					_time = ( time + ( 180 ) );
					_veh setVariable ["time", _time];
				};
				if ( _time < ( time + 180 ) )then {
					_time = time + 180;
					_veh setVariable ["time", _time];
				};
			};
		};
	}] call RE;
	[nil, _this, "per", rAddEventHandler, "GetOut", {
		if (isServer) then {
			private["_veh"];
			_veh = _this select 0;
			if (({!isNull _x} count crew _veh)>0) then{
				private["_time"];
				_time = (_veh getVariable "time");
				if ( isNil "_time" ) then {
					_time = ( time + ( 180 ) );
					_veh setVariable ["time", _time];
				};
				if ( _time < ( time + 180 ) )then {
					_time = time + 180;
					_veh setVariable ["time", _time];
				};
			};
		};
	}] call RE;
	_this setVehicleLock "UNLOCKED";
};
