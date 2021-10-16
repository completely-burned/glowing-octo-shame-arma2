/*---------------------------------------------------------------------------
поиск позиции для выгрузки вертолета
---------------------------------------------------------------------------*/

private["_r","_hills","_h","_pos","_try_n","_limit","_ok","_radius","_center","_behind_h_dist",
	"_t_dir","_t_pos","_t_pos","_l_enemy","_z"];

_center = _this select 0;
_radius = _this select 1;
_behind_h_dist = _this select 2;

diag_log format ["Log: [fnc_find_heliUnload_pos] start %1", _this];

_hills = nearestLocations [_center, ["Hill"], _radius];

if (count _hills == 0) exitWith {
	[];
};

//--- вражеский центр
	if (count _this > 3) then {
		_l_enemy = []; _z = _this select 3;
		{
			if (_z getFriend side _x < 0.6) then {
				_l_enemy set [count _l_enemy, _x];
			};
		} forEach (_center nearEntities _radius*2);

		_center = _l_enemy call gosa_fnc_centerOfImpact;
		_l_enemy = nil; _z = nil;
	};

_limit = 1000;
_try_n = 1;

_ok = false;
while {!_ok} do {

	if(_try_n >= _limit)exitWith{
		diag_log format ["Log: [fnc_find_heliUnload_pos] попытки закончились", nil];
		_r = [];
	};

	_h = _hills call BIS_fnc_selectRandom;
	_pos = [_center, locationPosition _h, _behind_h_dist] call gosa_fnc_getPosBehind;

	_ok=true;

	//--- позиция тестовая
		_t_dir = random 360; _t_radius = random _behind_h_dist;
		_t_pos = [(_pos select 0) + _t_radius*sin _t_dir, (_pos select 1) + _t_radius*cos _t_dir];

	//--- проверка черного списка
		/*
		if(_ok)then{
			if([_t_pos, _blacklist] call BIS_fnc_isPosBlacklisted)then{
				_ok = false;
				diag_log format ["Log: [fnc_find_heliUnload_pos] попытка %1 из %2, %3, false isPosBlacklisted", _try_n, _limit, [_h,_t_pos]];
			};
		};
		*/

	//--- проверка позиции на отсутствия лишних объектов и наклона
		if(_ok)then{
			if(count (_t_pos isFlatEmpty [50, -1, 0.3, 15]) == 0)then {
				_ok=false;
				diag_log format ["Log: [fnc_find_heliUnload_pos] попытка %1 из %2, %3, false isFlatEmpty", _try_n, _limit, [_h,_t_pos]];
			};
		};

	if(_ok)then{
		_r = _t_pos;
	};

	_try_n = _try_n + 1;

};

diag_log format ["Log: [fnc_find_heliUnload_pos] return %1", _r];
_r;
