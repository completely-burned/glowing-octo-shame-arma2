﻿diag_log format ["Log: [gosa_fnc_findSafePos] %1", _this];
// diag_log format ["gosa_fnc_findSafePos.sqf 1, %1", time];

private ["_pos","_safe_dist","_max_radius","_objDist","_waterMode","_maxGradient",
	"_shoreMode","_blacklist","_side","_posX","_posY","_radius","_attempts","_nearRoads",
	"_allowPos","_testPos","_preferRoads","_tmp_dir","_tmp_radius","_run_timer",
	"_max_square","_square","_max_attempt","_branchesRoads","_roads","_branchRoad",
	"_roadSize","_square_step","_r","_start_radius","_start_square","_dir_s",
	"_withinMap","_z"];


_run_timer = time;


_pos = _this select 0; // центр поиска
_safe_dist = _this select 1; // дистанция до игроков
_max_radius = _this select 2; // максимальный радиус поиска
_objDist = _this select 3;
_waterMode = _this select 4;
_maxGradient = _this select 5;
_shoreMode = _this select 6;

if (_shoreMode == 0) then {_shoreMode = false} else {_shoreMode = true};
_blacklist = [];
if ((count _this) > 7) then {
	_blacklist = _this select 7;
};

if ((count _pos) == 0) then {
	_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor");
};

if (_max_radius == -1) then {
	_max_radius = getNumber(configFile >> "CfgWorlds" >> worldName >> "safePositionRadius");
};

_preferRoads = (_this select 9 select 0);
if ((count _this) > 10) then {
	_side = _this select 10;
};

if ((count _this) > 11 && {count (_this select 11) > 0}) then {
	_dir_s = _this select 11;
};

if ((count _this) > 12 && {!isNil {_this select 12}}) then {
	_withinMap = _this select 12;
}else{
	_withinMap = false;
};

_posX = _pos select 0;
_posY = _pos select 1;

_allowPos = false;

//--- максимальное количество попыток
// катера не находят места на суше для такого нужно ограничение попыток
// в случае неудачи обычно функция вызывается с другим типом группы
_max_attempt = 1000; // TODO: лучше передавать максимальное количество попыток при вызове функции

// искать нужно сразу по достаточной площади
_start_radius = 1250;

//--- площадь круга
_max_square = pi * (_max_radius^2); // максимальная площадь
//_base = 2*pi*_max_radius; // основание круга
//_max_square = 0.5*_base*_max_radius; // площадь круга

_start_square = pi * (_start_radius^2);

//--- шаг изменения площади
_square_step = (_max_square-_start_square)/_max_attempt;

//--- находим развилки дорог
_branchesRoads = [];
if(_preferRoads)then{
	//if(isNil{CivilianLocation getVariable "_var_gosa_branchesRoads"})then{
		_nearRoads = (_pos nearRoads 500);
		if(count _nearRoads > 0)then{
			_branchesRoads = [_nearRoads call BIS_fnc_selectRandom, 150] call gosa_fnc_roads;
		};
		//CivilianLocation setVariable ["_var_gosa_branchesRoads", _branchesRoads];
	//}else{
	//	_branchesRoads = CivilianLocation getVariable "_var_gosa_branchesRoads";
	//};
};

// минимальное количество частей дороги 2, для верного направления
_roadSize = (_this select 9 select 1) max 2;

_attempts = 1;

while {!_allowPos} do {

	if(_attempts >= _max_attempt)exitWith{
		diag_log format ["Log: [gosa_fnc_findSafePos] попытки закончились", nil];
		_r = [];
	};

	_allowPos=true;

	// кучнее ии, площадь поиска этой попытки
	_square = (_square_step*_attempts)+_start_square;
	 // максимальный радиус поиска этой попытки, нет смысла искать точно в центре
	_radius = (sqrt(_square/pi)) max _objDist;

	diag_log format ["Log: [gosa_fnc_findSafePos] попытка %1 из %4, площадь %2, радиус %3", _attempts, _square, _radius, _max_attempt];

	//--- выбираем участки дорог
	_roads = [];
	if(count _branchesRoads > 0)then{
		_branchRoad = _branchesRoads call BIS_fnc_selectRandom; // TODO: части дорог и количество попыток не верно взаимосвязаны

		if(count _branchRoad >= _roadSize)then {
			private ["_start"];
			_start = random (count _branchRoad - _roadSize);
			for "_i" from _start to (_start + _roadSize - 1) do {
				_roads set [count _roads, _branchRoad select _i];
			};
		};
	};

	//--- позиция
	if(count _roads < _roadSize)then{
		if (isNil {_dir_s}) then {
			_tmp_dir = random 360;
		}else{
			/*
				Я плохой математик, но на пример.
				Возмем квадратный корень 180
				180^0.5 = 13,416407865
				13,416407865^2 = 180
				если взять его половину 6,708203932 в степени ^2
				6,708203932^2 = 45
				т.е. будет меньше 180/2 = 90
				в итоге
				рандомное число из 13,416407865 можно возводить в степень ^2
				получая значения ближе к нулю чаще чем к 180
			*/

			_z = 180^(1/(_dir_s select 1)); // FIXME: sqrt
			diag_log format ["Log: [gosa_fnc_findSafePos] dir %1", _z];

			//_z = ((random (_z*2)) - _z);
			_z = random _z;
			diag_log format ["Log: [gosa_fnc_findSafePos] dir %1", _z];

			_z = _z ^ (_dir_s select 1);
			diag_log format ["Log: [gosa_fnc_findSafePos] dir %1", _z];

			if (random 10 < 5) then {
				_tmp_dir = (_dir_s select 0) + _z;
			} else {
				_tmp_dir = (_dir_s select 0) - _z;
			};
			diag_log format ["Log: [gosa_fnc_findSafePos] dir %1", [_dir_s select 0, _tmp_dir]];
		};
		_tmp_radius = random _radius;
		_testPos = [_posX + _tmp_radius*sin _tmp_dir, _posY + _tmp_radius*cos _tmp_dir];
		if (_withinMap) then {
			if !(_testPos call gosa_fnc_withinMap) then {
				_allowPos = false;
			};
		};
		_roads = [];
	}else{
		_testPos = getPos (_roads select 0);
	};

	//--- проверка присутствия игроков рядом
	if(_allowPos)then{
		if([_testPos, _safe_dist] call gosa_fnc_CheckPlayersDistance)then{
			_allowPos = false;
		};
	};

	//--- проверка присутствия вражеских групп рядом
	if(count _this > 10)then {
		if(_allowPos)then {
			ScopeName "CheckForEnemy";
			{
				private "_leader";
				_leader = leader _x;
				if (alive _leader) then {
					if (( side _x getFriend _side) < 0.6 ) then {
						if ((vehicle leader _x distance _testPos) < (_safe_dist min _start_radius))then {
							_allowPos = false;
							BreakTo "CheckForEnemy";
						};
					};
				};
			} forEach allGroups;
		};
		// if(!_allowPos)then {
			// if ([_testPos, _safe_dist min 750, _side] call gosa_fnc_CheckCombatNearUnits ) then {
				// _allowPos = true;
			// };
		// };
	};

	//--- проверка черного списка
	if(_allowPos)then{
		if([_testPos, _blacklist] call BIS_fnc_isPosBlacklisted)then{
			_allowPos = false;
		};
	};

	//--- проверка позиции на отсутствия лишних объектов и наклона
	if(_allowPos)then{
		if(count _roads == 0)then{
			_testPos = (_testPos isFlatEmpty [_objDist, -1, _maxGradient, _objDist, _waterMode, _shoreMode, objNull]);
			if(count _testPos == 0)then {_allowPos=false};
		};
	};

	if(_allowPos)then{
		_r = [_testPos, _roads];
	};

	_attempts = _attempts + 1;

};

diag_log format ["gosa_fnc_findSafePos.sqf time %1", time - _run_timer];
diag_log format ["gosa_fnc_findSafePos.sqf %1", [_testPos, _roads]];

_r;
