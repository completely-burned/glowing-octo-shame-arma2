if ([[_this], ["StaticWeapon"]] call m_fnc_CheckIsKindOfArray) then {
	if (alive _this) then {
    if ({alive _x} count crew _this == 0) then {
      if ({alive _x} count (nearestObjects [_this, listMHQ + HQ + ["Base_WarfareBBarracks","Base_WarfareBLightFactory"], 150]) > 0) then {
        _this setVehicleAmmo 1;
    	};
  	};
	};
};
