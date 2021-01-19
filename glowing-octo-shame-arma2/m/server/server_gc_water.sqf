private["_veh_x","_timeIsWater","_assignedVehicle","_driver"];
while { true } do {

	{
		_veh_x = _x;

		if !(_veh_x call fnc_isPlayer) then {
			if ({_x call fnc_isPlayer} count units _veh_x == 0) then {

				scopeName "forEach1";

				// водитель корабля далеко от корабля
				_assignedVehicle = assignedVehicle _veh_x;
				if (!isNull _assignedVehicle) then {
					if(_assignedVehicle isKindOf "Ship")then{
						_driver = assignedDriver _assignedVehicle;
						if(_assignedVehicle distance vehicle _driver > 2)then{
							_veh_x setDamage 1;
							breakTo "forEach1";
						};
					};
				};

				// пехота на воде, долгое время
				if (vehicle _veh_x == _veh_x) then {
					if (surfaceIsWater getPos vehicle _veh_x) then {
						_timeIsWater = (_veh_x getVariable "timeIsWater");
						if ( isNil "_timeIsWater" ) then {
							_timeIsWater = ( time + 120 );
							_veh_x setVariable ["timeIsWater", _timeIsWater];
						}else{
							if ( _timeIsWater < time )then {
								_veh_x setDamage 1;
								breakTo "forEach1";
							};
						};
					}else{
						_veh_x setVariable ["timeIsWater", nil];
					};
				};
			};
		};

	} forEach allUnits;

	sleep 10;

};
