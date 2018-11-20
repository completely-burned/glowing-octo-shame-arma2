private ["_dataListWea"];
_dataListWea = []; 
for "_i" from 0 to ((count (configFile >> "CfgWeapons")) - 1) do {
	private ["_entry"];
	_entry = ((configFile >> "CfgWeapons") select _i);
	if (isClass _entry) then
	{
		if ((getNumber(_entry >> "scope")) == 2) then
		{
			if (({getNumber(_entry >> "type") == _x} count [65536]) == 0) then
			{
				_dataListWea = _dataListWea + [configname(_entry)];
			};
		};
	};
};
_dataListWea;
