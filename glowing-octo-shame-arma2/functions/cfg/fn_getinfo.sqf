private ["_r","_arr","_arr0"];
_arr = [_this select 0] call gosa_fnc_veh_getInfo;
_arr0 = [_this select 0] call gosa_fnc_faction_getInfo;
_r = [[]];

if (count (_arr select 0) >= 2 && count (_arr0 select 0) >= 2) then {
	_r select 0 set [0, (_arr select 0 select 0) max (_arr0 select 0 select 0)];
	_r select 0 set [1, (_arr select 0 select 1) min (_arr0 select 0 select 1)];
}else{
	if (count (_arr select 0) >= 2 && count (_arr0 select 0) <= 0) then {
		_r set [0, _arr select 0];
	};
	if (count (_arr select 0) <= 0 && count (_arr0 select 0) >= 2) then {
		_r set [0, _arr0 select 0];
	};
};

diag_log format ["Log: [fn_getinfo] %1", _this];
diag_log format ["Log: [fn_getinfo] %1", [_arr, _arr0]];
diag_log format ["Log: [fn_getinfo] %1", _r];

_r;
