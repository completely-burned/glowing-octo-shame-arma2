private ["_dataListMag"];
_dataListMag = [];
for "_i" from 0 to ((count (configFile >> "CfgMagazines")) - 1) do {
	private ["_entry"];
	_entry = ((configFile >> "CfgMagazines") select _i);
	if (isClass _entry) then
	{
		if ((getNumber(_entry >> "scope")) == 2) then
		{
			_dataListMag = _dataListMag + [configname(_entry)];
		};
	};
};
_dataListMag;
