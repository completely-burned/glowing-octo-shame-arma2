/*
 * Предварительные данные для дальнейшей генерации меню найма.
 *
 * _productions = [["air","man"],["air","man"],[1,1],[_factions,_factions]];
 * _factions = [["us","cdf"],["us","cdf"],[1,1],[_sub,_sub]];
 * _vehicleclasses = [["tank","man"],["tank","man"],[1,1],[_sub,_sub]];
 * _types [["solder","h1z1"]]
 * [["Car","Armored"],[],[],[[["INS"],[],[],[[["Car","Armored"],[],[],[[["Offroad_DSHKM_INS","BMP2_INS"],[],[],[]]]]]]]]
 */

private ["_fnc_vehicles","_entry","_type","_faction","_vehicleclass","_menu",
	"_factionclasses","_find_faction","_fnc_lib_add","_arr","_production",
	"_cfgVeh","_vehicleclasses","_find_vehicleclass"];

_cfgVeh = configFile >> "CfgVehicles"; // diag_log
//_cfgVeh = LIB_cfgVeh;

_menu = [[],[],[],[
		[[],[],[],[
		[[],[],[],[
		[[],[],[],[]]]]]]]];

_fnc_lib_add = {
	diag_log format ["Log: [fnc_menu_global] _fnc %1", _this];
	_arr = _menu;

	_n = (_arr select 0 find (_this select 4));
	diag_log format ["Log: [fnc_menu_global] %2 %1", _arr, _n];
	if (_n < 0) then {
		_n = 0;
		_arr select 0 set [count (_arr select 0), _this select 4];
	};
	_arr = (_arr select 3 select _n);
	_n = (_arr select 0 find (_this select 3));
	diag_log format ["Log: [fnc_menu_global] %2 %1", _arr, _n];
	if (_n < 0) then {
		_n = 0;
		_arr select 0 set [count (_arr select 0), _this select 3];
	};
	_arr = (_arr select 3 select _n);
	_n = (_arr select 0 find (_this select 2));
	diag_log format ["Log: [fnc_menu_global] %2 %1", _arr, _n];
	if (_n < 0) then {
		_n = 0;
		_arr select 0 set [count (_arr select 0), _this select 2];
	};
	_arr = (_arr select 3 select _n);
	if !(_this select 1 in (_arr select 0)) then {
		_arr select 0 set [count (_arr select 0), _this select 1];
	};
};

_arr_avail = availableVehicles;
//_arr_avail = ["Offroad_DSHKM_INS","BMP2_INS"]; // diag_log
for "_i" from 0 to (count _arr_avail -1) do {
	_type = _arr_avail select _i;
	_entry = (_cfgVeh >> _type);
	if !(toLower getText(_entry >> "simulation") in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
		if !(configname _entry isKindOf "Chukar") then {
			_vehicleclass = getText(_entry >> "vehicleclass");
			[	nil,
				_type,
				_vehicleclass,
				getText(_entry >> "faction"),
				_vehicleclass]
			call _fnc_lib_add;
		};
	};
};

diag_log format ["Log: [fnc_menu_global] %1", _menu];

gosa_menu_global = _menu;
