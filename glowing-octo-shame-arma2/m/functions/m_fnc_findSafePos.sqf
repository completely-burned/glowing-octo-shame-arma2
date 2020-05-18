	// diag_log format ["m_fnc_findSafePos.sqf 1, %1", time];

private["_run_timer"];
_run_timer = time;

private ["_pos","_minDist","_maxDist","_objDist","_waterMode","_maxGradient","_shoreMode","_blacklist","_side","_posX","_posY","_dist","_attempts","_allowPos","_testPos","_preferRoads"];
_pos = _this select 0;
_minDist = _this select 1;
_maxDist = _this select 2;
_objDist = _this select 3;
_waterMode = _this select 4;
_maxGradient = _this select 5;
_shoreMode = _this select 6;

if (_shoreMode == 0) then {_shoreMode = false} else {_shoreMode = true};
_blacklist = [];
if ((count _this) > 7) then {
	_blacklist = _this select 7;
};
// _defaultPos = [];
// if ((count _this) > 8) then {
	// _defaultPos = _this select 8;
// };
if ((count _pos) == 0) then {
	_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor");
};

if (_maxDist == -1) then {
	_maxDist = getNumber(configFile >> "CfgWorlds" >> worldName >> "safePositionRadius");
};

_preferRoads = _this select 9;
if ((count _this) > 10) then {
	_side = _this select 10;
};

_posX = _pos select 0;
_posY = _pos select 1;
// _dist = ( _minDist / 1.25 );
_dist = 100;
_attempts = 0;
private ["_attempts2"];
_attempts2 = 0;
_allowPos = false;

private ["_branchesRoads","_roads","_branchRoad","_roadSize"];
_branchesRoads = [];
if(_preferRoads)then{
	//if(isNil{CivilianLocation getVariable "_var_draga_branchesRoads"})then{
		private ["_nearRoads"];
		_nearRoads = (_pos nearRoads 500);
		if(count _nearRoads > 0)then{
			_branchesRoads = [_nearRoads call BIS_fnc_selectRandom, 150] call draga_fnc_roads;
		};
		//CivilianLocation setVariable ["_var_draga_branchesRoads", _branchesRoads];
	//}else{
	//	_branchesRoads = CivilianLocation getVariable "_var_draga_branchesRoads";
	//};
};
while {!_allowPos} do {

	_allowPos=true;

	_roads = [];
	if(_attempts2 >= 5000)exitWith{_testPos = []};

	if(count _branchesRoads > 0)then{
		_branchRoad = _branchesRoads call BIS_fnc_selectRandom;

		_roadSize = 10;

		if(count _branchRoad >= _roadSize)then {
			private ["_start"];
			_start = random (count _branchRoad - _roadSize);
			for "_i" from _start to (_start + _roadSize - 1) do {
				_roads set [count _roads, _branchRoad select _i];
			};
		};

		_testPos = getPos (_roads select 0);

	};

	if(count _roads < _roadSize)then{
		private ["_dir","_dist2"];
		_dir = random 360;
		_dist2 = random _dist;
		_testPos = [_posX + _dist2*sin _dir, _posY + _dist2*cos _dir];
		_roads = [];
	};

	if(_allowPos)then{
		if([_testPos,_minDist] call m_fnc_CheckPlayersDistance)then{
			_allowPos = false;
		};
	};

	if(count _this > 10)then {
		if(_allowPos)then {
			ScopeName "CheckForEnemy";
			{
				private "_leader";
				_leader = leader _x;
				if (alive _leader) then {
					if (( side _x getFriend _side) < 0.6 ) then {
						if ((vehicle leader _x distance _testPos) < (_minDist min 1500))then {
							_allowPos = false;
							BreakTo "CheckForEnemy";
						};
					};
				};
			} forEach allGroups;
		};
		// if(!_allowPos)then {
			// if ([_testPos, _minDist min 750, _side] call m_fnc_CheckCombatNearUnits ) then {
				// _allowPos = true;
			// };
		// };
	};

	if(_allowPos)then{
		if([_testPos, _blacklist] call BIS_fnc_isPosBlacklisted)then{
			_allowPos = false;
		};
	};

	if(count _roads == 0)then{
		_testPos = (_testPos isFlatEmpty [_objDist, -1, _maxGradient, _objDist, _waterMode, _shoreMode, objNull]);
		if(count _testPos == 0)then {_allowPos=false};
	};

	if(!_allowPos)then{
		_attempts = _attempts + 1;
		_attempts2 = _attempts2 + 1;
		if ( ( _attempts > 50 ) && ( _dist < _maxDist ) ) then {
			_dist = ( _dist + (( _maxDist / 8 ) max 100 ) );
			_attempts = 0;
		};
	};

};

diag_log format ["m_fnc_findSafePos.sqf time %1", time - _run_timer];

[_testPos, _roads];
