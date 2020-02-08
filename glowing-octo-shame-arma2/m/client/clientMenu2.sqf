_Man=[]; _Ammo=[]; _Car=[]; _Motorcycle=[]; _Tank=[]; _Helicopter=[]; _Plane=[]; _Uav=[]; _Ship=[]; 
for "_i" from 0 to ((count (configFile >> "CfgVehicles")) - 1) do {
	private "_entry"; _entry = ((configFile >> "CfgVehicles") select _i);
	if (isClass _entry) then {
		if ((getNumber(_entry >> "scope")) == 2) then {
			_libEnabled = [_entry] call fnc_libEnabled;
			if (_libEnabled) then {
				private ["_faction","_vehicleclass","_type"];
				_faction = getText(_entry >> "faction");
				_vehicleclass = getText(_entry >> "vehicleclass");
				_type = configName _entry;
			};
		};
	};
};