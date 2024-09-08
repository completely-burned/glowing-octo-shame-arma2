/*
	Скрипт обновляет различные значения транспорту, например уровень топлива.
	TODO: много лишнего кода
*/

private ["_countMHQ","_count_transportammo","_count_transportrepair","_count_transportfuel","_timeNew","_timerDelete","_shop",
	"_delete","_time","_veh","_type"];

if (missionNamespace getVariable "gosa_shop" == 1) then {
	_shop = true;
}else{
	_shop = false;
};

_timerDelete = 60 * 2.5;

while{true}do{
_countMHQ = 0;
_count_transportammo = 0; _count_transportrepair = 0; _count_transportfuel = 0;
{
	_delete = false;
	_veh=_x;
	_type = typeOf _veh;

	_time = (_veh getVariable "gosa_timeDeleteVehicle");
	if ( isNil "_time" ) then {
		_time = ( time + _timerDelete );
		_veh setVariable ["gosa_timeDeleteVehicle", _time];
		diag_log format ["Log: [vehicles_other] %1 setTime %2", _veh, _time];
	};

	if(alive _veh)then{

		if (_shop) then {
			private["_side"];
			_side = getNumber(LIB_cfgVeh >> _type >> "side") call gosa_fnc_getSide;
			if (_side in gosa_friendlyside) then{
				if(getNumber(configFile >> "CfgVehicles" >> _type >> "attendant")> 0) then{
					if (_delete) then{
						_count_transportammo = _count_transportammo + 1;
						if (_count_transportammo <= 3) then {
							_delete = false;
							_timeNew = _time max (time + _timerDelete);
						};
					};
				};
				if(getNumber(configFile >> "CfgVehicles" >> _type >> "transportammo")> 0) then{
					_veh setAmmoCargo 1;
					if (_delete) then{
						_count_transportammo = _count_transportammo + 1;
						if (_count_transportammo <= 3) then {
							_delete = false;
							_timeNew = _time max (time + _timerDelete);
						};
					};
				};
				if(getNumber(configFile >> "CfgVehicles" >> _type >> "transportrepair")> 0) then{
					_veh setRepairCargo 1;
					if (_delete) then{
						_count_transportrepair = _count_transportrepair + 1;
						if (_count_transportrepair <= 3) then {
							_delete = false;
							_timeNew = _time max (time + _timerDelete);
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
							_timeNew = _time max (time + _timerDelete);
						};
					};
				};
				if (_delete) then{
					if ([[_veh], listMHQ] call gosa_fnc_CheckIsKindOfArray) then {
						_countMHQ = _countMHQ + 1;
						if (_countMHQ <= 3) then {
							_delete = false;
							_timeNew = _time max (time + _timerDelete);
						};
					};
				};
			};
		};

		if (_veh call gosa_fnc_isCrewAlive) then{
			if(isEngineOn _veh && speed _veh == 0 && alive driver _veh)then{
				_veh engineOn false;
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
} forEach vehicles;

	sleep 10;
};
