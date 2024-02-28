/*
 * TODO: Рефакторинг.
 * FIXME: Не работает в A3 и a2oa.
 */
diag_log format ["Log: [fnc_teleport2] %1", _this];

private ["_pos","_allow","_for","_inList","_veh","_obj"];

_obj = _this select 0;
_for = _this select 1;

_allow = true;
switch (typeName _obj) do {
	case ("OBJECT"):
	{
		_pos = [_obj] call gosa_fnc_respawnPos;
		if(speed _obj >= 2)then{_allow = false; hint localize "STR_gosa_CannotTeleport";};

	};
	case ("LOCATION"):
	{
		_pos = getPos _obj;
	};
	case ("STRING"):
	{
		_pos = getMarkerPos _obj;
	};
	default {
		_pos = [_obj] call gosa_fnc_respawnPos;
	};
};

if(_allow)then{
	/*
	private ["_nearestLocations"];
	_nearestLocations = nearestLocations [_pos, ["FlatArea","FlatAreaCity","FlatAreaCitySmall"], 250];
	if (count _nearestLocations > 0) then {
		_pos = locationPosition (_nearestLocations select 0);
	};
	*/

	// _pos resize 2;
	if !(vehicle player isKindOf "StaticWeapon") then {
		vehicle player setVelocity [0, 0, 0];
		if (vehicle player == player) then {
			player setPos _pos;
		}else{
			vehicle player setPos ([_pos,0, sizeOf typeOf vehicle player] call gosa_fnc_getSafePos);
		};
		vehicle player setVectorUp [0,0,1];

		// {} forEach (GroupSelectedUnits player) не работает на прямую в a2oa.
		diag_log format ["Log: [fnc_teleport2] _for %1", _for];
		_inList = [];
		{
			if (!(_x call gosa_fnc_isPlayer) && damage _x < 0.9) then {
				_veh = vehicle _x;
				if (_veh distance vehicle player <= 15) then {
					if ( !(_veh in _inList) && !(_veh isKindOf "StaticWeapon") ) then {
						_inList set [count _inList, _veh];
						_veh setVelocity [0, 0, 0];
						_veh setPos ([_pos,0, sizeOf typeOf _veh] call gosa_fnc_getSafePos);
						_veh setVectorUp [0,0,1];
					};
				};
			};
		} forEach _for;
	};
};
