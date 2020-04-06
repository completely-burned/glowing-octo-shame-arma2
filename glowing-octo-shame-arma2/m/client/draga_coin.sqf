private["_coin_actions","_Objects","_coins"];
_coin_actions = [];

while{true}do{
	_coins = [];
	for "_i" from 0 to ((count _coin_actions) - 1) do {
		private["_action","_obj","_delete","_action_obj"];
		_action = _coin_actions select _i select 0;
		_obj = _coin_actions select _i select 1;
		_action_obj = _coin_actions select _i select 2;
		_delete = false;
		if (([[_obj], draga_objectsCoinMHQ] call m_fnc_CheckIsKindOfArray) && vehicle player distance _obj > draga_distanceCoinMHQ) then {
			_delete = true;
		};
		if (([[_obj], draga_objectsCoinBase] call m_fnc_CheckIsKindOfArray) && vehicle player distance _obj > draga_distanceCoinBase) then {
			_delete = true;
		};
		if (!alive _obj or !alive _action_obj) then{
			_delete = true;
		};
		if (_delete) then {
			_action_obj removeAction _action;
			_coin_actions set [_i, -1];
		}else{
			_coins set [count _coins, _obj];
		};
	};
	_coin_actions = _coin_actions - [-1];

	_Objects = (nearestObjects [vehicle player, draga_objectsCoinBase, draga_distanceCoinBase]);
	if ((count _Objects > 0)) then {
		{
			if (alive _x && !(_x in _coins)) then {
				private ["_action","_player"];
				_player = player;
				_action = _player addaction [
					localize "str_coin_action" + " - " + gettext(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),
					"m\client\coin_interface.sqf",
					[_x,draga_COIN_items,draga_distanceCoinBase],
					1,
					false,
					false
				];
				_coin_actions set [count _coin_actions, [_action, _x, _player]];
			};
		} forEach _Objects;
	};
	_Objects = (nearestObjects [vehicle player, draga_objectsCoinMHQ, draga_distanceCoinMHQ]);
	if ((count _Objects > 0)) then {
		{
			if (alive _x && !(_x in _coins)) then {
				private ["_action","_player"];
				_player = player;
				_action = _player addaction [
					localize "str_coin_action" + " - " + gettext(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),
					"m\client\coin_interface.sqf",
					[_x, [[typeOf _x call fnc_get_MHQ_type,"Base",0]], draga_distanceCoinMHQ],
					1,
					false,
					false
				];
				_coin_actions set [count _coin_actions, [_action, _x, _player]];
			};
		} forEach _Objects;
	};
	_Objects = (nearestObjects [vehicle player, Warfare_HQ, draga_distanceCoinMHQ]);
	{
		if (alive _x && !(_x in _coins)) then {
			private ["_action"];
			_action = _x addaction [
				gettext(configFile >> "CfgVehicles" >> typeOf _x call fnc_get_MHQ_type >> "displayName"),
				"m\client\coin_interface_MHQ.sqf",
				_x,
				1,
				false,
				false
			];
			_coin_actions set [count _coin_actions, [_action, _x, _x]];
		};
	} forEach _Objects;
	sleep 1;
};
