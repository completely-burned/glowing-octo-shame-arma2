/*
_true = [["btr90","t90","bmp"],["air","tank"]] call gosa_fnc_CheckIsKindOfArray;
 */
Private["_return"];
_return = false;
ScopeName "exit";
{
	Private["_tank"];
	_tank=_x;
	{
		Private["_m1a1"];
		_m1a1=_x;
		if (_m1a1 isKindOf _tank) then { // в первом списке
			if (count _this > 2) then {
				{
					if (_m1a1 isKindOf _x) then { // во втором списке
						_return = false;
						BreakTo "exit";
					};
				} forEach (_this select 2);
				_return = true;
				BreakTo "exit";
			}else{
				_return = true;
				BreakTo "exit";
			};
		};
	} forEach (_this select 0);
} forEach (_this select 1);
_return;
