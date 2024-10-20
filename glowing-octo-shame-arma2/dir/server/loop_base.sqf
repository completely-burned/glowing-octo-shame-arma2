diag_log format ["Log: [loop_base] %1", time];
private ["_arr"];
_arr = [[],[]];
gosa_base_array = _arr;
while {true} do {
	[_arr] call gosa_fnc_base_update;
	sleep 2;
};
