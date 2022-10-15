private ["_l","_lstr","_c"];

_l = []; _lstr = [];

{
	if (playerSide getFriend side _x >= 0.6 && leader effectiveCommander _x == effectiveCommander _x && _x != player) then {
		_l set [count _l, _x];
		_lstr set [count _lstr, str _x];
	};
} forEach (vehicle player nearEntities 200);

{
	if (playerSide getFriend side _x >= 0.6 && _x != player) then {
		_l set [count _l, _x];
		_lstr set [count _lstr, str _x];
	};
} forEach call BIS_fnc_listPlayers;

_l set [count _l, grpNull];
_lstr set [count _lstr, localize "STR_gosa_leave_the_squad"];


if (count _l == 0) exitWith {
	hint "no matching groups within 100 meters";
};


_c = "
	([player]+(GroupSelectedUnits player)) join (gosa_joinMenu select %2);
	hint 'Ok';
	gosa_joinMenu = nil;
";

gosa_joinMenu = _l;

["join", "gosa_joinMenu", _lstr, "", _c] call BIS_FNC_createmenu;

showCommandingMenu "#USER:gosa_joinMenu_0";
