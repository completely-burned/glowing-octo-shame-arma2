#define __A2OA__
/*
 * TODO: a3 Экипажу после успешного размещения
 * все равно отдается приказ покинуть тс.
 * TODO: Исправить беспилотнико A3.
 */

diag_log format ["Log: [fnc_spawnCrew.sqf] %1", _this];

#ifndef __ARMA3__
// Некоторые моды выдают bool вместо цифры.
#define true 1
#define false 0
#endif

private ["_type","_crewType","_typicalCargo","_unit","_crew","_vehicle",
	"_grp","_entry","_hasDriver","_turrets","_rank","_cfg_turret","_t",
	"_commanding","_uav","_side","_createSpecial","_dontCreateAI",
	"_bestCommander","_commandings","_commanding_max","_rankId",
	"_LandVehicle","_sorted","_typicalCargo2","_tmpPosSafe","_item"];

_vehicle = _this select 0;
_grp = _this select 1;
_side = _this select 2;
_type = _this select 3;
_typicalCargo = _this select 4;
_entry = _this select 5;
_tmpPosSafe = _this select 6;

_commandings = [];
// У Ванильных отрядов на этой позиции нет техники.
// TODO: Возможность создавать на дороге нужно учесть.
_tmpPosSafe set [0, (_tmpPosSafe select 0) + 10];
_tmpPosSafe set [1, (_tmpPosSafe select 1) + 10];
// FIXME: Еще идеи? Надеюсь юнит пререместится в тс раньше чем упадет или будет сбит.
_tmpPosSafe set [2, 2000];
// Под землей они умирают в a2.
//_tmpPosSafe set [2, (_tmpPosSafe select 2) - 200];
_uav = _vehicle call gosa_fnc_isUAV;

_crew = [];
_createSpecial = "CAN_COLLIDE";

//--- crew types
	if (count _typicalCargo > 0) then {
		_crewType = _typicalCargo select 0;
	}else{
		#ifndef __ARMA3__
		if (_uav) then {
			_crewType = [_grp, _type, _side] call gosa_fnc_crewUAV;
		};
		#endif
		if (isNil "_crewType") then {
			if (((getNumber (_entry >> "side")) call gosa_fnc_getSide) == _side) then {
				_crewType = getText (_entry >> "crew");
			}else{
				_crewType = ([_grp, _type, _side] call gosa_fnc_defaultCrew);
			};
		};
	};
	diag_log format ["Log: [fnc_spawnCrew.sqf] %1 %2", _crewType, _typicalCargo];

_hasDriver = getNumber (_entry >> "hasDriver");
_LandVehicle = _type isKindOf "LandVehicle";
//--- Пилот командир, поэтому первый.
if !(_LandVehicle) then {
	if ((_hasDriver == 1) && (isNull (driver _vehicle))) then {
			_unit = _grp createUnit [_crewType, _tmpPosSafe, [], 0, _createSpecial];
			_crew set [count _crew, _unit];

			// CUP_B_UH1Y_GUNSHIP_F не начинает движение если leader != effectiveCommander.
			_rank = "CAPTAIN";
			#ifdef __ARMA3__
				_unit setRank _rank;
			#else
				[nil, _unit, rsetRank, _rank] call RE;
			#endif

			_unit moveInDriver _vehicle;
			diag_log format ["Log: [fnc_spawnCrew.sqf] %1 assignAsDriver %2", _unit, _vehicle];
			_unit assignAsDriver _vehicle;

		#ifdef __ARMA3__
			_bestCommander = _unit;
			diag_log format ["Log: [fnc_spawnCrew.sqf] %1 setEffectiveCommander %2", _vehicle, _unit];
			_vehicle setEffectiveCommander _unit;
		#endif
	};
};

//--- turrets list
	#ifdef __ARMA3__
		_turrets = allTurrets [_vehicle, true];
	#else
		_turrets = ([_entry >> "turrets",[]] call gosa_fnc_returnVehicleTurrets);
	#endif

	if(_type == "FDF_leopard2a4")then{
		_turrets = [[0],[0,0]];
	};
	// Пулемет не нравится просто.
	#ifndef __A2OA__
		if(_type == "M1A2_TUSK_MG")then{
			_turrets = [[0],[0,0]];
		};
	#endif
	diag_log format ["Log: [fnc_spawnCrew.sqf] _turrets = %1", _turrets];


//--- sorting turrets and crew types
	for "_n" from 0 to (count _turrets - 1) do {
		_cfg_turret = _entry;
		{
			_cfg_turret = ((_cfg_turret  >> "turrets") select _x);
		} forEach (_turrets select _n);

		_commanding = getNumber(_cfg_turret >> "commanding");
		if !(_commanding in _commandings) then {
			_commandings set [count _commandings, _commanding];
		};
		if (isNil "_commanding_max") then {
			_commanding_max = _commanding;
		}else{
			_commanding_max = _commanding_max max _commanding;
		};

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

	if (_LandVehicle) then {
		_rankId = count _commandings;
	}else{
		_rankId = count _commandings -1;
	};

	if !(isNil "_sorted") then { // diag_log
		diag_log format ["Log: [fnc_spawnCrew.sqf] _sorted = %1", _sorted];
	}; // diag_log
	if !(isNil "_typicalCargo2") then { // diag_log
		diag_log format ["Log: [fnc_spawnCrew.sqf] _typicalCargo2 = %1", _typicalCargo2];
	}; // diag_log


//--- creating turret units
	if !(isNil "_sorted") then {
		for "_i" from (count _sorted - 1) to 0 step -1 do {
			_cfg_turret = _entry;
			{
				_cfg_turret = ((_cfg_turret  >> "turrets") select _x);
			} forEach (_sorted select _i select 1);
			#ifdef __ARMA3__
				_dontCreateAI = getNumber (_cfg_turret >> "dontCreateAI");
			#else
				_dontCreateAI = 0;
			#endif

			if (_dontCreateAI <= 0 && isNull (_vehicle turretUnit (_sorted select _i select 1))) then {

				if(!isNil {_typicalCargo2})then{
					_unit = _grp createUnit [(_typicalCargo2 select _i), _tmpPosSafe, [], 0, _createSpecial];
				}else{
					_unit = _grp createUnit [_crewType, _tmpPosSafe, [], 0, _createSpecial];
				};
				#ifndef __A2OA__
					_unit addEventHandler ["killed", {[_this select 0] call BIS_GC_trashItFunc}];
				#endif
				_crew set [count _crew, _unit];

				//--- установка ранга юнитам, TODO: ранг не правильно вычисляется
					_commanding = getNumber (_cfg_turret >> "commanding");
					if (_commanding < _commanding_max) then {
						_rankId = _rankId -1;
						_commanding_max = _commanding;
					};
					if (_rankId > 0) then {
						_rank = _rankId call gosa_fnc_rankConv;
						#ifdef __ARMA3__
							_unit setRank _rank;
						#else
							// До A3 движок не синхронизирует ранги самостоятельно.
							[nil, _unit, rsetRank, _rank] call RE;
						#endif
					};
					diag_log format ["Log: [fnc_spawnCrew.sqf] %1 setRank %2, %3, _c%4, %5", _unit, _rank, _sorted select _i select 1, _commanding, _cfg_turret];
					#ifdef __ARMA3__
						if (isNil "_bestCommander") then {
							_bestCommander = _unit;
							diag_log format ["Log: [fnc_spawnCrew.sqf] %1 setEffectiveCommander %2", _vehicle, _bestCommander];
							_vehicle setEffectiveCommander _bestCommander;
						};
					#endif

				_unit moveInTurret [_vehicle, _sorted select _i select 1];
					if (commander _vehicle == _unit) then {
						diag_log format ["Log: [fnc_spawnCrew.sqf] %1 assignAsCommander %2", _unit, _vehicle];
						_unit assignAsCommander _vehicle;
					}else{
						if (gunner _vehicle == _unit) then {
							diag_log format ["Log: [fnc_spawnCrew.sqf] %1 assignAsGunner %2", _unit, _vehicle];
							_unit assignAsGunner _vehicle;
							#ifdef __ARMA3__
						}else{
								diag_log format ["Log: [fnc_spawnCrew.sqf] %1 assignAsTurret %2", _unit, [_vehicle, _sorted select _i select 1]];
								_unit assignAsTurret [_vehicle, _sorted select _i select 1];
							#endif
						};
					};

			};
		};
	};


//--- creating driver unit for land
if (_LandVehicle) then {
	if ((_hasDriver > 0) && (isNull (driver _vehicle))) then {
			_unit = _grp createUnit [_crewType, _tmpPosSafe, [], 0, _createSpecial];
			_crew set [count _crew, _unit];
			_unit moveInDriver _vehicle;
			diag_log format ["Log: [fnc_spawnCrew.sqf] %1 assignAsDriver %2", _unit, _vehicle];
			_unit assignAsDriver _vehicle;
	};
}else{
	// Высокие деревья. В бою авиация не должна опускаться.
	if (worldName == "FDF_Isle1_a") then {
		for "_i" from 0 to (count _crew -1) do {
			_unit = _crew select _i;
			_unit disableAI "FSM";
			diag_log format ["Log: [fnc_spawnCrew.sqf] %1 disableAI 'FSM', FDF_Isle1_a", _unit];
		};
	};
};

// FIXME: Может этот кусок вынести из файла.
for "_i" from 0 to (count _crew - 1) do {
	_item = _crew select _i;
	#ifdef __ARMA3__
		[_item, "fnc_spawnCrew"] remoteExec ["gosa_fnc_vehInit2"];
	#else
		if (_uav) then {
			// FIXME: Без этого бпла не управляем.
			_item disableAI "FSM";
			// InvisibleMan.
			removeAllWeapons _item;
		};
		[nil, _item, rvehInit] call RE;
	#endif
};

_crew
