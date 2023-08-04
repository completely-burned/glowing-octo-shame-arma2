#define __A2OA__

/*
 * Скрипт возрождния в случайного юнита.
 * TODO: нужна проверка AFK на игроков и лидеров группы
 * FIXME: у меня нет возможности проверить этот режим должным образом, поэтому тут гадание, и вероятно не все проверки необходимы
 * FIXME: при проверки name возможно переменная selectPlayerDisable становится лишней
 * Заметки:
 * 	name синхоризируется не сразу.
 */

private ["_bestCandidate","_p","_units","_leader","_grp","_pos","_first",
	"_fnc_prio_units","_findBody",
	"_listPlayers","_deathTime","_cam","_t","_o","_z","_p_name"];

waitUntil{!isNil "gosa_playerStartingClass"};
if (gosa_playerStartingClass == 1) exitWith {
	diag_log format ["Log: [respawnRandom] Player class %1, exitWith", gosa_playerStartingClass];
};

if(missionNamespace getVariable "respawn" != 1 or !isMultiplayer)exitWith{
	respawnDone = true;
	diag_log format ["Log: [respawnRandom] respawnDone %1", time];
};

_p = player;
_p_name = name player;

_cam = objNull;

_o = gosa_owner;

gosa_lastSwitchBodyTime = -99999;

diag_log format ["Log: [respawnRandom] init info %1", [_p, _p_name, _o]];



_findBody={

	private ["_uOn","_u","_uOff","_z","_unit"];
	_uOn = [];
	_u = [];
	_uOff = [];

	{
		_unit = _x;
		_z = [_x] call gosa_fnc_getUnitClass;
		if ({_x in _z} count gosa_squadOffW > 0) then {
			_uOff set [count _uOff, _unit];
		} else {
			if ({_x in _z} count gosa_squadOnW > 0) then {
				_uOn set [count _uOn, _unit];
			} else {
				_u set [count _u, _unit];
			};
	  };
	} forEach _this;

	diag_log format ["Log: [respawnRandom] _uOn %1", _uOn];
	diag_log format ["Log: [respawnRandom] _u %1", _u];
	diag_log format ["Log: [respawnRandom] _uOff %1", _uOff];

	scopename "fb1";
	// TODO: Нужна функция.
	{
		if (_x call gosa_fnc_selectPlayer_isFit) then {

			if (isNil {_bestCandidate}) then {
				_bestCandidate = _x;
			};

			_z = leader _x;
			// FIXME: если лидер отряда другой игрок, то приоритет оружия можно поставить выше ранга
			// TODO: нужно учитывать ситуацию когда у другого игрока тоже приоритет оружия над рангом
			if (_z call gosa_fnc_isPlayer && _z != player) then {
				_bestCandidate = _x;
				breakTo "fb1";
			}else{
				if ((rankId _x) > (rankId _bestCandidate)) then {
					_bestCandidate = _x;
				};
				// TODO: при равных рангах можно учитывать еще и score
			};

		};
	} forEach _uOn+_u+_uOff;
};

_fnc_prio_units={
	// функция возвращает приоритет группы и юнитов в приоритете
	private ["_uH","_uM","_uL","_z","_u"];
	_uH = [];
	_uM = [];
	_uL = [];

	{
		_u = _x;
		_z = [_x] call gosa_fnc_getUnitClass;
		if ({_x in _z} count gosa_squadOffW > 0) then {
			_uL set [count _uL, _u];
		} else {
			if ({_x in _z} count gosa_squadOnW > 0) then {
				_uH set [count _uH, _u];
			} else {
				_uM set [count _uM, _u];
			};
	  };
	} forEach (_this select 0);

	[_this select 1,
		count _uH - count _uL,
		_uH,_uM,_uL];
};

// Первое тело данное при старте миссии при возрождении ведет себя иначе и не подходит.
player setVariable ["selectPlayerDisable", true, true];

// После переключения на новое тело уничтожаем первое тело данное при старте
// т.к. оно расположено на неподходящей позиции и нужно только для старта миссии.
// нужно для respawnDone = true
[_p] spawn {
	waitUntil{
		isNil{player getVariable "selectPlayerDisable"};
	};
	_this select 0 setDamage 1;
	respawnDone = true;
	diag_log format ["Log: [respawnRandom] respawnDone %1", time];
};

if (isNil "gosa_SquadRole") then {
	gosa_SquadRole = -2;
};

waitUntil{!isNil "gosa_MPF_InitDone"};
waitUntil{!isNil "civilianBasePos"};

while {true} do {

	scopeName "root";

	_t = false;
	if (!alive _p) then {
		_t = true;
		diag_log format ["Log: [respawnRandom] not alive %1", _p];
	};

	if (isNull player) then {
		_t = true;
		diag_log format ["Log: [respawnRandom] isNull %1", player];
	};
	if (!isNil{_p getVariable "selectPlayerDisable"}) then {
		_t = true;
		diag_log format ["Log: [respawnRandom] blacklisted unit %1", _p];
	};
	if !(lifeState player in ["ALIVE", "UNCONSCIOUS"]) then {
		_t = true;
		diag_log format ["Log: [respawnRandom] blacklisted lifeState %1", player];
	};
	_z = _p getVariable "gosa_player_owner";
	if (!isNil {_z}) then {
		if (_z != _o) then {
			_t = true;
			diag_log format ["Log: [respawnRandom] owner var %1", [_z, _o]];
		};
	};
	if (_t) then {

		//--- таймер смерти
		// FIXME: что это?
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
						// TODO: нужно предоставить выбор игрокам
						if (sqrt _z > {_x call gosa_fnc_isPlayer} count _units) then {
							diag_log format ["Log: [respawnRandom] ищем среди групп с игроками %1", _grp];
							_units call _findBody;
						};
					};
				} forEach _listPlayers;
			};
		};

		//--- сортировка групп по приоритетам игрока
			// подготовка
			private ["_pre","_sorted","_s"];
			_pre = [];
			{
				if (side _x in gosa_friendlyside) then {
					_pre set [
						count _pre,
						[units _x, _x] call _fnc_prio_units
					];
				};
			} forEach allGroups;

			diag_log format ["Log: [respawnRandom] _pre_sorted %1", _pre];

			// сортировка
			for "_i" from 0 to count _pre - 1 do {
				if (isNil "_sorted") then {
					_sorted = [_pre select _i];
				}else{
					scopeName "sn_gs";
					for "_s" from (count _sorted - 1) to 0 step -1 do {
						if (_pre select _i select 1 > (_sorted select _s select 1)) then {
							_sorted set [_s+1, _sorted select _s];
							_sorted set [_s, _pre select _i];
						};
						if (_pre select _i select 1 <= (_sorted select _s select 1) && count _sorted - 1 == _s) then {
							_sorted set [_s+1, _pre select _i];
							breakTo "sn_gs";
						};
					};
				};
			};
			_pre = nil;

		if !(isNil "_sorted") then {
			diag_log format ["Log: [respawnRandom] _sorted %1", _sorted];

			// ищем новое тело среди лидеров групп т.к. игроки лучше командуют отрядом
			if (isNil{_bestCandidate}) then {
				{
					_z = _x select 0;
					if (side _z in gosa_friendlyside) then {
						diag_log format ["Log: [respawnRandom] ищем среди остальных групп %1", _z];
						_leader = leader _z;
						if (_leader call gosa_fnc_selectPlayer_isFit) then {
							if (isNil {_bestCandidate}) then {
								_bestCandidate = _leader;
							};
							// TODO: нужно устранить конфликт с приоритетами
							if ((_pos distance _leader)+2000 < (_pos distance _bestCandidate)) then {
								_bestCandidate = _leader;
							};
						};
					};

				} forEach _sorted;
			};

			// ищем тело среди всех юнитов
			if (isNil{_bestCandidate}) then {
				{
					if (isNil{_bestCandidate}) then {
						(_x select 2) call _findBody;
					};
					if (isNil{_bestCandidate}) then {
						(_x select 3) call _findBody;
					};
					if (isNil{_bestCandidate}) then {
						(_x select 4) call _findBody;
					};
				} forEach _sorted;
			};

		};

		if (isNil{_bestCandidate}) then {
			gosa_player_needs_revival = time;
		};

		// переключение на птицу
		if (isNil{_bestCandidate} && isNull _cam && isNull player) then {
			// TODO: позиция будет [0,0] если тела игрока уже нет
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
		_p = ([_p, _bestCandidate, _o, _p_name] call gosa_fnc_selectPlayer);
		_bestCandidate = nil;
	};

	// нужно быстро переключить игрока лишь после первой смерти, поэтому такая частая проверка
	// TODO: нужно после удачного переключения увеличить sleep для меньшей нагрузги цп
	sleep 0.1;

};
