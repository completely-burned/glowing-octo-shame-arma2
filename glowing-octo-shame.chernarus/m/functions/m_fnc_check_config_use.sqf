Private["_visible"];
_visible = false;
ScopeName "Check";
	{
		if (([_this select 0 >> _x, _this select 2] call BIS_fnc_returnConfigEntry) == (_this select 3)) then {
				_visible = true;
				BreakTo "Check";
		};
	} forEach (_this select 1);
_visible;