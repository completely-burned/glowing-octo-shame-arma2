if (isPlayer _this) exitWith {
	true
};

if (getPlayerUID _this != "") exitWith {
	true
};

if (!isNil {_this getVariable "isPlayer"}) exitWith {
	true
};

false
