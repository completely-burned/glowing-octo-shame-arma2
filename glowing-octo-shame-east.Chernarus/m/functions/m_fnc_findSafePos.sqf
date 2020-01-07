	// diag_log format ["m_fnc_findSafePos.sqf 1, %1", time];

private["_run_timer"];
_run_timer = time;

private ["_pos","_minDist","_maxDist","_objDist","_waterMode","_maxGradient","_shoreMode","_blacklist","_side","_posX","_posY","_dist","_attempts","_visible","_testPos","_preferRoads"];
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
if ((count _pos) == 0) exitWith {debugLog "Log: [findSafePos] No center position was passed!"; []};

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
_visible = true;
// private ["_groupPosList"];
// _groupPosList=[0];
private ["_nearRoads"];
if(_preferRoads)then{
	_nearRoads = (_pos nearRoads _dist);
};
while {_visible} do {
	if(_attempts2 >= 5000)exitWith{_testPos = []};

	if(_preferRoads)then{
		if(count _nearRoads > 0)then{
			_testPos = getPos (_nearRoads call BIS_fnc_selectRandom);
		};
	}else{
		private ["_dir","_dist2"];
		_dir = random 360;
		_dist2 = random _dist;
		_testPos = [_posX + _dist2*sin _dir, _posY + _dist2*cos _dir];
	};

	// if(count _testPos == 0)then{
	// };

	// "test" setMarkerPos _testPos;

	_visible=false;
	if((!_visible) && true)then
	{
		_visible = ([_testPos,_minDist] call m_fnc_CheckPlayersDistance);
	};

	if(count _this > 10)then {
     if(!_visible)then {
			ScopeName "CheckForEnemy";
			{
				private "_leader";
				_leader = leader _x;
				if (alive _leader) then {
					if (( side _x getFriend _side) < 0.6 ) then {
						if ((vehicle leader _x distance _testPos) < (_minDist min 1500))then {
													_visible = true;
							BreakTo "CheckForEnemy";
						};
					};
				};
				// sleep 0.0001;
			} forEach allGroups;
		};
		// if(!_visible)then {
            // if ([_testPos, _minDist min 750, _side] call m_fnc_CheckCombatNearUnits ) then {
				// _visible = true;
			// };
		// };
	};

	if(!_visible)then{
		_visible = ([_testPos, _blacklist] call BIS_fnc_isPosBlacklisted);
	};

	if(!_visible)then{
		// sleep 0.01;
		_testPos = (_testPos isFlatEmpty [_objDist, -1, _maxGradient, _objDist, _waterMode, _shoreMode, objNull]);
		if(isNil "_testPos")then{_testPos=[]};
		if(count _testPos == 0)then {_visible=true};
	};

	_attempts = _attempts + 1;
	_attempts2 = _attempts2 + 1;
	if ( ( _attempts > 50 ) && ( _dist < _maxDist ) ) then {
		_dist = ( _dist + (( _maxDist / 8 ) max 100 ) );
		if(_preferRoads)then{
			_nearRoads = (_pos nearRoads _dist);
		};
		_attempts = 0;
	};
	// sleep 0.0001;

};

	// diag_log format ["m_fnc_findSafePos.sqf 119, %1", time];

diag_log format ["m_fnc_findSafePos.sqf time %1", time - _run_timer];

_testPos;
