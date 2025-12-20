/*
_arr_code = [
	{getText(_cfgVeh >> _this >> "vehicleclass")},
	{getText(_cfgVeh >> _this >> "displayName")},
	{getText(_cfgVeh >> _this >> "faction")},
	{_this}
];
[availableVehicles, [_arr_code]] call gosa_fnc_menu_pre;
*/
private ["_cfgVeh","_types","_distribution","_item","_class","_faction","_r",
	"_name","_n","_arr","_str","_n_class","_arr_code","_path","_arr_path","_b",
	"_distribution_str","_arr_code0","_copyRef","_n0","_return"
];
diag_log format ["Log: [fnc_menu_pre] _this %1", _this];

_types = _this select 0;
_distribution = _this select 1;

_cfgVeh = LIB_cfgVeh;
_copyRef = [];
_return = [];

// TODO: Учёт времени и погоды.
for "_i" from 0 to (count _types -1) do {
	_item = _types select _i;
	_entry = (_cfgVeh >> _item);

	_b = true;
	if (toLower getText(_entry >> "simulation") in ["","invisible","house","thing","flagcarrier","fire","breakablehouseproxy","breakablehouse","parachute"]) then
	{_b = false};
	if !(_b) then {
		if (toLower getText(_entry >> "vehicleclass") in ["i44_ammo","ammo","ace_ammunition","backpacks"]) then
		{_b = true};
	};
	if (_b) then {
		if (_item isKindOf "Chukar") then {_b = false};
	};
	if (_b) then {
		if (getText(_entry >> "displayName") == "") then {_b = false};
	};

	if (_b) then {
		for "_i0" from 0 to (count _distribution -1) do {
			_arr_code = _distribution select _i0;
			if (_i0 >= count _return) then {
				_return set [_i0, []];
			};

			_path = [];
			for "_i1" from 0 to (count _arr_code -1) do {
				_r = (_item call (_arr_code select _i1));
				_path set [0, _i1];

				_arr = _return select _i0;
				for "_i2" from 0 to (count _path -1) do {
					if ((_path select _i2) >= count _arr) then {
						_arr set [count _arr, []];
					};
					_arr = _arr select (_path select _i2);
				};

				_n = _arr find _r;
				if (_n < 0) then {
					_path set [count _path, count _arr];

					#ifdef __ARMA3__
						// Дедупликация
						// TODO: Функция.
						_n0 = (_copyRef findIf {_x isEqualTo _r});
						if (_n0 >= 0) then {
							_r = _copyRef select _n0;
						}else{
							_copyRef pushBack _r;
						};
					#endif

					_arr set [count _arr, _r];
				}else{
					_path set [count _path, _n];
				};
			};
		};
	};
};

_return;
