private ["_type"];
if (typeName (_this select 0) == typeName "") then {
	_type = (_this select 0);
} else {
	_type = typeOf (_this select 0);
};

#ifdef __ARMA3__
	// role = "Crewman";
	if (toLowerANSI getText (LIB_cfgVeh >> _type >> "role") isEqualTo "crewman") exitWith {
		true;
	};
#endif

if (_type in gosa_types_crew) exitWith {
	true;
};
if (_type in gosa_types_pilot) exitWith {
	true;
};

false;
