/*
 * ЗАГОТОВКА!
 * Обновление штабов.
 * TODO: Совместимость с PvP.
 */

if (missionNamespace getVariable "gosa_MHQ" < 1) exitWith {
	diag_log format ["Log: [while_hq]: param, gosa_MHQ == %1, exitWith", missionNamespace getVariable "gosa_MHQ"];
};

private ["_side","_arr","_type_Lower","_str","_status","_dir",
	"_testPosCount","_sideUsed","_posUsed","_pos","_b","_n",
	"_arr0","_str0",
	"_startingPositions","_minDist","_sidePlayable","_worldSize"];
scopeName "root";

_minDist = 500;
_testPosCount = 500;
//_startingPositions = [];
waitUntil {!isNil "gosa_sides_mhq"};
_sidePlayable = gosa_sides_mhq;
waitUntil {!isNil "gosa_worldSize"};
_worldSize = gosa_worldSize;

while {true} do {
	_sideUsed = [];
	_posUsed = [];
	_startingPositions = 
		//_startingPositions +
		([_worldSize, _testPosCount] call gosa_fnc_findStartingPos);
	while {true} do {
		if (count _startingPositions < 1) exitWith {
			diag_log format ["Log: [while_hq]: count _startingPositions < 1", nil];
		};

		_side = (_sidePlayable - _sideUsed call BIS_fnc_selectRandom);
		_pos = (_startingPositions call BIS_fnc_selectRandom);
		_startingPositions = _startingPositions - [_pos];

		_b = true;
		for "_i" from 0 to (count _sideUsed -1) do {
			if (_sideUsed select _i getFriend _side < 0.6) then {
				if (_posUsed select _i distance _pos < _minDist) then {
					_b = false;
				};
			};
		};

		if (_b) then {
			_sideUsed set [count _sideUsed, _side];
			_posUsed set [count _posUsed, _pos];
			if (count _sideUsed >= count _sidePlayable) then {
				breakTo "root";
			};
		};
	};
};
diag_log format ["Log: [while_hq]: %1, %2", _sideUsed, _posUsed];

waitUntil {!isNil "gosa_types_mhq"};
_arr = gosa_types_mhq;
for "_i" from 0 to (count _sideUsed -1) do {
	_side = _sideUsed select _i;
	_pos = _posUsed select _i;

	// TODO: Виртуальные типы.
	_arr0 = [[],[]];
	for "_i0" from 0 to ((count ((_arr select 0)) -1)) do {
		_arr0 select 0 set [_i0, _i0];
		if (((_arr select 0) select _i0) == _side) then {_n = 1} else {_n = 0};
		_arr0 select 1 set [_i0, _n];
	};

	diag_log format ["Log: [while_hq]: _arr0_Weighted %1", _arr0];
	_n = (_arr0 call BIS_fnc_selectRandomWeighted);
	_type_Lower = (_arr select 1 select _n);
	_dir = random 360;
	_status = 2;
	_str = _type_Lower call gosa_fnc_fixType;

	_str0 = format["gosa_listHQ_%1", _side];
	waitUntil {!isNil _str0};
	[_pos, _type_Lower, _status, _side, objNull, _dir, _str] call gosa_fnc_createHQ;
};

gosa_init_MHQ_done = true;
