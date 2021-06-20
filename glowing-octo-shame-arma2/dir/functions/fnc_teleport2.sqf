private ["_pos","_allow"];

_allow = true;
switch (typeName _this) do {
	case ("OBJECT"):
	{
		_pos = [_this] call gosa_fnc_respawnPos;
		if(speed _this >= 2)then{_allow = false; hint localize "STR_gosa_CannotTeleport";};

	};
	case ("LOCATION"):
	{
		_pos = getPos _this;
	};
	case ("STRING"):
	{
		_pos = getMarkerPos _this;
	};
	default {
		_pos = [_this] call gosa_fnc_respawnPos;
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
	if !(typeOf vehicle player == "StaticWeapon") then {
		vehicle player setVelocity [0, 0, 0];
		if (vehicle player == player) then {
			player setPos _pos;
		}else{
			vehicle player setPos ([_pos,0, sizeOf typeOf vehicle player] call gosa_fnc_getSafePos);
		};
		vehicle player setVectorUp [0,0,1];

		private ["_inList"];
		_inList = [];
		{
			if !(_x call gosa_fnc_isPlayer && alive _x) then {
				private ["_veh"];
				_veh = _x;
				if ( !(vehicle _veh in _inList) && !(typeOf vehicle _veh == "StaticWeapon") && (damage _veh != 1))then{
					_inList set [count _inList, vehicle _veh];
					vehicle _veh setVelocity [0, 0, 0];
					if (vehicle _veh == _veh) then {
						_veh setPos _pos;
					}else{
						vehicle _veh setPos ([_pos,0, sizeOf typeOf vehicle _veh] call gosa_fnc_getSafePos);
					};
					vehicle _veh setVectorUp [0,0,1];
				};
			};
		} forEach units group player;
	};
};
