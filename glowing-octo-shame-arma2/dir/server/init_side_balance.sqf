/*
 * Баланс сторон.
 * TODO: Должен быть динамичным, с возможностью вкл/выключать стороны после старта.
 */

private [
	"_count",
	"_allDead",
	"_cfgVeh",
	"_obj",
	"_str",
	"_arr",
	"_players_cfi",
	"_players",
	"_problem0",
	"_problem1",
	"_n",
	"_problems",
	"_problems_num",
	"_pvp",
	"_sides",
	"_sides_cfi",
	"_superpowers_rating",
	"_max",
	"_min",
	"_superpower"
];

_cfgVeh = LIB_cfgVeh;
_pvp = false;
_sides = [east, west, resistance];
_players_cfi = [0,0,0];
_allDead = [];
_problems = [];
_problems_num = [];
// В режиме PvE временно всего две стороны конфликта в целях повышения производительности.
// Противники.
_problem0 = [];
// Союзники.
_problem1 = [];
_superpowers_rating = [];


// TODO: Нужно учитывать колличество фракций стороны.
waitUntil {!isNil "gosa_Groups_common"};
_sides_cfi = [[0,1,2], gosa_Groups_common] call gosa_fnc_groups_get_cfi_side;
//_sides_cfi = [1,1,1];

// Рейтинг сторон.
for "_i0" from 0 to (count _sides -1) do {
	_max = 0;
	for "_i" from 0 to (count _sides -1) do {
		if (_sides_cfi select _i >= _max && _sides_cfi select _i > 0) then {
			if !(_i in _superpowers_rating) then {
				_max = _sides_cfi select _i;
				// _superpowers_rating
				_superpower = _i;
			};
		};
	};
	if !(isNil "_superpower") then {
		_superpowers_rating set [count _superpowers_rating,  _superpower];
		_superpower = nil;
	};
};

// В режиме PvP нужно учитывать баланс и доступность.
// TODO: Типы балансов PvP. Равны только две стороны, а остальные смеха ради (1) или отсутсвуют вовсе (2). Все равны (3). Слабые и сильные против средних (4).
if (_pvp) then {
	for "_i" from 0 to (count _superpowers_rating -1) do {
		_problems set [_i, [_sides select (_superpowers_rating select _i)]];
		_problems_num set [_i, [_superpowers_rating select _i]];
	};
};

if (isMultiplayer) then {
		// side игроков ожидающих возрождения == civilian. И countSide не работает.
	#ifdef __ARMA3__
		_allDead = allDead;
		for "_i" from 0 to (count _allDead -1) do {
			_obj = _allDead select _i;
			_str = typeOf _obj;
			_n = getNumber(_cfgVeh >> _str >> "side");
			_count = _players_cfi select _n;
			diag_log format ["Log: [init_side_balance] _allDead %1", [_obj, _str, _n]];
			_players_cfi set [_n, _count +1];
		};
	#endif

	_players = playableUnits;
	for "_i" from 0 to (count _players -1) do {
		if !(isPlayer (_players select _i)) then {_players set [_i, objNull]};
	};
	_players = _players -[objNull];

	for "_i" from 0 to (count _sides -1) do {
		_count = _sides select _i countSide _players;
		_players_cfi set [_i, (_players_cfi select _i) +_count];
	};
	for "_i" from 0 to (count _sides -1) do {
		_count = _players_cfi select _i;
		if (_count > 0) then {
			_problem1 set [count _problem1, _i];
		}else{
			// Проверка на доступность.
			if (_i in _superpowers_rating) then {
				_problem0 set [count _problem0, _i];
			};
		};
	};

	// Если союзные стороны не обнаружены значит игроки еще не подключились или выбран режим наблюдателя.
	if (count _problem1 <= 0) then {
		// TODO: Нужно найти две основные стороны конфликта и распределить остальные.
		diag_log format ["Log: [init_side_balance] _problem1 %1", _problem1];
		failMission "LOSER";
	}else{
		if (count _superpowers_rating < 2) then {
			diag_log format ["Log: [init_side_balance] _superpowers_rating %1", _superpowers_rating];
			failMission "LOSER";
		}else{
			// Негласное голосование выбором слота. Сторона с меньшим количесвом игроков станет противником.
			// TODO: Выбравших её игроков неободимо возвратить к выбору роли, а сторону сделать недоступной для выбора.
			if (count _problem1 == count _superpowers_rating) then {
				_min = 9999999999999;
				for "_i" from 0 to (count _superpowers_rating) do {
					_n = _players_cfi select (_superpowers_rating select _i);
					if (_n <= _min) then {
						_min = _n;
						_problem0 set [count _problem0, _superpowers_rating select _i];
					};
				};
				// Только одна сторона, чтобы не раздражать игроков изгнанием напрасно.
				_problem0 = [_problem0 call gosa_fnc_selectRandom];
			};
		};
	};
}else{
	_players = [player];
	// TODO: Рандомизация.
	if (count _superpowers_rating > 1) then {
		_problem0 set [count _problem0, _superpowers_rating select 0];
		if (count _superpowers_rating > 2) then {
			_problem0 set [count _problem0, _superpowers_rating select 2];
		};
		_problem1 set [count _problem1, _superpowers_rating select 1];
	};
};


if !(_pvp) then {
	_problems_num = [_problem0, _problem1];
	for "_i" from 0 to (count _problems_num -1) do {
		_arr = [];
		_problems set [_i, _arr];
		for "_i0" from 0 to (count (_problems_num select _i) -1) do {
			_arr set [_i0, _sides select (_problems_num select _i select _i0)];
		};
	};

	m_sideEnemy = _problems select 0;
	gosa_friendlyside = _problems select 1;
	publicVariable "m_sideEnemy";
	publicVariable "gosa_friendlyside";
};

_arr = [_sides, _sides_cfi, _superpowers_rating, [_problems, _problems_num], [_players_cfi, _allDead, _players]];
diag_log format ["Log: [init_side_balance] %1", _arr];

_arr;
