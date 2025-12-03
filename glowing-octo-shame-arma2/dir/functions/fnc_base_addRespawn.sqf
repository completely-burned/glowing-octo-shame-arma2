private ["_l_base","_respawn","_type","_arr","_logic"];
_l_base = _this select 0;
_respawn = _this select 1;

_type = "LocationRespawnPoint_F";

_arr = _respawn nearObjects [_type, 10];
if (count _arr <= 0) then {
	_logic = group _l_base createUnit [_type, getPos _respawn, [], 0, "CAN_COLLIDE"];
	_logic setPos getPos _respawn;
	_logic synchronizeObjectsAdd [_l_base];
	_l_base synchronizeObjectsAdd [_logic];
	_arr set [count _arr, _logic];
};
[_arr];
