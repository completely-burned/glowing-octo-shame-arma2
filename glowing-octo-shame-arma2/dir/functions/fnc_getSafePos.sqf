private ["_currentPosition","_position","_safeRadius","_radiusMax","_dir",
	"_dist2","_testPos","_posX","_posY","_attempts","_radius","_Water"];

ScopeName "PlaceSafe";


_position = _this Select 0;

_radiusMax = 0;
if (Count _this > 1) then {_radiusMax = _this Select 1};

_safeRadius = 12;
if (Count _this > 2) then {_safeRadius = _this Select 2};

_Water=false;
if (Count _this > 3) then {_Water = _this select 3};


if (TypeName _position != "ARRAY") then {
	_position = Position _position;
};


_attempts = 0;
_radius = 0;

while{isNil {_currentPosition}}do{
		_posX = _position select 0;
		_posY = _position select 1;

	_dir = random 360;
	_dist2 = random _radius;

	_testPos = [_posX + _dist2*sin _dir, _posY + _dist2*cos _dir];

	if ((!SurfaceIsWater _testPos && !_Water) or (SurfaceIsWater _testPos && _Water)) then
	{
		if (count nearestObjects [_testPos, ["Static","LandVehicle","Air","Man"], _safeRadius] == 0) then
		{
			_currentPosition = _testPos;
			BreakTo "PlaceSafe";
		};
	};
	if (_attempts > 10000) then {
		_radius = _radius + 10;
		/*
		if (_radiusMax > 0) then {
			if (_radiusMax < _radius + 5) then {
				BreakTo "PlaceSafe";
			};
		};
		*/
		_attempts = 0;
	};
	_attempts = _attempts + 1;
	// sleep 0.005; // TODO: Suspending not allowed in this context
};

_currentPosition;
