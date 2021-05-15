private "_r";

while{true}do{
	{
		_r = _x getVariable "rank";
		if (!isNil "_r") then {
			if (rank _x != _r) then {
				_x setRank _r;
			};
		};
	} forEach allUnits;
	sleep 5;
};
