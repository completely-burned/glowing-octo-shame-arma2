private["_type"];
_type = _this select 0;

private["_types","_times","_enable","_num"];
_types = availableVehiclesBuyMenu  select 0;
_times = availableVehiclesBuyMenu  select 1;
_enable = availableVehiclesBuyMenu  select 2;
_num = _types find toLower _type;

private["_cost"];
_cost = getNumber (configFile >> "CfgVehicles" >> _type >> "cost");

private["_time"];
_time = time + (_cost/5000);

if (_num < 0) then {
	private["_count"];
	_count = count _types;
	_types set [_count, toLower _type];
	_times set [_count, _time];
	_enable set [_count, 0];
	
}else{
	_times set [_num, _time];
	_enable set [_num, 0];
};

[] call compile preprocessFileLineNumbers "m\Client\ClientMenu.sqf";
