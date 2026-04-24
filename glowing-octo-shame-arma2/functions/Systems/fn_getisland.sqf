/*
 * Находит зону в которой находится позиция.
 */
diag_log format ["Log: [fnc_getIsland] _this %1", _this];
private ["_pos","_islands","_areas","_area","_r"];

_pos = _this select 0;
_islands = _this select 1;

_r = [false];

scopeName "root";
for "_iZ" from 0 to (count _islands -1) do {
	_areas = _islands select _iZ;
	for "_i" from 0 to (count _areas -1) do {
		_area = _areas select _i;
		if ([_area, _pos] call BIS_fnc_inTrigger) then {
			_r = [true, _areas, _area, [_iZ, _i]];
			breakTo "root";
		};
	};
};

diag_log format ["Log: [fnc_getIsland] _r %1", _r];
_r;
