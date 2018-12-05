private["_coin_actions","_Objects","_coins"];
_coin_actions = [];

while{true}do{
	if (!isNil{playerResetActions_coin}) then{
		_coin_actions =[];
		playerResetActions_coin = nil;
	};
	_coins = [];
	{
		private["_action","_obj","_delete"];
    _action = _x select 0;
		_obj = _x select 1;
		_delete = false;
		if (([[_obj], draga_objectsCoinMHQ] call m_fnc_CheckIsKindOfArray) && vehicle player distance _obj > draga_distanceCoinMHQ) then {
			_delete = true;
		};
		if (([[_obj], draga_objectsCoinBase] call m_fnc_CheckIsKindOfArray) && vehicle player distance _obj > draga_distanceCoinBase) then {
			_delete = true;
		};
		if (!alive _obj) then{
			_delete = true;
		};
		if (_delete) then {
	    player removeAction _action;
			_coin_actions = _coin_actions - [_x];
		}else{
			_coins set [count _coins, _obj];
		};
	} forEach _coin_actions;

	_Objects = (nearestObjects [vehicle player, draga_objectsCoinBase, draga_distanceCoinBase]);
	if ((count _Objects > 0)) then {
		{
			if (alive _x && !(_x in _coins)) then {
				private ["_action"];
				_action = player addaction [
					localize "str_coin_action" + " - " + gettext(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),
					"m\client\coin_interface.sqf",
					[_x,draga_COIN_items,draga_distanceCoinBase],
					1,
					false,
					false,
					"",
					"alive _target && alive _this"
				];
				_coin_actions set [count _coin_actions, [_action, _x]];
			};
		} forEach _Objects;
	};
	_Objects = (nearestObjects [vehicle player, draga_objectsCoinMHQ, draga_distanceCoinMHQ]);
	if ((count _Objects > 0)) then {
		{
			if (alive _x && !(_x in _coins)) then {
				private ["_action"];
				_action = player addaction [
					localize "str_coin_action" + " - " + gettext(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),
					"m\client\coin_interface.sqf",
					[_x,draga_COIN_MHQ,draga_distanceCoinMHQ],
					1,
					false,
					false,
					"",
					"alive _target && alive _this"
				];
				_coin_actions set [count _coin_actions, [_action, _x]];
			};
		} forEach _Objects;
	};
	_Objects = (nearestObjects [vehicle player, Warfare_HQ, draga_distanceCoinMHQ]);
	{
		if (isNil{_x getVariable "Warfare_HQ_base_unfolded_coin_actions"}) then {
			_action = _x addaction [
				gettext(configFile >> "CfgVehicles" >> draga_MHQ >> "displayName"),
				"m\client\coin_interface_MHQ.sqf",
				_x,
				1,
				false,
				false,
				"",
				"alive _target && alive _this"
			];
			_x setVariable ["Warfare_HQ_base_unfolded_coin_actions",_action];
		};
	} forEach _Objects;
	sleep 1;
};
