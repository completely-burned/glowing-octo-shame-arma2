#define __A2OA__

private["_count_groups","_grp","_leader","_friendlyPatrols","_enemyPatrols","_friendlyGroups","_enemyGroups","_enemySide","_friendlySide","_side","_ai_client_count","_cache","_ok","_avgGroups","_limit_fps","_frames_required","_time","_respawn_mode","_enemyCoefficient"];

	diag_log format ["Log: [while_patrols.sqf] started %1", time ];

waitUntil {!isNil "AllGroupsWest"};
waitUntil {!isNil "AllGroupsEast"};
waitUntil {!isNil "AllGroupsGuer"};
waitUntil {!isNil "GroupsStarted"};

waitUntil {!isNil "bis_fnc_init"};
waitUntil {!isNil "gosa_fnc_init"};

waitUntil {!isNil "playerReady"};
waitUntil {!isNil "gosa_framesAVG"};

waitUntil {!isNil "enemyCoefficient" && !isNil "gosa_friendlyside"};

waitUntil {!isNil "civilianBasePos"};

_enemySide = [west,east,resistance] - gosa_friendlyside;
_friendlySide = gosa_friendlyside - [civilian];

// _timeFriendlyReinforcements = (missionNamespace getVariable "timeFriendlyReinforcements") * 60;

_ai_client_count = missionNamespace getVariable "ai_client_count";
_avgGroups = _ai_client_count;
_limit_fps = (missionNamespace getVariable "gosa_ai_client_create_fps");
_frames_required = _limit_fps * gosa_server_diag_fps_interval;
_time = time;

_respawn_mode = missionNamespace getVariable "respawn";

while{ _ai_client_count > 0 }do{

	sleep 2;

	// считаем группы чтобы не создавать лишние и для баланса
	_friendlyPatrols = 0; _enemyPatrols = 0;
	_friendlyGroups = 0;  _enemyGroups = 0;
	{
		_grp=_x;
		_side = side _grp;
		_leader = leader _grp;
		// нужно ситать только локальные группы
		if (local _leader && _side in [west,east,resistance]) then {
			// нужны тесты производительности
			_ok=false;
			{
					//--- если _ok==true проверка alive не выполяется и не перезаписывается _ok
					#ifdef __A2OA__
					if (!_ok && {alive _x}) then {_ok = true};
					#else
					if (alive _x) then {_ok = true};
					#endif
					//--- при обнаружении игрока нет смысла проверять остальных юнитов // exitWith выходит только из forEach ??
					if (_x call gosa_fnc_isPlayer) exitWith { _ok = false };
			} forEach units _grp;

				if(_ok)then{
					if (!isNil {_grp GetVariable "patrol"}) then {
						if (_side in _friendlySide) then {
							_friendlyPatrols = _friendlyPatrols + 1;
						}else{
							_enemyPatrols = _enemyPatrols + 1;
						};
					}else{
						if (_side in _friendlySide) then {
							_friendlyGroups = _friendlyGroups + 1;
						}else{
							_enemyGroups = _enemyGroups + 1;
						};
					};
				};
		};
	} forEach allGroups;

	diag_log format ["Log: [while_patrols.sqf] _enemyGroups %1, _enemyPatrols %2, _friendlyGroups %3, _friendlyPatrols %4", 
												_enemyGroups, _enemyPatrols, _friendlyGroups, _friendlyPatrols];


		//
		_enemyCoefficient = enemyCoefficient;

		// у гражданских соотношение противники 1:1 союзники
		if(playerSide == civilian)then{
			_enemyCoefficient = 1;
		};

		// где /2 это поровну патрули и подкрепления, у меня плохо с математекой (
		_limits = [
			((_avgGroups / (1+_enemyCoefficient)) * _enemyCoefficient)	/ 2,	// enemy 
			((_avgGroups / (1+_enemyCoefficient)) * _enemyCoefficient)	/ 2,	// enemy 
			( _avgGroups / (1+_enemyCoefficient)) 						/ 2,	// friendly
			( _avgGroups / (1+_enemyCoefficient)) 						/ 2,	// friendly
			_avgGroups
		];
		diag_log format ["Log: [while_patrols.sqf] _limits = %1", _limits];

		if (_enemyGroups 	< _limits select 0) then {
			[_enemySide call BIS_fnc_selectRandom]			call gosa_fnc_call_reinforcement;
		};
		if (_enemyPatrols 	< _limits select 1) then {
			[_enemySide call BIS_fnc_selectRandom, player] call gosa_fnc_call_reinforcement;
		};
		if (_friendlyGroups < _limits select 2 or (_respawn_mode == 1 && _friendlyGroups < 1)) then {
			[_friendlySide call BIS_fnc_selectRandom]		call gosa_fnc_call_reinforcement;
		};
		if (_friendlyPatrols < _limits select 3) then {
			[_friendlySide call BIS_fnc_selectRandom, player] call gosa_fnc_call_reinforcement;
		};


	// динамическое ограничение
	if(_limit_fps > 0)then{
		if(gosa_framesAVG > _frames_required)then{
			_avgGroups = 0 max ( // не понижать ниже нуля
				_avgGroups + 2*(_time / gosa_server_diag_fps_interval)
			); // TODO: при большом отклонении колл-ва групп нужно другое поведение
		}else{
			_avgGroups = 0 max ( // не понижать ниже нуля
				_avgGroups - 2*(_time / gosa_server_diag_fps_interval)
			); // TODO: при большом отклонении колл-ва групп нужно другое поведение
		};
		diag_log format ["Log: [while_patrols.sqf] %1, лимит %2", time, _avgGroups];
		_time = time;
	};

}; // main while

diag_log format ["Log: [while_patrols.sqf] done %1 ", time];
