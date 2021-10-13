private ["_l","_lstr","_c"];

_l = []; _lstr = [];

{
	if (playerSide getFriend side _x >= 0.6 && leader _x == _x && _x != player) then {
		_l set [count _l, _x];
		_lstr set [count _lstr, str _x];
	};
} forEach (vehicle player nearEntities 100);

if (count _l == 0) exitWith {
	hint "no matching groups within 100 meters";
};


_c = "
	[player] join (gosa_joinMenu select %2);
	hint 'Ok';
	gosa_joinMenu = nil;
";

gosa_joinMenu = _l;

["join", "gosa_joinMenu", _lstr, "", _c] call BIS_FNC_createmenu;

showCommandingMenu "#USER:gosa_joinMenu_0";
