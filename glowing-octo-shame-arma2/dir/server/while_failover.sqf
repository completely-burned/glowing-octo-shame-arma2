private["_p","_l","_z"];

_p = "dir\server\";

_l = [
	"while_obj_gc.sqf", // очистка уничтоженных юнитов
	"while_reinforcement.sqf", // генерация отрядов ии
	"server_update_groups_wp.sqf" // маршруты
];

for "_i" from 0 to count _l -1 do {
	_z = _p + (_l select _i);
	_l set [_i, [_z, [] execVM _z]];
};

_p = nil; _z = nil;

while {true} do {

	for "_i" from 0 to count _l -1 do {
		if (scriptDone (_l select _i select 1)) then {
			[_l, [_i, 1], [] execVM (_l select _i select 0)] call BIS_fnc_setNestedElement;
			diag_log format ["Log: [while_failover_sv] restarted %1", _l select _i];
		};
	};

	sleep 30;

};
