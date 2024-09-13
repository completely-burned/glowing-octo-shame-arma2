diag_log format ["Log: [fnc_spectator_init_unit] _this %1", _this];

private ["_arr","_obj"];

_obj = _this select 0;

_arr = [
	"AllowAi",
	"AllowFreeCamera",
	"Allow3PPCamera",
	"ShowCameraButtons",
	"ShowFocusInfo",
	"ShowControlsHelper",
	"ShowHeader",
	"ShowLists"
];
for "_i" from 0 to (count _arr -1) do {
	if (isNil {_obj getVariable (_arr select _i)}) then {
		_obj setVariable [_arr select _i, true];
	};
};
