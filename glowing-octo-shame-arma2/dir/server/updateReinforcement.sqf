// тут все сделано неправильно, надо исправить

waitUntil {!isNil "bis_fnc_init"};
waitUntil {!isNil "gosa_fnc_init"};
waitUntil {!isNil "locationStarted"};
waitUntil {!isNil "GroupsStarted"};
waitUntil {!isNil "gosa_framesAVG"};

private["_minGroups","_enemyCoefficient","_playerCoefficient","_enemyCoefficientCfg","_timeFriendlyReinforcements","_limit_fps","_frames_required","_time","_avgGroups"];
_minGroups = missionNamespace getVariable "minGroups";
_avgGroups = _minGroups;
_enemyCoefficientCfg = missionNamespace getVariable "enemyCoefficient";
_playerCoefficient = missionNamespace getVariable "playerCoefficient";
_timeFriendlyReinforcements = (missionNamespace getVariable "timeFriendlyReinforcements") * 60;
_limit_fps = (missionNamespace getVariable "gosa_ai_create_fps");
_frames_required = _limit_fps * gosa_server_diag_fps_interval;
_time = time;

private["_all_groups","_friendlyGroups","_friendlyPatrols","_enemyGroups","_enemyPatrols","_enemySide"];

_enemySide = [west,east,resistance] - gosa_friendlyside;

while{true}do{
	// diag_log format ["UpdateReinforcement.sqf 17, %1", time];
	_friendlyGroups = 0; _friendlyPatrols = 0; _enemyGroups = 0; _enemyPatrols = 0;
	{
		private ["_grp"];
		_grp=_x;
		Private["_side"];
		_side = side _grp;

		if (_side in [west,east,resistance]) then {
			if({_x call gosa_fnc_isPlayer} count units _grp == 0)then{
				if({alive _x} count units _grp > 0)then{
					if (!isNil {_grp GetVariable "patrol"}) then {
						if (_side in gosa_friendlyside) then {
							_friendlyPatrols = _friendlyPatrols + 1;
						}else{
							_enemyPatrols = _enemyPatrols + 1;
						};
					}else{
						if (_side in gosa_friendlyside) then {
							_friendlyGroups = _friendlyGroups + 1;
						}else{
							_enemyGroups = _enemyGroups + 1;
						};
					};
				};
			};
		};
	}forEach allGroups;

	_all_groups=(_friendlyPatrols+_enemyPatrols+_friendlyGroups+_enemyGroups);

	if (isMultiplayer)then{
		{
			if(_x call gosa_fnc_isPlayer)then{
				_friendlyGroups = _friendlyGroups + _playerCoefficient;
			};
		}forEach ([] call BIS_fnc_listPlayers);
	}else{
		_friendlyGroups = _friendlyGroups + _playerCoefficient;
	};

	if(!isNil {CivilianLocationStartTime})then{
		private["_time"];
		_time = time - CivilianLocationStartTime;
		_enemyCoefficient =  _timeFriendlyReinforcements / _time;
		_enemyCoefficient = (_enemyCoefficientCfg min _enemyCoefficient) max 1;
	}else{
		_enemyCoefficient = _enemyCoefficientCfg;
	};

	if(playerSide == civilian)then{
		_enemyCoefficient = 1;
	};

		if(_all_groups < _avgGroups or {_all_groups < _minGroups && _limit_fps == 0})then{
			private ["_difference"];
			_difference = (((_all_groups / 5) min 4) max 2);
			// diag_log format ["UpdateReinforcement.sqf 106, %1", time];
			if (_friendlyGroups * _enemyCoefficient + _difference >= _enemyGroups) then {
				[_enemySide call BIS_fnc_selectRandom] call gosa_fnc_call_reinforcement;
			};
			if (_enemyGroups + _difference >= _friendlyGroups * _enemyCoefficient) then {
				[gosa_friendlyside call BIS_fnc_selectRandom] call gosa_fnc_call_reinforcement;
			};
			/*
			if ((_enemyPatrols + _friendlyPatrols) < ((_enemyGroups + _friendlyGroups) / 4)) then {
				if (_friendlyPatrols * _enemyCoefficient + _difference >= _enemyPatrols) then {
					[_enemySide call BIS_fnc_selectRandom,"patrol"] call gosa_fnc_call_reinforcement;
				};
				if (_enemyPatrols + _difference >= _friendlyPatrols * _enemyCoefficient) then {
					[gosa_friendlyside call BIS_fnc_selectRandom,"patrol"] call gosa_fnc_call_reinforcement;
				};
			};
			*/
			if (debug) then {
				// player globalChat format ["UpdateReinforcement.sqf: %1", _all_groups];
			};
		};
	// diag_log format ["UpdateReinforcement.sqf 121, %1", time];
	sleep 0.1;

	if(gosa_framesAVG > _frames_required)then{
		_avgGroups = _avgGroups + 2*(_time / gosa_server_diag_fps_interval);
	}else{
		_avgGroups = _minGroups max (_avgGroups - 2*(_time / gosa_server_diag_fps_interval));
	};
	diag_log format ["Log: [UpdateReinforcement.sqf] %1, %2", time, _avgGroups];
	_time = time;
};
		// if ((_guer < maxGroups/7*2)&&(_east+4 > _guer)&&(_west+4 > _guer)) then {
