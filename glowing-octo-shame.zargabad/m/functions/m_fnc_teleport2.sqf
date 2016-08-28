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

vehicle player setPos (([_pos] call Common_GetSafePosition) findEmptyPosition [0,100]);
vehicle player setVectorUp [0,0,1];
// vehicle player setPos (_pos findEmptyPosition [0,100]);
private ["_inList"];
_inList = [];
{
	if !((isPlayer _x) or (_x in _inList))then{
		_inList set [count _inList,_x];
		vehicle _x setPos (([_pos] call Common_GetSafePosition) findEmptyPosition [0,100]);
		vehicle _x setVectorUp [0,0,1];

		// vehicle _x setPos (_pos findEmptyPosition [0,100]);
	};
}forEach units group player;
