if (isPlayer _this) exitWith {
	true
};

// getPlayerUID возвращает "_SP_AI_" в одиночной игре.
if (isMultiplayer && getPlayerUID _this != "") exitWith {
	true
};

if (!isNil {_this getVariable "isPlayer"}) exitWith {
	true
};

false
