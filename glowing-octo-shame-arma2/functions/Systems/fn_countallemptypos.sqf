private["_c"];
_c = 0;
{
	_c = _this emptyPositions _x + _c;
} forEach ["Commander", "Driver", "Gunner", "Cargo"];
_c;
