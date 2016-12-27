private ["_Trigger"];
{
	_Trigger = createTrigger ["EmptyDetector", [0,0]];
	_Trigger setTriggerActivation [_x, "PRESENT", true];
	_Trigger setTriggerStatements ["this", format ["private['_ok']; _ok = [] execVM 'm\Client\radio\%1.sqf'",_x], ""];
} foreach [ "ALPHA", "BRAVO", "CHARLIE", "DELTA"];//, 
	// "ECHO", "FOXTROT", "GOLF", "HOTEL", "INDIA", "JULIET"];
	
	_Trigger = createTrigger ["EmptyDetector", [0,0]];
	_Trigger setTriggerActivation ["ECHO", "PRESENT", true];
	_Trigger setTriggerStatements ["this", "[]call locationNext;", ""];
	_Trigger = createTrigger ["EmptyDetector", [0,0]];
	_Trigger setTriggerActivation ["FOXTROT", "PRESENT", true];
	_Trigger setTriggerStatements ["this", "[]call bis_fnc_configviewer;", ""];
	// _Trigger = createTrigger ["EmptyDetector", [0,0]];
	// _Trigger setTriggerActivation ["GOLF", "PRESENT", true];
	// _trigger setTriggerType "END1"
