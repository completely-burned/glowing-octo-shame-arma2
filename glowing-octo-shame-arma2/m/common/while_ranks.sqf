#define 0 "PRIVATE"
#define 1 "CORPORAL"
#define 2 "SERGEANT"
#define 3 "LIEUTENANT"
#define 4 "CAPTAIN"
#define 5 "MAJOR"
#define 6 "COLONEL"

private "_r";

while{true}do{
	{
		_r = _x getVariable "rankid";
		if (!isNil "_r") then {
			if (rank _x != _r) then {
				_x setRank _r;
			};
		};
	} forEach allUnits;
};
