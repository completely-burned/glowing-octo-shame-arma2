diag_log format ["Log: [fnc_spectator_init] _this %1", _this];

private ["_arr","_obj","_timeOut"];

_timeOut = time + 5;

waitUntil {!isNil "gosa_worldSize" or time > _timeOut};
if !(isNil "gosa_worldSize") then {
	_arr = gosa_worldSize;
	_arr = [((_arr select 0)/4) + random ((_arr select 0)/2), ((_arr select 1)/4) + random ((_arr select 1)/2), 50];
	waitUntil {
		_obj = ["GetCamera"] call BIS_fnc_EGSpectator;
		!isNull _obj or
		time > _timeOut
	};
	_obj setDir random 360;
	_obj setPos _arr;
};
