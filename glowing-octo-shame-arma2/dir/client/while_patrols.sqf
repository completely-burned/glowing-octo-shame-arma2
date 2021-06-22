private["_count_groups","_grp","_leader","_friendlyPatrols","_enemyPatrols","_friendlyGroups","_enemyGroups","_enemySide","_side","_ai_client_count","_cache","_ok"];

	diag_log format ["Log: [while_patrols.sqf] started %1", time ];

waitUntil {!isNil "AllGroupsWest"};
waitUntil {!isNil "AllGroupsEast"};
waitUntil {!isNil "AllGroupsGuer"};
waitUntil {!isNil "GroupsStarted"};

waitUntil {!isNil "bis_fnc_init"};
waitUntil {!isNil "gosa_fnc_init"};

waitUntil {!isNil "playerReady"};

waitUntil {!isNil "enemyCoefficient" && !isNil "gosa_friendlyside"};
_enemySide = [west,east,resistance] - gosa_friendlyside;

// _timeFriendlyReinforcements = (missionNamespace getVariable "timeFriendlyReinforcements") * 60;

_ai_client_count = missionNamespace getVariable "ai_client_count";

while{ _ai_client_count > 0 }do{

	scopeName "while"; // перезапись scopeName в цикле ??

	sleep 2;

	// считаем группы чтобы не создавать лишние и для баланса
	_friendlyPatrols = 0; _enemyPatrols = 0;
	_friendlyGroups = 0;  _enemyGroups = 0;

	// gosa_cacheLocalGroups кеширует список групп чтобы не проверять всегда все
	if (isNil "gosa_cacheLocalGroups") then {
		_cache = [];
	}else{
		_cache = gosa_cacheLocalGroups;
	};

	//--- подсчет кэшированных групп
	for "_i" from 0 to ((count _cache) - 1) do {
		_grp = (_cache select _i);

		// нужны тесты производительности
		_ok=false;
		{
				//--- если _ok==true проверка alive не выполяется и не перезаписывается _ok
				if (!_ok && {alive _x}) then {_ok = true};
				//--- при обнаружении игрока нет смысла проверять остальных юнитов // exitWith выходит только из forEach ??
				if (_x call gosa_fnc_isPlayer) exitWith { _ok = false };
		} forEach units _grp;

		if(_ok)then{
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

			// если найдено достаточно подходящих локальных групп, то нет смысла проверять остальные
			if (_enemyPatrols+_enemyGroups >= _ai_client_count) then {
				breakTo "while;"
			};

		};
	};

	// если найдено достаточно локальных групп, то нет смысла проверять остальные
	if (_enemyPatrols+_enemyGroups < _ai_client_count) then {
	{
		_grp=_x;
		_side = side _grp;
		_leader = leader _grp;

		if (local _leader && _side in [west,east,resistance]) then {

			_cache set [count _cache, _grp];

			// нужны тесты производительности
			_ok=false;
			{
					//--- если _ok==true проверка alive не выполяется и не перезаписывается _ok
					if (!_ok && {alive _x}) then {_ok = true};
					//--- при обнаружении игрока нет смысла проверять остальных юнитов // exitWith выходит только из forEach ??
					if (_x call gosa_fnc_isPlayer) exitWith { _ok = false };
			} forEach units _grp;

				if(_ok)then{
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

					// если найдено достаточно локальных групп, то нет смысла проверять остальные
					if (_enemyPatrols+_enemyGroups >= _ai_client_count) then {
						breakTo "while;"
					};

				};
		};
	}forEach allGroups-_cache;
	};

		diag_log format ["Log: [while_patrols.sqf] _friendlyPatrols %1 _enemyPatrols %2, _friendlyGroups %3 _enemyGroups %4", _friendlyPatrols, _enemyPatrols, _friendlyGroups, _enemyGroups];

	// ограничим количество созданных локально игроку патрулей
	if(_friendlyPatrols+_enemyPatrols < _ai_client_count/2)then{

		// поддерживаем соотношение союзников и противников выбираем side для создания
		private ["_difference"];
		_difference = 0;
		if (_friendlyPatrols * enemyCoefficient + _difference >= _enemyPatrols) then {
			_side = _enemySide call BIS_fnc_selectRandom;
		}else{
			_side = gosa_friendlyside call BIS_fnc_selectRandom;
		};

		private["_player","_typeList","_pos"];

		// патрули создаются рядом с игроком
		_player = player;
		_pos = getPos _player;

		private["_run"];
		_run = true;

		// нормальный игрок не должен быть в позиции [0,0], игнорируем его
		if (_pos distance [0,0] < 1) then {
				diag_log format ["Log: [while_patrols.sqf] _pos = [0,0] _player = %1 ", _player];
			_run = false;
		};

		if(_run)then{

			switch (_side) do {
				case (east):
				{
					_typeList=AllGroupsEast;
				};
				case (west):
				{
					_typeList=AllGroupsWest;
				};
				case (resistance):
				{
					_typeList=AllGroupsGuer;
				};
				default {};
			};

			private["_pos_resp","_SafePosParams","_types","_grp1"];
			if (isNil "_typeList") exitWith {
				// иногда _typeList пустой, нужно исправить
					diag_log format ["Log: [while_patrols.sqf] isNil _typeList", nil];
			};
			_grp1 = (_typeList call BIS_fnc_selectRandomWeighted);
			_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;

			_SafePosParams = ([_types] call gosa_fnc_SafePosParams);

			// увеличивает максимальный радиус поиска позиции для создания патруля
			_SafePosParams set [1,((_SafePosParams select 1) * 2)];

				diag_log format ["Log: [while_patrols.sqf] creating %1 ", [_pos]+_SafePosParams+[_side]];

			_pos_resp = ([_pos]+_SafePosParams+[_side] call gosa_fnc_findSafePos);
			if(count (_pos_resp select 0) == 0)exitWith{}; // _pos_resp без позиции если не нашлось подходящей позиции

			private["_groups"];
			_groups = ([_pos_resp, _side, _grp1 select 0] call gosa_fnc_spawnGroup);

			_cache=_cache+_groups;

			// помечаем группу что это патруль и она готова для дальнейших скриптов
			{
				_x setVariable ["patrol", true, true];
				_x setVariable ["grp_created", true, true];
			} forEach _groups;

				diag_log format ["Log: [while_patrols.sqf] created %1 ", _groups];
		};

	};

	// ограничим количество созданных локально игроку подкреплений
	if(_friendlyGroups+_enemyGroups < _ai_client_count/2)then{



		// поддерживаем соотношение союзников и противников выбираем side для создания
		private ["_difference","_enemyCoefficient"];

		// со временем количество противников на локации уменьшается
		/* доделаю после
		if(!isNil {CivilianLocationStartTime})then{
			private["_time"];
			_time = time - CivilianLocationStartTime;
			_enemyCoefficient =  _timeFriendlyReinforcements / _time;
			_enemyCoefficient = (enemyCoefficient min _enemyCoefficient) max 1;
		}else{
			_enemyCoefficient = enemyCoefficient;
		};
		*/
		_enemyCoefficient = enemyCoefficient;

		// у гражданских соотношение противники 1:1 союзники
		if(playerSide == civilian)then{
			_enemyCoefficient = 1;
		};

		diag_log format ["Log: [while_patrols.sqf] _enemyCoefficient = %1 ", _enemyCoefficient];

		// _difference = 0;
		if (_friendlyGroups * _enemyCoefficient >= _enemyGroups) then {
			_side = _enemySide call BIS_fnc_selectRandom;
		}else{
			_side = gosa_friendlyside call BIS_fnc_selectRandom;
		};


		private["_run"];
		_run = true;


		if(_run)then{

			private["_typeList","_pos","_pos_resp","_SafePosParams","_types","_grp1"];

			// подкрепления создаются рядом с локацией
			_pos = civilianBasePos;

			// локация не должен быть в позиции [0,0], игнорируем его
			if (_pos distance [0,0] < 1) then {
				diag_log format ["Log: [while_patrols.sqf] _pos = [0,0] _player = %1 ", _player];
				_run = false;
			};

			switch (_side) do {
				case (east):
				{
					_typeList=AllGroupsEast;
				};
				case (west):
				{
					_typeList=AllGroupsWest;
				};
				case (resistance):
				{
					_typeList=AllGroupsGuer;
				};
				default {};
			};

			if (isNil "_typeList") exitWith {
				// иногда _typeList пустой, нужно исправить
				diag_log format ["Log: [while_patrols.sqf] isNil _typeList", nil];
			};



			_grp1 = (_typeList call BIS_fnc_selectRandomWeighted);
			_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;

			_SafePosParams = ([_types] call gosa_fnc_SafePosParams);

			diag_log format ["Log: [while_patrols.sqf] creating %1 ", [_pos]+_SafePosParams+[_side]];

			_pos_resp = ([_pos]+_SafePosParams+[_side] call gosa_fnc_findSafePos);
			if(count (_pos_resp select 0) == 0)exitWith{}; // _pos_resp без позиции если не нашлось подходящей позиции

			private["_groups"];
			_groups = ([_pos_resp, _side, _grp1 select 0] call gosa_fnc_spawnGroup);

			_cache=_cache+_groups;

			// помечаем группу что она готова для дальнейших скриптов
			{
				_x setVariable ["grp_created", true, true];
			} forEach _groups;

			diag_log format ["Log: [while_patrols.sqf] created %1 ", _groups];
		};

	};

	gosa_cacheLocalGroups = _cache-[grpNull];

};

diag_log format ["Log: [while_patrols.sqf] done %1 ", time];
