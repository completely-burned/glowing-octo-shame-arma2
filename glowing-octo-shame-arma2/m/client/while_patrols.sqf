private["_count_groups","_grp","_leader"];
private["_friendlyPatrols","_enemyPatrols","_enemySide","_side"];

if (draga_loglevel > 0) then {
	diag_log format ["while_patrols.sqf started %1", time ];
};

waitUntil {!isNil "AllGroupsWest"};
waitUntil {!isNil "AllGroupsEast"};
waitUntil {!isNil "AllGroupsGuer"};
waitUntil {!isNil "GroupsStarted"};

waitUntil {!isNil "bis_fnc_init"};
waitUntil {!isNil "m_fnc_init"};

waitUntil {!isNil "playerReady"};

waitUntil {!isNil "enemyCoefficient" && !isNil "m_friendlySide"};
_enemySide = [west,east,resistance] - m_friendlySide;

while{true}do{

	sleep 2;

	_friendlyPatrols = 0; _enemyPatrols = 0;
	{
		_grp=_x;
		_side = side _grp;
		_leader = leader _grp;

		if (local _leader && _side in [west,east,resistance]) then {
			if({isPlayer _x} count units _grp == 0)then{
				if({alive _x} count units _grp > 0)then{
					if (!isNil {_grp GetVariable "patrol"}) then {
						if (_side in m_friendlySide) then {
							_friendlyPatrols = _friendlyPatrols + 1;
						}else{
							_enemyPatrols = _enemyPatrols + 1;
						};
					};
				};
			};
		};
	}forEach allGroups;

	if (draga_loglevel > 20) then {
		diag_log format ["while_patrols.sqf _friendlyPatrols %1 _enemyPatrols %2", _friendlyPatrols, _enemyPatrols ];
	};

	if(_friendlyPatrols+_enemyPatrols < 10)then{

		private ["_difference"];
		_difference = 0;
		if (_friendlyPatrols * enemyCoefficient + _difference >= _enemyPatrols) then {
			_side = _enemySide call BIS_fnc_selectRandom;
		}else{
			_side = m_friendlySide call BIS_fnc_selectRandom;
		};

		private["_pos"];
		private["_typeList"];
		private["_player"];

		_player = player;
		_pos = getPos _player;

		private["_run"];
		_run = true;

		if (_pos distance [0,0] < 1) then {
			if (draga_loglevel > 0) then {
				diag_log format ["while_patrols.sqf _pos = [0,0] _player = %1 ", _player];
			};
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

			private["_grp1"];
			private["_types"];
			private["_SafePosParams"];
			private["_pos_resp"];
			_grp1 = (_typeList call BIS_fnc_selectRandomWeighted);
			_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;

			_SafePosParams = ([_types] call m_fnc_SafePosParams);

			_SafePosParams set [0,((_SafePosParams select 0) * 2)];
			_SafePosParams set [1,((_SafePosParams select 1) * 2)];

			if (draga_loglevel > 5) then {
				diag_log format ["while_patrols.sqf creating %1 ", [_pos]+_SafePosParams+[_side]];
			};

			_pos_resp = ([_pos]+_SafePosParams+[_side] call m_fnc_findSafePos);
			if(count (_pos_resp select 0) == 0)exitWith{};

			private["_groups"];
			_groups = ([_pos_resp, _side, _grp1 select 0] call m_fnc_spawnGroup);


			{
				_x setVariable ["patrol", true, true];
				_x setVariable ["grp_created", true, true];
			} forEach _groups;

			if (draga_loglevel > 5) then {
				diag_log format ["while_patrols.sqf created %1 ", _groups];
			};
		};

	};

};
