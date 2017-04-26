private["_vehPlayer","_enableAction","_vehicle","_action","_actionVehicleCargo"];

while {true} do {

	_vehPlayer = vehicle player;
	_enableAction = false;

	if(_vehPlayer isKindOf "helicopter")then{
		if(alive _vehPlayer)then{
			if(canMove _vehPlayer)then{
				if((_vehPlayer emptyPositions "driver")==0)then {
					if ((getPosATL _vehPlayer select 2)>1) then {
						_vehicle = nearestObject [_vehPlayer, "LandVehicle"];
						if !(isNull _vehicle) then {
							if ((_vehicle distance _vehPlayer) <= 17) then {
								if (({alive _x} count (crew _vehicle))==0) then {
									if (isNil {_vehPlayer getVariable "m_fnc_WinchManager_cargo"}) then {
										_enableAction = true;
									};			
								};			
							};			
						};	
					};
				};
			};
		};

		if (!isNil {_action}) then {
			if (!isNil {_actionVehicleCargo}) then {
				if (_actionVehicleCargo != _vehicle) then{
					_vehPlayer removeAction _action;
					_action = nil;
				};
			};
		};

		if(_enableAction)then{
			if (isNil {_action}) then {
				private["_name"];
				_name = gettext(configFile >> "CfgVehicles" >> (typeof _vehicle) >> "displayName");
				_action = _vehPlayer addAction [format["Pick: %1",_name], "m\functions\ACT_WinchPick.sqf", _vehicle];
				_actionVehicleCargo = _vehicle;
			};
		}else{
			if (!isNil {_action}) then {
				_vehPlayer removeAction _action;
				_action = nil;
			};
		};
	};
	sleep 0.5;
};
