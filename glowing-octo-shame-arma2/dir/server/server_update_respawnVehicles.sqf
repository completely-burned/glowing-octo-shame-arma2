waitUntil{!isNil "gosa_fnc_init"};
waitUntil {!isNil "BIS_fnc_init"};

respawnVehicleList=[];
{
	private ["_respawnVehicle"];
	_respawnVehicle = (_x getVariable "respawnVehicle");
	if (!isNil "_respawnVehicle") then {
		private ["_type"];
		_type = _x getVariable "respawnType";
		if(isNil "_type")then{
			_type = typeOf _x;
		};
		respawnVehicleList = respawnVehicleList + [[_x, [getPos _x, getDir _x], _type]];
		_x setVehicleLock "UNLOCKED";
	};
}forEach vehicles;

while{true}do{
for "_i" from 0 to (count respawnVehicleList - 1) do {
	private["_veh","_pos","_dir","_type","_veh1"];
	_veh = respawnVehicleList select _i;
	_pos = _veh select 1;
	_dir = _pos select 1;
	_pos = _pos select 0;
	_type = _veh select 2;
	_veh = _veh select 0;
	if((_veh distance _pos) > sizeOf _type)then{
		_veh setVariable ["time", time];
		_veh1 = createVehicle [_type, [(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)), (gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2))], [], 0, "CAN_COLLIDE"];
		_veh1 setDir _dir;
		_veh1 setPos _pos;
		_veh1 setVectorUp [0,0,1];
		[respawnVehicleList, [_i, 0], _veh1] call BIS_fnc_setNestedElement;
	}else{
		if((!alive _veh) or (!canMove _veh))then{
			_veh setVariable ["time", time];
			if(({alive _x} count crew _veh) == 0)then{
				deleteVehicle _veh;
				// {
					// if(!alive _x)then{deleteVehicle _x};
				// }forEach (_pos nearObjects ["AllVehicles",sizeOf _type]);
				_veh1 = createVehicle [_type, [(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)), (gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2))], [], 0, "CAN_COLLIDE"];
				_veh1 setDir _dir;
				_veh1 setPos _pos;
				_veh1 setVectorUp [0,0,1];
				[respawnVehicleList, [_i, 0], _veh1] call BIS_fnc_setNestedElement;
			};
		}else{
				if(_veh isKindOf "StaticWeapon")then{
					_veh setVehicleAmmo 1;
				};
		};
	};
	sleep 0.01
};

	sleep 1;
};
