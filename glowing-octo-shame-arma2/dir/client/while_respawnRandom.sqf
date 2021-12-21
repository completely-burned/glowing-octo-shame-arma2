#define __A2OA__

/*
скрипт возрождния в случайного юнита.
TODO: нужна проверка AFK на игроков и лидеров группы
FIXME: у меня нет возможности проверить этот режим должным образом, поэтому тут гадание, и вероятно не все проверки необходимы
FIXME: при проверки name возможно переменная selectPlayerDisable становится лишней
*/

private ["_bestCandidate","_p","_units","_leader","_grp","_pos","_first",
	"_listPlayers","_deathTime","_cam","_t","_o","_z","_p_name"];

if(missionNamespace getVariable "respawn" != 1)exitWith{
	respawnDone = true;
	diag_log format ["Log: [respawnRandom] respawnDone %1", time];
};

_p = player;
_p_name = name player;

_cam = objNull;

_o = gosa_owner;

gosa_lastSwitchBodyTime = -99999;

diag_log format ["Log: [respawnRandom] init info %1", [_p, _p_name, _o]];


private["_fnc_swich","_findBody"];

// переключение на новое тело
_fnc_swich={
	private["_old","_new","_b","_time","_var"];
	_old = (_this select 0);
	_new = (_this select 1);

	[nil, _new, rselectPlayer, _o] call RE; // временное решение

	_time = time+5;
	while {isNil "_var" && time < _time} do { // FIXME: это плохой способ
		_var = _new getVariable "gosa_player_owner";
		sleep 0.05;
	};

	diag_log format ["Log: [respawnRandom] _fnc_swich _var %1, _o %2", _var, _o];

	if (!isNil "_var" && {_var == _o}) then {

	if (name _old == _p_name) then { // FIXME: разные подозрения, name синхронизируется не сразу
		_old setVariable ["selectPlayerDisable", true]; // FIXME: не понимаю зачем нужно это
	};

	_new addEventHandler ["killed", {_this select 0 setVariable ["selectPlayerDisable", true, true];}];

	_b = behaviour _new;
	if (_b == "COMBAT") then { //&& (_new countEnemy (_new nearEntities ["Land", 500]) > 3)
		_new call gosa_fnc_aiFlareSupport;
	};

	diag_log format ["Log: [respawnRandom] swich %1 to %2", [_old], [_new, _b]];
	selectPlayer _new; // TODO: нужна пероверка удачного переключения

	gosa_lastSwitchBodyTime = time;

	_new call gosa_fnc_initBriefing;

	// информирование других игроков о возрождении в отряде
	[nil, _new, rhintresurrected, _p_name] call RE;

	if (gosa_loglevel > 0) then {					// diag_log TODO: нужна функция
		_z = [];									// diag_log
		{											// diag_log
			_z = _z + [_x,1];						// diag_log
		} foreach ([] call BIS_fnc_getFactions);	// diag_log
		_new setVariable ["MARTA_showRules", _z];	// diag_log
	};												// diag_log

	_new;

	}else{
		// TODO: при неудаче нужно временно добавить юнит в черный список
		_old;
	};

};

_findBody={

	private ["_uOn","_u","_uOff","_z"];
	_uOn = [];
	_u = [];
	_uOff = [];

	{
		_z = [_x] call gosa_fnc_getUnitClass;
		if (_z in gosa_squadOffW) then {
			_uOff set [count _uOff, _x];
		} else {
			if (_z in gosa_squadOnW) then {
		    _uOn set [count _uOn, _x];
			} else {
				_u set [count _u, _x];
			};
	  };
	} forEach _this;

	diag_log format ["Log: [respawnRandom] _uOn %1", _uOn];
	diag_log format ["Log: [respawnRandom] _u %1", _u];
	diag_log format ["Log: [respawnRandom] _uOff %1", _uOff];

	/* не завершено
	if ({_x != player && {_x call gosa_fnc_isPlayer}} count _this > 0) then {
		_z = true;
	} else {
		_z = false;
	};
	diag_log format ["Log: [respawnRandom] other players in squad %1", _z];
	*/

	scopename "fb1";
	{
		if (_x call _fnc_isFit) then {

			if (count gosa_squadOnW > 0) exitWith { // TODO: конфликт с рангом и лидером
				_bestCandidate = _x;
				breakTo "fb1";
			};
			if (isNil {_bestCandidate}) then {
				_bestCandidate = _x;
			};
			if ((rankId _x) > (rankId _bestCandidate)) then {
				_bestCandidate = _x;
			};
		};
	} forEach _uOn+_u+_uOff;
};
// первое тело данное при старте миссии при возрождении ведет себя иначе и не подходит
player setVariable ["selectPlayerDisable", true, true];

// после переключения на новое тело уничтожаем первое тело данное при старте т.к. оно расположено на неподходящей позиции и нужно только для старта миссии
// нужно для respawnDone = trueж
[_p] spawn {
	waitUntil{
		isNil{player getVariable "selectPlayerDisable"};
	};
	_this select 0 setDamage 1;
	respawnDone = true;
	diag_log format ["Log: [respawnRandom] respawnDone %1", time];
};

// функция отсеивает неподходящие тела для перерождения
private["_fnc_isFit"];
_fnc_isFit={
	if (
#ifndef __A2OA__
		local _this && // v1.11 если юнит не локальный не передает управление игроку
#endif
		( (_this call gosa_fnc_withinMap) or
			(!isNil "gosa_player_needs_revival" && {gosa_player_needs_revival + 25 < time})
		)	&&
		side _this in gosa_friendlyside &&
		isNil{_this getVariable "selectPlayerDisable"} &&
		alive _this &&
		(damage _this < 0.9) &&
		!(_this call gosa_fnc_isPlayer) &&
		!isNull _this &&
		!(_this call gosa_fnc_isUAV) &&
		!isNil{group _this getVariable "grp_created"} &&
		!(WaypointType [group _this, currentwaypoint group _this] in ["UNLOAD","GETOUT"]) && // TODO: нужно реализовать десант с игроками тоже
		!(vehicle _this isKindOf "StaticWeapon") &&
		!(vehicle _this isKindOf "Air") && // отключенно из-за десанта, и не умения летать некоторых игроков
		!(vehicle _this isKindOf "Ship") && // отключенно из-за десанта
		(isNil {group _this getVariable "patrol"} or vehicle _this distance civilianBasePos < (safeSpawnDistance select 1))
	) then {
		true;
	}else{
		false;
	};
};

if (isNil "gosa_SquadRole") then {
	gosa_SquadRole = -2;
};

waitUntil{!isNil "civilianBasePos"};

while {true} do {

	scopeName "root";

	_t = false;
	if (!alive _p) then {
		_t = true;
		diag_log format ["Log: [respawnRandom] not alive %1", _p];
	};
	/* при переключении другое тело не сразу становиться локальным
	if (!local _p) then { // FIXME: не исправляет ситуацию слипнувшихся игроков
		_t = true;
		diag_log format ["Log: [respawnRandom] not local %1", _p];
	};*/
	if (isNull player) then {
		_t = true;
		diag_log format ["Log: [respawnRandom] isNull %1", player];
	};

	// name синхронизируется не сразу
	/* не работает
	if (gosa_lastSwitchBodyTime + 2.5 > time) then {
		/* Проверка name не дает игрокам слипнуться.
		Помогает лишь одному игроку.
		Не всегда срабатывает даже когда ники разные.
		if (name player != _p_name or name _p != _p_name) then { // TODO: но после переключения остается сломанным предыдущий юнит из-за переменной, другой игрок
			_t = true;
			diag_log format ["Log: [respawnRandom] name player %1, name _p %2, _p_name %3", name player, name _p, _p_name];
		};
	};
	*/
	if (!isNil{_p getVariable "selectPlayerDisable"}) then {
		_t = true;
		diag_log format ["Log: [respawnRandom] blacklisted unit %1", _p];
	};
	if !(lifeState player in ["ALIVE", "UNCONSCIOUS"]) then {
		_t = true;
		diag_log format ["Log: [respawnRandom] blacklisted lifeState %1", player];
	};
	/* для local owner == 0 у всех игроков
	_z = owner _p;
	if (_z != 0) then {
		_t = true;
		diag_log format ["Log: [respawnRandom] owner %1", [_z, _o]];
	};*/
	_z = _p getVariable "gosa_player_owner";
	if (!isNil {_z}) then {
		if (_z != _o) then {
			_t = true;
			diag_log format ["Log: [respawnRandom] owner var %1", [_z, _o]];
		};
	};
	if (_t) then {

		//--- таймер смерти
		if (isNil "_deathTime") then {
			_deathTime = time+1;
			breakTo "root";
		} else {
			if (_deathTime>time) then {
				breakTo "root";
			};
		};

		_grp = group _p;

		_pos = getPos _p;

		// ищем новое тело из юнитов группы игрока т.к. они находятся рядом
		if (isNil{_bestCandidate}) then {
			diag_log format ["Log: [respawnRandom] поиск среди юнитов группы игрока %1", _grp];
			units _grp call _findBody;
		};

		_listPlayers = call BIS_fnc_listPlayers;



		//--- подключение к конкретному игроку
		if (isNil{_bestCandidate}) then {
			if (count gosa_squadOn > 0) then {
				{
					if (_x call gosa_fnc_isPlayer && getPlayerUID _x in gosa_squadOn) then {
						diag_log format ["Log: [respawnRandom] ищем среди юнитов игрока %1", _x];
						units _x call _findBody;
					};
				} forEach _listPlayers;
			};
		};




		// ищем группу с игроками и подключаем игрока к группе для кооперации
		if (isNil{_bestCandidate}) then {
			_z = true;
			if (typeName gosa_SquadRole == typeName 0) then {
				if (gosa_SquadRole == -1) then {
					_z = false;
				};
			};
			if (_z) then {
				{
					_grp = group _x;
					if (side _grp in gosa_friendlyside) then {
						_units = units _grp;
						_z = count _listPlayers;
						// рандомизация
						_z = _z / 2 + random _z;
						// в группе с большим количеством игроков не интересно (корень количества игроков)
						// корень всех зол
						if (sqrt _z > {_x call gosa_fnc_isPlayer} count _units) then { // TODO: нужно предоставить выбор игрокам
							diag_log format ["Log: [respawnRandom] ищем среди групп с игроками %1", _grp];
							_units call _findBody;
						};
					};
				} forEach _listPlayers;
			};
		};

		// ищем новое тело среди групп локальных игроку для лучшего командования подчиненными
		if (isNil{_bestCandidate}) then {
			{
				if (side _x in gosa_friendlyside) then {
					_leader = leader _x;
					if (local _leader) then {
						diag_log format ["Log: [respawnRandom] ищем среди локальных групп %1", _x];
						if (_leader call _fnc_isFit) then {
							if (isNil {_bestCandidate}) then {
								_bestCandidate = _leader;
							};
							if ((_pos distance _leader) < (_pos distance _bestCandidate)) then {
								_bestCandidate = _leader;
							};
						};
					};
				};
			} forEach allGroups;
		};

		// ищем новое тело среди лидеров групп т.к. игроки лучше командуют отрядом
		if (isNil{_bestCandidate}) then {
			{
				if (side _x in gosa_friendlyside) then {
					diag_log format ["Log: [respawnRandom] ищем среди остальных групп %1", _x];
					_leader = leader _x;
					if (_leader call _fnc_isFit) then {
						if (isNil {_bestCandidate}) then {
							_bestCandidate = _leader;
						};
						if ((_pos distance _leader) < (_pos distance _bestCandidate)) then {
							_bestCandidate = _leader;
						};
					};
				};

			} forEach allGroups;
		};

		// ищем тело среди всех юнитов
		if (isNil{_bestCandidate}) then {
			allUnits call _findBody;
		};

		if (isNil{_bestCandidate}) then {
			gosa_player_needs_revival = time;
		};

		// переключение на птицу
		if (isNil{_bestCandidate} && isNull _cam && isNull player) then {
			_cam = "seagull" camCreate (player modelToWorld [0,0,100]); // TODO: позиция будет [0,0] если тела игрока уже нет
			_cam cameraEffect ["FIXED", "LEFT TOP"];
			_cam camCommand "MANUAL ON";
			diag_log format ["Log: [respawnRandom] переключение на камеру %1", _cam];
		};
	}else{

		if (!isNull _cam) then {
			diag_log format ["Log: [respawnRandom] уничтожение камеры %1", _cam];
			_cam cameraEffect ["terminate","back"];
			camDestroy _cam;
		};

		gosa_player_needs_revival = nil;

		_deathTime = nil;
	};

	// защита от непланируемого поведения, после первой смерти еще одно тело появляется на точке возрождения и переключает игрока в это тело, здесь мы переключаем его обратно в нужное тело, а созданное на точке возрождения отключаем
	if (player != _p) then {
		diag_log format ["Log: [respawnRandom] защита от непланируемого поведения %1", [player, _p]];
		[player] joinSilent grpNull;
		[player] spawn {
			waitUntil{
				isNil{player getVariable "selectPlayerDisable"};
			};
			diag_log format ["Log: [respawnRandom] защита от непланируемого поведения %1 setDamage 1", _this];
			_this select 0 setDamage 1;
		};
		player setVariable ["selectPlayerDisable", true, true];
		selectPlayer _p;
		diag_log format ["Log: [respawnRandom] защита от непланируемого поведения player %1", player];
	};

	// выбрано новое тело, переключаем
	if (!isNil{_bestCandidate}) then {
		_p = ([_p, _bestCandidate] call _fnc_swich);
		_bestCandidate = nil;
	};

	// нужно быстро переключить игрока лишь после первой смерти, поэтому такая частая проверка
	sleep 0.1; // TODO: нужно после удачного переключения увеличить sleep для меньшей нагрузги цп

};
