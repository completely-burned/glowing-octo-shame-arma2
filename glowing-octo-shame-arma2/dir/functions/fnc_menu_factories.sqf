/*
Формирует меню заводов для подменю завода.
*/
private ["_str","_arr","_for","_factories","_class",
	"_logic","_cfgVeh","_pos","_factory",
	"_Buy_Man","_Buy_Car","_Buy_Tank","_Buy_Helicopter",
	"_arr0","_arr1","_arr2","_n"];

_str = format["gosa_listHQ_%1", gosa_playerSide];
if (isNil _str) exitWith {
};

_for = ([] call compile _str);
_factories = [];

for "_i" from 0 to (count _for -1) do {
	// _factory = [_logic, _class, _status, [_obj,_obj,objNull], _side, _str]
	_factory = _for select _i;
	_logic = (_factory select 0);

	if (alive _logic) then {
		_factories set [count _factories, _factory];
	};
};

diag_log format ["Log: [fnc_menu_factories]: _factories %1", _factories];


if (count _factories > 0) then {
	//--- меню заводов
	_arr0 = [];
	_arr1 = [];
	_arr2 = [];
	for "_i" from 0 to (count _factories -1) do {
		_factory = _factories select _i;
		// имя
		_str = _factory select 5;
		_arr0 set [_i, nil];
		_arr1 set [_i, "*"+_str];
		_arr2 set [_i, 1];
	};

	//- createmenu
	["Factories", "gosa_menu", [_arr0,_arr1,_arr2], "",
		"private ['_arr'];
		_arr = (gosa_menu select %2);
		gosa_menu = _arr; [_arr] spawn gosa_fnc_menu_factory;
		"
	] call BIS_FNC_createmenu;

	gosa_menu = _factories;

	//--- открытие меню заводов
	showCommandingMenu "#USER:gosa_menu_0";
};