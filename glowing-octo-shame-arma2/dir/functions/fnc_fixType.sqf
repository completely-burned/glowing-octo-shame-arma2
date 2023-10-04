/*
 * Исправление типа юнита.
 * Если он отсутствует например,
 * или является виртуальным.
 *
 * Аргументы: "type" в нижнем регистре.
 */

diag_log format ["Log: [fnc_fixType] _this %1", _this];

private ["_type","_r","_cfg","_types_mhq_virt","_n"];

_type = _this;


if (_type == "") exitWith {
	_type;
};

_cfg = LIB_cfgVeh;

if (configName (_cfg >> _type) == "") then {
	_types_mhq_virt = gosa_types_mhq_virt;
	_n = (_types_mhq_virt select 2 find _type);
	if (_n >= 0) then {
		_r = (_types_mhq_virt select 1 select _n);
	}else{
		_r = _type;
	};
}else{
	_r = _type;
};

_r = configName (_cfg >> _r);

diag_log format ["Log: [fnc_fixType] _this %1, _r %2", _this, _r];
_r;
