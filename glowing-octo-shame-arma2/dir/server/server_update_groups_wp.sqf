waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "gosa_locationSize"};
waitUntil {!isNil "group_system_units"};
waitUntil {!isNil "group_off_units"};
waitUntil {!isNil "gosa_fnc_init"};
private["_gosa_initGroup"];

diag_log format ["Log: [server_update_groups_wp.sqf] start %1", time];

while{true}do{
	{
		if (_x != group_system_units) then {
			_gosa_initGroup = _x call gosa_fnc_group_wp;
		};
	}forEach allGroups;
	sleep 0.1;
};

// FIXME: проблемный код завершается не доходит до этой строки
diag_log format ["Log: [server_update_groups_wp.sqf] scriptDone %1, ошибка, этот скрипт не должен завершаться", time];
