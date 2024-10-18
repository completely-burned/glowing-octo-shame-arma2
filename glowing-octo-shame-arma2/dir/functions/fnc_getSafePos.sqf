
diag_log format ["Log: [fnc_getSafePos] %1", _this];

private ["_return_pos","_position","_safeRadius","_radiusMax","_dir",
	"_type","_num","_arr","_obj","_maxGradient","_Water","_gradientRadius",
	"_waterMode","_shoreMode","_objectProximity","_attempt_radius_up",
	"_timeOut",
	"_dist2","_testPos","_posX","_posY","_attempt_radius","_radius"];

ScopeName "PlaceSafe";


_position = _this Select 0;

_radiusMax = 0;
if (Count _this > 1) then {_radiusMax = _this Select 1};

_safeRadius = 12;
if (Count _this > 2) then {_safeRadius = _this Select 2};

_Water=false;
if (Count _this > 3) then {_Water = _this select 3};
if (Count _this > 4) then {
	_timeOut = _this select 4;
	_timeOut = _timeOut + time;
};


if (TypeName _position != "ARRAY") then {
	_position = Position _position;
};


/*
if (Count _this > 4) then {
	_obj = _this select 4;
};

if !(isNil "_obj") then {
		_arr = boundingBox _obj;
		diag_log format ["Log: [fnc_getSafePos] %1, boundingBox %2", _obj, _arr];
		_num = (_arr select 1 select 0) max (_arr select 1 select 1) max (_arr select 1 select 2);
		_safeRadius = _safeRadius max _num;
};
*/

// TODO: Завершить
_maxGradient = -1;
_gradientRadius = _safeRadius;
_waterMode = -1;
_shoreMode = false;
_objectProximity = _safeRadius;
//.

_attempt_radius_up = 1000;
_attempt_radius = 0;
_radius = 20;

while {isNil "_return_pos"} do
{
		_posX = _position select 0;
		_posY = _position select 1;

	_dir = random 360;
	_dist2 = random _radius;

	//-- Проверка позиции.
	[_posX + _dist2*sin _dir, _posY + _dist2*cos _dir, 0] call
	{
		diag_log format ["Log: [fnc_getSafePos] Check, _testPos %1, _a %2, _radius %3", _this, _attempt_radius, _radius];

		if ( (SurfaceIsWater _this && !_Water)
			or (!SurfaceIsWater _this && _Water)
		)
		exitWith {};

		if (count nearestObjects
			[_this, ["Static","LandVehicle","Air","Man"], _safeRadius]
			// Не должно быть конфликтов с объектами.
			> 0
		)
		exitWith {};

		// position is roughly suitable
		if (count (_this isFlatEmpty 
			[_safeRadius, -1, _maxGradient, _gradientRadius, _waterMode, _shoreMode])
			// Пусто если нет позиции.
			< 1
		) 
		exitWith {};
		
		#ifdef __ARMA3__
			// away from other objects
			if (_objectProximity > 0
				&& (count nearestTerrainObjects 
					[_this, [], _objectProximity, false, true]
					// Не должно быть конфликтов с объектами.
					> 0
				)
			)
			exitWith {};
			
			// not inside something
			if (count lineIntersectsSurfaces 
					[AGLtoASL _this, AGLtoASL _this vectorAdd [0, 0, 50], objNull, objNull, false, 1, "GEOM", "NONE"]
					// Не должно быть конфликтов с объектами.
					> 0
			) 
			exitWith {};
		#endif

		diag_log format ["Log: [fnc_getSafePos] _r %1", _this];
		_return_pos = _this;
		BreakTo "PlaceSafe";
	};

	if !(isNil "_timeOut") then {
		if (_timeOut < time) then {
			_return_pos = [];
			BreakTo "PlaceSafe";
		};
	};


	//-- Увеличение радиуса поиска.
	if (_attempt_radius > _attempt_radius_up) then {
		_radius = _radius + 10;
		/*
		if (_radiusMax > 0) then {
			if (_radiusMax < _radius + 5) then {
				BreakTo "PlaceSafe";
			};
		};
		*/
		_attempt_radius = 0;
	};
	_attempt_radius = _attempt_radius + 1;
};

_return_pos;
