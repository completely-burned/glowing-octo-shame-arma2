#define __A2OA__

/* скрипт возрождния в случайного юнита.
 * TODO: нужна проверка AFK на игроков и лидеров группы
 */

private ["_bestCandidate","_player","_units","_leader","_grp","_pos","_first","_listPlayers","_deathTime","_cam"];
waitUntil{!isNil{respawn}};
if(respawn != 1)exitWith{
	respawnDone = true;
	diag_log format ["Log: [respawnRandom] respawnDone %1", time];
};

_player = player;

_cam = objNull;

// переключение на новое тело
private["_fnc_swich"];
_fnc_swich={
	private["_old","_new"];
	_old = (_this select 0);
	_old setVariable ["selectPlayerDisable", true, true];
	_new = (_this select 1);
	_new addEventHandler ["killed", {_this select 0 setVariable ["selectPlayerDisable", true, true];}];
	selectPlayer _new;
	_new call gosa_fnc_initBriefing;
	diag_log format ["Log: [respawnRandom] swich %1 to %2", _old, _new];
	_new;
};

// первое тело данное при старте миссии при возрождении ведет себя иначе и не подходит
player setVariable ["selectPlayerDisable", true, true];

// после переключения на новое тело уничтожаем первое тело данное при старте т.к. оно расположено на неподходящей позиции и нужно только для старта миссии
// нужно для respawnDone = trueж
[_player] spawn {
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
		isNil{_this getVariable "selectPlayerDisable"} &&
		alive _this &&
		!(_this call gosa_fnc_isPlayer) &&
		!isNull _this &&
		!(_this call gosa_fnc_isUAV) &&
		!isNil{group _this getVariable "grp_created"} &&
		isNil {group _this getVariable "patrol"}
	) then {
		true;
	}else{
		false;
	};
};

while {true} do {

	scopeName "root";

	// ищем подходящее тело при условии
	if (!(lifeState player in ["ALIVE", "UNCONSCIOUS"]) or // TODO: нужно разделить на отдельные проверки и добавить diag_log
		isNull player or !alive _player or 
		!isNil{_player getVariable "selectPlayerDisable"}
	) then {

		//--- таймер смерти
		if (isNil "_deathTime") then {
			_deathTime = time+1;
			breakTo "root";
		} else {
			if (_deathTime>time) then {
				breakTo "root";
			};
		};

		_grp = group _player;

		_pos = getPos _player;

		// ищем новое тело из юнитов группы игрока т.к. они находятся рядом
		if (isNil{_bestCandidate}) then {
			diag_log format ["Log: [respawnRandom] поиск среди юнитов группы игрока %1", _grp];
		_units = units _grp;
			{
				if (_x call _fnc_isFit) then {
					if (isNil {_bestCandidate}) then {
						_bestCandidate = _x;
					};
					if ((rankId _x) > (rankId _bestCandidate)) then {
						_bestCandidate = _x;
					};
				};
			} forEach _units;
		};

		_listPlayers = call BIS_fnc_listPlayers;

		// ищем группу с игроками и подключаем игрока к группе для кооперации
		if (isNil{_bestCandidate}) then {
		{
			_grp = group _x;
			if (side _grp in gosa_friendlyside) then {
				_units = units _grp;
				// в группе с большим количеством игроков не интересно (корень количества игроков)
				if (sqrt count _listPlayers > {_x call gosa_fnc_isPlayer} count _units) then {
					diag_log format ["Log: [respawnRandom] ищем среди групп с игроками %1", _grp];
					{
						if (_x call _fnc_isFit) then {
							if (isNil {_bestCandidate}) then {
								_bestCandidate = _x;
							};
							if ((rankId _x) > (rankId _bestCandidate)) then {
								_bestCandidate = _x;
							};
						};
					} forEach _units;
				};
			};
		} forEach _listPlayers;
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

		// переключение на птицу
		if (isNil{_bestCandidate} && isNull _cam) then {
			_cam = "seagull" camCreate (player modelToWorld [0,0,100]);
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

		_deathTime = nil;
	};

	// защита от непланируемого поведения, после первой смерти еще одно тело появляется на точке возрождения и переключает игрока в это тело, здесь мы переключаем его обратно в нужное тело, а созданное на точке возрождения отключаем
	if (player != _player) then {
		diag_log format ["Log: [respawnRandom] защита от непланируемого поведения %1", [player, _player]];
		[player] joinSilent grpNull;
		[player] spawn {
			waitUntil{
				isNil{player getVariable "selectPlayerDisable"};
			};
			diag_log format ["Log: [respawnRandom] защита от непланируемого поведения %1 setDamage 1", _this];
			_this select 0 setDamage 1;
		};
		player setVariable ["selectPlayerDisable", true, true];
		selectPlayer _player;
		diag_log format ["Log: [respawnRandom] защита от непланируемого поведения player %1", player];
	};

	// выбрано новое тело, переключаем
	if (!isNil{_bestCandidate}) then {
		_player = ([_player, _bestCandidate] call _fnc_swich);
		_bestCandidate = nil;
	};

	sleep 0.01;

};
