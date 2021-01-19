private "_isPlayer";
_isPlayer = isPlayer _this;

if (_isPlayer) exitWith {
	_isPlayer
};

if (!isNil {_this getVariable "isPlayer"}) exitWith {
	true
};

false
