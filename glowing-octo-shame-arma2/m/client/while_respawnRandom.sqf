if(missionNamespace getVariable "respawn" != 1)exitWith{respawnDone = true};
private ["_bestCandidate","_player","_units","_leader","_grp","_pos","_first"];

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

// первое не подходит
player setVariable ["selectPlayerDisable", true, true];

[_player] spawn {
	waitUntil{
		isNil{player getVariable "selectPlayerDisable"};
	};
	_this select 0 setDamage 1;
	respawnDone = true;
};

private["_fnc_isFit"];
_fnc_isFit={
	if (
		isNil{_this getVariable "selectPlayerDisable"} &&
		alive _this &&
		!isPlayer _this &&
		!isNull _this &&
		!(_this call m_fnc_isUAV) &&
		!isNil{group _this getVariable "grp_created"} &&
		isNil {group _this getVariable "patrol"}
	) then {
		true;
	}else{
		false;
	};
};

while {true} do {

	// тело не подходит
	if (!(lifeState player in ["ALIVE", "UNCONSCIOUS"]) or isNull player or !alive _player or !isNil{_player getVariable "selectPlayerDisable"}) then {

		_grp = group _player;

		_pos = getPos _player;

		// юниты группы
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

		// лидеры групп
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

	// возрождение первое
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

	// есть новое тело
	if (!isNil{_bestCandidate}) then {
		_player = ([_player, _bestCandidate] call _fnc_swich);
		_bestCandidate = nil;
	};

	sleep 0.01;

};
