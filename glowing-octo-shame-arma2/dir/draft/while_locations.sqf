/*
Обновление локаций.

TODO:	Смена локации, очки.
*/

/*
gosa_locationsMap = [
	[logic_location],
	[[[logic_depot,side,pos,"marker",_score],
		[[logic_camp,side,pos,"marker",_score],[logic_camp,side,pos,"marker",_score]],
		[locationNull,side,pos,"_l_marker_pve", _score_pve, "task"]]]
];
*/

gosa_location_depot_size = 50;
gosa_location_score_max_depot = 150;
gosa_location_score_max_camp = 50;
gosa_location_score_max_pve = 50000;

diag_log format ["Log: [while_locations] locationsMap %1", gosa_locationsMap];
group_logic = createGroup sideLogic;
gosa_fnc_isPlayer = {isPlayer _this};
gosa_getLocations = {
	private ["_location","_position","_town","_a","_depotPosition","_depotDirection",
	"_flatAreas","_depot","_marker","_range","_camps","_destination","_conflictingCamps",
	"_camp","_marker1"
	];
	_a = [[],[],[]];

	//-- town
	_location = _this;
	_position = locationPosition _location;
	// FIXME: Экономия ресурсов?
	_position resize 2;
	_town = group_logic CreateUnit ["LocationLogicCity",_position,[],0,"CAN_COLLIDE"];
	// location. Для town объект логики в другом массиве записывается.
	_marker = str [_location,_position];
	_a set [2, [_location, civilian, _position, createMarker [_marker, _position], [0,0,0,0]]];
	diag_log format ["Log: [while_locations] _town = %1", _a select 2];

	//-- depot
	// Только один depot, как одна акция к 50%.
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
		[_depot,civilian,_depotPosition,createMarker [_marker, _depotPosition],[0,0,0,0]]];
	_marker setMarkerType "Dot";

	diag_log format ["Log: [while_locations] _depot = %1", _a select 0];
	// TODO: _composition

	//diag_log Format ["Log: [while_locations] town Created %1 at _depotPosition %2",_town, _depotPosition];

	// TODO: _range
	_range = 350;

	//-- camps
	// TODO: Объекты логики внутриигрового редактора.
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
				[_camp,civilian,_destination,createMarker [_marker, _destination],[0,0,0,0]]
			];
			_marker setMarkerType "Dot";
		//};
		// TODO: _campAreas
	//} ForEach _campAreas;
	} ForEach NearestLocations[_position,["StrongpointArea"],_range];

	diag_log format ["Log: [while_locations] _camps = %1", _camps];
	_a set [1,_camps];

	diag_log format ["Log: [while_locations] _a = %1", _a];
	[[_town],[_a]];
};
gosa_locationsMap = _this call gosa_getLocations;
diag_log format ["Log: [while_locations] locationsMap %1", gosa_locationsMap];
//if (true) exitWith {};

private ["_depot_size","_side","_fnc_sideColor","_fnc_tik","_tmp","_time",
	"_marker","_l_size","_l_size_old","_l_sizeMultipler","_l_other",
	"_delay","_l_logic","_l_depot","_l_camps","_l_camp"];

_l_sizeMultipler = missionNamespace getVariable "gosa_locationSizeMultipler";

_fnc_tik = {
	/*
	Обновление score.
	Возвращает сторону, если значительный перевес.
	*/
	diag_log format ["Log: [while_locations] _fnc_tik = %1", _this];
	private ["_east","_west","_resistance","_objects","_pos",
		"_east_score","_west_score","_resistance_score","_score_max",
		"_eastEnemies","_westEnemies","_resistanceEnemies","_obj","_score",
		"_eastPlayers","_westPlayers","_resistancePlayers"
		];
	_pos = (_this select 0 select 2);
	_pos resize 2;

	_score = _this select 0 select 4;

	_score_max = _this select 2;

	_objects = (_pos nearEntities [["AllVehicles"], (_this select 1)]);
	_east = East CountSide _objects;
	_west = West CountSide _objects;
	_resistance = Resistance CountSide _objects;
	_east_score = _east;
	_west_score = _west;
	_resistance_score = _resistance;
	_eastEnemies = 0;
	_westEnemies = 0;
	_resistanceEnemies = 0;
	diag_log format ["Log: [while_locations] _fnc_tik o %1", [_east,_west,_resistance, _objects]];

	_westPlayers = 0;
	_eastPlayers = 0;
	_resistancePlayers = 0;
	for "_i" from 0 to (count _objects -1) do {
		_obj = effectiveCommander (_objects select _i);
		if(_obj call gosa_fnc_isPlayer)then{
			switch (side _obj) do {
				case (east):
				{
					_eastPlayers = _eastPlayers + 1;
				};
				case (west):
				{
					_westPlayers = _westPlayers + 1;
				};
				case (resistance):
				{
					_resistancePlayers = _resistancePlayers + 1;
				};
				default {};
			};
		};
	};

	if (east getFriend west < 0.6) then {
		_east_score = (_east_score - _west);
		_eastEnemies = _eastEnemies + _west;
	};
	if (east getFriend resistance < 0.6) then {
		_east_score = (_east_score - _resistance);
		_eastEnemies = _eastEnemies + _resistance;
	};
	if (west getFriend east < 0.6) then {
		_west_score = (_west_score - _east);
		_westEnemies = _westEnemies + _east;
	};
	if (west getFriend resistance < 0.6) then {
		_west_score = (_west_score - _resistance);
		_westEnemies = _westEnemies + _resistance;
	};
	if (resistance getFriend west < 0.6) then {
		_resistance_score = (_resistance_score - _west);
		_resistanceEnemies = _resistanceEnemies + _west;
	};
	if (resistance getFriend east < 0.6) then {
		_resistance_score = (_resistance_score - _east);
		_resistanceEnemies = _resistanceEnemies + _east;
	};
	diag_log format ["Log: [while_locations] _fnc_tik s %1", [_east_score,_west_score,_resistance_score]];

	_east_score = ((_score select 0) + (_east_score *  _delay));
	_west_score = ((_score select 1) + (_west_score *  _delay));
	_resistance_score = ((_score select 2) + (_resistance_score *  _delay));

	_east_score = (_east_score max 0 min _score_max);
	_west_score = (_west_score max 0 min _score_max);
	_resistance_score = (_resistance_score max 0 min _score_max);
	diag_log format ["Log: [while_locations] _fnc_tik ss %1", [_east_score,_west_score,_resistance_score]];

	// Запись новых данных.
	_score set [0, _east_score];
	_score set [1, _west_score];
	_score set [2, _resistance_score];

	// Смена стороны.
	if (_east_score >= _score_max &&
		_eastPlayers > 0 &&
		_eastEnemies * 3 < _east) exitWith
	{
		diag_log format ["Log: [while_locations] _fnc_tik East", nil];
		East;
	};
	if (_west_score >= _score_max &&
		_westPlayers > 0 &&
		_westEnemies * 3 < _west) exitWith
	{
		diag_log format ["Log: [while_locations] _fnc_tik West", nil];
		West;
	};
	if (_resistance_score >= _score_max &&
		_resistancePlayers > 0 &&
		_resistanceEnemies * 3 < _resistance) exitWith
	{
		diag_log format ["Log: [while_locations] _fnc_tik Resistance", nil];
		Resistance;
	};
	diag_log format ["Log: [while_locations] _fnc_tik nil", nil];
	nil;
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
	_delay = (time - _time);
	_time = time;

	_tmp = gosa_locationsMap;
	for "_i" from 0 to count (_tmp select 0) -1 do {
		//-- Обновление локации.
		_l_logic = (_tmp select 0) select _i;
		diag_log format ["Log: [while_locations] _l_logic = %1", _l_logic];
		if !(isNull _l_logic) then {

			//-- Обновление depot локации.
			_l_depot = _tmp select 1 select _i select 0;
			diag_log format ["Log: [while_locations] _l_depot = %1", _l_depot];
			_side = ([_l_depot, _depot_size, gosa_location_score_max_depot] call _fnc_tik);
			if !(isNil "_side") then {
				if (_side != (_l_depot select 1)) then {
					diag_log format ["Log: [while_locations] _side = %1", _side];
					_l_depot set [1,_side];
					_l_depot select 3 setMarkerColor (_side call _fnc_sideColor);
				};
			};

			//-- Обновление camps локации.
			_l_camps = _tmp select 1 select _i select 1;
			for "_i0" from 0 to count (_l_camps) -1 do {
				_l_camp = _l_camps select _i0;
				diag_log format ["Log: [while_locations] _l_camp = %1", _l_camp];
				_side = ([_l_camp, _depot_size, gosa_location_score_max_camp] call _fnc_tik);
				if !(isNil "_side") then {
					if (_side != (_l_camp select 1)) then {
						diag_log format ["Log: [while_locations] _side = %1", _side];
						_l_camp set [1,_side];
						_l_camp select 3 setMarkerColor (_side call _fnc_sideColor);
					};
				};

			};

			//-- Обновление других данных локации.
			_l_other = _tmp select 1 select _i select 2;
			diag_log format ["Log: [while_locations] _l_other = %1", _l_other];
				//-- Размер локации PvE.
				_marker = _l_other select 3;
				_l_size_old = (getMarkerSize _marker select 0);
				_l_size = 300;
				/*sqrt(((_l_sizeMultipler/count (_tmp select 0)) *
					({{alive _x && !(_x call gosa_fnc_isPlayer)} count units _x > 0} count allGroups)
					)/pi) max 100;*/
				diag_log format ["Log: [while_locations] _l_size = %1", [_l_size_old,_l_size]];
				if (_l_size != _l_size_old) then {
					_marker setMarkerSize [_l_size,_l_size];
				};

				// Захват PvE.
				_side = ([_l_other, _l_size, gosa_location_score_max_pve] call _fnc_tik);
				if !(isNil "_side") then {
					if (_side != (_l_other select 1)) then {
						diag_log format ["Log: [while_locations] _side = %1", _side];
						_l_other set [1,_side];
						_marker setMarkerColor (_side call _fnc_sideColor);
					};
				};

		} else {
			// TODO: Чистка локации.
			//_tmp set [_i, -1];
		};

	};

	sleep 5;
};
//gosa_locationsMap = _tmp-[-1];
