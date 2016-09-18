while {true} do {
	private["_types","_times","_enable"];
	_types = availableVehiclesBuyMenu  select 0;
	_times = availableVehiclesBuyMenu  select 1;
	_enable = availableVehiclesBuyMenu  select 2;

	for "_i" from 0 to (count _types - 1) do {
		if (_enable select _i == 1) then {
			if (_times select _i > time) then {
				_enable set [_i, 0];
				[] call compile preprocessFileLineNumbers "m\Client\ClientMenu.sqf";
			};
		}else{
			if (_times select _i < time) then {
				_enable set [_i, 1];
				[] call compile preprocessFileLineNumbers "m\Client\ClientMenu.sqf";
			};
		};
	};

	sleep 0.5;
};
