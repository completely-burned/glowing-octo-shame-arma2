private["_draga_init"];
_draga_init = (_this getVariable "_draga_init");
if (isNil "_draga_init") then {
	if (getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isMan") == 1) then {

		if (isNil {_this getVariable "BIS_BC_carrier"}) then {_this setVariable ["BIS_BC_carrier",false];};
		if (isNil {_this getVariable "BIS_BC_dragger"}) then {_this setVariable ["BIS_BC_dragger",false];};
		if (isNil {_this getVariable "BIS_IS_inAgony"}) then {_this setVariable ["BIS_IS_inAgony",false];};

		if(isPlayer _this or _this in playableUnits)then{
			if (local _this) then {
				//_this addEventHandler ["handledamage", {_this call m_FirstAid_handleDamage}];
				//_this addEventHandler ["handleheal", {_this spawn m_FirstAid_handleHeal}];
			};
		};
	}else{
		if (local _this) then {
			//_this addEventHandler ["HandleDamage", {_this call draga_fnc_vehicleHandleDamage}];
		};
		if (isServer) then {
			_this addEventHandler ["GetIn", {
				private["_veh"];
				_veh = _this select 0;
				private["_unit"];
				_unit = _this select 2;
				[_unit] allowGetin true;
				if (isServer) then {
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
				_this call fnc_eh_getout;
				private["_unit"];
				_unit = _this select 2;
				[_unit] allowGetin false;
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
	};
	_this setVehicleLock "UNLOCKED";
	_this setVariable ["_draga_init",true,false];
};
