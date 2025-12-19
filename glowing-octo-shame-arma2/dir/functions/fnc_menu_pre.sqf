private ["_cfgVeh","_types","_distribution","_item","_class","_faction","_r",
	"_name","_n","_arr","_str","_n_class","_arr_code","_path","_arr_path",
	"_distribution_str","_arr_code0","_copyRef","_n0"
];
diag_log format ["Log: [fnc_menu_pre] _this %1", _this];

_cfgVeh = LIB_cfgVeh;
_copyRef = [];

_types = availableVehicles;

//_cfgVeh = configFile >> "CfgVehicles";
//_types = ["vn_b_armor_m41_01_01", "vn_b_men_lrrp_09", "vn_b_men_lrrp_08"];

// private _itemDetails = [["firstData", "secondData"], ["First", "Second"]];
// ["Menu", "b", _itemDetails, "", "hint (str '%1' + str '%2' + str '%3')"] call BIS_fnc_createMenu;
// showCommandingMenu "#USER:b_0";

// Порядок: класс, имя, фракция, вариант.
_arr_code = [
	{getText(_cfgVeh >> _this >> "vehicleclass")},
	{getText(_cfgVeh >> _this >> "displayName")},
	{getText(_cfgVeh >> _this >> "faction")},
	{_this}
];
//- Дополнительные данные.
_arr_code0 = [
	{[getText(configfile >> "CfgVehicleClasses" >> getText(_cfgVeh >> _this >> "vehicleclass") >> "displayName")]},
	{[getText(_cfgVeh >> _this >> "displayName")]},
	{[getText(configfile >> "CfgFactionClasses" >> getText(_cfgVeh >> _this >> "faction") >> "displayName")]},
	{[_this]}
];


_distribution = [];
_distribution_str = [];

// TODO: Учёт времени и погоды.
for "_i" from 0 to (count _types -1) do {
	_item = _types select _i;
	//_entry = (_cfgVeh >> _item);

	_path = [];
	for "_i0" from 0 to (count _arr_code -1) do {
		_r = (_item call (_arr_code select _i0));
		_r0 = (_item call (_arr_code0 select _i0));
		_path set [0, _i0];

		_arr = _distribution;
		_arr0 = _distribution_str;
		for "_i1" from 0 to (count _path -1) do {
			if ((_path select _i1) >= count _arr) then {
				_arr set [count _arr, []];
				_arr0 set [count _arr0, []];
			};
			_arr = _arr select (_path select _i1);
			_arr0 = _arr0 select (_path select _i1);
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
					_n0 = (_copyRef findIf {_x isEqualTo _r0});
				if (_n0 >= 0) then {
					_r0 = _copyRef select _n0;
				}else{
					_copyRef pushBack _r0;
				};
			#endif

			_arr set [count _arr, _r];
			_arr0 set [count _arr0, _r0];
		}else{
			_path set [count _path, _n];
		};
	};
};

[_distribution, _distribution_str];
