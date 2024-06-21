scriptName "Functions\misc\fn_createmenu.sqf";
/*
	File: fn_createMenu.sqf

	Description:
	Create custom commanding menu (with multiple pages if necessary).

	Parameter(s):
		_this select 0 - STRING or ARRAY - Name of menu or [Name, Context sensitive]
		_this select 1 - STRING - Variable in which will be menu params stored (as variable_0, variable_1, ...)
		_this select 2 - ARRAY - Array with menu items (can be either [items] or [[items],[itemNames],[itemEnable]] if you want to set custom params (names, enable values))
		_this select 3 - STRING - Name of submenu which will open when item is activated. Name of selected item is passed to string as %1
		_this select 4 - STRING - Expression which is executed when item is activated. Name of selected item is passed to string as %1, ID is %2.
		_this select 5 - ANYTHING (Optional) - params passed to expression. Whole argument is passed as %3
		_this select 6 - BOOLEAN - False to hide number shortcuts

	Returned value(s):
		True
		
	Example:
	  c = ["first","second"]; ["Menu", "b", c, "","hint 'ahoj'"] call BIS_FNC_createmenu; showCommandingMenu "#USER:b_0"  
	  c = [["firstData","secondData"],["First","Second"]]; ["Menu", "b", c, "","hint (str '%1' + str '%2' + str '%3')"] call BIS_FNC_createmenu;  showCommandingMenu "#USER:b_0";  
	  see news:g7p3po$gik$1@new-server.localdomain
*/
private ["_name","_variable","_input","_submenu","_expression","_input_count","_input_start","_input_page","_input_end","_array","_item"];
scopename "main";

_name = _this select 0;
_contextsensitive = false;
if (typename _name == "ARRAY") then {_contextsensitive = _name select 1; _name = _name select 0};
_variable = _this select 1;
_input = _this select 2;
_inputNames = _input;
_inputEnable = [];
{_inputEnable = _inputEnable + [1]} foreach _input;
if (typename (_input select 0) == "ARRAY") then {
	_inputNames = _input select 1;
	if (count _input > 2) then {_inputEnable = _input select 2} else {_inputEnable = []; {_inputEnable = _inputEnable + [1]} foreach (_input select 0)};
	if (count _input > 3) then {_submenu = _input select 3} else {_submenu = _this select 3};
	_input = _input select 0;
};
_expression = _this select 4;
_params = if (count _this > 5) then {_this select 5} else {""};
_displayShortcuts = if (count _this > 6) then {_this select 6} else {true};

_input_count = count _input;
_input_start = 0;
_input_page = 0;
_input_end = _input_start + 8;

//--- All lists
for "_n" from 0 to (ceil (_input_count / 9)) do {
	_array = [[_name,_contextsensitive]];
	_input_start = _input_page * 9;
	_input_end = _input_start + 8;

	//--- Specific page
	for "_i" from _input_start to _input_end do {
		if (_i >= _input_count) exitwith {
			call compile format ["%1_%2 = _array;",_variable,_input_page];
			breakto "main";
		};
		_item = _input select _i;
		_itemName = _inputNames select _i;
		_itemEnable = str (_inputEnable select _i);
		_itemShortcut = if (_displayShortcuts) then {_i + 2 - _input_start} else {0};
		private ["_item_submenu"];
		if (typename _submenu == "ARRAY") then {_item_submenu = _submenu select _i}else{_item_submenu = ""};
		_array = _array + [[_itemName, [_itemShortcut], _item_submenu, -5, [["expression", format [_expression,_item,_i,_params]]], "1", _itemEnable]];
	};

	//--- Listing options
	if ((_input_end - _input_start) >= 8) then {
		_itemShortcut = if (_displayShortcuts) then {11} else {0};
		_array = _array + [[localize "STR_MORE_MENU", [_itemShortcut], format ["#USER:%1_%2",_variable,_input_page + 1], -5, [["expression", ""]], "1", "1"]];

	};
	//_array = _array + [["", actionKeys "menuback", "", -5, [["expression", ""]], "1", "1"]];

	call compile format ["%1_%2 = _array;",_variable,_input_page];

	_input_page = _input_page + 1;
};

true;