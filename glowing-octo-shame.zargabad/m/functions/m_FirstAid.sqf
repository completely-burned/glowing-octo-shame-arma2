private["_unit"];
_unit = _this;
if (_unit getvariable "BIS_lifestate" == "ALIVE") then {
	if (lifestate _unit == "UNCONSCIOUS" or captive _unit) then {
		_unit playactionnow "agonyStop";
		_unit setvariable ["BIS_lifeState","ALIVE",true];
		_unit setUnconscious false;
		_unit setcaptive false;
	};
};

if (_unit getvariable "BIS_lifestate" == "UNCONSCIOUS") then {
	if (local _unit) then {
		if (lifestate _unit == "ALIVE" or !(captive _unit)) then {
			moveOut _unit;
			_unit playactionnow "agonyStart";
			_unit setUnconscious true;
			_unit setcaptive true;
		};		
	};		
};
