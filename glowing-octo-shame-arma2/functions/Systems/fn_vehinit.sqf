if (getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isMan") == 1) then {
	if({_x call gosa_fnc_isPlayer} count units _this > 0)then{
	};
}else{
	/*
	if ([[_this], ["SPE_Tank_base","LIB_Tank_base"]] call gosa_fnc_CheckIsKindOfArray) then {
		[
			_this,
			nil, 
			["Hide_Shields_Hull",1,"Hide_Shields_Turret",1,"hide_shield_brackets_source",1]
		] call BIS_fnc_initVehicle;
	};
	*/
};

_this setSkill ["spotDistance", 1];
_this setSkill ["spotTime", 1];
_this setSkill ["commanding", 1];
