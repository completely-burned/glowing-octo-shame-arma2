#define __A2OA__

/*
 * Скрипт возрождния в случайного юнита.
 * TODO: нужна проверка AFK на игроков и лидеров группы
 * FIXME: gosa_fnc_sortUnits_onRank вызвается слишком часто.
 * FIXME: у меня нет возможности проверить этот режим должным образом, поэтому тут гадание, и вероятно не все проверки необходимы
 * FIXME: при проверки name возможно переменная selectPlayerDisable становится лишней
 * Заметки:
 * 	name синхоризируется не сразу.
 */

private ["_bestCandidate","_p","_units","_leader","_grp","_pos","_first",
	"_fnc_prio_units","_findBody","_arr","_sides_friendly",
	"_pre","_sorted","_str","_obj",
	"_listPlayers","_deathTime","_cam","_b","_o","_z","_p_name"];

waitUntil{!isNil "gosa_playerStartingClass"};
if (gosa_playerStartingClass == 1) exitWith {
	diag_log format ["Log: [respawnRandom] Player class %1, exitWith", gosa_playerStartingClass];
};

if(missionNamespace getVariable "respawn" != 1 or !isMultiplayer)exitWith{
	[player, objNull] call gosa_fnc_eh_playerSelected;
	respawnDone = true;
	diag_log format ["Log: [respawnRandom] respawnDone %1", time];
};

_p = player;
_p_name = name player;
_sides_friendly = gosa_friendlyside;
_cam = objNull;
_o = gosa_owner;
gosa_lastSwitchBodyTime = -99999;
_arr = [];

diag_log format ["Log: [respawnRandom] init info %1", [_p, _p_name, _o]];


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

	_b = false;
	if !(alive _p) then {
		_b = true;
		diag_log format ["Log: [respawnRandom] not alive %1", _p];
	};

	if (isNull player) then {
		_b = true;
		diag_log format ["Log: [respawnRandom] isNull %1", player];
	};
	if !(isNil{_p getVariable "selectPlayerDisable"}) then {
		_b = true;
		diag_log format ["Log: [respawnRandom] blacklisted unit %1", _p];
	};
	if !(lifeState player in ["ALIVE", "UNCONSCIOUS"]) then {
		_b = true;
		diag_log format ["Log: [respawnRandom] blacklisted lifeState %1", player];
	};
	_str = _p getVariable "gosa_player_owner";
	if !(isNil "_str") then {
		if (_str != _o) then {
			_b = true;
			diag_log format ["Log: [respawnRandom] owner var %1", [_str, _o]];
		};
	};
	if (_b) then {

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

		_bestCandidate = ([_grp, _sides_friendly, _pos] call gosa_fnc_findBestCandidate_onRespawn);
		if (isNil "_bestCandidate") then {
			gosa_player_needs_revival = time;
		};
	}else{
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
	if !(isNil "_bestCandidate") then {
		_p = ([_p, _bestCandidate, _o, _p_name] call gosa_fnc_selectPlayer);
		_bestCandidate = nil;
	};

	// нужно быстро переключить игрока лишь после первой смерти, поэтому такая частая проверка
	// TODO: нужно после удачного переключения увеличить sleep для меньшей нагрузги цп
	sleep 0.1;

};
