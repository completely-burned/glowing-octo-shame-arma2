/*
 * Генерирует отказоустойчивую группу для возрождения игрока.
 * TODO: Рефакторинг.
 * Arg [side, side number, townpos]
 */
diag_log format ["Log: [fnc_failoverGroup] %1", _this];

private ["_side","_grp1","_types","_SafePosParams","_pos_resp","_pos","_n",
	"_arr","_arr0","_arr1","_typeList","_groups","_n0","_arr2","_arr3"];

_side = (_this select 0);
_pos = (_this select 2);

// TODO: Необходимо заранее генерировать список отказоустойчивых групп,
// и прочих групп тоже.
// Side number.
_n = (_this select 1);

_arr0 = gosa_Groups_common select _n select 0;
_arr1 = gosa_Groups_common select _n select 1;

// TODO: Изменения производить в отдельной функции.
if ([daytime - 1] call gosa_fnc_isNight) then {
	#ifdef __ARMA3__
		_arr0 append (gosa_Groups_Night select _n select 0);
		_arr1 append (gosa_Groups_Night select _n select 1);
	#else 
		_arr0 = _arr0 + (gosa_Groups_Night select _n select 0);
		_arr1 = _arr1 + (gosa_Groups_Night select _n select 1);
	#endif
};

// Копия, потому что значения изменяются в дальнейшем.
_arr1 = + _arr1;
//-- Изменения неподходящих отрядов.
//- Не могут действовать ночью. Например самолёты времён ww2.
if ([daytime - 1] call gosa_fnc_isNight) then {
	for "_i" from 0 to (count _arr0 -1) do {
			_arr = _arr0 select _i select 0 select 0 select 0;
			if ("Air" in ([_arr] call gosa_fnc_getGroupTypeCount select 0)) then {
				if (({_x call gosa_fnc_canSee <= 5} count _arr) >= 
					(count _arr * 0.9)) then
				{
					_n0 = (_arr1 select _i) / 20;
					diag_log format ["Log: [fnc_failoverGroup] %1 set %2", _arr, [_arr1 select _i, _n0]];
					_arr1 set [_i, _n0];
				};
			};
		};
};

_typeList = [_arr0, _arr1];
[_typeList, [
		[["Air"], 0],
		[["Ship"], 0],
		[["StaticWeapon"], 0]
	]
] call gosa_fnc_groupsRarity;

// Убираем юнитов из DLC.
// TODO: Разрешить dlc если нет альтернативы.
#ifdef __ARMA3__
_arr2 = [];
_arr3 = [];
for "_i" from 0 to (count _arr0 -1) do {
	_arr = _arr0 select _i select 0 select 0 select 0;
	_n0 = ({getAssetDLCInfo [_x] select 1} count _arr);
	if (_n0 <= 0) then {
		_n0 = (_arr1 select _i) / 100;
		diag_log format ["Log: [fnc_failoverGroup] dlc, %1 set %2", _arr, [_arr1 select _i, _n0]];
		_arr1 set [_i, _n0];
	}else{
		if (_n0 < count _arr) then {
			_n0 = (count _arr / _n0);
			_n0 = (_arr1 select _i) / (_n0 * 2);
			diag_log format ["Log: [fnc_failoverGroup] dlc, %1 set %2", _arr, [_arr1 select _i, _n0]];
			_arr1 set [_i, _n0];
		}else{
			_arr2 pushBack (_arr0 select _i);
			_arr3 pushBack (_arr1 select _i);
		};
	};
};
if (count _arr3 > 0) then {
	diag_log format ["Log: [fnc_failoverGroup] dlc, count _arr3 %1", count _arr3];
	_typeList = [_arr2, _arr3];
};
#endif

// TODO: Проверка Weighted > 0.
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

if (count _pos_resp <= 0) exitWith {
	diag_log format ["Log: [fnc_failoverGroup] _pos_resp %1", _pos_resp];
	diag_log format ["Log: [fnc_failoverGroup] Законцились попытки поиска позиции для размещения отряда %1", _types];
	_types
};

_groups = ([_pos_resp, _side, _grp1 select 0] call gosa_fnc_spawnGroup);
for "_i" from 0 to (count _groups - 1) do {
	_groups select _i setVariable ["grp_created", true, true];
};

diag_log format ["Log: [fnc_failoverGroup] %1 created", _groups];
gosa_player_needs_revival = nil;
