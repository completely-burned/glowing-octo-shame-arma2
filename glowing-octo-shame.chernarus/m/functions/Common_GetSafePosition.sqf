scriptName format ["%1Scripts\Common\Functions\Common_GetSafePosition.sqf",BIS_WFdPath];
//Last modified 1/31/9
/*
Description: Attempt to get a safe area for object placement. If no location is found then position is returned.
_position - Centerpoint to begin check.
_radius - Distance from centerpoint that is allowable for getting a safe position.
_safeRadius - Min safe radius required (usually radius of object to be placed).
Example (get safe position within 30m of player for an object with an 8m radius):
[GetPos player,30,8] Call GetSafePosition
*/

Private["_currentPosition","_position","_radius","_safeRadius"];
ScopeName "PlaceSafe";

_position = _this Select 0;
if (TypeName _position != "ARRAY") then {_position = Position _position};

_radius = 25;
if (Count _this > 1) then {_radius = _this Select 1};

_safeRadius = 12;
if (Count _this > 2) then {_safeRadius = _this Select 2};

_currentPosition = _position;

for [{_direction = 0},{_direction < 360},{_direction = _direction + 36}] do
{
	if (!SurfaceIsWater _currentPosition) then
	{
		if (_currentPosition Distance NearestObject[_currentPosition,"All"] >= _safeRadius) then
		{
			_position = _currentPosition;
			BreakTo "PlaceSafe";
		};
	};

	_currentPosition = [(_position Select 0)+((sin _direction)*_radius),(_position Select 1)+((cos _direction)*_radius),0];
	_direction = _direction + 36;
};

_position

//1/31/8 MM - Created file.
