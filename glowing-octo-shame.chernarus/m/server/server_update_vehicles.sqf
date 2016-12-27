while{true}do{
private ["_countMHQ","_deleteList","_count_transportammo","_count_transportrepair","_count_transportfuel"];
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
		// if ([[_veh], listMHQ] call m_fnc_CheckIsKindOfArray) then {
			// Private["_coin"];
			// _coin = (_veh getvariable "m_COIN_ID");
			// if (isNil "_coin") then {
				// _veh setvariable ["m_COIN_ID",true]; 
				// _veh spawn m_fnc_mobileHQ_init;
			// };
		// };
		
		if(getNumber(configFile >> "CfgVehicles" >> _type >> "transportammo")> 0) then{
			_veh setAmmoCargo 1;
			if (_delete) then{
				_count_transportammo = _count_transportammo + 1;
				if (_count_transportammo <= 50) then {
					_delete = false;
				};
			};
		};
		if(getNumber(configFile >> "CfgVehicles" >> _type >> "transportrepair")> 0) then{
			_veh setRepairCargo 1;
			if (_delete) then{
				_count_transportrepair = _count_transportrepair + 1;
				if (_count_transportrepair <= 50) then {
					_delete = false;
				};
			};
		};
		if(getNumber(configFile >> "CfgVehicles" >> _type >> "transportfuel")> 0) then{
			_veh setFuelCargo 1;
			_veh setFuel 1;
			if (_delete) then{
				_count_transportfuel = _count_transportfuel + 1;
				if (_count_transportfuel <= 50) then {
					_delete = false;
				};
			};
		};
	
		if (({!isNull _x} count crew _veh)>0) then{
			if(isEngineOn _veh && speed _veh == 0 && alive driver _veh)then{
				_veh engineOn false;
			};
			_delete = false;
			if ( _time < ( time + 180 ) )then {
				_time = time + 180;
				_veh setVariable ["time", _time];
			};
		};
		
		if (_delete) then{
			if ([[_veh], listMHQ] call m_fnc_CheckIsKindOfArray) then {
				_countMHQ = _countMHQ + 1;
				if (_countMHQ <= 50) then {
					_delete = false;
				};
			};
		};

		_veh call m_fnc_SalvageTruck;
		
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
	sleep 0.01;
} forEach vehicles;
		
_deleteList call fnc_cleanup;
	sleep 1;
};
