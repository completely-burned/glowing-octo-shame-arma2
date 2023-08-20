/*
 * Сортировка групп по приоритетам игрока.
 */
private ["_arr","_sides_friendly","_pre","_grp","_sorted","_s"];

// Подготовка.
// groups
_arr = _this select 0;
_sides_friendly  = _this select 1;

_pre = [];
for "_i" from 0 to (count _arr -1) do {
	_grp = _arr select _i;
	if (side _grp in _sides_friendly) then {
		_pre set [
			count _pre,
			[units _grp, _grp] call gosa_fnc_sortGroupsPre;
		];
	};
};

diag_log format ["Log: [fnc_sortGroups] _pre_sorted %1", _pre];

// Сортировка.
// TODO: Нужна отдельная функция.
_sorted = [];
if (count _pre > 0) then {
	_sorted set [0, _pre select 0];

	for "_i" from 1 to (count _pre -1) do {
		scopeName "sn_gs";
		for "_s" from (count _sorted -1) to 0 step -1 do {
			if (_pre select _i select 1 > (_sorted select _s select 1)) then
			{
				_sorted set [_s+1, _sorted select _s];
				_sorted set [_s, _pre select _i];
			};
			if (_pre select _i select 1 <= (_sorted select _s select 1) && 
				count _sorted - 1 == _s) then
			{
				_sorted set [_s+1, _pre select _i];
				// FIXME: Может подойдет ExitWith?
				breakTo "sn_gs";
			};
		};
	};
};
diag_log format ["Log: [fnc_sortGroups] _sorted %1", _sorted];

_sorted;
