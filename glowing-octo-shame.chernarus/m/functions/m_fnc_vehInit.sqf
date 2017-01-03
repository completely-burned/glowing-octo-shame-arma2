if (getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isMan") == 1) then {
	if(isPlayer leader _this or isPlayer _this)then{
		[nil, nil, "per", rSPAWN, _this, {
			_this addeventhandler ["handledamage",{
				_this call m_FirstAid_handleDamage
			}];
			_this addeventhandler ["handleheal",{
				_this spawn m_FirstAid_handleHeal;
			}];
		}] call RE;
	};
}else{
	_this addEventHandler ["GetIn",{
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
	_this addEventHandler ["GetOut",{
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
	_this setVehicleLock "UNLOCKED";
};
