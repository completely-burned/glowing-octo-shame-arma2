private ["_role","_type"];
_role = _this select 0;

if (count _role >= 2) then {
	if (_role select 0 == "Turret") then {
		_type = _this select 1;
		// TODO: Проверять по configFile.
		if (_type isKindOf "BMP3") then {
			if ((_role select 1 select 0) in [1,2]) then {
				_role set [0, "FFV"];
			};
		};
	};
};

_role;
