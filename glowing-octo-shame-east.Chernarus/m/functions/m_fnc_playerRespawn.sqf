waitUntil {!isNil "draga_respawnMarkers"};

private ["_pos","_units"];
switch (playerSide) do {
	case (resistance):
	{
		_pos = getMarkerPos "respawn_guerrila";
	};
	case (west):
	{
		_pos = getMarkerPos "respawn_west";
	};
	case (east):
	{
		_pos = getMarkerPos "respawn_east";
	};
	case (civilian):
	{
		_pos = getMarkerPos "respawn_civilian";
	};
	default {
	};
};
while {true} do {
	_units = units player;
	if (({lifestate _x == "ALIVE"} count _units) == 0) then {
		{
			_x setDamage 0;
			_x setvariable ["BIS_lifeState","ALIVE",true];
			_x setPos _pos;
		}forEach _units;
	};
	sleep 0.5
};
