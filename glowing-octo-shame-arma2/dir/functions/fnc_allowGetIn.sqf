#define __A2OA__
/*
 * TODO: Рефакторинг.
 * TODO: Комментарии.
 */

if (isNil "lambs_danger_fnc_brainVehicle") then {
	diag_log format ["Log: [fnc_allowGetIn] %1", _this];

	private["_out","_allow","_veh","_ng","_ng_l","_u","_z","_role","_type",
		"_units","_leader","_arr","_b","_var","_Getin","_role_cargo",
		"_vehicles","_tmpNum","_item","_tmpObj","_arr0"];

	_units = _this select 0;
	_leader = _this select 1;
	_out=[];
	_Getin = [];
	_ng_l = [];
	_arr = [];
	_var = "allowGetin";
	_role_cargo = ["cargo","Cargo","CARGO","FFV"];

	if !(_leader call gosa_fnc_isPlayer) then {
		for "_i" from 0 to (count _units -1) do {
			_u = _units select _i;
			_type = typeOf _u;
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
					_role = assignedVehicleRole _u;
					[_role, _veh] call gosa_fnc_assignedVehicleRole_fix;
					diag_log format ["Log: [fnc_allowGetIn] %1", [_u,_veh,_role], _allow];

					// в бою
					if(_allow)then{
						if ([_u] call gosa_fnc_unit_isAttacker or behaviour _u == "COMBAT") then {
							if(count _role > 0)then{
								if (_role select 0 in _role_cargo) then {
									_allow=false;
									diag_log format ["Log: [fnc_allowGetIn] %1, COMBAT, %2", [_u,_veh,_role], _allow];
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

						// TODO: Нужна функция проверки ближайших заданий.
						if ([_veh, _out_dist max gosa_locationSize] call gosa_fnc_CheckDistance_mission) then {
							private ["_attack"];
							_attack = true;

							_attack = [_attack, _veh] call gosa_fnc_veh_isAttacker_fix;

							// не авиация, без вооружения
							if!(_attack)then{
								if!(_veh isKindOf "Air")then{
									_allow=false;
									diag_log format ["Log: [fnc_allowGetIn] %1, cfg enableAttack==0, %2, not Air", [_u,_veh,_role], _allow];
								};
							};

							// техника с вооружением
							if(_attack)then{
								if(count _role > 0)then{
									if (_role select 0 in _role_cargo) then {
										_allow=false;
										diag_log format ["Log: [fnc_allowGetIn] %1, cfg enableAttack==1, %2", [_u,_veh,_role], _allow];
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
								diag_log format ["Log: [fnc_allowGetIn] %1, distance, %2", [_u,_veh,_role], _allow];
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

					//- Роль.
					if !(_allow) then {
						if ([_type] call gosa_fnc_role_isCrew) then {
							_allow = true;
						};
					};

					// авиация
					if!(_allow)then{
						if(_veh isKindOf "Air")then{
							_allow=true;
							diag_log format ["Log: [fnc_allowGetIn] %1, Air, %2", [_u,_veh,_role], _allow];
						};
					};
					if(_allow)then{
						if(_veh isKindOf "Helicopter")then{
							if(_u == vehicle _u)then{
								if((_veh distance vehicle _u)>50)then{
									_allow=false;
									diag_log format ["Log: [fnc_allowGetIn] %1, Helicopter, %2", [_u,_veh,_role], _allow];
								};
							};
						};
					};
					// самолеты
					if (toLower getText(configFile >> "CfgVehicles" >> _type >> "simulation") in ["airplane", "airplanex"]) then {
						// юнит вне самолета
						if(_u == vehicle _u)then{
							_allow=false;
							diag_log format ["Log: [fnc_allowGetIn] %1, out airplane, %2", [_u,_veh,_role], _allow];
						};
						// юнит в самолете
						if(_veh == vehicle _u)then{
							_allow=true;
							diag_log format ["Log: [fnc_allowGetIn] %1, in  airplane, %2", [_u,_veh,_role], _allow];
						};
					};

					// корабль
					if!(_allow)then{
						if(_veh isKindOf "Ship")then{
							_allow=true;
							diag_log format ["Log: [fnc_allowGetIn] %1, Ship, %2", [_u,_veh,_role], _allow];
						};
					};

					// грузовик поддержки
						if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
							if(currentCommand (_this select 1) in ["","STOP","WAIT"])then{ // ,"SUPPORT","REPAIR","REFUEL","REARM"
								_allow=false;
							}else{
								_allow=true;
							};
							diag_log format ["Log: [fnc_allowGetIn] %1, waypointType SUPPORT, %2, %3", [_u,_veh,_role], _allow, currentCommand (_this select 1)];
						};
						if !(_allow) then {
							_arr0 = [_veh] call gosa_fnc_getGroupType;
							if ("SUPPORT" in _arr0) then {
								_allow = true;
								diag_log format ["Log: [fnc_allowGetIn] %1, _veh type, %2, %3", [_u,_veh,_role], _allow, _arr0];
							};
						};

					// неподвижное
					if!(_allow)then{
						if(_veh isKindOf "StaticWeapon")then{
							_allow=true;
							diag_log format ["Log: [fnc_allowGetIn] %1, StaticWeapon, %2", [_u,_veh,_role], _allow];
						};
					};

					// игрок
					if (_u call gosa_fnc_isPlayer) then {
						if (vehicle _u == _u) then {
							// _allow=false;
						}else{
							_allow=true;
							diag_log format ["Log: [fnc_allowGetIn] %1, isPlayer, %2", [_u,_veh,_role], _allow];
						};
					};
				};

				if !(_allow) then {
					_out set [count _out, _u];
					_b = _u getVariable _var;
					if (isNil "_b") then {_b = true};
				
					if (_b) then {
						_u setVariable [_var, _allow];
						_arr set [count _arr, _u];
					};
				};
			};
		};

		if (count _arr > 0) then {
			diag_log format ["Log: [fnc_allowGetIn] false %1", _arr];
			_arr allowGetin false;
		};

		#ifdef __ARMA3__
			// a3 тс не останавливается само если у других есть приказ выйти.
			// Находим тс и останавливаем их.
			_tmpNum = count _out;
			if (_tmpNum > 0) then {
				_vehicles = [];
				for "_i" from 0 to (_tmpNum -1) do {
					_item = _out select _i;
					_tmpObj = vehicle _item;
					if (_tmpObj != _item && !(_tmpObj in _vehicles)) then {
						_vehicles set [count _vehicles, _tmpObj];
					};
				};
				// FIXME: Некоторые ТС не восстанавливают движение.
				for "_i" from 0 to (count _vehicles -1) do {
					_vehicles select _i commandFollow (_vehicles select _i);
				};
			};
		#endif

		_arr = (_units - _out);
		for "_i" from 0 to (count _arr -1) do {
			_u = _arr select _i;

			_b = _u getVariable _var;
			if (isNil "_b") then {_b = true};
		
			if !(_b) then {
				_u setVariable [_var, true];
				_Getin set [count _Getin, _u];
			};
		};
		if (count _Getin > 0) then {
			diag_log format ["Log: [fnc_allowGetIn] true %1", _Getin];
			_Getin allowGetin true;
		};
	};
};
