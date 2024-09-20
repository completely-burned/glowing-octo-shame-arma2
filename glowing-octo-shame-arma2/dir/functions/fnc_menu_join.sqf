private ["_l","_lstr","_c","_dist","_n","_arr","_obj",
	"_GroupSelectedUnits"];

if (count _this > 0) then {
	_GroupSelectedUnits = _this select 0;
};
for "_i" from 0 to (count _GroupSelectedUnits -1) do {
	player groupSelectUnit [_GroupSelectedUnits select _i, true];
};

_dist = 500;

_l = []; _lstr = [];
_n = 0;

//--- Ближние отряды.
_arr = (vehicle player nearEntities _dist);
for "_i" from 0 to (count _arr -1) do
{
	_obj = _arr select _i;

	if (gosa_playerSide == side _obj
		// Командир отряда, а не тс.
		&& leader effectiveCommander _obj == effectiveCommander _obj
		&& _obj != player) then
	{
		_l set [_n, _obj];
		_lstr set [_n, mapGridPosition _obj + " " + str _obj];
		_n = _n + 1;
	};
};

//--- Игроки.
_arr = (([] call gosa_fnc_listPlayers) -[player]);
for "_i" from 0 to (count _arr -1) do
{
	_obj = _arr select _i;
	if (gosa_playerSide == side _obj) then
	{
		_l set [_n, _obj];
		_lstr set [_n, mapGridPosition _obj + " " + str _obj];
		_n = _n + 1;
	};
};

//--- Покинуть группу.
_l set [_n, grpNull];
_lstr set [_n, localize "STR_gosa_leave_the_squad"];


if (count _l < 1) exitWith {
	hint format["No matching groups within %1 meters", _dist];
};


_c = "
	([player]+GroupSelectedUnits player) join (gosa_joinMenu select %2);
	hint 'Ok';
	gosa_joinMenu = nil;
";

gosa_joinMenu = _l;

["join", "gosa_joinMenu", _lstr, "", _c] call BIS_FNC_createmenu;

showCommandingMenu "#USER:gosa_joinMenu_0";
