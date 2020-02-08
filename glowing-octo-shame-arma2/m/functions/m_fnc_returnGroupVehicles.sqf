private["_Vehicles"];
_Vehicles=[];
{
	if(alive _x)then{
		private["_veh"];
		// _veh = assignedVehicle _x;
		_veh = Vehicle _x;
		if(alive _veh)then{
			if!(_veh in _Vehicles)then{
				_Vehicles = _Vehicles + [_veh];
			};
		};
	};
}foreach (units _this);
_Vehicles;
