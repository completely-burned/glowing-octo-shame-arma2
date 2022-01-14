#define __A2OA__

diag_log format ["Log: [fnc_spawnCrew.sqf] %1", _this];

#define true 1
#define false 0

private ["_type","_crewType","_typicalCargo","_unit","_crew","_vehicle","_grp","_entry","_hasDriver","_turrets","_rank","_cfg_turret","_t","_commanding",
	"_LandVehicle","_sorted","_typicalCargo2"];

_vehicle = _this select 0;
_grp = _this select 1;

_type = typeOf _vehicle;

_entry = configFile >> "CfgVehicles" >> _type;
_crew = [];

//--- crew types
	if ((count _this) > 2) then {
		_typicalCargo = (_this select 2);
		_crewType = (_typicalCargo select 0);
	}else{
		_typicalCargo=[];
		if (_vehicle call gosa_fnc_isUAV) then {
			_crewType = [_grp, _type, side _grp] call gosa_fnc_crewUAV;
		};
		if (isNil "_crewType") then {
			if (((getNumber (_entry >> "side")) call gosa_fnc_getSide) == side _grp) then {
				_crewType = getText (_entry >> "crew");
			}else{
				_crewType = ([_grp, _type, side _grp] call gosa_fnc_defaultCrew);
			};
		};
	};
	diag_log format ["Log: [fnc_spawnCrew.sqf] _typicalCargo = %1", _typicalCargo];

//--- creating driver unit for air
	_hasDriver = getNumber (_entry >> "hasDriver");
	_LandVehicle = _type isKindOf "LandVehicle";

	if ((_hasDriver == 1) && (isNull (driver _vehicle)) && !_LandVehicle) then
	{
			_unit = _grp createUnit [_crewType, getPos _vehicle, [], 0, "FORM"];
			_crew set [count _crew, _unit];

			_unit moveInDriver _vehicle;
	};

//--- turrets list
	_turrets = ([_entry >> "turrets",[]] call gosa_fnc_returnVehicleTurrets);

	if(_type == "FDF_leopard2a4")then{
		_turrets = [[0],[0,0]];
	};
	#ifndef __A2OA__
	if(_type == "M1A2_TUSK_MG")then{
		_turrets = [[0],[0,0]];
	};
	#endif
	diag_log format ["Log: [fnc_spawnCrew.sqf] _turrets = %1", _turrets];


//--- sorting turrets and crew types
	for "_n" from 0 to count _turrets - 1 do {
		_cfg_turret = _entry;
		{
			_cfg_turret = ((_cfg_turret  >> "turrets") select _x);
		} forEach (_turrets select _n);
		_commanding = getNumber(_cfg_turret >> "commanding");

		if (isNil {_sorted}) then {
			_sorted = [[_commanding, _turrets select _n]];
			if(count _typicalCargo > 0)then{
				_typicalCargo2 = [_typicalCargo select _n+1]; // _n0 == driver
			};
		}else{
			scopeName "sn_t";
			for "_i" from (count _sorted - 1) to 0 step -1 do {
				if (_commanding <  (_sorted select _i select 0)) then {
					_sorted set [_i+1, _sorted select _i];
					_sorted set [_i, [_commanding, _turrets select _n]];
					if(count _typicalCargo > 0)then{
						_typicalCargo2 set [_i+1, _typicalCargo2 select _i];
						_typicalCargo2 set [_i, _typicalCargo select _n+1]; // _n0 == driver
					};
				};
				if (_commanding >= (_sorted select _i select 0) && count _sorted - 1 == _i) then {
					_sorted set [_i+1, [_commanding, _turrets select _n]];
					if(count _typicalCargo > 0)then{
						_typicalCargo2 set [_i+1, _typicalCargo select _n+1]; // _n0 == driver
					};
					breakTo "sn_t";
				};
			};
		};
	};

	if (!isNil {_sorted}) then { // diag_log
		diag_log format ["Log: [fnc_spawnCrew.sqf] _sorted = %1", _sorted];
	}; // diag_log
	if (!isNil {_typicalCargo2}) then { // diag_log
		diag_log format ["Log: [fnc_spawnCrew.sqf] _typicalCargo2 = %1", _typicalCargo2];
	}; // diag_log


//--- creating turret units
	if (!isNil {_sorted}) then {
		for "_i" from count _sorted - 1 to 0 step -1 do {
			if (isNull (_vehicle turretUnit (_sorted select _i select 1))) then {
				if(!isNil {_typicalCargo2})then{
					_unit = _grp createUnit [(_typicalCargo2 select _i), getPos _vehicle, [], 0, "FORM"];
				}else{
					_unit = _grp createUnit [_crewType, getPos _vehicle, [], 0, "FORM"];
				};
	#ifndef __A2OA__
				_unit addEventHandler ["killed", {[_this select 0] call BIS_GC_trashItFunc}];
	#endif
				_crew set [count _crew, _unit];

				//--- установка ранга юнитам, TODO: ранг не правильно вычисляется
					_rank = "CORPORAL";
					//--- turrets
					_cfg_turret = _entry;
					{
						_cfg_turret = ((_cfg_turret  >> "turrets") select _x);
					} forEach (_sorted select _i select 1);
					_commanding = getNumber (_cfg_turret >> "commanding");
					//--- gunner
					if ( _commanding == 1 ) then { // TODO: 1 не всегда означает gunner
						_rank = "SERGEANT";
					};
					//--- commander
					if ( _commanding == 2 ) then { // TODO: 2 не всегда означает commander
						_rank = "LIEUTENANT";
					};
					//--- set rank
					[nil, _unit, rsetRank, _rank] call RE;

				_unit moveInTurret [_vehicle, _sorted select _i select 1];
			};
		};
	};


//--- creating driver unit for land
	if ((_hasDriver == 1) && (isNull (driver _vehicle)) && _LandVehicle) then
	{
			_unit = _grp createUnit [_crewType, getPos _vehicle, [], 0, "FORM"];
			_crew set [count _crew, _unit];

			_unit moveInDriver _vehicle;
	};


_crew
