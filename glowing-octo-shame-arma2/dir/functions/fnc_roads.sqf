private ["_dist_max","_road_start","_branches","_fnc",
	"_size","_branch","_max_dist"];
_road_start = _this select 0;
_dist_max = _this select 1;


//if(count _roads <= 1)then{_roads = (_road nearRoads 20)-[_road]};
_branches = [];

_fnc={
	private ["_previous","_dist","_road","_branch","_rages","_roads"];
	_road = _this select 0;
	_dist = _this select 1;
	_previous = _this select 2 select 0;
	_rages = _this select 2 select 1;
	_branch = _this select 3;
	_roads = (((roadsConnectedTo _road) - _previous) - _rages);

	if(count _roads > 1)then{
		_rages set [count _rages, _road];
	};

	{
		if(_dist>_dist_max or count _roads == 0)then{
			_branches set [count _branches, _branch];
		}else{
			// [_x, _dist+1, [_road], _branch+[[_x, _dist+1]]] call _fnc;
			[_x, _dist+1, [[_road], _rages], _branch+[_x]] call _fnc;
		};
	} forEach _roads;
};

[_road_start, 0, [[],[]], []] call _fnc;

{
	_branch = _x;

	_max_dist = -1;

	_size = 0;

	for "_i" from 0 to ((count _branch) - 1) do {

		if(_branch select _i distance (_branch select 0) > _max_dist)then{
			_max_dist = (_branch select _i distance (_branch select 0));
			_size = _i+1;
		};

	};

	_branch resize _size;

} forEach _branches;

//_new_branches;
_branches;
