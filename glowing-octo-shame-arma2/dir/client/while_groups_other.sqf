/*
	TODO: Оптимизация.
*/

if (missionNamespace getVariable "gosa_ai_scripts" == 0) exitWith {
	diag_log format ["Log: [while_groups_other] gosa_ai_scripts == %1, exitWith", missionNamespace getVariable "gosa_ai_scripts"];
};

private["_g","_s","_c"];
waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "gosa_locationSize"};
waitUntil {!isNil "group_system_units"};
waitUntil {!isNil "group_off_units"};
while{true}do{
	_g = allGroups-[group_system_units];
	sleep 1;
	_c = count _g;
	if (_c > 0) then {
		_s = 20/_c;
		for "_i" from 0 to (_c -1) do {
			sleep ((_s call gosa_fnc_dynSleep) max 1);
			_g select _i call gosa_fnc_group_other;
		};
	};
};
