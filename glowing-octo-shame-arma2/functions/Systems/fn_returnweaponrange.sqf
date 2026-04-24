private ["_weapon","_n","_minR","_maxR","_midR_min","_midR_max","_modes","_mode"];
_weapon = _this select 0;
_modes = getArray (_weapon >> "modes");

for "_i" from 0 to (count _modes -1) do {
	_mode = _weapon >> (_modes select _i);

	_n = getNumber (_mode >> "minRange");
	if (isNil "_minR") then {
		_minR = _n;
	}else{
		_minR = _minR min _n;
	};

	_n = getNumber (_mode >> "maxRange");
	if (isNil "_maxR") then {
		_maxR = _n;
	}else{
		_maxR = _maxR max _n;
	};

	_n = getNumber (_mode >> "midRange");
	if (isNil "_midR_min") then {
		_midR_min = _n;
	}else{
		_midR_min = _midR_min min _n;
	};
	if (isNil "_midR_max") then {
		_midR_max = _n;
	}else{
		_midR_max = _midR_max max _n;
	};
};

diag_log format ["Log: [fnc_returnWeaponRange] %1, r %2", _this, [_minR, _maxR, _midR_min, _midR_max]];
[_minR, _maxR, _midR_min, _midR_max];
