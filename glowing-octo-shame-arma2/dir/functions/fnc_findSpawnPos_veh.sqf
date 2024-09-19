/*
 * Поиск позиций возрождения объектов.
 * TODO: Учитывать размер объекта.
 * TODO: Сортировать по типу.
 */
diag_log format ["Log: [fnc_findSpawnPos_veh] _this %1", _this];
private ["_center","_types","_dist_max","_arr","_return","_obj","_var"];

_center = _this select 0;
_types = _this select 1;
_dist_max = _this select 2;

_arr = nearestObjects [_center, ["Logic"], _dist_max];
_return = [];
for "_i" from 0 to (count _arr -1) do {
	_obj = _arr select _i;
	_var = _obj getVariable "gosa_respawn_type";
	if !(isNil "_var") then {
		if (_var in _types) then {
			_return set [count _return, _obj];
		};
	};
};

diag_log format ["Log: [fnc_findSpawnPos_veh] %1 -> %2", _this, _return];
_return;
