diag_log format ["Log: [fnc_forceSpeed] %1, %2", _this, typeOf vehicle (_this select 0)];

#ifndef __ARMA3__
	if (_this select 1 >= 0) then {
		_this select 0 setVariable ["gosa_forceSpeed_v2",	[_this select 1, _this select 2]];
		_this select 0 setVariable ["gosa_forceSpeed", 		 _this select 1];
	} else {
		[_this select 0, ["gosa_forceSpeed_v2", "gosa_forceSpeed"]] call gosa_fnc_var_clean;
	};
#endif
_this select 0 forceSpeed (_this select 1);
