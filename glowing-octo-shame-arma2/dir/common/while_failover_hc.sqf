diag_log format ["Log: [while_failover_hc] run %1", time];

private ["_arr"];

_arr = [
	// Генерация отрядов ИИ.
	"dir\common\while_reinforcement_v2.sqf"
];

for "_i" from 0 to (count _arr -1) do {
	_arr set [_i, [_arr select _i, [] execVM (_arr select _i)]];
};

waitUntil {!isNil "bis_fnc_init" && !isNil "gosa_fnc_init"};

while {sleep 30; true} do {
	for "_i" from 0 to (count _arr -1) do {
		if (scriptDone (_arr select _i select 1)) then {
			[_arr, [_i, 1], [] execVM (_arr select _i select 0)] call BIS_fnc_setNestedElement;
			diag_log format ["Log: [while_failover_hc] restarted %1", _arr select _i];
		};
	};
};
