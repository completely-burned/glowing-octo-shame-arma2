#ifdef __ARMA3__
	_this getVariable ["type", typeOf _this];
#else
	private ["_str"];
	_str = _this getVariable "type";
	if (isNil "_str") then {
		_str = typeOf _this;
	};
	_str;
#endif
