private ["_obj","_switchCamera","_arr","_str","_grp","_n"];
gosa_spectator_exit = true;
sleep 0.1;
gosa_spectator_exit = nil;

while {isNil "gosa_spectator_exit"} do {
	sleep 2;
	_obj = cameraOn;
	_switchCamera = false;

	if (_obj == player) then {
		_switchCamera = true;
	};

	if !(alive _obj) then {
		_switchCamera = true;
	};

	if (_switchCamera) then {
		_arr = allUnits;
		_arr = (_arr - units group player);
		for "_i" from 0 to (count _arr -1) do {
			if (vehicle (_arr select _i) isKindOf "Air") then {
				_arr set [_i, objNull];
			};
			_grp = group (_arr select _i);
			if !(isNil (_grp getVariable "patrol")) then {
				_arr set [_i, objNull];
			};
		};
		_arr = _arr-[objNull];
		if (count _arr > 0) then {
			_obj = (_arr call BIS_fnc_selectRandom);
			preloadCamera getPos _obj;
			_str = "INTERNAL";
			sleep 2;
			if (vehicle _obj != _obj) then {
				_str = "GUNNER";
			};
			_obj switchCamera _str;
		};
	};
};
