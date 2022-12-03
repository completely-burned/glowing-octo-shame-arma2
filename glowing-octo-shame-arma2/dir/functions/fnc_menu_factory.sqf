/*
Формирует меню завода для подменю найма.
*/
diag_log format ["Log: [fnc_menu_factory]: _this %1", _this];
private ["_str","_arr","_for","_factories","_class",
	"_logic","_cfgVeh","_pos","_factory",
	"_Buy_Man","_Buy_Car","_Buy_Tank","_Buy_Helicopter",
	"_arr0","_arr1","_arr2","_n"];

// _factory = [_logic, _class, _status, [_obj,_obj,objNull], _side, _str]
_factory = _this select 0;

//--- меню завода
_logic = _factory select 0;
_class = _factory select 1;
_pos = getPos _logic;

_cfgVeh = (configfile >> "cfgvehicles");

_n = 0;
_arr0 = [];
_arr1 = [];
_arr2 = [];

_Buy_Man = false;
_Buy_Car = false;
_Buy_Tank = false;
_Buy_Helicopter = false;

// HQ
if (_class == 0) then {
	_Buy_Man = true;
	_Buy_Car = true;
	_Buy_Tank = true;
	_Buy_Helicopter = true;
};

//-- Казармы.
if (_Buy_Man) then {
	//- Man
	// Найм живых юнитов доступен только командиру.
	if (leader player == player) then {
		_arr0 set [_n, "#USER:Man_0"];
		_arr1 set [_n, gettext(_cfgVeh >> "Man" >> "displayName")];
		_arr2 set [_n, 1];
		_n = _n +1;
	};

	//- Снаряжения.
	_arr0 set [_n, "#USER:Ammo_0"];
	_arr1 set [_n, gettext(_cfgVeh >> "ReammoBox" >> "displayName")];
	_arr2 set [_n, 1];
	_n = _n +1;

	//- static
};

//-- Легкая техника.
if (_Buy_Car) then {
	_arr0 set [_n, "#USER:Car_0"];
	_arr1 set [_n, gettext(_cfgVeh >> "Car" >> "displayName")];
	_arr2 set [_n, 1];
	_n = _n +1;
	_arr0 set [_n, "#USER:Motorcycle_0"];
	_arr1 set [_n, gettext(_cfgVeh >> "Motorcycle" >> "displayName")];
	_arr2 set [_n, 1];
	_n = _n +1;
};

//-- Тяжёлая техника.
if (_Buy_Tank) then {
	_arr0 set [_n, "#USER:Tank_0"];
	_arr1 set [_n, gettext(_cfgVeh >> "Tank" >> "displayName")];
	_arr2 set [_n, 1];
	_n = _n +1;
};

//-- ЛА вертикального взета.
if (_Buy_Helicopter) then {
	_arr0 set [_n, "#USER:Helicopter_0"];
	_arr1 set [_n, gettext(_cfgVeh >> "Helicopter" >> "displayName")];
	_arr2 set [_n, 1];
	_n = _n +1;
};

//-- Самолеты.

//-- Корабли.

//- createmenu
if (count _arr0 > 0) then {
	diag_log format ["Log: [fnc_menu_factory]: _BuyMenu %1", [_arr0,_arr1,_arr2]];

	_str = _factory select 5;

	["Factory: "+_str,
		"gosa_menu",
		[_arr0,_arr1,_arr2],
		"%1",
		""
	] call BIS_FNC_createmenu;

	if (alive _logic) then {
		gosa_menu = _factory;
		showCommandingMenu "#USER:gosa_menu_0";
	}else{
		gosa_menu = nil;
	};
}else{
	gosa_menu = nil;
};

