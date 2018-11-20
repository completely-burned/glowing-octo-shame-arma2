private["_draga_init"];
_draga_init = (_this getVariable "_draga_init");
if (isNil "_draga_init") then {
	if (getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isMan") == 1) then {
		if(isPlayer _this or _this in playableUnits)then{
		_this addEventHandler ["handledamage", {_this call m_FirstAid_handleDamage}];
		_this addEventHandler ["handleheal", {_this spawn m_FirstAid_handleHeal}];
		};
	}else{
		_this addEventHandler ["HandleDamage", {_this call draga_fnc_vehicleHandleDamage}];
		_this addEventHandler ["GetIn", {
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
		}];
		_this addEventHandler ["GetOut", {
			private["_unit"];
			_unit = _this select 2;
			if(isPlayer _unit)then{
				unassignVehicle _unit;
			};
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
		}];
	};
	_this setVehicleLock "UNLOCKED";
	_this setVariable ["_draga_init",true]; 
};
