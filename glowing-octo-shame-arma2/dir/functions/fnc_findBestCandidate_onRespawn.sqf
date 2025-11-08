
private ["_bestCandidate","_grp","_sides_friendly","_pos",
	"_sorted","_subordinate",
	"_obj","_arr","_units","_listPlayers","_b","_count"];

_grp = _this select 0;
_sides_friendly = _this select 1;
_pos = _this select 2;

_subordinate = if (1001 in gosa_squadOnW) then {true} else {false};

scopename "root";
if (true) then {
	_arr = [];
	scopename "fb1";

	// Ищем новое тело из юнитов группы игрока т.к. они находятся рядом.
	diag_log format ["Log: [respawnRandom] поиск среди юнитов группы игрока %1", _grp];
	_obj = leader _grp;
	if (_subordinate or (_obj call gosa_fnc_isPlayer && _obj != player)) then {
		_arr = ([units _grp] call gosa_fnc_sortUnits_onWeapon);
		for "_i0" from 0 to 2 do {
			_units = ([_arr select _i0] call gosa_fnc_sortUnits_onRank);
			for "_i" from (count _units -1) to 0 step -1 do {
				_obj = _units select _i;
				if (_obj call gosa_fnc_selectPlayer_isFit) then {
					_bestCandidate = _obj;
					breakTo "root";
				};
			};
		};
	}else{
		_units = ([units _grp] call gosa_fnc_sortUnits_onRank);
		for "_i" from 0 to (count _units -1) do {
			_obj = _units select _i;
			if (_obj call gosa_fnc_selectPlayer_isFit) then {
				_bestCandidate = _obj;
				breakTo "root";
			};
		};
	};

	_listPlayers = call gosa_fnc_listPlayers;
	_count = count _listPlayers;
	//--- подключение к конкретному игроку
	if (count gosa_squadOn > 0) then {
		for "_i1" from 0 to (_count -1) do {
			_obj = (_listPlayers select _i1);
			if (_obj call gosa_fnc_isPlayer &&
				getPlayerUID _obj in gosa_squadOn) then
			{
				diag_log format ["Log: [respawnRandom] ищем среди юнитов игрока %1", _obj];
				_arr = ([units _obj] call gosa_fnc_sortUnits_onWeapon);
				for "_i0" from 0 to 2 do {
					_units = ([_arr select _i0] call gosa_fnc_sortUnits_onRank);
					for "_i" from (count _units -1) to 0 step -1 do {
						_obj = _units select _i;
						if (_obj call gosa_fnc_selectPlayer_isFit) then {
							_bestCandidate = _obj;
							breakTo "root";
						};
					};
				};
			};
		};
	};


	// ищем группу с игроками и подключаем игрока к группе для кооперации
	_b = true;
	if (typeName gosa_SquadRole == typeName 0) then {
		if (gosa_SquadRole == -1) then {
			_b = false;
		};
	};
	if (_b) then {
		for "_i1" from 0 to (_count -1) do {
			_grp = group (_listPlayers select _i1);
			if (side _grp in _sides_friendly) then {
				_arr = units _grp;
				_n = (_count / 2 + random _count);
				// в группе с большим количеством игроков не интересно (корень количества игроков)
				// TODO: нужно предоставить выбор игрокам
				if (sqrt _n > {_x call gosa_fnc_isPlayer} count _arr) then {
					diag_log format ["Log: [respawnRandom] ищем среди групп с игроками %1", _grp];
					_units = ([_arr] call gosa_fnc_sortUnits_onRank);
					for "_i" from (count _units -1) to 0 step -1 do {
						_obj = _units select _i;
						if (_obj call gosa_fnc_selectPlayer_isFit) then {
							_bestCandidate = _obj;
							breakTo "root";
						};
					};
				};
			};
		};
	};

	_sorted = ([allGroups, _sides_friendly] call gosa_fnc_sortGroups);
	_count = count _sorted;

	// Игрок не хочет командовать.
	if (_subordinate) then {
		for "_i1" from 0 to (_count -1) do {
			_arr = _sorted select _i1;
			diag_log format ["Log: [respawnRandom] ищем среди остальных групп %1", _arr];
			for "_i0" from 2 to 4 do {
				_units = ([_arr select _i0] call gosa_fnc_sortUnits_onRank);
				for "_i" from (count _units -1) to 0 step -1 do {
					_obj = _units select _i;
					if (_obj call gosa_fnc_selectPlayer_isFit) then {
						_bestCandidate = _obj;
						breakTo "root";
					};
				};
			};
		};
	}else{
		_arr resize 0;
		// Игрокам лучше дать контроль над отрядом.
		for "_i" from 0 to (_count -1) do {
			_grp = (_sorted select _i select 0);
			diag_log format ["Log: [respawnRandom] Ищем подчинённых среди групп %1", _grp];
			_obj = leader _grp;
			if (_obj call gosa_fnc_selectPlayer_isFit) then {
				_arr set [count _arr, _obj];
			};
		};
		_units = ([_arr, _pos] call gosa_fnc_sortObjects_onDist);
		for "_i" from 0 to (count _units -1) do {
			_obj = (_units select _i);
			if (_obj call gosa_fnc_selectPlayer_isFit) then {
				_bestCandidate = _obj;
				breakTo "root";
			};			
		};
	};

	// Ищем тело среди всех юнитов.
	// FIXME: Возможно следует выбирать тело случайным образом?
	for "_i1" from 0 to (_count -1) do {
		_arr = _sorted select _i1;
		for "_i0" from 2 to 4 do {
			_units = ([_arr select _i0] call gosa_fnc_sortUnits_onRank);
			for "_i" from 0 to (count _units -1) do {
				_obj = _units select _i;
				if (_obj call gosa_fnc_selectPlayer_isFit) then {
					_bestCandidate = _obj;
					breakTo "root";
				};
			};
		};
	};
};

if (isNil "_bestCandidate") then {
	nil;
} else {
	_bestCandidate;
};
