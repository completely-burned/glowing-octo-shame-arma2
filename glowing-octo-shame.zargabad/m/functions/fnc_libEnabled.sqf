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
