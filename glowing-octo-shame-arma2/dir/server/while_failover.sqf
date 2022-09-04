private["_l","_z"];

_l = [
	// очистка уничтоженных юнитов
	"dir\server\while_obj_gc.sqf",
	// генерация отрядов ии
	"dir\common\while_reinforcement_v2.sqf",
	// маршруты
	"dir\server\server_update_groups_wp.sqf"
];

for "_i" from 0 to count _l -1 do {
	_z = (_l select _i);
	_l set [_i, [_z, [] execVM _z]];
};

_z = nil;

waitUntil {!isNil "bis_fnc_init" && !isNil "gosa_fnc_init"};
waitUntil {!isNil "gosa_crewL" && !isNil "listMHQ"};
waitUntil {!isNil "silvieManagerBlacklist" && !isNil "silvieManagerVehicles"};

while {true} do {

	for "_i" from 0 to count _l -1 do {
		if (scriptDone (_l select _i select 1)) then {
			[_l, [_i, 1], [] execVM (_l select _i select 0)] call BIS_fnc_setNestedElement;
			diag_log format ["Log: [while_failover_sv] restarted %1", _l select _i];
		};
	};

	sleep 30;

};
