private ["_r"];
_r = [_this select 0] call gosa_fnc_veh_getInfo;
if (count (_r select 0) <= 0) then {
	_r = [_this select 0] call gosa_fnc_faction_getInfo;
};
_r;
