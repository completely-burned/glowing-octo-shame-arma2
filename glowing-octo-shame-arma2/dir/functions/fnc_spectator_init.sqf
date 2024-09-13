private ["_arr","_obj"];

_obj = ["GetCamera"] call BIS_fnc_EGSpectator;
if (isNull _obj) then {
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
		if (isNil {player getVariable (_arr select _i)}) then {
			player setVariable [_arr select _i, true];
		};
	};
};

if !(isNil "gosa_worldSize") then {
	_arr = gosa_worldSize;
	_arr = [((_arr select 0)/4) + random ((_arr select 0)/2), ((_arr select 1)/4) + random ((_arr select 1)/2), 50];
	waitUntil {
		_obj = ["GetCamera"] call BIS_fnc_EGSpectator;
		!isNull _obj or
		time > 30
	};
	_obj setDir random 360;
	_obj setPos _arr;
};
