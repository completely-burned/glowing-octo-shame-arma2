private ["_type","_cfgVeh","_entry","_weapons","_item","_turret_entry","_turret_path"];
_type = _this select 0;

_cfgVeh = LIB_cfgVeh;
_entry = _cfgVeh >> _type;

_weapons = getArray (_entry >> "weapons");
_turrets = ([_entry >> "turrets", []] call gosa_fnc_returnVehicleTurrets);

for "_i" from 0 to (count _turrets -1) do {
	_turret_path = _turrets select _i;
	for "_i_tp" from 0 to (count _turret_path -1) do {
		if (_i_tp <= 0) then {
			_turret_entry = ((_entry >> "turrets") select (_turret_path select _i_tp));
		}else{
			_turret_entry = ((_turret_entry >> "turrets") select (_turret_path select _i_tp));
		};
		diag_log format ["Log: [fnc_returnVehicleWeapons] _turret %1", [_turret_entry, _i_tp, _turret_path]];
		_weapons = _weapons + getArray (_turret_entry >> "weapons");
	};
};

diag_log format ["Log: [fnc_returnVehicleWeapons] %1, r %2", _this, _weapons];
[_weapons];
