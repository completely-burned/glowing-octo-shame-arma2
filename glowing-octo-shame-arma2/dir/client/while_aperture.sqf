/*
 * Более светлые ночи.
 */
private ["_reset","_var","_values","_arr","_current"];
_reset = [-1];
if (isNil "gosa_setApertureNew_night") then {
	gosa_setApertureNew_night = _reset;
};

while {!isNil "gosa_setApertureNew_night"} do {
	_var = gosa_setApertureNew_night;
	_arr = apertureParams;
	if (_var isNotEqualTo _reset && [daytime] call gosa_fnc_isNight) then {
		_current = [_arr select 4, _arr select 5, _arr select 6, _arr select 7];
		if (_current isNotEqualTo _var) then {
			setApertureNew _var;
		};
	}else{
		if (_arr select 8) then {
			setApertureNew _reset;
		};
	};
	sleep 10 + random 5;;
};

setApertureNew _reset;
