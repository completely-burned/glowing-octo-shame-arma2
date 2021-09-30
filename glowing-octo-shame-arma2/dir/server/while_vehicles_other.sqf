/*скрипт обновляет различные значения транспорту, например уровень топлива
 * TODO: много лишнего кода
 */

private ["_countMHQ","_deleteList","_count_transportammo","_count_transportrepair","_count_transportfuel"];
while{true}do{
_countMHQ = 0;
_count_transportammo = 0; _count_transportrepair = 0; _count_transportfuel = 0;
_deleteList=[];
{
	Private["_delete","_time","_veh","_type"];
	_delete = false;
	_veh=_x;
	_type = typeOf _veh;

	_time = (_veh getVariable "time");
	if ( isNil "_time" ) then {
		_time = ( time + ( 180 ) );
		_veh setVariable ["time", _time];
	}else{
		if ( _time < time )then {
			_delete = true;
		};
	};

	if(alive _veh)then{

		private["_side"];
		_side = getNumber(LIB_cfgVeh >> _type >> "side") call gosa_fnc_getSide;
		if (_side in gosa_friendlyside) then{
		if(getNumber(configFile >> "CfgVehicles" >> _type >> "attendant")> 0) then{
			if (_delete) then{
				_count_transportammo = _count_transportammo + 1;
				if (_count_transportammo <= 3) then {
					_delete = false;
				};
			};
		};
		if(getNumber(configFile >> "CfgVehicles" >> _type >> "transportammo")> 0) then{
			_veh setAmmoCargo 1;
			if (_delete) then{
				_count_transportammo = _count_transportammo + 1;
				if (_count_transportammo <= 3) then {
					_delete = false;
				};
			};
		};
		if(getNumber(configFile >> "CfgVehicles" >> _type >> "transportrepair")> 0) then{
			_veh setRepairCargo 1;
			if (_delete) then{
				_count_transportrepair = _count_transportrepair + 1;
				if (_count_transportrepair <= 3) then {
					_delete = false;
				};
			};
		};
		if(getNumber(configFile >> "CfgVehicles" >> _type >> "transportfuel")> 0) then{
			_veh setFuelCargo 1;
			_veh setFuel 1;
			if (_delete) then{
				_count_transportfuel = _count_transportfuel + 1;
				if (_count_transportfuel <= 3) then {
					_delete = false;
				};
			};
		};
			if (_delete) then{
				if ([[_veh], listMHQ] call gosa_fnc_CheckIsKindOfArray) then {
					_countMHQ = _countMHQ + 1;
					if (_countMHQ <= 3) then {
						_delete = false;
					};
				};
			};
		};

		if (({alive _x} count (crew _veh + [assignedDriver _veh, assignedGunner _veh, assignedCommander _veh] + assignedCargo _veh))>0) then{
			if(isEngineOn _veh && speed _veh == 0 && alive driver _veh)then{
				_veh engineOn false;
			};
			_delete = false;
			if ( _time < ( time + 180 ) )then {
				_time = time + 180;
				_veh setVariable ["time", _time];
			};
		};

		_veh call gosa_fnc_SalvageTruck;

		// _veh call gosa_fnc_StaticWeapon;

		// _veh call gosa_fnc_uav;

	}else{
		if !(_delete) then{
			if ( _time > ( time + 180 ) )then {
				_veh setVariable ["time",  time + 180 ];
			};
		};
	};
	if (_delete) then{
		_deleteList set [count _deleteList,_veh];
	};
} forEach vehicles;

	sleep 10;
};
