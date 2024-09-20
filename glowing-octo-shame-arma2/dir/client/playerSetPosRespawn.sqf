waitUntil {alive player};
private ["_pos"];
switch (gosa_playerSide) do {
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
		_pos = getMarkerPos format["respawn_%1", gosa_playerSide];
	};
};
if(count _pos > 0)then{
	player setPos _pos;
};
