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

private ["_objects"];
_objects = [];
{
	_objects = _objects + allMissionObjects _x;
} forEach HQ;

private ["_respawnMarkers"];
_respawnMarkers = [];

for "_i" from 0 to (count _objects - 1) do {
	private ["_obj","_marker","_pos"];
	_obj = _objects select _i;
	_pos = getPos _obj;
	if(_obj isKindOf "Warfare_HQ_base_unfolded")then{
		private ["_dir","_dist2"];
		_dir = getDir _obj;
		_dist2 = 6.5;
		_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
	};
	if(_obj isKindOf "WarfareBDepot")then{
		private ["_dir","_dist2"];
		_dir = getDir _obj;
		_dist2 = 3;
		_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
	};
	if(_i == 0)then{
		_marker = createMarkerLocal [format["respawn_%1",_side_str], _pos];
	}else{
		_marker = createMarkerLocal [format["respawn_%1_%2",_side_str,_i], _pos];
	};
	_marker setMarkerTypeLocal "Depot";
	_marker setMarkerColorLocal _markerColor;
	_respawnMarkers set [count _respawnMarkers, _marker];
};

draga_respawnMarkers = _respawnMarkers;
