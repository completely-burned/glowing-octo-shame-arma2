scriptName "Functions\arrays\fn_setNestedElement.sqf";
/*
	File: fn_setNestedElement.sqf

	Description:
	Function to set an item in a nested array using a path.
	
	Example:
	_array = [[1, 2], [3, 4]];
	_bool = [_array, [0, 0], 0] call BIS_fnc_setNestedElement; //Expected result: [[0, 2], [3, 4]]

	Parameter(s):
	_this select 0: Array
	_this select 1: path to the element (Array)
	_this select 2: new value (Any Value)
	
	Returns:
	Boolean success flag
*/

private ["_array", "_path", "_value", "_return"];
_array = _this select 0;
_path = _this select 1;
_value = _this select 2;
_return = true;

if ((typeName _array) != (typeName [])) exitWith {debugLog "Log: [setNestedElement] Array (0) should be an Array!"; false};
if ((typeName _path) != (typeName [])) exitWith {debugLog "Log: [setNestedElement] Path (1) should be an Array!"; false};

for "_i" from 0 to ((count _path) - 1) do 
{
	private ["_nextIndex"];
	_nextIndex = _path select _i;
	
	// if ((typeName _array) != (typeName [])) exitWith {_return = false; diag_log "Log: [setNestedElement] One of the elements in the given path is not an Array!"};
	// if (_nextIndex > ((count _array) - 1)) exitWith {_return = false; diag_log "Log: [setNestedElement] One of the elements in the given path is outside the scope of its parent Array!"};

	//See if we reached the target array, in which to set the element.
	if (_i == ((count _path) - 1)) then 
	{
		_array set [_nextIndex, _value];
	} 
	else 
	{
		_array = _array select _nextIndex;
	};
};

_return