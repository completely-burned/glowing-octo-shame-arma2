for "_i" from 0 to (count (_this select 1) -1) do {
	diag_log format ["Log: [fnc_var_clean] %1, get = %3, setVar '%2' = nil", _this select 0, _this select 1 select _i, _this select 0 getVariable (_this select 1 select _i)];
	_this select 0 setVariable [_this select 1 select _i, nil];
};
