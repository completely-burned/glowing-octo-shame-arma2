private ["_veh","_weapons","_cfgWea","_entry","_minR","_maxR","_midR_min","_midR_max","_range",
	"_vehicles"];

_vehicles = _this select 0;
_cfgWea = LIB_cfgWea;

for "_i" from 0 to (count _vehicles -1) do {
	_veh = _vehicles select _i;
	_weapons = ([_veh] call gosa_fnc_returnVehicleWeapons select 0);

	for "_i_veh" from 0 to (count _weapons -1) do {
		_entry = _cfgWea >> (_weapons select _i_veh);
		_range = [_entry] call gosa_fnc_returnWeaponRange;
		diag_log format ["Log: [fnc_returnVehicleRange] %1", [_veh, _weapons select _i_veh, _range]];
		// [_minR, _maxR, _midR_min, _midR_max];
		_n = _range select 0;
		if (_n > 0) then {
			if (isNil "_minR") then {
				_minR = _n;
			}else{
				_minR = _minR min _n;
			};
			_n = _range select 1;
			if (isNil "_maxR") then {
				_maxR = _n;
			}else{
				_maxR = _maxR max _n;
			};
			_n = _range select 2;
			if (isNil "_midR_min") then {
				_midR_min = _n;
			}else{
				_midR_min = _midR_min min _n;
			};
			_n = _range select 3;
			if (isNil "_midR_max") then {
				_midR_max = _n;
			}else{
				_midR_max = _midR_max max _n;
			};
		};
	};
};

diag_log format ["Log: [fnc_returnVehicleRange] %1, return %2", _this, [_minR, _maxR, _midR_min, _midR_max]];
[_minR, _maxR, _midR_min, _midR_max];
