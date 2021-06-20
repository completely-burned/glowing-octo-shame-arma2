if (getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isMan") == 1) then {
	if({_x call gosa_fnc_isPlayer} count units _this > 0)then{
	};
}else{
};

_this setSkill ["spotDistance", 1];
_this setSkill ["spotTime", 1];
_this setSkill ["commanding", 1];
