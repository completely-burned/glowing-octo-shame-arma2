private ["_side_str","_markerColor"];
switch (playerSide) do {
	case (resistance):
	{
		_side_str = "guerrila";
		_markerColor = "ColorGreen";
	};
	case (civilian):
	{
		_side_str = "civilian";
		_markerColor = "ColorYellow";
	};
	case (west):
	{
		_side_str = "west";
		_markerColor = "ColorBlue";
	};
	case (east):
	{
		_side_str = "east";
		_markerColor = "ColorRed";
	};
	default {
		_side_str = str playerSide;
		_markerColor = "Default";
	};
};

private ["_respawnMarkers"];
_respawnMarkers = [];
{
	private ["_objects"];
	_objects = allMissionObjects _x;
	for "_i" from 0 to (count _objects - 1) do {
		private ["_obj","_marker"];
		_obj = _objects select _i;
		if(_i == 0)then{
			_marker = createMarkerLocal [format["respawn_%1",_side_str], getPos _obj];
		}else{
			_marker = createMarkerLocal [format["respawn_%1_%2",_side_str,_i], getPos _obj];
		};
		_marker setMarkerTypeLocal "Depot";
		_marker setMarkerColorLocal _markerColor;
		_respawnMarkers set [count _respawnMarkers, _marker];
	};
} forEach HQ;

draga_respawnMarkers = _respawnMarkers;
