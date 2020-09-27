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

	}forEach _assignedVehicles;
	if(waypointType [_grp, currentwaypoint _grp] == "SUPPORT")then{
		if({count assignedVehicleRole _x > 0} count _units > 0)then{
			_support = true;
		};
	};



	// HE Tank
	if (_Tank or _Wheeled_APC) then {
		private["_veh","_type","_entry","_turrets","_turret","_mags_he","_mag","_ammo","_indirectHitRange","_weapon","_mag_he","_mags","_he"];
		{

			_veh = _x;

			_type = typeOf _veh;

			if (_type isKindOf "Tank" && !isPlayer effectiveCommander _veh) then {


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


	if (!isPlayer _leader) then {
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
