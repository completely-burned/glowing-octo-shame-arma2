#define __A2OA__
/*
 * Скрипт блокирует дверь от конокрадов.
 * TODO: Возможность блокировки ТС игрока по его запросу.
 * setVehicleLock "UNLOCKED" = same as "lock 0"
 * setVehicleLock "DEFAULT" = same as "lock 1"
 * setVehicleLock "LOCKED" = same as "lock 2"
 * setVehicleLock "LOCKEDPLAYER" = same as "lock 3"
 */

if (gosa_pvp) exitWith {
	diag_log format ["Log: [while_vehicles_lock] %1, PvP, exitWith ", time];
};

if(missionNamespace getVariable "gosa_vehicles_lock" == 2 or !isMultiplayer)exitWith{
	diag_log format ["Log: [while_vehicles_lock] exitWith %1", time];
};

#ifdef __ARMA3__
 if (true) exitWith {
	 diag_log format ["Log: [while_vehicles_lock] exitWith %1", time];
 };
#endif

#ifndef __A2OA__
if (true) exitWith {
	diag_log format ["Log: [while_vehicles_lock] exitWith %1", time];
};
#endif

private["_vehicles_lock","_grp","_units","_leaderPlayer","_isPlayer","_side",
	"_vehicle","_grpPlayer","_lock","_transportPlayer","_arr","_obj",
	"_friendly_vehicles_only","_sleep","_locked","_sides_check","_cfgVeh",
	"_sides_friendly","_s","_n"];

if (missionNamespace getVariable "gosa_vehicles_lock" == 1) then {
	_friendly_vehicles_only = true;
}else{
	_friendly_vehicles_only = false;
};
_sleep = 5;
_sides_check = [west,east,resistance];
_cfgVeh = LIB_cfgVeh;
_vehicles_lock = [];

waitUntil{!isNil "gosa_friendlyside"};
_sides_friendly = gosa_friendlyside;

while{sleep 1; true}do{
	// TODO: нужно оптимизировать, слишком сильная нагрузка

	_arr = allGroups;
	_vehicles_lock resize 0;
	// перечислить транспорт который нужно закрыть
	_n = count _arr;
	if (_n > 0) then {
		_s = (_sleep/_n);
		for "_i" from 0 to (_n -1) do {
			_grp = _arr select _i;
			sleep _s;

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
					for "_i0" from 0 to (count _units -1) do {
						_obj = _units select _i0;
						_veh = _obj call gosa_fnc_assignedVeh;
						if (_veh != _obj) then {
							if !(_veh in _vehicles_lock) then {
								_vehicles_lock set [count _vehicles_lock, _veh];
							};
						};
					};
				};
			};
		};
		_vehicles_lock = _vehicles_lock -[objNull];
	};

		diag_log format ["Log: [while_vehicles_lock.sqf] транспорт для закрытия %1", _vehicles_lock];

	_arr = vehicles;
	_n = count _arr;
	if (_n > 0) then {
		_s = (_sleep/_n);
		for "_i" from 0 to (_n -1) do {
			_veh = _arr select _i;
			sleep _s;

			// lock агрументы должны быть локальными
			if (Local _veh) then {


				#ifdef __ARMA3__
				// Return - Num for Arma3 0.50, Boolean for older games.
				_locked = locked _veh;
				if (_locked >= 0) then {
					_locked = if (_locked > 0) then {true} else {false};
				#endif

					// проверка только живого тс должно повысить производительность в случае большого числа уничтоженного транспорта
					if (alive _veh) then {
						if (_veh in _vehicles_lock) then {
							if ({_x call gosa_fnc_isPlayer} count crew _veh > 0) exitWith {
								_lock = false;
							};
							_obj = _veh getVariable "transportPlayer";
							if !(isNil "_obj") then {
								if (alive _obj) then {
									_lock = false;
								}else{
									_lock = true;
								};
							}else{
								_lock = true;
							};
						}else{
							if (_veh isKindOf "UAV" or _veh isKindOf "Ka137_Base_PMC") then {
								_lock = true;
							}else{
								if (_friendly_vehicles_only) then {
									_side = getNumber(_cfgVeh >> typeOf _veh >> "side") call gosa_fnc_getSide;
									if (_side in _sides_check &&
										!(_side in _sides_friendly)) then
									{
										_lock = true;
									}else{
										_lock = false;
									};
								}else{
									_lock = false;
								};
							};
						};

						#ifdef __ARMA3__
						if (_locked != _lock) then
						#else
						_locked = locked _veh;
						if ((_locked && !_lock) or (!_locked && _lock)) then
						#endif
						{
							diag_log format ["Log: [while_vehicles_lock.sqf] транспорт %1 %5, локальный = %4, нужно lock %2, сейчас %3", _veh, _lock, _locked, local _veh, typeOf _veh];
							// Alternative Syntax lock not awailable for <= A2OA games.
							_veh lock _lock;
						};
					};
				#ifdef __ARMA3__
				};
				#endif
			};
		};
	};
};
