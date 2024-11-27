private ["_role","_type"];
_role = _this select 0;

#define "turret" "Turret"
#define "TURRET" "Turret"

scopeName "root";

if (count _role >= 2) then {
	if (_role select 0 == "Turret") then {
		_type = _this select 1;
		// TODO: Проверять по configFile.
		#ifdef __ARMA3__
			if (_type isKindOf "MRAP_03_base_F") then {
				if (_role select 1 isEqualTo [1]) then {
					_role set [0, "FFV"];
					breakTo "root";
				};
			};
			if (_type isKindOf "B_LSV_01_armed_F") then {
				if (_role select 1 isEqualTo [1]) then {
					_role set [0, "FFV"];
					breakTo "root";
				};
			};
			if (_type isKindOf "CUP_BAF_Jackal2_BASE_D") then {
				if (_role select 1 isEqualTo [0]) then {
					_role set [0, "FFV"];
					breakTo "root";
				};
			};
			if (_type isKindOf "CUP_BMP3_Base") then {
				if (_role select 1 isEqualTo [1] or _role select 1 isEqualTo [2]) then {
					_role set [0, "FFV"];
					breakTo "root";
				};
			};
			if (_type isKindOf "EF_AAV9_Base") then {
				if (_role select 1 select 0 >= 1 or _role select 1 isEqualTo [0,1]) then {
					_role set [0, "FFV"];
					breakTo "root";
				};
			};
		#else
		if (_type isKindOf "BMP3") then {
			if ((_role select 1 select 0) in [1,2]) then {
				_role set [0, "FFV"];
			};
		};
		#endif
	};
};

_role;
