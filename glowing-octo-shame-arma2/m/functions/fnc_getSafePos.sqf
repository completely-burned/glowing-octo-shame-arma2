Private["_currentPosition","_position","_safeRadius","_radiusMax"];
ScopeName "PlaceSafe";

_position = _this Select 0;

_radiusMax = 25;
if (Count _this > 1) then {_radiusMax = _this Select 1};

_safeRadius = 12;
if (Count _this > 2) then {_safeRadius = _this Select 2};

private ["_Water"];
_Water=false;
if (Count _this > 3) then {_Water = _this select 3};

private ["_dir","_dist2","_testPos","_posX","_posY","_attempts"];
_attempts = 0;
private ["_radius"];
_radius = 0;

while{isNil {_currentPosition}}do{
	if (TypeName _position != "ARRAY") then {
		private["_pos"];
		if (_position call gosa_fnc_isPlayer) then {
			_pos = Position vehicle player;
		}else{
			_pos = Position _position;
		};
		_posX = (_pos select 0);
		_posY = (_pos select 1);
	}else{
		_posX = _position select 0;
		_posY = _position select 1;
	};

	_dir = random 360;
	_dist2 = _radius + random 10;
	_testPos = [_posX + _dist2*sin _dir, _posY + _dist2*cos _dir];
	if ((!SurfaceIsWater _testPos && !_Water) or (SurfaceIsWater _testPos && _Water)) then
	{
		if (count nearestObjects [_testPos, ["Static","LandVehicle","Air"], _safeRadius] == 0) then
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
	sleep 0.005;
};

_currentPosition;
