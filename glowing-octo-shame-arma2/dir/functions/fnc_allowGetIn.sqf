private["_out","_allow","_veh","_ng","_ng_l"];
// _units = _this select 0;
// _leader = _this select 1;
_out=[];
_ng_l = [];

if !((_this select 1) call gosa_fnc_isPlayer) then {
	{ // _units
		_veh = assignedVehicle _x;

		// failover
		if (isNull _veh) then {
			_veh = vehicle _x;
			if (_veh == _x) then {
				_veh = objNull;
			}else{ // diag_log
				diag_log format ["Log: [fnc_allowGetIn] isNull assignedVehicle unit:%1 veh:%2", [_x, typeOf _x], [_veh, typeOf _veh]];
			};
		};

		_allow=true; // TODO: название переменной
		if(!isNull _x)then{
			if(!isNull _veh)then{
				private ["_role"];
				_role = assignedVehicleRole _x;

				// в бою
				if(_allow)then{
					if((behaviour _x == "COMBAT" ) or ( currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]))then{
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
					if((_this select 1) == vehicle (_this select 1) or speed vehicle (_this select 1) < 5)then{ // TODO: транспорт создается остановленным
						_out_dist = safeSpawnDistance select 1;
					};

					if( ((civilianBasePos distance vehicle _x)<(_out_dist max sizeLocation)) or ((civilianBasePos distance _veh)<(_out_dist max sizeLocation)) )then{
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
					if(_veh != vehicle _x)then{
						if((_veh distance vehicle _x)>1000)then{
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
						if(_x == vehicle _x)then{
							if((_veh distance vehicle _x)>50)then{
								_allow=false;
							};
						};
					};
				};
				// самолеты
				if(toLower getText(configFile >> "CfgVehicles" >> typeOf _veh >> "simulation") == "airplane")then{
					// юнит вне самолета
					if(_x == vehicle _x)then{
						_allow=false;
					};
					// юнит в самолете
					if(_veh == vehicle _x)then{
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
				if (_x call gosa_fnc_isPlayer) then {
					if (vehicle _x == _x) then {
						// _allow=false;
					}else{
						_allow=true;
					};
				};

			}else{
				if (gosa_loglevel > 0) then { // TODO: нестабильно
				// экипаж подбитой техники переходит в другую группу чтобы не задерживать движение основной группы
				if(typeOf _x in (gosa_crewL+gosa_pilotL) &&
					count assignedVehicleRole _x == 0 && // команда работает лишь на сервере или локальных юнитах клиента
					vehicle _x == _x
				 )then{
					if (isNil {_grp getVariable "gosa_grpCrewOld"}) then { // TODO: лишние Variable занимают память и группу невозможно использовать повторно
						_ng_l set [count _ng_l, _x];
					};
				};
				};

			}; // isNull _veh

			if!(_allow)then{
				_out set [count _out, _x];
			};

		}; // isNull _x

	} forEach (_this select 0);

	_out allowGetin false;

	(_this select 0) - _out allowGetin true;


	if (count _ng_l > 0) then {

		_ng = _grp getVariable "gosa_grpCrewNew";
		if(isNil "_ng")then{
			_ng = createGroup side _grp;
			_grp setVariable ["gosa_grpCrewNew", _ng];
			_ng setVariable ["gosa_grpCrewOld", _grp];
		};

		diag_log format ["Log: [fnc_allowGetIn]: %1 экипаж подбитой техники переходит в группу %2", _ng_l, _ng];
		_ng_l joinSilent _ng;
	};

};
