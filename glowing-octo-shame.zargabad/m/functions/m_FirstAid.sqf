private["_unit"];
_unit = _this;
if (_unit getvariable "BIS_lifestate" == "ALIVE") then {
	if (lifestate _unit == "UNCONSCIOUS") then {
		_unit playactionnow "agonyStop";
		_unit setvariable ["BIS_lifeState","ALIVE",true];
		_unit setcaptive false;
		_unit setUnconscious false;
	};
};

if (_unit getvariable "BIS_lifestate" == "UNCONSCIOUS") then {
	if (local _unit) then {
		if (lifestate _unit == "ALIVE") then {
			moveOut _unit;
			_unit playactionnow "agonyStart";
			_unit setUnconscious true;
			_unit setcaptive true;
		};		
	};		
};
