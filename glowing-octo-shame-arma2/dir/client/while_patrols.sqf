#define __A2OA__

private["_count_groups","_grp","_leader","_friendlyPatrols","_enemyPatrols","_friendlyGroups",
	"_enemyGroups","_enemySide","_friendlySide","_side","_ai_client_count","_cache","_ok",
	"_avgGroups","_limit_fps","_frames_required","_time","_respawn_mode","_enemyCoefficient",
	"_run","_h","_s"];

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
					//--- при обнаружении игрока нет смысла проверять остальных юнитов // exitWith выходит только из forEach ??
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
												_enemyGroups, _enemyPatrols, _friendlyGroups, _friendlyPatrols];


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



	//--- создание групп ---
		if (_enemyGroups < _limits select 0 && isNil {gosa_logic_local getVariable "gosa_handle_enemyGroups"}) then {
			_h = _enemySide spawn {
				diag_log format ["Log: [while_patrols.sqf] _enemyGroups %1 spawn fnc_call_reinforcement", _this];
				[_this call BIS_fnc_selectRandom] call gosa_fnc_call_reinforcement;
				gosa_logic_local setVariable ["gosa_handle_enemyGroups", nil];
			};
			gosa_logic_local setVariable ["gosa_handle_enemyGroups", _h];
		};

		if (_enemyPatrols < _limits select 1 && isNil {gosa_logic_local getVariable "gosa_handle_enemyPatrols"}) then {
			_h = _enemySide spawn {
				diag_log format ["Log: [while_patrols.sqf] _enemyPatrols %1 spawn fnc_call_reinforcement", _this];
				[_this call BIS_fnc_selectRandom, player] call gosa_fnc_call_reinforcement;
				gosa_logic_local setVariable ["gosa_handle_enemyPatrols", nil];
			};
			gosa_logic_local setVariable ["gosa_handle_enemyPatrols", _h];
		};

		//--- _friendlyGroups ---
			// создовать зарание группу перерождения нужно для быстрого и комфортного возрождения игрока, хотя она может создоватся и после смерти игрока
			// не желательно создавать лишнюю союзную группу это протит баланс
			// в группе нет необходимости если в текущей группе достаточно юнитов для перерождения
			// локальные группы отображають лишь alive, но нужна проверка local для отсеивания других игроков в группе
			if (isNil {gosa_logic_local getVariable "gosa_handle_friendlyGroups"}) then {
				// diag_log format ["Log: [while_patrols.sqf] isNil gosa_handle_friendlyGroups", nil];
				if (_friendlyGroups < _limits select 2 or !isNil "gosa_player_needs_revival" or ( _respawn_mode == 1 && _friendlyGroups < 1 && {local _x} count units player < 3 )) then {
					diag_log format ["Log: [while_patrols.sqf] _friendlyGroups pre spawn", nil];
					_h = _friendlySide spawn {
						diag_log format ["Log: [while_patrols.sqf] _friendlyGroups %1 spawn fnc_call_reinforcement", _this];
						[_this call BIS_fnc_selectRandom] call gosa_fnc_call_reinforcement;
						gosa_player_needs_revival = nil;
						gosa_logic_local setVariable ["gosa_handle_friendlyGroups", nil];
					};
					gosa_logic_local setVariable ["gosa_handle_friendlyGroups", _h];
				};
			}else{
				diag_log format ["Log: [while_patrols.sqf] !isNil gosa_handle_friendlyGroups", nil];
			};

		if (_friendlyPatrols < _limits select 3 && isNil {gosa_logic_local getVariable "gosa_handle_friendlyPatrols"}) then {
			_h = _friendlySide spawn {
				diag_log format ["Log: [while_patrols.sqf] _friendlyPatrols %1 spawn fnc_call_reinforcement", _this];
				[_this call BIS_fnc_selectRandom, player] call gosa_fnc_call_reinforcement;
				gosa_logic_local setVariable ["gosa_handle_friendlyPatrols", nil];
			};
			gosa_logic_local setVariable ["gosa_handle_friendlyPatrols", _h];
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
