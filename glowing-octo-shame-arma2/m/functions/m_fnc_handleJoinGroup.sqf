private ["_join_action","_join_action_vehicle","_player","_cursorTarget","_join_target_vehicle"];
_join_target_vehicle = objNull;

while {true} do {
	_cursorTarget = effectiveCommander cursorTarget;
	if (alive _cursorTarget && side _cursorTarget == playerSide && _cursorTarget isKindOf "Man") then {
		if (_join_target_vehicle != _cursorTarget) then {
			if !(isNil "_join_action") then {
				_join_action_vehicle removeAction _join_action;
				_join_action = nil;
				_join_target_vehicle = objNull;
			};
		};
		if (isNil "_join_action") then {
			_player = player;
			_join_action = _player addaction [localize "draga_str_join_the_squad" + " " + name _cursorTarget, "m\functions\join_grp.sqf", _cursorTarget, 0.5, false, false, "","group cursorTarget != group _this && alive cursorTarget && side cursorTarget == playerSide && (effectiveCommander cursorTarget) isKindOf 'Man'"];
			_join_action_vehicle = _player;
			_join_target_vehicle = _cursorTarget;
		};
	}else{
		if !(isNil "_join_action") then {
			_join_action_vehicle removeAction _join_action;
			_join_action = nil;
			_join_target_vehicle = objNull;
		};
	};

	sleep 0.5;
};
