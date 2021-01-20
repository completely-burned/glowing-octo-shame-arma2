private["_vehicles_lock"];

private["_grp","_units","_leaderPlayer","_isPlayer","_vehicle","_grpPlayer","_side"];

private["_lock"];

private["_transportPlayer"];

private["_friendly_vehicles_only"];
_friendly_vehicles_only = missionNamespace getVariable "friendly_vehicles_only";

while{true}do{

	_vehicles_lock = [];
	{
		_grp = _x;
		_units = units _grp;

		if(leader _grp call fnc_isPlayer)then{
			_leaderPlayer = true;
		}else{
			_leaderPlayer = false;
		};

		{
/*
			if(isPlayer _x)then{
				_isPlayer = true;
			}else{
				_isPlayer = false;
			};
*/

			if({_x call fnc_isPlayer}count _units > 0)then{
				_grpPlayer = true;
			}else{
				_grpPlayer = false;
			};

			_vehicle = assignedVehicle _x;

			if (isNull _vehicle) then {
				_vehicle = _x getVariable "assignedVehicle";
				if (isNil {_vehicle}) then {_vehicle = objNull};
			};


			if(isNull _vehicle)then{
				_vehicle = vehicle _x;
			};

			if(!isNull _vehicle && !_leaderPlayer && !_grpPlayer && _vehicle != _x)then{
				_vehicles_lock set [count _vehicles_lock, _vehicle];
			};

		} forEach _units;

	} forEach allGroups;

	{
		_vehicle = _x;
		if (_vehicle in _vehicles_lock) then {
			_lock = "LOCKED";
		}else{
			_lock = "UNLOCKED";
		};

		if (_vehicle isKindOf "UAV" or _vehicle isKindOf "Ka137_Base_PMC") then {
			_lock = "LOCKED";
		};

		_transportPlayer = _vehicle getVariable "transportPlayer";
		if(!isNil {_transportPlayer})then{
			if(alive _transportPlayer)then{
				_lock = "UNLOCKED";
			};
		};

		if (_friendly_vehicles_only == 1) then {
			_side = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "side") call m_fnc_getSide;
			if (_side in [west,east,resistance]) then {
				if !(_side in m_friendlySide) then {
					_lock = "LOCKED";
				};
			};
		};

		if({_x in crew _vehicle}count([] call BIS_fnc_listPlayers) > 0)then{
			_lock = "UNLOCKED";
		};

		_lock_old = _vehicle getVariable "draga_vehicle_lock";
		if (isNil{_lock_old}) then {
			_vehicle setVariable ["draga_vehicle_lock", _lock, true];
			//if (local _x) then {
				_vehicle setVehicleLock _lock;
			//};
		}else{
			if (_lock_old != _lock) then {
				_vehicle setVariable ["draga_vehicle_lock", _lock, true];
				//if (local _x) then {
					_vehicle setVehicleLock _lock;
				//};
			};
		};

	} forEach vehicles;

	sleep 10;
};
