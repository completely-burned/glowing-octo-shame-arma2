/* скрипт возрождния в случайного юнита.
нужна проверка AFK на игроков и лидеров группы
*/

waitUntil{!isNil{respawn}};
if(respawn != 1)exitWith{respawnDone = true};
private ["_bestCandidate","_player","_units","_leader","_grp","_pos","_first","_listPlayers"];

_player = player;

// переключение на новое тело
private["_fnc_swich"];
_fnc_swich={
	private["_old","_new"];
	_old = (_this select 0);
	_old setVariable ["selectPlayerDisable", true, true];
	_new = (_this select 1);
	_new addEventHandler ["killed", {_this select 0 setVariable ["selectPlayerDisable", true, true];}];
	selectPlayer _new;
	_new;
};

// первое тело данное при старте миссии при возрождении ведет себя иначе и не подходит
player setVariable ["selectPlayerDisable", true, true];

// после переключения на новое тело уничтожаем первое тело данное при старте т.к. оно расположено на неподходящей позиции и нужно только для старта миссии
[_player] spawn {
	waitUntil{
		isNil{player getVariable "selectPlayerDisable"};
	};
	_this select 0 setDamage 1;
	respawnDone = true;
};

// функция отсеивает неподходящие тела для перерождения
private["_fnc_isFit"];
_fnc_isFit={
	if (
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

	// ищем подходящее тело при условии
	if (!(lifeState player in ["ALIVE", "UNCONSCIOUS"]) or isNull player or !alive _player or !isNil{_player getVariable "selectPlayerDisable"}) then {

		_grp = group _player;

		_pos = getPos _player;

		// ищем новое тело из юнитов группы т.к. они находятся рядом
		if (isNil{_bestCandidate}) then {
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
			if (side _grp in m_friendlySide) then {
				_units = units _grp;
				// в группе с большим количеством игроков не интересно (корень количества игроков)
				if (sqrt count _listPlayers > {_x call gosa_fnc_isPlayer} count _units) then {
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
			if (side _x in m_friendlySide) then {
				_leader = leader _x;
				if (local _leader) then {
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
			if (side _x in m_friendlySide) then {
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
	};

	// защита от непланируемого поведения, после первой смерти еще одно тело появляется на точке возрождения и переключает игрока в это тело, здесь мы переключаем его обратно в нужное тело, а созданное на точке возрождения отключаем
	if (player != _player) then {
		[player] joinSilent grpNull;
		[player] spawn {
			waitUntil{
				isNil{player getVariable "selectPlayerDisable"};
			};
			_this select 0 setDamage 1;
		};
		player setVariable ["selectPlayerDisable", true, true];
		selectPlayer _player;
	};

	// выбрано новое тело, переключаем
	if (!isNil{_bestCandidate}) then {
		_player = ([_player, _bestCandidate] call _fnc_swich);
		_bestCandidate = nil;
	};

	sleep 0.01;

};
