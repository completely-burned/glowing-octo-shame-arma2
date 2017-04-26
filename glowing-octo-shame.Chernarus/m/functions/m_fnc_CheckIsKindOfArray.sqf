/* 
_true = [["btr90","t90","bmp"],["air","tank"]] call m_fnc_CheckIsKindOfArray;
 */
Private["_visible"];
_visible = false;
ScopeName "Check";
{
	Private["_tank"];
	_tank=_x;
	{
		Private["_m1a1"];
		_m1a1=_x;
		if (_m1a1 isKindOf _tank) then {
			_visible = true;
			BreakTo "Check";
		};
	} forEach (_this select 0);
} forEach (_this select 1);
_visible;