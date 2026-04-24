/*
 * Подменю с выбором беспилотника.
 */

private["_arguments","_names","_arr","_vehicles","_obj","_cfgVeh","_type","_str"];

_arguments = _this select 3;

_cfgVeh = LIB_cfgVeh;
_arr = [];
_names = [];

_vehicles = vehicles;
for "_i" from 0 to (count _vehicles -1) do {
	_obj = _vehicles select _i;
	if (alive _obj
		&& gosa_playerSide == side _obj
		&& _obj call gosa_fnc_isUAV) then
	{
		_type = typeOf _obj;
		_str = getText (_cfgVeh >> _type >> "displayName");
		_names set [count _arr, _str];
		_arr set [count _arr, [nil, _obj, nil, _arguments, _type, _str]];
	};
};

if (count _names > 0) then {
	_str = gosa_menu_str;
	gosa_menu = _arr;
	[_str, _str, _names, "",
		"gosa_menu select %2 call gosa_fnc_interface_uav"
	] call BIS_FNC_createmenu;
	showCommandingMenu gosa_commandingMenu;
}else{
	hint format [localize "strwfbasestructuredestroyed", localize "str_uav_action"];
};
