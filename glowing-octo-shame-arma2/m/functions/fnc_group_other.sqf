// функция изменяет поведение ии, например: вход и выход с транспортом, переключает тип боеприпасов, изменяет скорость, режим боя

private["_grp"];
private["_leader"];
private["_leaderPos"];
private["_currentWP","_wp","_typeWP"];
private ["_units","_vehicles","_types","_cargo","_assignedVehicles"];
private["_Submarine"];
private ["_Helicopter"];
private ["_Plane"];
private ["_Ship"];
private ["_StaticWeapon"];
private ["_Air","_uav","_Car","_Tank"];
private ["_Tracked_APC","_Wheeled_APC"];
private["_AA"];
private["_support"];
// private ["_Stealth"];
private["_grp_wp_completed"];

_grp=_this;

scopeName "main";


_grp_wp_completed = _grp getVariable "_grp_wp_completed";

_units = units _grp;

if (draga_loglevel > 0) then {
	diag_log format ["fnc_group_other.sqf units %1", _units];
};

if({alive _x} count units _grp > 0)then{

	_leader = leader _grp;

	// нужно проверять локальных
	if(
		// если не локальные
		!local _leader or
		(isServer && (owner _leader > 2)) or
		(!isServer && (owner _leader == 2))
	)then{
		// то пропуск
		if (draga_loglevel > 0) then {
			diag_log format ["fnc_group_other.sqf breakTo main, owner: %1  %2,  isServer = %3, isLocal = %4", _leader, owner _leader, isServer, local _leader];
		};
		breakTo "main";
	};

	_leaderPos = getPos vehicle _leader;

	_currentWP = currentWaypoint _grp;
	_wp = [_grp,_currentWP];
	_typeWP = waypointType _wp;

	_vehicles = [];
	_types = [];
	_cargo = [];
	_assignedVehicles = [];
	{
		_types set [count _types, typeOf _x];
		private ["_veh","_assignedVehicle"];
		_veh = vehicle _x;
		_assignedVehicle = assignedVehicle _x;
		if (!isNull _assignedVehicle) then {
			_assignedVehicles set [count _assignedVehicles, _veh];
		};
		if(_veh != _x)then{
			if!(_veh in _vehicles)then{
				_vehicles set [count _vehicles, _veh];
				_types set [count _types, typeOf _veh];
				_cargo = _cargo + assignedCargo _veh;
			};
		};
	}forEach _units;

	if( ({!isNil {_x getVariable "draga_transportwaypoint_created_GET_IN_pos"}} count [_grp] + _vehicles > 0 ) or ({!isNil {_x getVariable "draga_transportwaypoint_created_GET_OUT_pos"}} count [_grp] + _vehicles > 0 ))then{
		breakTo "main";
		if (draga_loglevel > 0) then {
			diag_log format ["fnc_group_other.sqf %1 breakTo main, transport", _grp ];
		};
	};

	if({toLower getText(LIB_cfgVeh >> _x >> "vehicleClass") == "submarine"} count _types > 0)then{_Submarine = true}else{_Submarine = false};

	_Helicopter = ([_vehicles, ["Helicopter"]] call m_fnc_CheckIsKindOfArray);

	_Plane = ([_vehicles, ["Plane"]] call m_fnc_CheckIsKindOfArray);

	_Ship = ([_vehicles, ["Ship"]] call m_fnc_CheckIsKindOfArray);

	_StaticWeapon = ([_vehicles, ["StaticWeapon"]] call m_fnc_CheckIsKindOfArray);

	_Air = ([_vehicles, ["Air"]] call m_fnc_CheckIsKindOfArray);

	_Tank = ([_vehicles, ["Tank"]] call m_fnc_CheckIsKindOfArray);

	_Car = ([_vehicles, ["Car"]] call m_fnc_CheckIsKindOfArray);

	_Tracked_APC = ([_vehicles, ["Tracked_APC"]] call m_fnc_CheckIsKindOfArray);
	_Wheeled_APC = ([_vehicles, ["Wheeled_APC"]] call m_fnc_CheckIsKindOfArray);

	_uav = ([_types, ["UAV"]] call m_fnc_CheckIsKindOfArray);
	if({getNumber (LIB_cfgVeh >> _x >> "isUav") == 1} count _types > 0)then{
		_uav = true;
	};

	_AA = ([_vehicles, ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1"]] call m_fnc_CheckIsKindOfArray);

	_support = false;
	ScopeName "_true1";
	{
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "attendant")> 0 && _x isKindOf "LandVehicle")then{
			_support = true;
			BreakTo "_true1";
		};
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportfuel")> 0)then{
			_support = true;
			BreakTo "_true1";
		};
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportammo")> 0)then{
			_support = true;
			BreakTo "_true1";
		};
		if(getNumber(LIB_cfgVeh >> typeOf _x >> "transportrepair")> 0)then{
			_support = true;
			BreakTo "_true1";
		};

	}forEach _vehicles+_assignedVehicles;
	if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
		if({count assignedVehicleRole _x > 0} count _units > 0)then{
			_support = true;
		};
	};


	private["_getOut","_allowGetin","_assignedVehicle"];
	_getOut=[];
	if !(_leader call fnc_isPlayer) then {
		{
			_assignedVehicle = assignedVehicle _x;
			_allowGetin=true;
			if(!isNull _x)then{
				if(!isNull _assignedVehicle)then{
					private ["_VehicleRole"];
					_VehicleRole = assignedVehicleRole _x;

					// в бою
					if(_allowGetin)then{
						if((behaviour _x == "COMBAT" ) or ( currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]))then{
							if(count _VehicleRole > 0)then{
								if(_VehicleRole select 0 == "Cargo")then{
									_allowGetin=false;
								};
								if(_VehicleRole select 0 == "Turret")then{
									if(_assignedVehicle isKindOf "BMP3")then{
										if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1,2])then{
											_allowGetin=false;
										};
									};
								};
							};
						};
					};

					// на месте
					if(_allowGetin && true)then{
						if(((civilianBasePos distance vehicle _x)<(1000 max sizeLocation))or ((civilianBasePos distance _assignedVehicle)<(1000 max sizeLocation)))then{
							private ["_enableAttack"];
							_enableAttack = true;

							// транспорт без вооружения
							if(_enableAttack)then{
								if(getNumber(LIB_cfgWea >> currentWeapon _assignedVehicle >> "enableAttack")==0)then{
									_enableAttack = false;
								};
							};

							// транспорт без вооружения 2
							if!(_enableAttack)then{
								if([[_assignedVehicle], ["M1128_MGS_EP1", "Pandur2_ACR"]] call m_fnc_CheckIsKindOfArray)then{
									_enableAttack = true;
								};
							};

							// не авиация
							if!(_enableAttack)then{
								if!(_assignedVehicle isKindOf "Air")then{
									_allowGetin=false;
								};
							};

							// техника с вооружением
							if(_enableAttack)then{
								if(count _VehicleRole > 0)then{
									if(_VehicleRole select 0 == "Cargo")then{
										_allowGetin=false;
									};
									if(_VehicleRole select 0 == "Turret")then{
										if(_assignedVehicle isKindOf "BMP3")then{
											if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1,2])then{
												_allowGetin=false;
											};
										};
									};
								};
							};
						};
					};

					// расстояние до транспорта
					if(_allowGetin)then{
						if(_assignedVehicle != vehicle _x)then{
							if((_assignedVehicle distance vehicle _x)>1000)then{
								_allowGetin=false;
							};
						};
					};

					// без стрелка
					if(_allowGetin)then{
						if(_assignedVehicle isKindOf "LandVehicle")then{
							if!([_assignedVehicle, false] call draga_fnc_CheckTurretAlive)then{
								_allowGetin=false;
							};
						}
					};

					// авиация
					if!(_allowGetin)then{
						if(_assignedVehicle isKindOf "Air")then{
							_allowGetin=true;
						};
					};
					if(_allowGetin)then{
						if(_assignedVehicle isKindOf "Helicopter")then{
							if(_x == vehicle _x)then{
								if((_assignedVehicle distance vehicle _x)>50)then{
									_allowGetin=false;
								};
							};
						};
					};
					// самолеты
					if(toLower getText(configFile >> "CfgVehicles" >> typeOf _assignedVehicle >> "simulation") == "airplane")then{
						// юнит вне самолета
						if(_x == vehicle _x)then{
							_allowGetin=false;
						};
						// юнит в самолете
						if(_assignedVehicle == vehicle _x)then{
							_allowGetin=true;
						};
					};

					// корабль
					if!(_allowGetin)then{
						if(_assignedVehicle isKindOf "Ship")then{
							_allowGetin=true;
						};
					};

					// грузовик поддержки
						if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
							if(currentCommand _leader in ["","STOP","WAIT"])then{ // ,"SUPPORT","REPAIR","REFUEL","REARM"
								_allowGetin=false;
							}else{
								_allowGetin=true;
							};
						};

					// неподвижное
					if!(_allowGetin)then{
						if(_assignedVehicle isKindOf "StaticWeapon")then{
							_allowGetin=true;
						};
					};

					// игрок
					if (_x call fnc_isPlayer) then {
						if (vehicle _x == _x) then {
							// _allowGetin=false;
						}else{
							_allowGetin=true;
						};
					};

				}; // isNull _assignedVehicle

				if!(_allowGetin)then{
					_getOut set [count _getOut, _x];
				};

			}; // isNull _x

		} forEach _units;

		_getOut allowGetin false;

		_units - _getOut allowGetin true;

	}; // count _vehicles

	// HE Tank
	if (_Tank or _Wheeled_APC) then {
		private["_veh","_type","_entry","_turrets","_turret","_mags_he","_mag","_ammo","_indirectHitRange","_weapon","_mag_he","_mags","_he"];
		{

			_veh = _x;

			_type = typeOf _veh;

			if (_type isKindOf "Tank" && !(effectiveCommander _veh call fnc_isPlayer)) then {


				_entry = configFile >> "CfgVehicles" >> _type;

				_turrets = ([_entry >> "turrets",[]] call m_fnc_returnVehicleTurrets);

				{
					_turret = _x;

					// подходящие магазины
					_mags = [];
					// подходящие офс магазины
					_mags_he = [];
					{ // weapons turret

						// оружие
						_weapon = _x;


						{ // magazines turret

							_mag = _x;


							// магазин подходит оружию
							if ({toLower _mag == toLower _x } count getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines") > 0) then {

								// добавить в список подходящих магазинов
								_mags set [count _mags, [_turret, _weapon, _mag]];

								// тип снаряда
								_ammo = getText (configFile >> "CfgMagazines" >> _mag >> "ammo");

								// офс снаряд
								_indirectHitRange = getNumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
								if (_indirectHitRange > 2) then {

									// добавить в список подходящих офс магазинов
									_mags_he set [count _mags_he, [_turret, _weapon, _mag]];

								};
							};

						} forEach (_veh magazinesTurret _turret);




					} forEach (_veh weaponsTurret _turret);

					// есть офс магазины
					if (count _mags_he > 0) then {

						// выбрать магазин офс

						_he = true;
						{

							if (_x select 1 isKindOf "Tank" && _x select 3 > 1.5) exitWith {
								_he = false;
							};
						} forEach (_veh nearTargets 2000);

						// использовать офс
						if (_he) then {
							// зарядить офс магазин
							_mag_he = (_mags_he select 0);
						}else{
							// зарядить первый подходящий магазин
							_mag_he = (_mags select 0);
						};
						_veh loadMagazine [_mag_he select 0, _mag_he select 1, _mag_he select 2];


					};


				} forEach _turrets;

			};
		} forEach _vehicles;
	};

	// лидер двигается ближе к атакующим юнитам
	if (_leader == Vehicle _leader) then {

		private["_follow"];

		scopeName "_follow";

		if !(_leader call fnc_isPlayer) then {

			// лидер двигаться в сторону атакующей техники отряда
			{
				if (currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"]) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _vehicles;

			// лидер двигаться в сторону техники отряда
			/*
			{
				if (alive effectiveCommander _x && !(behaviour _leader in ["SAFE", "CARELESS", "AWARE"])) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _vehicles;
			*/

			// лидер двигаться в сторону атакующего юнита отряда
			{
				if (currentCommand _x in ["ATTACK","FIRE","ATTACKFIRE"] && vehicle _x == _x ) then {
					_follow = _x;
					breakTo "_follow";
				};
			} forEach _units-[_leader];

		};

		// движение лидера
		if (!isNil{_follow}) then {
			if (_leader Distance _follow > 75) then {
				Private["_position","_position1"];
				_position = GetPos _leader;
				_position1 = GetPos _follow;
				_position = [((_position Select 0) + (_position1 Select 0)) / 2,((_position Select 1) + (_position1 Select 1)) / 2];
				// _grp Move _position;
				_leader doMove _position;
			};
		};
	};


	if !(_leader call fnc_isPlayer) then {
		private["_SpeedMode","_CombatMode","_Behaviour"];
		_SpeedMode = "NORMAL";
		_CombatMode = "YELLOW";
		_Behaviour = "AWARE";

		private["_currentWaypoint","_currentWaypointType"];
		_currentWaypoint = [_grp, currentWaypoint _grp];
		_currentWaypointType = waypointType _currentWaypoint;

		if ((vehicle _leader distance civilianBasePos) > sizeLocation + sizeLocation/2) then {
			_SpeedMode = "FULL";
		};

		if(_Car && vehicle _leader != _leader)then{
			_Behaviour = "SAFE";
		};

		if ((vehicle _leader distance civilianBasePos) <= sizeLocation) then {
			_Behaviour = "COMBAT";
		};

		if (_Tank) then {
			_Behaviour = "COMBAT";
		};

		if(_Air)then{
			_Behaviour = "COMBAT";
		};

		private ["_Stealth"];
		_Stealth = false;
		private ["_countStealth"];
		_countStealth = 0;
		{
			if (toLower _x in listStealthTypesLower) then {
				_countStealth = _countStealth +1;
			};
		} forEach _types;
		if (_countStealth > (count _types / 2)) then {
			_Behaviour = "STEALTH";
			_CombatMode = "WHITE";
		};

		if(_uav)then{
			_SpeedMode = "LIMITED";
			_CombatMode = "BLUE";
			_Behaviour = "CARELESS";
		};

		if(_Air)then{
			if(_currentWaypointType in ["UNLOAD","GETOUT","GETIN"] or count _cargo > 0)then{
				_CombatMode = "GREEN";
				_Behaviour = "AWARE";
				_SpeedMode = "FULL";
			};
		};

		if(!_Air)then{
			if(_Behaviour in ["COMBAT","STEALTH"])then{
				if !([_leader, 800] call m_fnc_CheckPlayersDistance) then {
					_Behaviour = "AWARE";
				};
			};
		};

		if(_currentWaypointType in ["SUPPORT"])then{
			_CombatMode = "GREEN";
			_Behaviour = "SAFE";
			_SpeedMode = "FULL";
		};

		// танки
		if(_Tank && !_Tracked_APC)then{
			_CombatMode = "RED";
		};

		if(speedMode _grp != _SpeedMode)then{
			_grp setSpeedMode _SpeedMode;
		};
		if(combatMode _grp != _CombatMode)then{
			_grp setCombatMode _CombatMode;
		};
		if(behaviour _leader != _Behaviour)then{
			_grp setBehaviour _Behaviour;
		};




	};

};

if (draga_loglevel > 0) then {
	diag_log format ["fnc_group_other end %1", time];
};
