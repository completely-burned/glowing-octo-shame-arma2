#define __A2OA__

private["_out","_allow","_veh","_ng","_ng_l","_u","_z","_fnc_CrewLeave"];

_fnc_CrewLeave={
	private ["_u","_t","_b","_g"];
	_u = _this select 0;
	_t = _this select 1;
	_g = _this select 2;
	_b = true;

	diag_log format ["Log: [fnc_allowGetIn]: %1 экипаж подбитой техники, fnc", _this];

	// failover, нужно исключить ложные срабатывания
	while {time < _t} do {
		if (count assignedVehicleRole _u > 0 or vehicle _u != _u) exitWith {
			diag_log format ["Log: [fnc_allowGetIn]: %1 экипаж подбитой техники, отмена перехода, assignedVehicle", _u];
			_b = false;
		};
		sleep 1;
	};

	if (_b) then {

		// игрок может оказатся в группе по истечении таймера
		if ({_x call gosa_fnc_isPlayer} count units _g > 0) exitWith {
			diag_log format ["Log: [fnc_allowGetIn]: %1 экипаж подбитой техники, отмена перехода, игроки в группе %2", _u, units _g];
		};

		private ["_n"];
		_n = _g getVariable "gosa_grpCrewNew";
		if(isNil "_n" or {isNull _n})then{
			_n = createGroup side _g;
			_g setVariable ["gosa_grpCrewNew", _n];
			_n setVariable ["gosa_grpCrewOld", _g];
		};

		diag_log format ["Log: [fnc_allowGetIn]: %1 экипаж подбитой техники переходит в группу %2", _u, _n];
		[_u] joinSilent _n;
	}else{ //diag_log
		diag_log format ["Log: [fnc_allowGetIn]: %1 экипаж подбитой техники, отмена перехода %2 %3 %4", _u, typeof _u, typeof vehicle _u, assignedVehicleRole _u];
	};
};


// _units = _this select 0;
// _leader = _this select 1;
_out=[];
_ng_l = [];

if !((_this select 1) call gosa_fnc_isPlayer) then {
	{ // _units
		_u = _x;
		_veh = assignedVehicle _u;

		// failover
		if (isNull _veh) then {
			_veh = vehicle _u;
			if (_veh == _u) then {
				_veh = objNull;
			}else{ // diag_log
				diag_log format ["Log: [fnc_allowGetIn] isNull assignedVehicle unit:%1 veh:%2", [_u, typeOf _u], [_veh, typeOf _veh]];
			};
		};

		// TODO: название переменной
		_allow=true;
		if(!isNull _u)then{
			if(!isNull _veh)then{
				private ["_role"];
				_role = assignedVehicleRole _u;

				// в бою
				if(_allow)then{
					if((behaviour _u == "COMBAT" ) or ( currentCommand _u in ["ATTACK","FIRE","ATTACKFIRE"]))then{
						if(count _role > 0)then{
							if(_role select 0 == "Cargo")then{
								_allow=false;
							};
							if(_role select 0 == "Turret")then{
								if(_veh isKindOf "BMP3")then{
									if(([_role, [1, 0]] call BIS_fnc_returnNestedElement) in [1,2])then{
										_allow=false;
									};
								};
							};
						};
					};
				};

				// на месте
				if(_allow && true)then{

					private "_out_dist";
					// дистанция возрождения пехоты подходит для безопасной высадки
					_out_dist = safeSpawnDistance select 0;
					// если пехота покинула транспорт или он застрял, нет необходимости забираться обратно если он на приемлемой дистанции до цели, дистанция возрождения техники может подойти
					// TODO: транспорт создается остановленным
					if((_this select 1) == vehicle (_this select 1) or speed vehicle (_this select 1) < 5)then{
						_out_dist = safeSpawnDistance select 1;
					};

					if( ((civilianBasePos distance vehicle _u)<(_out_dist max gosa_locationSize)) or ((civilianBasePos distance _veh)<(_out_dist max gosa_locationSize)) )then{
						private ["_attack"];
						_attack = true;

						// транспорт без вооружения
						if(_attack)then{
							if(getNumber(LIB_cfgWea >> currentWeapon _veh >> "enableAttack")==0)then{
								_attack = false;
							};
						};

						// транспорт без вооружения 2
						if!(_attack)then{
							if([[_veh], ["M1128_MGS_EP1", "Pandur2_ACR"]] call gosa_fnc_CheckIsKindOfArray)then{
								_attack = true;
							};
						};

						// не авиация, без вооружения
						if!(_attack)then{
							if!(_veh isKindOf "Air")then{
								_allow=false;
							};
						};

						// техника с вооружением
						if(_attack)then{
							if(count _role > 0)then{
								if(_role select 0 == "Cargo")then{
									_allow=false;
								};
								if(_role select 0 == "Turret")then{
									if(_veh isKindOf "BMP3")then{
										if(([_role, [1, 0]] call BIS_fnc_returnNestedElement) in [1,2])then{
											_allow=false;
										};
									};
								};
							};
						};
					};
				};

				// расстояние до транспорта
				if(_allow)then{
					if(_veh != vehicle _u)then{
						if((_veh distance vehicle _u)>1000)then{
							_allow=false;
						};
					};
				};

				/*
				// без стрелка
				if(_allow)then{
					if(_veh isKindOf "LandVehicle")then{
						if(count _role > 0)then{
							if(_role select 0 == "Driver")then{
								if!([_veh, false] call gosa_fnc_CheckTurretAlive)then{
									_allow=false;
								};
							};
						};
					}
				};
				*/

				// авиация
				if!(_allow)then{
					if(_veh isKindOf "Air")then{
						_allow=true;
					};
				};
				if(_allow)then{
					if(_veh isKindOf "Helicopter")then{
						if(_u == vehicle _u)then{
							if((_veh distance vehicle _u)>50)then{
								_allow=false;
							};
						};
					};
				};
				// самолеты
				if(toLower getText(configFile >> "CfgVehicles" >> typeOf _veh >> "simulation") == "airplane")then{
					// юнит вне самолета
					if(_u == vehicle _u)then{
						_allow=false;
					};
					// юнит в самолете
					if(_veh == vehicle _u)then{
						_allow=true;
					};
				};

				// корабль
				if!(_allow)then{
					if(_veh isKindOf "Ship")then{
						_allow=true;
					};
				};

				// грузовик поддержки
					if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
						if(currentCommand (_this select 1) in ["","STOP","WAIT"])then{ // ,"SUPPORT","REPAIR","REFUEL","REARM"
							_allow=false;
						}else{
							_allow=true;
						};
					};

				// неподвижное
				if!(_allow)then{
					if(_veh isKindOf "StaticWeapon")then{
						_allow=true;
					};
				};

				// игрок
				if (_u call gosa_fnc_isPlayer) then {
					if (vehicle _u == _u) then {
						// _allow=false;
					}else{
						_allow=true;
					};
				};

			}else{
				// isNull _veh
				// экипаж подбитой техники переходит в другую группу чтобы не задерживать движение основной группы
				if(typeOf _u in (gosa_crewL+gosa_pilotL) &&
					// команда работает лишь на сервере или локальных юнитах клиента
					count assignedVehicleRole _u == 0 &&
					vehicle _u == _u
					//&& !(behaviour _u in ["COMBAT","STEALTH"])
					//&& !(currentCommand _u in ["ATTACK","FIRE","ATTACKFIRE"])
					// не нужно разделять отряд при отсутствии тс в отряде
					&& {_x != vehicle _x or (count assignedVehicleRole _x > 0)} count units _u == 0
				 )then{
					// TODO: лишние Variable занимают память и группу невозможно использовать повторно
					if (isNil {_grp getVariable "gosa_grpCrewOld"}) then {
						_ng_l set [count _ng_l, _u];
					};
				};

			}; // isNull _veh

			if!(_allow)then{
				_out set [count _out, _u];
			};

		}; // isNull _u

	} forEach (_this select 0);

	_out allowGetin false;

	(_this select 0) - _out allowGetin true;


	//--- переход экипажа подбитой техники в новую группу
	{
		_z = _x getVariable "gosa_grpCrewLeave";
		// TODO: код нужно оптимизировать
		#ifdef __A2OA__
		if (isNil "_z" or {scriptDone _z}) then
		#else
		if (isNil "_z" or (scriptDone _z)) then
		#endif
		{
			_x setVariable ["gosa_grpCrewLeave", [_x, time+ 30, _grp] spawn _fnc_CrewLeave];
		};
	} forEach _ng_l;

	/* TODO: нестабильно
	if (count _ng_l > 0) then {

		_ng = _grp getVariable "gosa_grpCrewNew";
		if(isNil "_ng")then{
			_ng = createGroup side _grp;
			_grp setVariable ["gosa_grpCrewNew", _ng];
			_ng setVariable ["gosa_grpCrewOld", _grp];
		};

		diag_log format ["Log: [fnc_allowGetIn]: %1 экипаж подбитой техники переходит в группу %2", _ng_l, _ng];
		_ng_l joinSilent _ng;
	};*/

};
