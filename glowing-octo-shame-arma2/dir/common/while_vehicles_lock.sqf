#define __A2OA__

/*
	setVehicleLock "UNLOCKED" = same as "lock 0"
	setVehicleLock "DEFAULT" = same as "lock 1"
	setVehicleLock "LOCKED" = same as "lock 2"
	setVehicleLock "LOCKEDPLAYER" = same as "lock 3"
*/

#ifdef __A2OA__

private["_vehicles_lock"];

private["_grp","_units","_leaderPlayer","_isPlayer","_vehicle","_grpPlayer","_side"];

private["_lock"];

private["_transportPlayer"];

private["_friendly_vehicles_only"];
_friendly_vehicles_only = missionNamespace getVariable "friendly_vehicles_only";

waitUntil{!isNil "gosa_friendlyside"};

while{true}do{
	// TODO: нужно оптимизировать, слишком сильная нагрузка

	// перечислить транспорт который нужно закрыть
	_vehicles_lock = [];
	{
		_grp = _x;

		// можно не выполнять другие вычисления если игрок лидер
		if(leader _grp call gosa_fnc_isPlayer)then{
				//diag_log format ["Log: [while_vehicles_lock.sqf] поиск транспорта для закрытия отменен, игрок лидер группы %1", _grp];
		}else{
			// можно не выполнять другие вычисления если игрок в группе, но долго проверяются все юниты в группе
			_units = units _grp;
			if({_x call gosa_fnc_isPlayer}count _units > 0)then{
					//diag_log format ["Log: [while_vehicles_lock.sqf] поиск транспорта для закрытия отменен, игроки в группе %1", _grp];
			}else{
				// транспорт чужой группы нужно закрывать
				//	diag_log format ["Log: [while_vehicles_lock.sqf] поиск транспорта для закрытия %1", _grp];
				// находим транспорт
				{
					_vehicle = assignedVehicle _x;

					if (isNull _vehicle) then {
						_vehicle = _x getVariable "gosa_assignedVehicle";
						if (isNil {_vehicle}) then {_vehicle = objNull};
					};

					if(isNull _vehicle)then{
						_vehicle = vehicle _x;
					};

					if(!isNull _vehicle && _vehicle != _x && !(_vehicle in _vehicles_lock))then{
						_vehicles_lock set [count _vehicles_lock, _vehicle];
					};

				} forEach _units;
			};
		};
	} forEach allGroups;

		diag_log format ["Log: [while_vehicles_lock.sqf] транспорт для закрытия %1", _vehicles_lock];

	{
		// lock агрументы должны быть локальными
		if (Local _x) then {
			// проверка только живого тс должно повысить производительность в случае большого числа уничтоженного транспорта
			if (alive _x) then {
				_vehicle = _x;
				if (_vehicle in _vehicles_lock) then {
					_lock = 2;
				}else{
					_lock = 0;
				};

				if (_vehicle isKindOf "UAV" or _vehicle isKindOf "Ka137_Base_PMC") then {
					_lock = 2;
				};

				_transportPlayer = _vehicle getVariable "transportPlayer";
				if(!isNil {_transportPlayer})then{
					if(alive _transportPlayer)then{
						_lock = 0;
					};
				};

				if (_friendly_vehicles_only == 1) then {
					_side = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "side") call gosa_fnc_getSide;
					if (_side in [west,east,resistance]) then {
						if !(_side in gosa_friendlyside) then {
							_lock = 2;
						};
					};
				};

				if({_x call gosa_fnc_isPlayer}count crew _vehicle > 0)then{
					_lock = 0;
				};

				_lock_old = locked _vehicle;


				if (_lock == 2) then {_lock = true}else{_lock = false};

				if (!_lock_old && _lock) then {
					diag_log format ["Log: [while_vehicles_lock.sqf] транспорт %1 %5, локальный = %4, нужно lock %2, сейчас %3", _vehicle, _lock, _lock_old, local _vehicle, typeOf _vehicle];
					_vehicle lock _lock;
				};
				if (_lock_old && !_lock) then {
					diag_log format ["Log: [while_vehicles_lock.sqf] транспорт %1 %5, локальный = %4, нужно lock %2, сейчас %3", _vehicle, _lock, _lock_old, local _vehicle, typeOf _vehicle];
					_vehicle lock _lock;
				};
			};
		};

	} forEach vehicles;

	sleep 5;
};
#endif
