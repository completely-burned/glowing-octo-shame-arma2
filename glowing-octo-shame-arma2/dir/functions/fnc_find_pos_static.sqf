/*
 * Поиск позиций для спавна статичных орудий.
 * TODO: Поворачивать пушку.
 * TODO: Использовать рельеф местности.
 * TODO: Позиции для других пушек.
 */
diag_log format ["Log: [fnc_find_pos_static] %1", _this];

private ["_centr","_dist","_type","_dist_conflict","_dist_group","_dir","_b",
	"_return","_objects","_arr","_obj","_offset_positions","_pos","_arr0",
	"_dist_offset","_types","_player_dist"
];
_centr = _this select 0;
_dist = _this select 1;
_types = _this select 2;
_player_dist = _this select 3;

_dist_conflict = 0.0001;
_dist_group = 7;
_dist_offset = -4;

_return = [];

#ifdef __ARMA3__
	for "_i_types" from 0 to (count _types -1) do {
		_type = _types select _i_types;
		_pos_types = [];
		_return set [_i_types, _pos_types];

		// Эти позиции подходят только для SPE_FlaK_36 из-за высоты укрытий.
		if (_type isKindOf "SPE_FlaK_36") then {
			_dugouts = ["spe_dugout_6m315_sandbags.p3d","spe_dugout_6m45_sandbags.p3d"];
			_objects = [];
			_arr = nearestTerrainObjects [_centr, [], _dist];
			for "_i" from 0 to (count _arr -1) do {
				_obj = _arr select _i;
				if (getModelInfo _obj select 0 in _dugouts) then {
					if !(_obj in _objects) then {
						_objects set [count _objects, _obj];
					};
				};
			};

			//- Поиск позиций относительно укрытий.
			_offset_positions = [];
			for "_i" from 0 to (count _objects -1) do {
				_obj = _objects select _i;
				_pos = getPos _obj;
				_dir = getDir _obj;
				_pos = [(_pos select 0) + _dist_offset*sin (_dir), (_pos select 1) + _dist_offset*cos (_dir)];
				_offset_positions set [_i, _pos];
			};

			if (count _offset_positions > 0) then {
				_arr = [[_offset_positions select 0]];

				for "_ip" from 1 to (count _offset_positions -1) do {
					_pos = _offset_positions select _ip;
					_b = true;
					for "_i" from 0 to (count _arr -1) do {
						_arr0 = _arr select _i;
						if ({_x distance _pos < _dist_group} count _arr0 > 0) then {
							_arr0 set [count _arr0, _pos];
							_b = false;
						};
					};
					if (_b) then {
						_arr set [count _arr, [_pos]];
					};
				};

				for "_i" from 0 to (count _arr -1) do {
					_pos = (_arr select _i call gosa_fnc_centerOfImpact);
					_b = true;
					/*
					_arr0 = nearestObjects [_pos, ["LandVehicles","Air"], 5];
					for "_i0" from 0 to (count _arr0 -1) do {
						if (alive (_arr0 select _i0)) exitWith {
							diag_log format ["Log: [fnc_find_pos_static] %1, alive %2", _pos, (_arr0 select _i0)];
							_b = false;
						};
					};
					*/
					if (_b) then {
						if (count nearestObjects [_pos, [], _dist_conflict] <= 0) then {
							if !([_pos, _player_dist] call gosa_fnc_CheckPlayersDistance) then {
								_pos_types set [count _pos_types, _pos];
							};
						};
					};
				};
			};
		};
	};
#endif

diag_log format ["Log: [fnc_find_pos_static] _return %2", _return];
_return;
