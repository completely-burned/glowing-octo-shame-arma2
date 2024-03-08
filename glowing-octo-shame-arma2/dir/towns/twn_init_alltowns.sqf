/*
 * Скрипт создает бункеры у городов.
 */

Private["_buildings","_constructFunction","_count","_customCamps","_customOwners","_locationsInitialized",
	"_marker_type_town","_marker_type_depot","_marker_type_camp","_marker_type",//diag_log
	"_marker","_markedPosition","_markedRegions","_path","_rangeSize","_side","_townNodeNames","_total",
	"_campAreas","_cityCenters","_className","_direction","_name","_names","_nodeName","_nodeName1",
	"_cityCenter","_depotDirection","_depotPosition","_depots","_depots","_flatAreas","_objects",
	"_camp","_camps","_conflictingCamps","_destination","_minSize","_range","_size","_speech",
	"_composition","_constructed","_nearestDistance","_newCamps","_previousTown","_towns",
	"_replaceTownName","_typeCity","_typeDepot","_typeCamp","_dyno","_grp_logic","_logic",
	"_constructedList","_depotCompositions","_campCompositions","_typeCityCapital",
	"_town","_depot","_dir","_typeVillage","_types_City_all","_types_City","_types_Depot",
	"_types_CityCapital","_types_Camp","_types_Village","_dyno_allowed",
	"_houselist","_blacklist_types_house","_dist_houselist","_dist_nearRoads",
	"_obj","_type","_bbox","_twn_maxVehicles","_houselist_roads","_pos","_obj_roads",
	"_road","_b","_bboxA","_bboxB","_bboxY","_bboxY","_difmin","_difmax","_dif",
	"_cityCapital","_rangeSizeModifier","_rangeModifier","_conflict_dist","_towns_used",
	"_minSizeMod","_sizeMod","_position","_townName","_townNames","_type","_neighbors"];

#ifdef __ARMA3__
	_marker_type = "hd_dot";//diag_log
	_marker_type_camp = "loc_defend";//diag_log
	_marker_type_depot = "loc_Fortress";//diag_log
	_marker_type_town = "mil_flag";//diag_log
#else
	_marker_type = "Dot";//diag_log
	_marker_type_camp = "Strongpoint";//diag_log
	_marker_type_depot = "Depot";//diag_log
	_marker_type_town = "City";//diag_log
#endif

if (missionNamespace getVariable "gosa_camps" > 0) then {
	_dyno = true;
	_constructFunction = Compile preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf";
	_depotCompositions = gosa_depotCompositions;
	_campCompositions = gosa_campCompositions;
}else{
	_dyno = false;
};
_constructedList = [];

_locationsInitialized = 0;
_towns = [];
_townNodeNames = [];//CityCenter classnames of towns.

_cityCenters = BIS_WF_TownCenters;	//Data from Config entry on towns' center, node name, & neighbors.
_townNames = BIS_WF_TownNames;	//Data from Config entry on towns' actual name (taken from town map label).
_campAreas = BIS_WF_CampAreas;	//Data from Config entry on towns' camps (position and direction).


_blacklist_types_house = silvieManagerBlacklist;
_dist_nearRoads = 40;
_dist_houselist = gosa_dist_houselist-_dist_nearRoads;
_twn_nd = 350;
_conflict_dist = 20;
_towns_used = [];
_var_gc_time_d = "gosa_timeDeleteVehicle";
_grp_logic = group_logic;
_rangeSizeModifier = gosa_rangeSizeModifier;
_rangeModifier = gosa_rangeModifier;

_types_City = gosa_types_location_City;
_types_CityCapital = gosa_types_location_CityCapital;
_types_Village = gosa_types_location_Village;
_types_Depot = gosa_types_location_Depot;
_types_Camp = gosa_types_location_Camp;

_types_City_all = _types_CityCapital + _types_City + _types_Village;


_arr = [];
{
	_arr = _arr + allMissionObjects _x;
} forEach _types_CityCapital + _types_City + _types_Village;
_cityCenters = _arr + _cityCenters;

_arr = [];
{
	_arr = _arr + allMissionObjects _x;
} forEach _types_Camp;
_campAreas = _arr + _campAreas;


for "_count" from 0 to (count _cityCenters -1) do {
	_cityCenter = _cityCenters Select _count;

	if (typeName _cityCenter == typeName []) then {
		_position = _cityCenter Select 0;
		_townName = _cityCenter Select 1;
		_neighbors = _cityCenter Select 2;	//Connected city centers.
		_className = _cityCenter Select 3;	//Name of this town's CityCenter class.

		if (_townName == "" || _townName == _className) then {
			_replaceTownName = true;
		}else{
			_replaceTownName = false;
		};

	}else{
		_position = getPos _cityCenter;
		_townName = str _cityCenter;
		_neighbors = [];
		_className = typeOf _cityCenter;

		_replaceTownName = true;
	};

	_speech = "village";
	_cityCapital = false;
	ScopeName "CreateTown";


	//Find town's actual name.
	_nearestDistance = 1500; //Berezino: (CC dist name_location) > 700

	//match name locations (labels in 2D map) - for speech array + _townName eventually
	{
		_distance = (_x Select 0) Distance _position;
		if (_distance < _nearestDistance) then {
			_nearestDistance = _distance;

			if (_replaceTownName) then {_townName = _x Select 1};
			_speech = _x select 2;

			if (_distance < 150) then {
				if (_x select 3 in ["NameCityCapital"]) then {
					_cityCapital = true;
				};
				BreakTo "CreateTown";
			};
		};
	} ForEach _townNames;

	//If no name was found then set to class name.
	if (_townName == "") then {_townName == _className};


	//Do not use map location if a custom location is already present.
	_objects = _position nearEntities [_types_City_all, _twn_nd];

	//-- Town logic.
	if (count _objects > 0) then {
		_town = _objects select 0;
		if (_town in _towns) then {
			_depots = [_town getVariable "depot"];
		}else{
			_depots = [];
			_marker = str [_town,_position];//diag_log
			createMarker [_marker, _position];//diag_log
			_marker setMarkerType _marker_type_town;//diag_log
		};

	}else{
		if (_cityCapital && count _types_CityCapital > 0) then {
			_type = _types_CityCapital select 0;
		}else{
			_type = _types_City select 0;
		};
		_town = _grp_logic CreateUnit [_type, _position, [], 0, "CAN_COLLIDE"];
			_marker = str [_town,_position];//diag_log
			createMarker [_marker, _position];//diag_log
			_marker setMarkerType _marker_type_town;//diag_log

		_depots = [];
	};


	// Список необходимо создавать до генерации объектов.
	_houselist = (_town getVariable "gosa_houselist");
	if (isNil "_houselist") then {
		_houselist = (_position nearobjects ["House", _dist_houselist]);
		for "_i" from 0 to (count _houselist -1) do {
			_obj = (_houselist select _i);
			_type = toLower typeOf _obj;
			if (_type in _blacklist_types_house) then {
				diag_log Format ["Log: [TOWN] %1, %2 blacklisted, %3", _town, _obj, _type];
				_houselist set [_i, objNull];
			}else{
				_bbox = abs((boundingbox _obj select 1) select 0)
					min abs((boundingbox _obj select 1) select 1);
				if (_bbox < 3) then {
					diag_log Format ["Log: [TOWN] %1, %2 ignore, bbox %3", _town, _obj, _bbox];
					_houselist set [_i, objNull];
				};
			};
		};
		_houselist = _houselist -[objNull];
	};
	_town setVariable ["gosa_houselist", _houselist];

	_twn_maxVehicles = 0;
	_houselist_roads = [];
	for "_i" from 0 to (count _houselist -1) do {
		_obj = _houselist select _i;
		_pos = getpos _obj;
		_dir = direction _obj + (floor random 4)*90;

		_obj_roads = (_pos nearRoads _dist_nearRoads);
		for "_iR" from 0 to (count _obj_roads -1) do {
			_road = _obj_roads select _iR;
			_b = false;
			if (count (roadsconnectedto _road) <= 2
				or (({count (roadsconnectedto _x) > 2} count (getPos _road nearRoads 7)) <= 0)) then
			{
				_dir = direction _road;
				_bbox = boundingbox _road;
				_bboxA = (_bbox select 0);
				_bboxB = (_bbox select 1);
				_bboxX = abs(_bboxA select 0) + abs(_bboxB select 0);
				_bboxY = abs(_bboxA select 1) + abs(_bboxB select 1);
				_difmin = (_bboxX min _bboxY);
				_difmax = (_bboxX max _bboxY);
				_dif = _difmin/2 + sqrt(_difmin)*0.3;

				if (_difmax < 15) then {
					_pos = position _road;
					_pos = [
						(_pos select 0)+(sin (_dir + 90) * _dif),
						(_pos select 1)+(cos (_dir + 90) * _dif)
					];
					_b = true;
					_obj_roads set [_iR, [_road, _pos]];
				};
			};

			if (_b) then {
				_obj_roads set [_iR, [_road, _pos]];
			}else{
				_obj_roads set [_iR, -1];
			};
		};
		_obj_roads = _obj_roads-[-1];
		_houselist_roads set [_i, _obj_roads];

		if (count _obj_roads > 0) then {
			_twn_maxVehicles = _twn_maxVehicles +(1/8);
		} else {
			_twn_maxVehicles = _twn_maxVehicles +(1/8);
		};
		diag_log Format ["Log: [TOWN] %1, %2, roads %3", _town, _obj, _obj_roads];
	};
	_town setVariable ["gosa_houselist_roads", _houselist_roads];
	diag_log Format ["Log: [TOWN] %1, max vehicles %2", _town, _twn_maxVehicles];
	_town setVariable ["gosa_maxVehicles", _twn_maxVehicles];


	/*
	{
		if (_x In BIS_WF_CustomLocations) then {_depots = _depots + [_x]};
	} ForEach _objects;
	*/

	//Check if this area is being used by a custom location.
	if (Count _depots <= 0) then {
		_buildings = Count (_position NearObjects ["house", _twn_nd]);

		_size = Round (_buildings / 15) * 10 + 30;
		if (_size > 200) then {_size = 200};

		_rangeSize = Round (_buildings / 20) * 10 + 20;
		if (_rangeSize > 150) then {_rangeSize = 150};

		_minSize = (Round (_size / 40)) * 10;
		if (_minSize < 20) then {_minSize = 20};


		_dyno_allowed = false;
		//-- Create Depot.
		_flatAreas = _position NearEntities [_types_Depot, _twn_nd];
		if (Count _flatAreas > 0) then {
			_depot = (_flatAreas Select 0);
			_depotPosition = getPos _depot;
			_depotDirection = Direction _depot;
			_dyno_allowed = true;

		}else{
			_depotPosition = _position;
			_depotDirection = 0;

			_flatAreas = NearestLocations [_position, ["FlatAreaCity"], _twn_nd];
			if (Count _flatAreas > 0) then {
				_depotPosition = LocationPosition (_flatAreas Select 0);
				_depotDirection = Direction (_flatAreas Select 0);
				_dyno_allowed = true;
			};

			_depot = _grp_logic CreateUnit [_types_Depot select 0, _depotPosition, [], 0, "CAN_COLLIDE"];
			_depot setDir _depotDirection;

		};

			_marker = str [_depot,_depotPosition];//diag_log
			createMarker [_marker, _depotPosition];//diag_log
			_marker setMarkerType _marker_type_depot;//diag_log

		//- Гуманитария.
		_town setVariable ["name", _townName];
		//speech - string that matches word/sentence definition in voice protocol; also can be usually converted to localized string (str_location_<speech>)
		_town setVariable ["speech", _speech, true];

		// Постройки.
		if (_dyno && _dyno_allowed) then {
			_composition = _depotCompositions call BIS_fnc_selectRandom;
			_constructed = [_depotPosition, _depotDirection, _composition] call _constructFunction;
			for "_i" from 0 to (count _constructed -1) do {
				_constructed select _i setVariable [_var_gc_time_d,0];
			};
			_constructedList set [count _constructedList, _constructed];
			// мед палатка
			//[_depot] call BIS_WF_InitDefenseLayout;
		};

		// 
		//[[_town]] call BIS_fnc_locations;

		//For Alice compatibility - Remove if BIS_fnc_locations is modified to allow registering locations.
		_town SetVariable ["type", "FlatAreaCity"];
		//_town SetVariable ["class","BIS_loc_" + (_town GetVariable "name")];

		//Link logic and depot.
		_depot setVariable ["location", _town, true];
		_depot synchronizeObjectsAdd [_town];
		_town setVariable ["depot", _depot, true];
		_town synchronizeObjectsAdd [_depot];

		_towns set [count _towns, _town];
		_townNodeNames set [count _townNodeNames, _className];

		//These will be converted from strings to town depots after all depots have been created.
		_town setVariable ["neighbors", _neighbors];

		//Calculate range based on size.
		_sizeMod = 5 + _rangeSizeModifier;
		if (_sizeMod < 0) then {_sizeMod = 0};

		_minSizeMod = _rangeModifier;
		if (_minSizeMod < -300) then {_minSizeMod = -300};

		_range = (400 + _minSizeMod) + _rangeSize * _sizeMod;

		//Cap very high values.
		if (_range > 5000) then {_range = 5000};

		_town setVariable ["range", _range];
		_town setVariable ["minSV", _minSize];
		_town setVariable ["SV", _minSize];

		_town setVariable ["maxSV", _size];
		//if (BIS_WF_LimitedWarfare) then {_town setVariable ["maxSV",_minSize]};

		_town setVariable ["centerPosition", _position, true];

		_camps = [];

		//-- Create camps.
		{
			if (typeName _x == typeName []) then {
				_destination = (_x Select 0);
				_dir = (_x Select 1);
			}else{
				_destination = getPos _x;
				_dir = getDir _x;
			};

			if (_destination Distance _position < _range) then {
				_conflictingCamps = _destination nearEntities [_types_Camp, _conflict_dist];

				if (Count _conflictingCamps <= 0) then {
					_camp = _grp_logic createUnit [_types_Camp select 0, _destination, [], 0, "CAN_COLLIDE"];

					_camp setVariable ["town", _town, true];
					_camp SetDir _dir;

				}else{
					//Check if this camp is closer to current town then one it was created for.
					_camp = _conflictingCamps Select 0;
					_previousTown = _camp GetVariable ["town", _town];

					if (_camp Distance _town < _camp Distance _previousTown) then {
						_camp setVariable ["town", _town, true];

						_newCamps = (_previousTown GetVariable ["camps", []]);
						_newCamps = _newCamps - [_camp];
						_previousTown setVariable ["camps", _newCamps, true];
					};

				};

				_camp synchronizeObjectsAdd [_town];
				_camps set [count _camps, _camp];

				_marker = str [_camp, _destination];//diag_log
				createMarker [_marker, _destination];//diag_log
				_marker setMarkerType _marker_type_camp;//diag_log

				// Постройки.
				if (_dyno) then {
					_composition = _campCompositions call BIS_fnc_selectRandom;
					_constructed = [_destination, _dir, _composition] call _constructFunction;
					for "_i" from 0 to (count _constructed -1) do {
						_constructed select _i setVariable [_var_gc_time_d, 0];
					};
					_constructedList set [count _constructedList, _constructed];
				};
			};
		} ForEach _campAreas;

		_town setVariable ["camps", _camps, true];
		_town synchronizeObjectsAdd _camps;

		diag_log Format ["Log: [TOWN] %1 created, %2, %3, %4", _town, _depotPosition, _depot, _camps];
	};
};


gosa_towns_constructed = _constructedList;
gosa_towns = _towns;
