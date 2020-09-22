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

while {true} do {

	// тело не подходит
	if (!alive _player or !isNil{_player getVariable "selectPlayerDisable"}) then {

		_grp = group _player;

		_pos = getPos _player;

		// юниты группы
		_units = units _grp;
		// if ((count _units) > 0) then {
			{
				if (isNil{_x getVariable "selectPlayerDisable"} && alive _x && !(_x in playableUnits)) then {
					if (isNil {_bestCandidate}) then {
						_bestCandidate = _x;
					};
					if ((rankId _x) > (rankId _bestCandidate)) then {
						_bestCandidate = _x;
					};
				};
			} forEach _units;
		// };

		// лидеры групп
		{
			if (side _x in m_friendlySide) then {
				_leader = leader _x;
				if (isNil{_leader getVariable "selectPlayerDisable"} && alive _leader && !(_leader in playableUnits)) then {
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
