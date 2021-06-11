private ["_Trigger"];
{
	_Trigger = createTrigger ["EmptyDetector", [0,0]];
	_Trigger setTriggerActivation [_x, "PRESENT", true];
	_Trigger setTriggerStatements ["this", format ["private['_ok']; _ok = [] execVM 'dir\Client\radio\%1.sqf'",_x], ""];
} foreach [ "ALPHA", "BRAVO", "CHARLIE", "DELTA", "ECHO", "FOXTROT", "GOLF", "HOTEL", "INDIA", "JULIET"];
	// "ALPHA", "BRAVO", "CHARLIE", "DELTA", "ECHO", "FOXTROT", "GOLF", "HOTEL", "INDIA", "JULIET"];
