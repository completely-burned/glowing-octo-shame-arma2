private["_coin_actions","_Objects","_coins","_action","_player","_action","_obj","_delete","_action_obj"];

_coin_actions = [];

while{true}do{
	_coins = [];
	for "_i" from 0 to ((count _coin_actions) - 1) do {
		_action = _coin_actions select _i select 0;
		_obj = _coin_actions select _i select 1;
		_action_obj = _coin_actions select _i select 2;
		_delete = false;
		if (([[_obj], gosa_objectsCoinMHQ] call gosa_fnc_CheckIsKindOfArray) && vehicle player distance _obj > gosa_distanceCoinMHQ) then {
			_delete = true;
		};
		if (([[_obj], gosa_objectsCoinBase] call gosa_fnc_CheckIsKindOfArray) && vehicle player distance _obj > gosa_distanceCoinBase) then {
			_delete = true;
		};
		if (!alive _obj or !alive _action_obj) then{
			_delete = true;
		};
		if (
			getNumber(configFile >> "CfgVehicles" >> typeOf _action_obj >> "isMan") == 1
			&& 
			_action_obj != player
		) then{
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
	
	_player = player;
	if(alive _player)then{

		_Objects = (nearestObjects [vehicle _player, gosa_objectsCoinBase, gosa_distanceCoinBase]);
		if ((count _Objects > 0)) then {
			{
				if (alive _x && !(_x in _coins)) then {
					_action = _player addaction [
						localize "str_coin_action" + " - " + gettext(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),
						"dir\coin\coin_interface.sqf",
						[_x,gosa_COIN_items,gosa_distanceCoinBase],
						1,
						false,
						false
					];
					_coin_actions set [count _coin_actions, [_action, _x, _player]];
				};
			} forEach _Objects;
		};
		_Objects = (nearestObjects [vehicle _player, gosa_objectsCoinMHQ, gosa_distanceCoinMHQ]);
		if ((count _Objects > 0)) then {
			{
				if (alive _x && !(_x in _coins)) then {
					_action = _player addaction [
						localize "str_coin_action" + " - " + gettext(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),
						"dir\coin\coin_interface.sqf",
						[_x, [[typeOf _x call gosa_fnc_get_MHQ_type,"Base",0]], gosa_distanceCoinMHQ],
						1,
						false,
						false
					];
					_coin_actions set [count _coin_actions, [_action, _x, _player]];
				};
			} forEach _Objects;
		};
		_Objects = (nearestObjects [vehicle _player, Warfare_HQ, gosa_distanceCoinMHQ]);
		{
			if (alive _x && !(_x in _coins)) then {
				_action = _x addaction [
					gettext(configFile >> "CfgVehicles" >> typeOf _x call gosa_fnc_get_MHQ_type >> "displayName"),
					"dir\client\coin_interface_MHQ.sqf",
					_x,
					1,
					false,
					false
				];
				_coin_actions set [count _coin_actions, [_action, _x, _x]];
			};
		} forEach _Objects;
	};
	sleep 1;
};
