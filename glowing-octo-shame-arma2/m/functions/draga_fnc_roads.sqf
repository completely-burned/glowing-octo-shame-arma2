private ["_dist_max","_road_start"];
_road_start = _this select 0;
_dist_max = _this select 1;


//if(count _roads <= 1)then{_roads = (_road nearRoads 20)-[_road]};
private ["_branches"];
_branches = [];

private ["_fnc"];
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

/*
private ["_new_branches","_new_branch","_branch","_skip"];
_new_branches = [];

{
	_branch = _x;

	_new_branch = [];


	ScopeName "Scope1";
	for "_i" from 0 to ((count _branch) - 1) do {


		_skip = false;
		ScopeName "Scope2";
		{


			{
				if(_branch select _i select 1 != _x select 1)then{
					if(_branch select _i select 1 > _x select 1)then{
						if(_branch select _i select 0 == _x select 0)then{
							_skip = true;
							breakTo "Scope2";
						};
					};
				};


			} forEach _x;


		} forEach _branches;

		if(!_skip)then{
			_new_branch set [count _new_branch, _branch select _i select 0];
		}else{
			breakTo "Scope1";
		};
	};

	if(count _new_branch > 0)then{
		_new_branches set [count _new_branches, _new_branch];
	};

} forEach _branches;
*/

private ["_size","_branch","_max_dist"];
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
