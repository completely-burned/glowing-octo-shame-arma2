private ["_side_str","_markerColor","_rBase","_objects","_respawnMarkers",
	"_delay","_time","_time_last","_size_RespawnPoint","_side_base",
	"_cpoints_needed_RespawnPoint","_resistance","_west","_east",
	"_diff_resistance","_diff_west","_diff_east",
	"_points_resistance","_points_east","_points_west",
	"_fnc_MarkerInitUnit","_markerPosHiden","_tmp_arr","_tmp_str","_text",
	"_tmp_obj","_rMHQ","_tmp_n","_item","_startingClass","_airports",
	"_logic","_obj","_n","_fnc_update_HQ","_markersHQ","_listHQ_str",
	"_markers_airport","_respawn_type_Pilot","_respawn_type_All","_markers_alive",
	"_list","_arr","_b","_marker_type","_marker_type_respawn_unknown",
	"_marker_type_respawn_plane","_fnc_update_LocationAirport","_grp",
	"_base_array","_RespawnPositionActive","_logic_base","_var","_delete",
	"_var_synchronizedObjects","_side","_arr0","_respawn_type_carrier","_arr1",
	"_markers_LocationBase","_fnc_update_LocationBase","_types_respawn_blacklist",
	"_markerMHQ","_markerMHQtype","_dynamicMarkers","_hq","_pos","_marker"];

_base_array = _this select 0;

_marker_type_respawn_unknown = "Start";
_marker_type_respawn_plane = "Airport";
#ifdef __ARMA3__
	_marker_type_respawn_unknown = "respawn_unknown";
	_marker_type_respawn_plane = "respawn_plane";
#endif
_respawn_type_Pilot = 1;
_respawn_type_carrier = 2;
_respawn_type_All = 0;

_cpoints_needed_RespawnPoint = 15;
_size_RespawnPoint = 20;

_RespawnPositionActive = [];
if (isMultiplayer) then {
	_arr = _base_array select 0;
	for "_i" from (count _arr -1) to 0 step -1 do {
		_arr0 = _arr select _i;
		_delete = false;
		// TODO: Учёт разрушений здания.

		if (count _arr0 > 1) then {
			//- Удаление отключенных позиций.
			if (damage (_arr0 select 0) >= 0.9) then {
				_delete = true;
			};
		};
		if (!_delete && count _arr0 > 2) then {
			//- Смена стороны.
			_logic_base = _arr0 select 2;
			_var = _logic_base getVariable "side";
			if !(isNil "_var") then {
				if !(_var in [sideunknown, civilian]) then {
					_side = _arr0 select 1 select 0;
					if (_side != _var) then {
						diag_log format ["Log: [fnc_base_update] delete %1, %2", _arr0, _side];
						_delete = true;
					};
				};
			};
		};
		if (_delete) then {
			diag_log format ["Log: [fnc_base_update] delete %1", _arr0];
			_arr0 select 1 call BIS_fnc_removeRespawnPosition;
			_arr deleteAt _i;
		}else{
			_RespawnPositionActive pushBack (_arr0 select 0);
		};
	};
};
//diag_log format ["Log: [fnc_base_update] _RespawnPositionActive %1", _RespawnPositionActive];

_list = call gosa_fnc_base_get_locations;
_list = _list select 0;

for "_i" from 0 to (count _list -1) do {
	scopeName "for_b";
	_logic_base = _list select _i;

		_time = time;
		_time_last = _logic_base getVariable "gosa_time_last_update";
		if !(isNil "_time_last") then {
			_delay = (_time - _time_last);
		};
		_logic_base setVariable ["gosa_time_last_update", _time];

	_grp = group _logic_base;
	_side_base = _logic_base getVariable "side";
	if (isNil "_side_base") then {
		_side_base = sideUnknown;
	};

	_arr0 = [_logic_base, [_respawn_type_Pilot, _respawn_type_carrier, _respawn_type_All], -1] call gosa_fnc_base_getRespawn;
	_arr = [];
	for "_i0" from 0 to (count _arr0 -1) do {
		#ifdef __ARMA3__
			_arr append (_arr0 select _i0);
		#else
			_arr = _arr + (_arr0 select _i0);
		#endif
	};

	_b = true;
		if (count _arr <= 0) then {
			_arr = [_logic_base];
		};

		for "_i0" from 0 to (count _arr -1) do {
			_logic = _arr select _i0;

			_side = _logic getVariable "side";
			if (isNil "_side") then {
				_side = _side_base;
			};

			if !(isNil "_time_last") then {
				_objects = (_logic nearEntities [["AllVehicles"], _size_RespawnPoint]);

				// TODO: Не производить вычисления без причины.
				_east = east countSide _objects;
				_west = west countSide _objects;
				_resistance = resistance countSide _objects;
				_eastEnemies = 0;
				_westEnemies = 0;
				_resistanceEnemies = 0;
				_diff_east = _east;
				_diff_west = _west;
				_diff_resistance = _resistance;
				if (east getFriend west < 0.6) then {
					_diff_east = (_diff_east - _west);
					_eastEnemies = _eastEnemies + _west;
				};
				if (east getFriend resistance < 0.6) then {
					_diff_east = (_diff_east - _resistance);
					_eastEnemies = _eastEnemies + _resistance;
				};
				if (west getFriend east < 0.6) then {
					_diff_west = (_diff_west - _east);
					_westEnemies = _westEnemies + _east;
				};
				if (west getFriend resistance < 0.6) then {
					_diff_west = (_diff_west - _resistance);
					_westEnemies = _westEnemies + _resistance;
				};
				if (resistance getFriend west < 0.6) then {
					_diff_resistance = (_diff_resistance - _west);
					_resistanceEnemies = _resistanceEnemies + _west;
				};
				if (resistance getFriend east < 0.6) then {
					_diff_resistance = (_diff_resistance - _east);
					_resistanceEnemies = _resistanceEnemies + _east;
				};
				diag_log format ["Log: [fnc_base_update] %1, _diff %2", _logic, [_diff_east, _diff_west, _diff_resistance]];

				_arr0 = _logic getVariable "gosa_capture_points";
				if (isNil "_arr0") then {
					_arr0 = [0,0,0];
				};
				diag_log format ["Log: [fnc_base_update] %1, _capture_points %2", _logic, _arr0];

				_points_east = ((((_arr0 select 0) + (_diff_east * _delay)) max 0) min _cpoints_needed_RespawnPoint);
				_points_west = ((((_arr0 select 1) + (_diff_west * _delay)) max 0) min _cpoints_needed_RespawnPoint);
				_points_resistance = ((((_arr0 select 2) + (_diff_resistance * _delay)) max 0) min _cpoints_needed_RespawnPoint);
				diag_log format ["Log: [fnc_base_update] %1, _capture_points %2", _logic, [_points_east, _points_west, _points_resistance]];
				_arr1 = [_points_east, _points_west, _points_resistance];
				//_east = false; _west = false; _resistance = false;
				if (_points_east >= _cpoints_needed_RespawnPoint && _eastEnemies <= 0) then {
					//_east = true;
					if (_side != east) then {
						_side = east;
						_logic setVariable ["side", _side];
					};
				};
				if (_points_west >= _cpoints_needed_RespawnPoint && _westEnemies <= 0) then {
					//_west = true;
					if (_side != west) then {
						_side = west;
						_logic setVariable ["side", _side];
					};
				};
				if (_points_resistance >= _cpoints_needed_RespawnPoint && _resistanceEnemies <= 0) then {
					//_resistance = true;
					if (_side != resistance) then {
						_side = resistance;
						_logic setVariable ["side", _side];
					};
				};
				if (_arr0 isNotEqualTo _arr1) then {
					_logic setVariable ["gosa_capture_points", _arr1];
				};
			};

			_n = [_logic, _respawn_type_All] call gosa_fnc_respawn_get_type;
			switch (_n) do {
				case _respawn_type_carrier;
				case _respawn_type_Pilot: {
						_b = true;
						_marker_type = _marker_type_respawn_plane;
				};
				case _respawn_type_All: {
					_b = true;
					_marker_type = _marker_type_respawn_unknown;
				};
				default {
					_b = false;
				};
			};

			_obj = _logic getVariable "gosa_RespawnPoint";
			// TODO: Учёт разрушений.
			if (damage _logic >= 0.9) then {
				if !(isNil "_obj") then {
					diag_log format ["Log: [fnc_base_update] %1 delete %2", _logic, _obj];
					deleteVehicle _obj;
					_logic setVariable ["gosa_RespawnPoint", nil];
				};
			};

			if (_logic in _RespawnPositionActive) then {
				_b = false;
			};

			if (_b) then {
				#ifdef __ARMA3__
					if (_side in [sideUnknown, civilian]) then {
						_arr0 = [east,west,resistance,civilian];
					}else{
						_arr0 = [_side, civilian];
					};
					for "_i1" from 0 to (count _arr0 -1) do {
						/*
						_str = [_arr0 select _i1] call gosa_fnc_respawn_get_type_point;
						_obj = _grp createUnit [_str, getPos _logic, [], 0, "CAN_COLLIDE"];
						_pos = getPosASL _logic;
						_obj setPosASL _pos;
						_obj attachTo [_logic];
						diag_log format ["Log: [fnc_base_update] %1 attached %2, %3", _logic, _obj, _str];
						// FIXME: Не надёжно использовать на динамичном обекте.
						_logic setVariable ["gosa_RespawnPoint", _obj];
						_obj setVariable ["gosa_RespawnPoint", _logic];
						_logic synchronizeObjectsAdd [_obj];
						_obj synchronizeObjectsAdd [_logic];
						_base_array select 1 pushBack [_logic, _obj];
						*/

							diag_log format ["Log: [fnc_base_update] %1 addRespawnPosition %2", _logic, _arr0 select _i1];
							_arr1 = [_arr0 select _i1, _logic] call BIS_fnc_addRespawnPosition;
							_base_array select 0 pushBack [_logic, _arr1, _logic_base];
					};
				#endif
			};
		};
};
