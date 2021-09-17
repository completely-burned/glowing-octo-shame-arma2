#define __A2OA__

// тут все сделано неправильно, надо исправить

waitUntil {!isNil "bis_fnc_init"};
waitUntil {!isNil "gosa_fnc_init"};
waitUntil {!isNil "locationStarted"};
waitUntil {!isNil "GroupsStarted"};
waitUntil {!isNil "gosa_framesAVG"};

diag_log format ["Log: [UpdateReinforcement.sqf] post waitUntil %1", time];

private["_minGroups","_enemyCoefficient","_playerCoefficient","_enemyCoefficientCfg","_timeFriendlyReinforcements","_limit_fps","_frames_required","_time","_dyn_limit",
	"_z","_dfi","_conveyer","_conveyer_limit"];

_conveyer = [];

_dfi = gosa_server_diag_fps_interval;
_minGroups = missionNamespace getVariable "minGroups";
_dyn_limit = _minGroups;
_enemyCoefficientCfg = missionNamespace getVariable "enemyCoefficient";
_playerCoefficient = missionNamespace getVariable "playerCoefficient";
_timeFriendlyReinforcements = (missionNamespace getVariable "timeFriendlyReinforcements") * 60;
_limit_fps = (missionNamespace getVariable "gosa_ai_create_fps");
_frames_required = _limit_fps * _dfi;
_time = time;

private["_all_groups","_g_friendly","_g_patrol_f","_g_enemy","_g_patrol_e","_enemySide","_friendlySide"];

_enemySide = [west,east,resistance] - gosa_friendlyside;
_friendlySide = gosa_friendlyside - [civilian];

while{true}do{
	// diag_log format ["UpdateReinforcement.sqf 17, %1", time];
	_g_friendly = 0; _g_patrol_f = 0; _g_enemy = 0; _g_patrol_e = 0;
	{
		private ["_grp"];
		_grp=_x;
		Private["_side"];
		_side = side _grp;

		if (_side in [west,east,resistance]) then {
			if({_x call gosa_fnc_isPlayer} count units _grp == 0)then{
				if({alive _x} count units _grp > 0)then{
					if (!isNil {_grp GetVariable "patrol"}) then {
						if (_side in _friendlySide) then {
							_g_patrol_f = _g_patrol_f + 1;
						}else{
							_g_patrol_e = _g_patrol_e + 1;
						};
					}else{
						if (_side in _friendlySide) then {
							_g_friendly = _g_friendly + 1;
						}else{
							_g_enemy = _g_enemy + 1;
						};
					};
				};
			};
		};
	}forEach allGroups;

	_all_groups=(_g_patrol_f+_g_patrol_e+_g_friendly+_g_enemy);

	diag_log format ["Log: [UpdateReinforcement.sqf] count group %1", _all_groups];

	if (isMultiplayer)then{
		{
			if(_x call gosa_fnc_isPlayer)then{
				_g_friendly = _g_friendly + _playerCoefficient;
			};
		}forEach ([] call BIS_fnc_listPlayers);
	}else{
		_g_friendly = _g_friendly + _playerCoefficient;
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


	//--- conveyer ---
		for "_i" from 0 to count _conveyer -1 do {
			if (scriptDone (_conveyer select _i select 0)) then {
				_conveyer set [_i, -1];
			};
		};
		_conveyer = _conveyer -[-1];

		diag_log format ["Log: [UpdateReinforcement.sqf] count conveyer %1", count _conveyer];

#ifdef __A2OA__
		if(_all_groups < _dyn_limit or {_all_groups < _minGroups && _limit_fps == 0})then{
#else
		if(_all_groups < _dyn_limit or (_all_groups < _minGroups && _limit_fps == 0))then{
#endif
			private ["_difference"];
			_difference = (((_all_groups / 5) min 4) max 2);
			// diag_log format ["UpdateReinforcement.sqf 106, %1", time];
			if (_g_friendly * _enemyCoefficient + _difference >= _g_enemy) then {
				_conveyer set [count _conveyer, [[_friendlySide call BIS_fnc_selectRandom] spawn gosa_fnc_call_reinforcement, 0]];
			};
			if (_g_enemy + _difference >= _g_friendly * _enemyCoefficient) then {
				_conveyer set [count _conveyer, [[_enemySide call BIS_fnc_selectRandom] spawn gosa_fnc_call_reinforcement, 1]];
			};
			/*
			if ((_g_patrol_e + _g_patrol_f) < ((_g_enemy + _g_friendly) / 4)) then {
				if (_g_patrol_f * _enemyCoefficient + _difference >= _g_patrol_e) then {
					[_enemySide call BIS_fnc_selectRandom,"patrol"] call gosa_fnc_call_reinforcement;
				};
				if (_g_patrol_e + _difference >= _g_patrol_f * _enemyCoefficient) then {
					[_friendlySide call BIS_fnc_selectRandom,"patrol"] call gosa_fnc_call_reinforcement;
				};
			};
			*/
			if (debug) then {
				// player globalChat format ["UpdateReinforcement.sqf: %1", _all_groups];
			};
		};
	// diag_log format ["UpdateReinforcement.sqf 121, %1", time];
	sleep 0.1;

	_z = 2*((time-_time) / _dfi);
	if(gosa_framesAVG > _frames_required)then{
		_dyn_limit = _dyn_limit + _z;
		diag_log format ["Log: [UpdateReinforcement.sqf] + 2* %1 / %2 = %3", _z, _dfi, _z];
	}else{
		diag_log format ["Log: [UpdateReinforcement.sqf] - 2* %1 / %2 = %3", _z, _dfi, _z];
		_dyn_limit = _minGroups max _dyn_limit - _z;
	};
	diag_log format ["Log: [UpdateReinforcement.sqf] _frames_current %2, _frames_required %3, _limit %4", time, gosa_framesAVG, _frames_required, _dyn_limit];
	_time = time;
};
		// if ((_guer < maxGroups/7*2)&&(_east+4 > _guer)&&(_west+4 > _guer)) then {

diag_log format ["Log: [UpdateReinforcement.sqf] scriptDone %1", time];
