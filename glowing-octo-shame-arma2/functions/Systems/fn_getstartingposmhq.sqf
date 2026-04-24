/*
Стартовые позиции MHQ.
*/

private ["_useDefaultStarts", "_names","_return","_item"];

_useDefaultStarts = true;
_names = configfile >> "cfgWorlds" >> WorldName >> "Names";
_return = [];

for "_i" from 0 to (count _names - 1) do
{
	_item = _names Select _i;

	if (IsClass _item) then
	{
		private ["_type","_position"];
		_type = GetText (_item >> "type");

		if (_useDefaultStarts && _type == "FlatArea") then
		{
			_position = GetArray (_item >> "position");
			// _direction = GetNumber (_item >> "angle");

			_return set [count _return, _position];
		};
	};
};

#ifdef __A2OA__
// FIXME: "LocationLogicStart" или "LocationLogicFlat"
{
	_return set [count _return, getPos _x];
} forEach allMissionObjects "LocationLogicStart";
{
	_return set [count _return, getPos _x];
} forEach allMissionObjects "LocationLogicFlat";
#endif

if (count _return < 1) then
{
	_return = [getArray(configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor")];
};

_return;
