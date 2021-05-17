private["_type"];
_type = _this select 0;

private["_types","_enable","_num"];
_types = availableVehiclesBuyMenu  select 0;
_enable = availableVehiclesBuyMenu  select 2;
_num = _types find toLower _type;

if (_num < 0) then {
	1
}else{
	_enable select _num
};

