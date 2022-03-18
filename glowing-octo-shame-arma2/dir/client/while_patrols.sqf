#define __A2OA__

private["_count_groups","_grp","_leader","_friendlyPatrols","_enemyPatrols","_friendlyGroups",
	"_enemyGroups","_enemySide","_friendlySide","_side","_ai_client_count","_cache","_ok",
	"_avgGroups","_limit_fps","_frames_required","_time","_respawn_mode","_enemyCoefficient",
	"_run","_h","_s","_conveyer","_conveyer_limit"];

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

if (_respawn_mode == 1 or
	_ai_client_count > 0 or
	_limit_fps > 0
 )then{
	_run = true;
 }else{
	_run = false;
};

if (isNil "gosa_logic_local") then {
	gosa_logic_local = (createGroup sideLogic createUnit ["logic", position player, [], 0, "CAN_COLLIDE"]);
	diag_log format ["Log: [while_patrols.sqf] gosa_logic_local created %1", gosa_logic_local];
};

_conveyer = [];
_conveyer_limit = 8;

while{_run}do{

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
					// exitWith выходит только из forEach ??
					//--- при обнаружении игрока нет смысла проверять остальных юнитов
					if (_x call gosa_fnc_isPlayer) exitWith { _ok = false };
			} forEach units _grp;

				if(_ok)then{
					if (!isNil {_grp GetVariable "patrol"} or
						(vehicle _leader call gosa_fnc_isUAV)
					) then {
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
												_enemyGroups, _enemyPatrols, _friendlyGroups, _friendlyPatrols]; // diag_log


	//--- подсчет соотношений ---
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

	//--- conveyer ---
		for "_i" from 0 to count _conveyer -1 do {
			if (scriptDone (_conveyer select _i select 0)) then {
				_conveyer set [_i, -1];
			};
		};
		_conveyer = _conveyer -[-1];

		diag_log format ["Log: [while_patrols.sqf] count conveyer %1", count _conveyer];


	//--- создание групп ---

		//--- аварийная группа возрождения
			if (!isNil "gosa_player_needs_revival" or ( _respawn_mode == 1 && _friendlyGroups < 1 && {local _x} count units player < 3 )) then {
				if ({_x select 1 == 4} count _conveyer < 1) then {
					_conveyer set [count _conveyer, [[_friendlySide] spawn gosa_fnc_failoverGroup, 4]];
				};
			};

		//--- группы
			_z = {_x select 1 == 0} count _conveyer;
			if (_enemyGroups +_z < (_limits select 0) && count _conveyer < _conveyer_limit) then {
				_conveyer set [count _conveyer, [[_enemySide call BIS_fnc_selectRandom, objNull] spawn gosa_fnc_call_reinforcement, 0]];
			};
			_z = {_x select 1 == 1} count _conveyer;
			if (_enemyPatrols +_z < (_limits select 1) && count _conveyer < _conveyer_limit) then {
				_conveyer set [count _conveyer, [[_enemySide call BIS_fnc_selectRandom, player] spawn gosa_fnc_call_reinforcement, 1]];
			};
			_z = {_x select 1 == 2} count _conveyer;
			if (_friendlyGroups +_z < (_limits select 2) && count _conveyer < _conveyer_limit) then {
				_conveyer set [count _conveyer, [[_friendlySide call BIS_fnc_selectRandom, objNull] spawn gosa_fnc_call_reinforcement, 2]];
			};
			_z = {_x select 1 == 3} count _conveyer;
			if (_friendlyPatrols +_z < (_limits select 3) && count _conveyer < _conveyer_limit) then {
				_conveyer set [count _conveyer, [[_friendlySide call BIS_fnc_selectRandom, player] spawn gosa_fnc_call_reinforcement, 3]];
			};


	// динамическое ограничение
	if(_limit_fps > 0)then{
		if(gosa_framesAVG > _frames_required)then{
			// не понижать ниже нуля
			// TODO: при большом отклонении колл-ва групп нужно другое поведение
			_avgGroups = 0 max (
				_avgGroups + 2*(_time / gosa_server_diag_fps_interval)
			);
		}else{
			// не понижать ниже нуля
			// TODO: при большом отклонении колл-ва групп нужно другое поведение
			_avgGroups = 0 max (
				_avgGroups - 2*(_time / gosa_server_diag_fps_interval)
			);
		};
		diag_log format ["Log: [while_patrols.sqf] %1, лимит %2", time, _avgGroups];
		_time = time;
	};

}; // main while

diag_log format ["Log: [while_patrols.sqf] done %1 ", time];
