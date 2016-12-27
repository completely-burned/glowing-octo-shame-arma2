private ["_fnc_libEnabled"];
_fnc_libEnabled = {
	private ["_entry"];
	_entry = _this select 0;
	private ["_libEnabled", "_disabledProperty"];
	_libEnabled = true;
	
	_disabledProperty = _entry >> "Armory" >> "disabled";
	if ((configName _disabledProperty) == "") then 
	{
		_disabledProperty = _entry >> "Library" >> "disabled";
	};
	if ((configName _disabledProperty) != "") then 
	{
		if ((getNumber _disabledProperty) == 1) then {_libEnabled = false};
	} 
	else 
	{
		_disabledProperty = _entry >> "Armory" >> "libEnabled";				
		if ((configName _disabledProperty) == "") then 
		{
			_disabledProperty = _entry >> "Library" >> "libEnabled";
		};
		if ((configName _disabledProperty) != "") then 
		{	
			if ((getNumber _disabledProperty) == 0) then {_libEnabled = false};
		};
	};
	_libEnabled;
};

// private ["_dataListWeh"];
// _dataListWeh = [];
// for "_i" from 0 to ((count (configFile >> "CfgVehicles")) - 1) do {
	// private ["_entry"];
	// _entry = ((configFile >> "CfgVehicles") select _i);
	// if (isClass _entry) then
	// {
		// if ((getNumber(_entry >> "scope")) == 2) then
		// {
			// _libEnabled = [_entry] call _fnc_libEnabled;
			// if (_libEnabled) then
			// {
				// if (({getText(_entry >> "vehicleclass") == _x} count ["Car", "Air"]) > 0) then
				// {
					// _dataListVeh = _dataListVeh + [_entry];
				// };
			// };
		// };
	// };
// };
private ["_dataListWea"];
_dataListWea = []; 
for "_i" from 0 to ((count (configFile >> "CfgWeapons")) - 1) do {
	private ["_entry"];
	_entry = ((configFile >> "CfgWeapons") select _i);
	if (isClass _entry) then
	{
		if ((getNumber(_entry >> "scope")) == 2) then
		{
			private["_libEnabled"];
			_libEnabled = [_entry] call _fnc_libEnabled;
			if (_libEnabled) then
			{
				if (({getNumber(_entry >> "type") == _x} count [65536]) == 0) then
				{
					_dataListWea = _dataListWea + [configname(_entry)];
				};
			};
		};
	};
};
private ["_dataListMag"];
_dataListMag = [];
for "_i" from 0 to ((count (configFile >> "CfgMagazines")) - 1) do {
	private ["_entry"];
	_entry = ((configFile >> "CfgMagazines") select _i);
	if (isClass _entry) then
	{
		if ((getNumber(_entry >> "scope")) == 2) then
		{
			private["_libEnabled"];
			_libEnabled = [_entry] call _fnc_libEnabled;
			if (_libEnabled) then
			{
					_dataListMag = _dataListMag + [configname(_entry)];
			};
		};
	};
};

// private ["_dataListWea"];
// _dataListWea = weapons player;
// {
	// private["_Mag"];
	// _Mag = getArray(configFile >> "CfgWeapons" >> _x >> "magazines");
		// _dataListMag = _dataListMag - _Mag + _Mag;
// } foreach _dataListWea;

private ["_WeaponsBox"];
_WeaponsBox = "USOrdnanceBox" createVehicle (position player);
_WeaponsBox addEventHandler ["killed", {[_this select 0] spawn BIS_GC_trashItFunc}];
{
	_WeaponsBox addMagazineCargo [_x,2];
}foreach _dataListMag;
{
	_WeaponsBox addWeaponCargo [_x,1];
}foreach _dataListWea;
hint "WeaponsBox";