if (getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isMan") == 1) then {
	if({isPlayer _x} count units _this > 0)then{
	};
}else{
};
