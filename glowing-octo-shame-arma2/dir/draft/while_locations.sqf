/*
Обновление локаций.

TODO:	Смена локации, очки.
*/

/*
gosa_locationsMap = [
	[logic_location], [[[logic_depot,side,pos,"marker"], [[logic_camp,side,pos,"marker"],[logic_camp,side,pos,"marker"]], [locationNull,side,pos,"task"]]]
];
*/

gosa_location_depot_size = 10;

diag_log format ["Log: [while_locations] locationsMap %1", gosa_locationsMap];
group_logic = createGroup sideLogic;
gosa_getLocations = {
	private ["_location","_position","_town","_a","_depotPosition","_depotDirection",
	"_flatAreas","_depot","_marker","_range","_camps","_destination","_conflictingCamps",
	"_camp","_marker1"
	];
	_a = [[],[],[]];

	//-- town
	_location = _this;
	_position = locationPosition _location;
	_position resize 2;
	_town = group_logic CreateUnit ["LocationLogicCity",_position,[],0,"CAN_COLLIDE"];
	// location. Для town объект логики в другом массиве записывается.
	_a set [2,[_location,civilian,_position,nil]];
	diag_log format ["Log: [while_locations] _town = %1", _a select 2];

	//-- depot
	_depotPosition = _position;
	_depotDirection = 0;
	_flatAreas = NearestLocations[_position,["FlatAreaCity"],350];

	if (Count _flatAreas > 0) then
	{
		_depotPosition = LocationPosition (_flatAreas Select 0);
		_depotDirection = Direction (_flatAreas Select 0);
	};

	_depot = group_logic CreateUnit ["LocationLogicDepot",_depotPosition,[],0,"CAN_COLLIDE"];
	_depot SetDir _depotDirection;

	_marker = str [_depot,_depotPosition];
	_a set [0,
		[_depot,civilian,_depotPosition,createMarker [_marker, _depotPosition]]];
	_marker setMarkerType "Dot";

	diag_log format ["Log: [while_locations] _depot = %1", _a select 0];
	// TODO: _composition

	//diag_log Format ["Log: [while_locations] town Created %1 at _depotPosition %2",_town, _depotPosition];

	// TODO: _range
	_range = 350;

	//-- camps
	_camps = [];
	{
		//_destination = _x Select 0;
		_destination = LocationPosition _x;

		//if (_destination Distance _position < _range) then {
			_conflictingCamps = _destination NearEntities["LocationLogicCamp",20];

			if (Count _conflictingCamps < 1) then {
				_camp = group_logic CreateUnit ["LocationLogicCamp",_destination,[],0,"CAN_COLLIDE"];
				//_camp SetDir (_x Select 1);
				_camp SetDir Direction _x;
				// TODO: _composition
			}else{
				_camp = _conflictingCamps Select 0;
			};

			_marker = str [_camp,_destination];
			_camps set [count _camps,
				[_camp,civilian,_destination,createMarker [_marker, _destination]]
			];
			_marker setMarkerType "Dot";
		//};
		// TODO: _campAreas
	//} ForEach _campAreas;
	} ForEach NearestLocations[_position,["StrongpointArea"],_range];

	diag_log format ["Log: [while_locations] _camps = %1", _camps];
	_a set [1,_camps];

	diag_log format ["Log: [while_locations] _a = %1", _a];
	[[_location],[_a]];
};
gosa_locationsMap = _this call gosa_getLocations;
//if (true) exitWith {};

private ["_depot_size","_side","_fnc_sideColor","_fnc_tik","_tmp","_time",
	"_delay","_l_logic","_l_depot","_l_camps","_l_camp"];

_fnc_tik = {
	diag_log format ["Log: [while_locations] _fnc_tik = %1", _this];
	private ["_east","_west","_resistance","_objects","_pos"];
	_pos = (_this select 0);
	if (typename _pos == typename []) then {
		_pos = _pos select 2;
		_pos resize 2;
	};
	// TODO: Улучшить режим захвата.
	_objects = (_pos nearEntities [["AllVehicles"], (_this select 1)]);
	_east = East CountSide _objects;
	_west = West CountSide _objects;
	_resistance = Resistance CountSide _objects;
	if (_east > 0 && _west < 1 && _resistance < 1) exitWith	{
		diag_log format ["Log: [while_locations] _fnc_tik East", nil];
		East;
	};
	if (_west > 0 && _east < 1 && _resistance < 1) exitWith {
		diag_log format ["Log: [while_locations] _fnc_tik West", nil];
		West;
	};
	if (_resistance > 0 && _east < 1 && _west < 1) exitWith {
		diag_log format ["Log: [while_locations] _fnc_tik Resistance", nil];
		Resistance;
	};
	sideUnknown;
};


_fnc_sideColor = {
	diag_log format ["Log: [while_locations] _fnc_sideColor _this = %1", _this];
	switch (_this) do {
		/*case east: {"ColorEAST"};
		case west: {"ColorWEST"};
		case resistance: {"ColorGUER"};
		default {"ColorUNKNOWN"};*/
		case east: {"ColorRed"};
		case west: {"ColorBlue"};
		case resistance: {"ColorGreen"};
		// ColorWhite ColorYellow
		default {};
	};
};

_depot_size = gosa_location_depot_size;
diag_log format ["Log: [while_locations] _depot_size = %1", _depot_size];
waitUntil {!isNil "gosa_locationsMap"};

_time = time;

//-- Обновление локаций.
while {true} do {
	// TODO: Optimize I/O
	sleep 5;
	_delay = (time - _time);
	_time = time;

	_tmp = gosa_locationsMap;
	for "_i" from 0 to count (_tmp select 0) -1 do {
		_l_logic = (_tmp select 0) select _i;
		diag_log format ["Log: [while_locations] _l_logic = %1", _l_logic];
		if !(isNull _l_logic) then {

			_l_depot = _tmp select 1 select _i select 0;
			diag_log format ["Log: [while_locations] _l_depot = %1", _l_depot];
			_side = ([_l_depot, _depot_size] call _fnc_tik);
			if !(isNil "_side") then {
				if (_side != (_l_depot select 1)) then {
					diag_log format ["Log: [while_locations] _side = %1", _side];
					_l_depot set [1,_side];
					_l_depot select 3 setMarkerColor (_side call _fnc_sideColor);
				};
			};

			_l_camps = _tmp select 1 select _i select 1;
			for "_i0" from 0 to count (_l_camps) -1 do {
				_l_camp = _l_camps select _i0;
				diag_log format ["Log: [while_locations] _l_camp = %1", _l_camp];
				_side = ([_l_camp, _depot_size] call _fnc_tik);
				if !(isNil "_side") then {
					if (_side != (_l_camp select 1)) then {
						diag_log format ["Log: [while_locations] _side = %1", _side];
						_l_camp set [1,_side];
						_l_camp select 3 setMarkerColor (_side call _fnc_sideColor);
					};
				};

			};
		} else {
			// TODO: Чистка локации.
			//_tmp set [_i, -1];
		};

	};

};
//gosa_locationsMap = _tmp-[-1];
