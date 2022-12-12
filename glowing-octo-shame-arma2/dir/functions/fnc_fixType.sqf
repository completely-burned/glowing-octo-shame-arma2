/*
 * Исправление типа юнита.
 * Если он отсутствует например,
 * или является виртуальным.
 *
 * Аргументы: "type" в нижнем регистре.
 */

diag_log format ["Log: [fnc_fixType] _this %1", _this];

private ["_type","_r","_cfg"];

_type = _this;


if (_type == "") exitWith {
	_type;
};

_cfg = LIB_cfgVeh;

if (configName (_cfg >> _type) == "") then {
	switch (_type) do {
		case "o_truck_03_command_f": {
			_r = "o_truck_03_covered_f";
		};
		case "b_truck_01_command_f": {
			_r = "b_truck_01_covered_f";
		};
		case "i_truck_02_command_f": {
			_r = "i_truck_02_covered_f";
		};
		default {
			_r = "";
		};
	};
};

_r = configName (_cfg >> _r);

diag_log format ["Log: [fnc_fixType] _this %1, _r %2", _this, _r];
_r;
