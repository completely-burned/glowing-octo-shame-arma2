private["_units"];
while{true}do{
	_units = [];
	{
		private["_p"];
		_p = _x;
		{
			if!(_x in _units)then{
				_units set [count _units, _x];
			};
		}forEach units _p;
	}forEach playableUnits;
	{
		_x call draga_fnc_vehInit2;
	}forEach _units+vehicles;
	sleep 0.05;
};
