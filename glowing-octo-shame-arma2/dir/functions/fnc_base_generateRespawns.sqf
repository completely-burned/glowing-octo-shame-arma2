private["_b","_dist","_arr"];
_b = _this select 0;
_dist = _this select 1;

_arr = [_b, _dist] call gosa_fnc_base_findRespawnPositions;
for "_i" from 0 to (count _arr -1) do {
	[_b, _arr select _i] call gosa_fnc_base_addRespawn;
};
