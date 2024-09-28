/*
	Скрипт обновляет различные значения транспорту, например уровень топлива.
	TODO: много лишнего кода
	// TODO: Совместимость с GC2.
*/

private ["_countMHQ","_count_transportammo","_count_transportrepair","_b",
	"_isPlayer","_lights",
	"_count_transportfuel","_timeNew","_timerDelete","_shop","_pos","_dir",
	"_obj","_cfgVeh","_side","_entry","_sides_friendly_num","_vehicles","_c",
	"_turretLimits","_turret","_minTurn","_maxTurn","_minElev","_target",
	"_maxElev","_overridden","_need_dir","_crew","_arrOff","_arrOn","_isNight",
	"_delete","_time","_veh","_type","_n","_str","_arr","_SearchLight_dist"];

_cfgVeh = LIB_cfgVeh;
_sides_friendly_num = gosa_sides_friendly_num;

if (missionNamespace getVariable "gosa_shop" == 1) then {
	_shop = true;
}else{
	_shop = false;
};

_timerDelete = 60 * 2.5;
// Обычные фары <150m, инфракрасные >500m
_SearchLight_dist = 250;

_arrOff = [];
_arrOn = [];

while{true}do{
_countMHQ = 0;
_count_transportammo = 0; _count_transportrepair = 0; _count_transportfuel = 0;
	_vehicles = vehicles;
	_isNight = [daytime] call gosa_fnc_isNight;
	sleep 3;
	_c = count _vehicles;
	if (_c > 0) then {
		_s = 60/_c;
		for "_i" from 0 to (_c -1) do {
			_veh = _vehicles select _i;
			sleep (_s call gosa_fnc_dynSleep);
	_delete = false;
	_type = typeOf _veh;

	_time = (_veh getVariable "gosa_timeDeleteVehicle");
	if ( isNil "_time" ) then {
		_time = ( time + _timerDelete );
		_veh setVariable ["gosa_timeDeleteVehicle", _time];
		diag_log format ["Log: [vehicles_other] %1 setTime %2", _veh, _time];
	};

	if(alive _veh)then{
		if (_shop) then {
			_entry = _cfgVeh >> _type;
			_n = getNumber(_entry >> "side");

			if (_n in _sides_friendly_num) then{
				if (getNumber(_entry >> "attendant") > 0) then {
					if (_delete) then{
						_count_transportammo = _count_transportammo + 1;
						if (_count_transportammo <= 3) then {
							_delete = false;
							_timeNew = _time max (time + _timerDelete);
						};
					};
				};
				if (getNumber(_entry >> "transportammo") > 0) then {
					_veh setAmmoCargo 1;
					if (_delete) then{
						_count_transportammo = _count_transportammo + 1;
						if (_count_transportammo <= 3) then {
							_delete = false;
							_timeNew = _time max (time + _timerDelete);
						};
					};
				};
				if (getNumber(_entry >> "transportrepair") > 0) then {
					_veh setRepairCargo 1;
					if (_delete) then{
						_count_transportrepair = _count_transportrepair + 1;
						if (_count_transportrepair <= 3) then {
							_delete = false;
							_timeNew = _time max (time + _timerDelete);
						};
					};
				};
				if (getNumber(_entry >> "transportfuel") > 0) then {
					_veh setFuelCargo 1;
					_veh setFuel 1;
					if (_delete) then{
						_count_transportfuel = _count_transportfuel + 1;
						if (_count_transportfuel <= 3) then {
							_delete = false;
							_timeNew = _time max (time + _timerDelete);
						};
					};
				};
			};
		};

		if (_veh call gosa_fnc_isCrewAlive) then{
					_crew = crew _veh;
					if ({_x call gosa_fnc_isPlayer} count _crew > 0) then {_isPlayer = true} else {_isPlayer = false};

					if !(_isPlayer) then {
						if (fuel _veh < 0.01) then {
							_veh setFuel 0.2;
							diag_log format ["Log: [vehicles_other] %1 refueling", _veh];
						};

						// FIXME: IFA3: Повреждения мотора отображаются визуально и такой скрытый ремонт не подходит.
						#ifdef __ARMA3__
							_str = "hitEngine";
							_n = _veh getHitPointDamage _str;
							if (_n >= 0.9) then {
								_n = 0.7;
								_arr = [_str, _n];
								_veh setHitPointDamage _arr;
								diag_log format ["Log: [vehicles_other] %1 setHitPointDamage %2", _veh, _arr];
							};
						#endif

						//- Включает фары и прожекторы.
						// FIXME: Прожектор не отключается сам после уничтожения ТС.
						// TODO: Патрульные машины которые светят вокруг, но при угрозе прячутся.
						#ifdef __ARMA3__
						if (_isNight) then {
							_lights = false;
							_arrOff resize 0;
							_arrOn resize 0;
							for "_i0" from 0 to (count _crew -1) do {
								_obj = _crew select _i0;
								_target = assignedTarget _obj;
								if (isNull _target && getSuppression _obj <= 0) then {
									_b = false;
								}else{
									if (_target isKindOf "Air") then {
										_b = false;
									}else{
										_b = true;
									}
								};
								if (_b) then {
									_arr = _veh unitTurret _obj;
									if (_arr select 0 >= 0) then {
										if !(isLightOn [_veh, _arr]) then {
											diag_log format ["Log: [vehicles_other] %1 SearchLightOn %2 %3, %4, %5", _veh, _obj, getSuppression _obj, typeOf _veh];
											_obj action ["SearchLightOn", _veh];
										};
									};
									_arrOn set [count _arrOn, _obj];
									_lights = true;
								}else{
									_arrOff set [count _arrOff, _obj];
								};
							};

							_target = assignedTarget _veh;
							if (isNull _target) then {
								_arr = _veh targets [true, _SearchLight_dist];
								for "_i0" from 0 to (count _arr -1) do {
									if (_veh knowsAbout (_arr select _i0) > 0) exitWith {
										_target = _arr select _i0;
									};
								};
							};
							if (isNull _target && getSuppression _obj <= 0) then {
								_b = false;
							}else{
								if (_target isKindOf "Air") then {
									_b = false;
								}else{
									_b = true;
								}
							};
							if (_b) then {
								_lights = true;
								_n = _target distance _veh;
								if (_n > _SearchLight_dist) then {
									_lights = false;
								};
								if (_lights) then {
									for "_i0" from 0 to (count _arrOff -1) do {
										_arr = _veh unitTurret (_arrOff select _i0);
										if (_arr select 0 >= 0) then {
											if !(isLightOn [_veh, _arr]) then {
												diag_log format ["Log: [vehicles_other] %1 SearchLightOn %2 %3, %4, %5", _veh, _arrOff select _i0, getSuppression _obj, typeOf _veh];
												_arrOff select _i0 action ["SearchLightOn", _veh];
											};
										};
									};
								};
							}else{
								for "_i0" from 0 to (count _arrOff -1) do {
									_arr = _veh unitTurret (_arrOff select _i0);
									if (_arr select 0 >= 0) then {
										if (isLightOn [_veh, _arr]) then {
											diag_log format ["Log: [vehicles_other] %1 SearchLightOff %2 %3, %4, %5", _veh, _arrOff select _i0, getSuppression _obj, typeOf _veh];
											_arrOff select _i0 action ["SearchLightOff", _veh];
										};
									};
								};
								_lights = false;
							};

							if (_lights) then {
								if (_veh checkAIFeature "LIGHTS") then {
									diag_log format ["Log: [vehicles_other] %1 disableAI %2", _veh, "LIGHTS"];
									_veh disableAI "LIGHTS";
								};
								if !(isLightOn _veh) then {
									diag_log format ["Log: [vehicles_other] %1 setPilotLight true", _veh, "LIGHTS"];
									// FIXME: Фары демаскируют больше чем прожекторы.
									_veh setPilotLight true;
								};
								//_veh enableGunLights "ForceOn";
							}else{
								if !(_veh checkAIFeature "LIGHTS") then {
									diag_log format ["Log: [vehicles_other] %1 enableAI %2", _veh, "LIGHTS"];
									_veh enableAI "LIGHTS";
								};
								//_veh setPilotLight false;
								//_veh enableGunLights "Auto";
							};
						} else {
							if !(_veh checkAIFeature "LIGHTS") then {
								diag_log format ["Log: [vehicles_other] %1 enableAI %2", _veh, "LIGHTS"];
								_veh enableAI "LIGHTS";
							};
							for "_i0" from 0 to (count _arrOff -1) do {
								_arr = _veh unitTurret (_arrOff select _i0);
								if (_arr select 0 >= 0) then {
									if (isLightOn [_veh, _arr]) then {
										diag_log format ["Log: [vehicles_other] %1 SearchLightOff %2 %3", _veh, _arrOff select _i0];
										_arrOff select _i0 action ["SearchLightOff", _veh];
									};
								};
							};
						};
						#endif
					};

			//- Разворачивает танк.
			// В A2 отсутсвуют vehicleMoveInfo и sendSimpleCommand "STOPTURNING";
			#ifdef __ARMA3__
			if (_veh isKindOf "Tank") then {
				// TODO: Учитывать ограничения поворота пушки.
				//_turret = [0];
				//_turretLimits = _veh getTurretLimits _turret;

					_dir = getDir _veh;
						_target = assignedTarget _veh;
					_dir = _dir - ([_veh, _target] call BIS_fnc_dirTo);

					if !(isNull _target) then {
						if (_dir < 0) then {
							_dir = _dir + 360;
						};

						_arr = vehicleMoveInfo _veh;
						if (_dir >= 345 or _dir <= 15) then {
							if ("RIGHT" in _arr or "LEFT" in _arr) then {
								_veh sendSimpleCommand "STOPTURNING";
							};
						}else{
							/*
							if (_dir >= 270 or _dir <= 90) then {
								_pos = getPos _veh;
								_pos = [_pos, 10, 180] call BIS_fnc_relPos;
								_veh commandMove _pos;
							}else{
							*/
								if ((_arr select 0 == "STOP" or speed _veh < 1) && !("RIGHT" in _arr or "LEFT" in _arr)) then {
									if (_dir < 350 && _dir > 180) then {
										_veh sendSimpleCommand "RIGHT";
										// FIXME: Инерция.
										_veh sendSimpleCommand "STOPTURNING";
									};
									if (_dir > 10 && _dir <= 180) then {
										_veh sendSimpleCommand "LEFT";
										// FIXME: Инерция.
										_veh sendSimpleCommand "STOPTURNING";
									};
								};
							//};
						};
					};
			};
			#endif

			if (isEngineOn _veh) then {
				if (speed _veh == 0) then {
					_obj = driver _veh;
					if (alive _obj) then {
						if !(_obj call gosa_fnc_isPlayer) then {
							_veh engineOn false;
						};
					};
				};
			};
			_delete = false;
			_timeNew = _time max (time + _timerDelete);
		};

		_veh call gosa_fnc_SalvageTruck;

		// _veh call gosa_fnc_StaticWeapon;

		// _veh call gosa_fnc_uav;

		if (!isNil {_timeNew}) then {
			if (_time != _timeNew) then {
				_veh setVariable ["gosa_timeDeleteVehicle", _timeNew];
				diag_log format ["Log: [vehicles_other] %1 time %2, new %3", _veh, _time, _timeNew];
			};
		};
				_timeNew = nil;
			};
		};
	};
};
