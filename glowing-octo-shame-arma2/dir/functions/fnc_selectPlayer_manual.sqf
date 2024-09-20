private ["_bestCandidate","_p","_units","_leader","_grp","_pos","_first",
	"_fnc_prio_units","_findBody","_arr","_sides_friendly","_pvp",
	"_pre","_sorted","_str","_obj",
	"_listPlayers","_deathTime","_cam","_b","_o","_z","_p_name"];

_p = player;
_p_name = name player;
_pvp = gosa_pvp;
if (_pvp) then {
	_sides_friendly = [playerSide];
} else {
_sides_friendly = gosa_friendlyside;
};
_o = gosa_owner;
_arr = [];

_p setVariable ["selectPlayerDisable", true, true];
[_p] spawn {
	waitUntil{
		isNil{player getVariable "selectPlayerDisable"};
	};
	_this select 0 setDamage 1;
};

_grp = group _p;

waitUntil{!isNil "gosa_MPF_InitDone"};
waitUntil{!isNil "civilianBasePos"};

_pos = getPos _p;

_bestCandidate = ([_grp, _sides_friendly, _pos] call gosa_fnc_findBestCandidate_onRespawn);
if !(isNil "_bestCandidate") then {
	_p = ([_p, _bestCandidate, _o, _p_name] call gosa_fnc_selectPlayer);
};
