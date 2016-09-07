private ["_pos"];

switch (typeName _this) do {
	case ("OBJECT"):
	{
		_pos = getPos _this;
	};
	case ("LOCATION"):
	{
		_pos = getPos _this;
	};
	case ("STRING"):
	{
		_pos = getMarkerPos _this;
	};
	default {
		_pos = getPos _this;
	};
};

private ["_nearestLocations"];
_nearestLocations = nearestLocations [_pos, ["FlatArea","FlatAreaCity","FlatAreaCitySmall"], 250];
if (count _nearestLocations > 0) then {
	_pos = locationPosition (_nearestLocations select 0);
};

_pos resize 2;

vehicle player setVelocity [0, 0, 0];
vehicle player setPos (([_pos] call Common_GetSafePosition) findEmptyPosition [0,100]);
vehicle player setVectorUp [0,0,1];
private ["_inList"];
_inList = [];
{
	if !(isPlayer _x)then{
		private ["_veh"];
		_veh = vehicle _x;
		if !(_veh in _inList)then{
			_inList set [count _inList,_veh];
			_veh setPos (([_pos] call Common_GetSafePosition) findEmptyPosition [0,100]);
			_veh setVectorUp [0,0,1];
		};
	};
}forEach units group player;
