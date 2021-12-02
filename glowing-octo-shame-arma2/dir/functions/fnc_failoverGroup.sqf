diag_log format ["Log: [fnc_failoverGroup] %1", _this];

private["_side","_grp1","_types","_SafePosParams","_pos_resp","_pos","_typeList","_groups"];

_side = _this select 0 call BIS_fnc_selectRandom;

diag_log format ["Log: [fnc_failoverGroup] %1", _side];

switch (_side) do {
	case (east):
	{
		_typeList=+AllGroupsEast;
	};
	case (west):
	{
		_typeList=+AllGroupsWest;
	};
	case (resistance):
	{
		_typeList=+AllGroupsGuer;
	};
	default {};
};

[_typeList, [
		[["Air"], 0],
		[["Ship"], 0],
		[["StaticWeapon"], 0]
	]
] call gosa_fnc_groupsRarity;


if (isNil "_typeList") exitWith {
	diag_log format ["Log: [fnc_failoverGroup] isNil _typeList", nil];
};

diag_log format ["Log: [fnc_failoverGroup] count _typeList %1", count _typeList];

_grp1 = (_typeList call BIS_fnc_selectRandomWeighted);
_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;

diag_log format ["Log: [fnc_failoverGroup] _grp1 %1", _grp1];

_pos = civilianBasePos;

_SafePosParams = ([_types] call gosa_fnc_SafePosParams);

_pos_resp = ([_pos]+_SafePosParams+[_side]+[[],true] call gosa_fnc_findSafePos);
if(count _pos_resp == 0)exitWith{
	diag_log format ["Log: [fnc_failoverGroup] isNil _pos_resp", nil];
	grpNull;
};

_groups = ([_pos_resp, _side, _grp1 select 0] call gosa_fnc_spawnGroup);

for "_i" from 0 to (count _groups - 1) do {
	_groups select _i setVariable ["grp_created", true, true];
};

diag_log format ["Log: [fnc_failoverGroup] %1 created", _groups];

gosa_player_needs_revival = nil;
