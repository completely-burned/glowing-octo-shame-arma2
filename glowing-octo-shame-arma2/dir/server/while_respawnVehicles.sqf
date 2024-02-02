/*
 * Возрождение транспорта.
 * TODO: Рефакторинг.
 */

if (missionNamespace getVariable "gosa_respawnVehicles" != 1) exitWith {
	diag_log format ["Log: [respawnVehicles] respawn type %1, exitWith", missionNamespace getVariable "gosa_respawnVehicles"];
};

private ["_arr","_arr0","_dist","_var_noDelete","_obj","_b",
	"_var_respawn","_var_spawn_time","_lock","_posObj",
	"_posSafe","_canMove",
	"_pos_safe","_distSafe","_pos","_dir","_type"];

_var_noDelete = gosa_var_noDelete;
_var_respawn = gosa_var_respawnVehicle;
_var_spawn_time = gosa_var_spawn_time;
_lock = "UNLOCKED";

// Создаем список восстанавливаемых объектов.

// _arr динамичный массив.
_arr = [];
{
	_b = _x getVariable [_var_respawn, false];
	// TODO: Фильтровать по параметрам.
	if (_b) then {
		_arr set [count _arr, _x];
	};
} forEach vehicles;

diag_log format ["Log: [respawnVehicles] count %1", count _arr];
if (count _arr <= 0) exitWith {};

// _arr0 статичный массив.
_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_obj = _arr select _i;
	_obj setVariable [_var_spawn_time, time];
	_type = typeOf _obj;
	_arr0 set [_i,
		[_type,
		getPos _obj,
		sizeOf _type,
		getDir _obj,
		vectorDir _obj,
		vectorUp _obj]
	];
	_obj setVariable [_var_noDelete, true];
	_obj setVehicleLock _lock;

	_obj setVariable [_var_respawn, nil];
};

diag_log format ["Log: [respawnVehicles] %1", _arr];
diag_log format ["Log: [respawnVehicles] %1", _arr0];

waitUntil {!isNil "BIS_fnc_init"};
waitUntil {!isNil "gosa_fnc_init"};

while {sleep (12 + random 5); true} do {
	for "_i" from 0 to (count _arr0 -1) do {
		_obj = _arr select _i;
		_posObj = getPos _obj;
		_type = _arr0 select _i select 0;
		_pos = _arr0 select _i select 1;
		_distSafe = _arr0 select _i select 2;
		_posSafe = [_pos select 0, _pos select 1, (_pos select 2) + 2000];
		_dist = _posObj distance _pos;
		_canMove = canMove _obj;

		if (_dist > _distSafe) then {
			_b = true;
		}else{
			_b = false;
		};
		if (!_canMove && _dist <= _distSafe) then {
			if (({alive _x} count crew _obj) <= 0) then {
				diag_log format ["Log: [respawnVehicles] %1 deleteVehicle", _obj];
				deleteVehicle _obj;
				_b = true;
				sleep 1;
			};
		};

		if (_b) then {
			_obj setVariable [_var_noDelete, nil];
			_obj setVariable [_var_spawn_time, nil];

			// TODO: Проверка мещающих объектов рядом.

			_obj = createVehicle [_type, _posSafe, [], 200, "NONE"];
			_obj setVariable [_var_noDelete, true];
			_obj setVariable [_var_spawn_time, time];
			_arr set [_i, _obj];
			_obj setDir (_arr0 select _i select 3);
			_obj setVectorDir (_arr0 select _i select 4);
			_obj setVectorUp (_arr0 select _i select 5);
			#ifdef __ARMA3__
				[_obj, "fnc_spawnVehicle"] remoteExec ["gosa_fnc_vehInit2"];
			#else
				[nil, _obj, rvehInit] call RE;
			#endif
			_obj setPos _pos;
			diag_log format ["Log: [respawnVehicles] %1 created %2", _obj, _pos];
		};
	};
};
