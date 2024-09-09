/*
 * Генерирует отказоустойчивую группу для возрождения игрока.
 * TODO: Рефакторинг.
 * Arg [side, side number, townpos]
 */
diag_log format ["Log: [fnc_failoverGroup] %1", _this];

private ["_side","_grp1","_types","_SafePosParams","_pos_resp","_pos","_i",
	"_arr","_arr0","_arr1","_typeList","_groups"];

_side = (_this select 0);
_pos = (_this select 2);

// TODO: Необходимо заранее генерировать список отказоустойчивых групп,
// и прочих групп тоже.
// Side number.
_i = (_this select 1);
_arr = (gosa_Groups_common select _i);
_arr0 = [_arr];
_arr1 = [count (_arr select 1)];
if !(isNil "gosa_Groups_Night") then {
if ([daytime - 1] call gosa_fnc_isNight) then {
		// TODO: нужна функция обединяющая Groups_common_Night_Patrol_SUPPORT_Other.
	_arr = (gosa_Groups_Night select _i);
	if !(isNil "_arr") then {
		_arr0 set [count _arr0, _arr];
		_arr1 set [count _arr1, count (_arr select 1)];
	};
	};
};
_arr = ([_arr0, _arr1] call gosa_fnc_selectRandomWeighted);
if (isNil "_arr") then {
	diag_log format ["Log: [fnc_failoverGroup] _typeList isNil", nil];
};
// Нельзя модифицировать основной список групп =+.
_typeList = [_arr select 0, +(_arr select 1)];
[_typeList, [
		[["Air"], 0],
		[["Ship"], 0],
		[["StaticWeapon"], 0]
	]
] call gosa_fnc_groupsRarity;
diag_log format ["Log: [fnc_failoverGroup] count _typeList %1", count _typeList];

_grp1 = (_typeList call gosa_fnc_selectRandomWeighted);
_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;
diag_log format ["Log: [fnc_failoverGroup] _grp1 %1", _grp1];

_SafePosParams = ([_types] call gosa_fnc_SafePosParams_v2);
_arr = [
	_pos,
	_SafePosParams select 0,
	_SafePosParams select 1,
	_SafePosParams select 2,
	_SafePosParams select 3,
	_SafePosParams select 4,
	_SafePosParams select 5,
	_SafePosParams select 6,
	_SafePosParams select 7,
	_SafePosParams select 8,
	_side,
	[],
	true,
	_SafePosParams select 9
];
_pos_resp = _arr call gosa_fnc_findSafePos;

_groups = ([_pos_resp, _side, _grp1 select 0] call gosa_fnc_spawnGroup);
for "_i" from 0 to (count _groups - 1) do {
	_groups select _i setVariable ["grp_created", true, true];
};

diag_log format ["Log: [fnc_failoverGroup] %1 created", _groups];
gosa_player_needs_revival = nil;
