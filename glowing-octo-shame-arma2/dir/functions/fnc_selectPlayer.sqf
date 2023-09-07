#define __A2OA__

private["_old","_new","_b","_time","_var","_arr","_str","_o"];
_old = (_this select 0);
_new = (_this select 1);
// owner
_o = (_this select 2);
// name player
_str = (_this select 3);

// FIXME: Эта проверка лишняя возможно.
if (isMultiplayer) then {
	// Устанавливаем переменную централизовано через сервер,
	// чтобы игроки не слипались в одно тело.
	[nil, _new, rselectPlayer, _o] call RE;

	// FIXME: Возможно приведет к ошибке 
	// если стандартное возрождение сработает раньше переключения.
	_time = time+60;
	while {isNil "_var" && time < _time} do {
		_var = _new getVariable "gosa_player_owner";
		sleep 0.05;
	};

	diag_log format ["Log: [respawnRandom] _fnc_swich _var %1, _o %2", _var, _o];
}else{
	_var = _o;
};

#ifdef __A2OA__
if (!isNil "_var" && {_var == _o}) then
#else
if (!isNil "_var" && (_var == _o)) then
#endif
{
	// FIXME: Эта проверка лишняя возможно
	// т.к. есть проверка alive.
	_new addEventHandler ["killed", {
		_this select 0 setVariable ["selectPlayerDisable", true, true];
	}];

	// Добавляем обект в список игроков
	// т.к. isPlayer не работает после переключения.
	[nil, _new, rgosa_setMapPlayers, _o] call RE;

	_b = behaviour _new;
	diag_log format ["Log: [respawnRandom] swich %1 to %2", [_old], [_new, _b]];
	selectPlayer _new;

	if (_b == "COMBAT") then { //&& (_new countEnemy (_new nearEntities ["Land", 500]) > 3)
		//-- осветительная ракета
		_new call gosa_fnc_aiFlareSupport;
	};

	gosa_lastSwitchBodyTime = time;

	// В случае неудачи необходимо временно добавить объект в черный список,
	// иначе он будет повторно выбран.
	// FIXME: Не уверен в отсутствии ложных срабатываний.
	// FIXME: Возможно требуется время для синхронизации.
	_time = time+30;
	waitUntil {
		sleep 0.01;
		if (player == _new) then {
			_b = true;
		}else{
			_b = false;
		};

		(_b or time > _time)
	};
	// gosa_respawn_blt это blocklist.
	if (_b) then {
		[_new, objNull, _str] call gosa_fnc_eh_playerSelected;
		_new;
	}else{
		_new setVariable ["gosa_respawn_blt", time];
		diag_log format ["Log: [respawnRandom] _fnc_swich переключение не удалось %1", _new];
		_old;
	};

}else{
	_new setVariable ["gosa_respawn_blt", time];
	_old;
};
