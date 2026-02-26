/*
 * Более светлые ночи.
 * TODO: Возможность менять значение индивидуально для игрока.
 */
private ["_reset","_var","_values","_arr","_current"];
_var = _this select 0;

_reset = [-1];
if (typeName _var isEqualTo typeName 0) then {
	_values = [
		// VN_fnc_set_aperture_based_on_light_level:
		[4, 6, 9, 0.9],
		// Simulate eye adjustment at night: 
		[2, 8, 14, 0.9],
			[2, 8, 14, 0.8],
			[2, 8, 14, 0.7],
			[2, 8, 14, 0.6],
			[2, 8, 14, 0.5],
			[2, 8, 14, 0.4],
		// Narrower range for a subtler effect:
		[2, 5, 9, 0.8],
			[2, 5, 9, 0.9],
			[2, 5, 9, 0.7],
			[2, 5, 9, 0.6],
			[2, 5, 9, 0.5],
			[2, 5, 9, 0.4],
		//
		[0.99, 0.99, 0.99, 0.9]
	];
	_var = _values select _var;
};

while {isNil "gosa_setApertureNew_night_exit"} do {
	_arr = apertureParams;
	if ([daytime] call gosa_fnc_isNight) then {
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

gosa_setApertureNew_night_exit = nil;

