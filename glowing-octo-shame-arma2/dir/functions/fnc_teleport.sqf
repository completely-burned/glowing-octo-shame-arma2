#define __A2OA__
/*
 * В этом файле формируется меню позиций для телепортации.
 * TODO: Рефакторинг.
 */
private ["_item","_obj","_num","_str","_for","_pos","_arr",
	"_list","_list2","_teleport_list",
	"_class","_logic",
	"_gosa_objectsTeleportTmp","_gosa_objectsTeleport"];

_list=[];
_teleport_list=[];
_list2=[];
_gosa_objectsTeleportTmp = [];
_gosa_objectsTeleport = [];

waitUntil{!isNil "gosa_fnc_CheckIsKindOfArray"};
waitUntil{!isNil "civilianBasePos"};
waitUntil{!isNil "CivilianLocation"};
waitUntil{!isNil "MHQ_list"};


//-- Штабы.
//- Список штабов.
_str = format["gosa_listHQ_%1", playerSide];
//waitUntil{!isNil _str};
_for = ([] call compile _str);

for "_i" from 0 to (count _for - 1) do {
	//- Массив штаба.
	// [_logic, _class, _status, [_obj,objNull,_obj], _side, _str]
	_item = _for select _i;
	_logic = _item select 0;

	// Если логика мертва значит штаб уничтожен.
	if (alive _logic) then {
		_class = _item select 1;

		// Доступен только штаб.
		//if (_class == 0) then {
			//- Объекты.
			_arr = _item select 3;
			_arr = _arr -[objNull];
			if (count _arr < 1) then {
				// Объекты могут дать сбой.
				_arr = [_logic];
			};

			//- Добавление в предварительный список.
			_gosa_objectsTeleportTmp = _gosa_objectsTeleportTmp + _arr;
		//};
	};
};

//-- Локации.
_for = gosa_list_LocationBase;
for "_i" from 0 to (count _for -1) do {
	_logic = (_for select _i);

	// TODO: Side.

	_arr = synchronizedObjects _logic;

	// Для совместимости.
	if (count _arr < 1) then {
		_arr = [_logic];
	};

	for "_i0" from 0 to (count _arr -1) do {
		_logic = (_arr select _i0);
		_obj = _logic getVariable ["gosa_building", _logic];
		_gosa_objectsTeleportTmp set [count _gosa_objectsTeleportTmp, _obj];
	};
};

//-- Аэропорты, пока только для пилотов.
// TODO: Возможность телепортироваться обратно.
if (gosa_playerStartingClass == 1) then {
	_for = [] call gosa_fnc_initAirports;
	// FIXME: Код повторяется, нужен лишь для аэропортов.
	for "_i" from 0 to (count _for - 1) do {
		_item = _for select _i;
		_obj = _item select 1;
		_pos = _item select 4;

		_num = count _list;
		_str = format ["%1, %2", text ((nearestLocations [_pos,
				["nameCity","NameCityCapital","NameVillage","NameLocal","NameMarine","Hill"],5000])
					select 0),
				getText(configfile >> "CfgVehicles" >> typeof _obj >> "displayName")];

		_list set [_num, _num];
		_teleport_list set [_num, _obj];
		_list2 set [_num, _str];
	};
};

//-- Дедубликация.
{
	if!(_x in _gosa_objectsTeleport)then{
		_gosa_objectsTeleport set [count _gosa_objectsTeleport, _x];
	};
} foreach _gosa_objectsTeleportTmp;


// TODO: Координаты в имени.
//-- 
_teleportLocations = [];
{
	switch (typeName _x) do {
		case ("OBJECT"):
		{
				if (alive _x) then {
				if !(getNumber(configFile >> "CfgVehicles">> typeOf _x >> "side") call gosa_fnc_getSide getFriend playerSide < 0.6) then {
					_list = _list + [count _list];
					_teleport_list = _teleport_list + [_x];
					_list2= _list2 + [format ["%1, %2", text ((nearestLocations [position _x, ["nameCity","NameCityCapital","NameVillage","NameLocal","NameMarine","Hill"],5000]) select 0), getText(configfile >> "CfgVehicles" >> typeof _x >> "displayName")]];
				};
				};
		};
		case ("STRING"):
		{
			_list = _list + [count _list];
			_teleport_list = _teleport_list + [_x];
			_list2= _list2 + [format ["%1, %2", text ((nearestLocations [getMarkerPos _x, ["nameCity","NameCityCapital","NameVillage","NameLocal","NameMarine","Hill"],5000]) select 0), _x]];
		};
		case ("LOCATION"):
		{
			_list = _list + [count _list];
			_teleport_list = _teleport_list + [_x];
			_list2= _list2 + [format ["%1", text ((nearestLocations [position _x, ["nameCity","NameCityCapital","NameVillage","NameLocal","NameMarine","Hill"],5000]) select 0)]];
		};
		default {};
	};
} foreach _gosa_objectsTeleport
+_teleportLocations;


diag_log format ["Log: [fnc_teleport] n %1", _list];
diag_log format ["Log: [fnc_teleport] t %1", _list2];
diag_log format ["Log: [fnc_teleport] o %1", _teleport_list];


gosa_menu = _teleport_list;
//- меню
[
	"teleport",
	"teleport",
	[_list,_list2],
	"",
	"(gosa_menu select %1) spawn gosa_fnc_teleport2; gosa_menu = nil;"
] call BIS_FNC_createmenu;
