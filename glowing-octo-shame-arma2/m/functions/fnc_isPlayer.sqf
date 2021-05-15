private "_isPlayer";
_isPlayer = isPlayer _this;

if (_isPlayer) exitWith {
	_isPlayer
};

if (getPlayerUID _this != "") exitWith {
	true
};

if (!isNil {_this getVariable "isPlayer"}) exitWith {
	true
};

false
