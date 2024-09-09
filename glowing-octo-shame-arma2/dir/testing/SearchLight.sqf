// gosa_testing = true; cameraon execVM "dir\testing\SearchLight.sqf";

// FIXME: getAttackTarget не работает на экипаже.

private ["_b","_obj","_n","_arr","_arrOn","_arrOff"];
while {!isNil "gosa_testing"} do {
	sleep 0.1;
	{
		_veh = _x;
		_b = false;
		_arrOff = [];
		_arrOn = [];
		{
			if (isNull assignedTarget _x) then {
				_arrOff set [count _arrOff, _x];
			}else{
				_x action ["SearchLightOn", _veh];
				_arrOn set [count _arrOn, _x];
				_b = true;
			};
		} forEach crew _veh;

		_obj = assignedTarget _veh;
		if (isNull _obj) then {
			{
				_x action ["SearchLightOff", _veh];
			} forEach _arrOff;
			_b = false;
		}else{
			if !(_b) then {
				_n = _obj distance _veh;
				if (_n <= 100) then {
					_b = true;
				};
				if (_b) then {
					{
						_x action ["SearchLightOn", _veh];
					} forEach _arrOff;
				};
			};
		};

		if (_b) then {
			_veh disableAI "LIGHTS";
			_veh setPilotLight true;
			_veh enableGunLights "ForceOn";
		} else {
			_veh enableAI "LIGHTS";
			//_veh setPilotLight false;
			_veh enableGunLights "Auto";
		};
	} forEach vehicles;
};
