private ["_b","_arr","_str","_cfg","_str0"];

_cfg = _this select 0;
_arr = _this select 1;
_str0 = toLower (_this select 3);

_b = false;

ScopeName "Check";
{
	_str = toLower ([_cfg >> _x, _this select 2] call BIS_fnc_returnConfigEntry);

	#ifdef __ARMA3__
		if (_str isEqualTo "nvgoggles") then {
			if (getNumber(_cfg >> _x >> "SPE_isFlashLight") > 0) then {
				_str = "gosa_flashight";
			};
		};
	#endif

	if (_str == _str0) then {
		_b = true;
		BreakTo "Check";
	};
} forEach _arr;

_b;
