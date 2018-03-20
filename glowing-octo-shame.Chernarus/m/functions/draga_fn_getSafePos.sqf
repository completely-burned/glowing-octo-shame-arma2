Private["_currentPosition","_position","_radius","_safeRadius"];
ScopeName "PlaceSafe";

_position = _this Select 0;
if (TypeName _position != "ARRAY") then {_position = Position _position};

_radius = 25;
if (Count _this > 1) then {_radius = _this Select 1};

_safeRadius = 12;
if (Count _this > 2) then {_safeRadius = _this Select 2};

private ["_Water"];
_Water=false;
if (Count _this > 3) then {_Water = _this select 3};

private ["_dir","_dist2","_testPos","_posX","_posY","_attempts"];
_posX = _position select 0;
_posY = _position select 1;
_attempts = 0;
while{true}do{
	_dir = random 360;
	_dist2 = random _radius;
	_testPos = [_posX + _dist2*sin _dir, _posY + _dist2*cos _dir];
	if ((!SurfaceIsWater _testPos && !_Water) or (SurfaceIsWater _testPos && _Water)) then
	{
		if (_testPos Distance NearestObject[_testPos,"All"] >= _safeRadius) then
		{
			_currentPosition = _testPos;
			BreakTo "PlaceSafe";
		};
	};
	if (_attempts > 2000) then {
		_currentPosition = _position;
		BreakTo "PlaceSafe";
	};
	_attempts = _attempts + 1;
};
_currentPosition
