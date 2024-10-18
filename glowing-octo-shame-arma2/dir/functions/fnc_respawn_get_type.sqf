private ["_n"];
_n = _this select 0 getVariable "gosa_respawn_type";
if (isNil "_n") then {
	if (_this select 0 isKindOf "LocationRespawnPoint_F") then {
		_n = 0;
	}else{
		if (count _this > 1) then {
			_n = _this select 1;
		}else{
			_n = -1;
		};
	};
};
_n;
