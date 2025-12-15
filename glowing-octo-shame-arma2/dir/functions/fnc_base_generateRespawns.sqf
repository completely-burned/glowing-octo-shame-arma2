private["_b","_dist","_arr"];
_b = _this select 0;
_dist = _this select 1;

_arr = [_b, _dist] call gosa_fnc_base_findRespawnPositions;
[_b, _arr] call gosa_fnc_base_addRespawn;
