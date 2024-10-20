private ["_side_str","_markerColor","_rBase","_objects","_respawnMarkers",
	"_fnc_MarkerInitUnit","_markerPosHiden","_tmp_arr","_tmp_str","_text",
	"_tmp_obj","_rMHQ","_tmp_n","_item","_startingClass","_airports",
	"_logic","_obj","_n","_fnc_update_HQ","_markersHQ","_listHQ_str",
	"_markers_airport","_respawn_type_Pilot","_respawn_type_All","_markers_alive",
	"_list","_arr","_b","_marker_type","_marker_type_respawn_unknown",
	"_marker_type_respawn_plane","_fnc_update_LocationAirport","_grp",
	"_var_synchronizedObjects","_side","_arr0","_respawn_type_carrier",
	"_markers_LocationBase","_fnc_update_LocationBase","_types_respawn_blacklist",
	"_markerMHQ","_markerMHQtype","_dynamicMarkers","_hq","_pos","_marker"];

_marker_type_respawn_unknown = "Start";
_marker_type_respawn_plane = "Airport";
#ifdef __ARMA3__
	_marker_type_respawn_unknown = "respawn_unknown";
	_marker_type_respawn_plane = "respawn_plane";
#endif
_respawn_type_Pilot = 1;
_respawn_type_carrier = 2;
_respawn_type_All = 0;

_list = call gosa_fnc_base_get_locations;
_list = _list select 0;

for "_i" from 0 to (count _list -1) do {
	scopeName "for_b";
	_logic = _list select _i;
	_grp = group _logic;
	_side = _logic getVariable "side";
	if (isNil "_side") then {
		_side = civilian;
	};

	// объекты аэропорта.
	_arr0 = [_logic, [_respawn_type_Pilot, _respawn_type_carrier, _respawn_type_All], -1] call gosa_fnc_base_getRespawn;
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
			_arr = [_logic];
		};

		for "_i0" from 0 to (count _arr -1) do {
			_logic = _arr select _i0;

			_obj = _logic getVariable "gosa_RespawnPoint";
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

			// TODO: Учёт разрушений.
			if (damage _logic >= 0.9) then {
				if !(isNil "_obj") then {
					diag_log format ["Log: [fnc_base_update] %1 delete %2", _logic, _obj];
					deleteVehicle _obj;
					_logic setVariable ["gosa_RespawnPoint", nil];
				};
			};

			if (_b) then {
				#ifdef __ARMA3__
					if (isNil "_obj") then {
						_str = [_side] call gosa_fnc_respawn_get_type_point;
						//_obj = createVehicle [_str, getPosATL _logic, [], 0, "CAN_COLLIDE"];
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
					};
				#endif
			};
		};
};
