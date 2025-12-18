#define __A2OA__

/*
 * Функция вызывает подкрепление.
 * TODO: Рефакторинг.
 */

diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] %1", _this];

private["_side","_b","_run","_uav","_grp1","_types","_SafePosParams","_obj",
	"_players","_groups","_units","_vehicles","_crew","_cargo","_reweapon",
	"_skill","_grp","_veh","_var_grp_ready","_var_grp_ready_compat",
	"_positions_static","_withinMap","_grp_current",
	"_pos_resp","_pos","_typeList","_patrol","_dir","_n"];

_side = _this select 0;
_skill = gosa_ai_skill;

_var_grp_ready = "gosa_grp_ready";
_var_grp_ready_compat = "grp_created";

#ifdef __A2OA__
if(count _this > 1 && {!isNull(_this select 1)})then
#else
if(count _this > 1 && (!isNull(_this select 1)))then
#endif
{
	if (typeName (_this select 1) == typeName objNull) then {
		_pos = getPos (_this select 1);
		_players = [_this select 1];
	} else {
	if(isMultiplayer)then{
		_players = ([] call gosa_fnc_listPlayers);
	}else{
		_players = [player];
	};
	if (count _players > 0) then {
		_pos = getPos (_players call BIS_fnc_selectRandom);
	}else{
		_pos = civilianBasePos;
	};
	};
	_patrol = true;
}else{
	_pos = civilianBasePos;
	_patrol = false;
	//_typeList=GroupsAll;
};

diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] _patrol %1", _patrol];

_n = daytime-1;
_b = ([_n] call gosa_fnc_isNight);

_n = (_side call gosa_fnc_getSideNum);
diag_log format ["Log: [gosa_fnc_call_reinforcement] %2 fnc_getSideNum = %1", _n, _side];
if (_n < 0 or _n > 2) exitWith {};

//-- Типы отрядов.
// Копия, потому что значения изменяются в дальнейшем.
_arr = [gosa_Groups_common select _n select 0, +(gosa_Groups_common select _n select 1)];
_arr0 = [_arr];
_arr1 = [count (_arr select 1)];

// TODO: Изменения производить в отдельной функции.
if ([daytime - 1] call gosa_fnc_isNight) then {
	_arr = [gosa_Groups_Night select _n select 0, +(gosa_Groups_Night select _n select 1)];
	_arr0 set [count _arr0, _arr];
	_arr1 set [count _arr1, count (_arr select 1)];
};

//-- Изменения неподходящих отрядов.
//- Не могут действовать ночью. Например самолёты времён ww2.
if ([daytime - 1] call gosa_fnc_isNight) then {
	for "_i" from 0 to (count _arr0 -1) do {
		for "_i0" from 0 to (count (_arr0 select _i select 0) -1) do {
			_arr = _arr0 select _i select 0 select _i0;
			if ("Air" in ([_arr select 0 select 0 select 0] call gosa_fnc_getGroupTypeCount select 0)) then {
				_n = (_arr0 select _i select 1 select _i0) / 20;
				_arr0 select _i select 1 set [_i0, _n];
			};
		};
	};
};

//- Учёт присутствующих отрядов.
if (count _this > 3) then {
	_grp_current = _this select 3;
	_n = count (_grp_current select 0) + count (_grp_current select 1);
	if (_n < 10) then {
		for "_i" from 0 to (count _arr0 -1) do {
			for "_i0" from 0 to (count (_arr0 select _i select 0) -1) do {
				_arr = _arr0 select _i select 0 select _i0;
				_arr = ([_arr select 0 select 0 select 0] call gosa_fnc_getGroupTypeCount select 0);

				if ("SUPPORT" in _arr) then {
					_n = 0;
					_arr0 select _i select 1 set [_i0, _n];
				};
				if ("Frigate" in _arr) then {
					_n = 0;
					_arr0 select _i select 1 set [_i0, _n];
				};
				if ("Artillery" in _arr) then {
					_n = 0;
					_arr0 select _i select 1 set [_i0, _n];
				};
				if ("Loiter" in _arr) then {
					_n = 0;
					_arr0 select _i select 1 set [_i0, _n];
				};
				if ("LCVP" in _arr) then {
					_n = 0;
					_arr0 select _i select 1 set [_i0, _n];
				};
				if ("UAV" in _arr) then {
					_n = 0;
					_arr0 select _i select 1 set [_i0, _n];
				};
				if ("StaticWeapon" in _arr) then {
					_n = 0;
					_arr0 select _i select 1 set [_i0, _n];
				};
				if ("Ship" in _arr) then {
					_n = 0;
					_arr0 select _i select 1 set [_i0, _n];
				};
				if ("Air" in _arr) then {
					_n = 0;
					_arr0 select _i select 1 set [_i0, _n];
				};
			};
		};
	};
};


_typeList = ([_arr0, _arr1] call gosa_fnc_selectRandomWeighted);

if (isNil "_typeList") exitWith {
	diag_log format ["Log: [while_patrols.sqf] isNil _typeList", nil];
};


#ifdef __A2OA__
if(!_patrol && count _this > 2 && {count (_this select 2) > 0})then
#else
if(!_patrol && count _this > 2 && (count (_this select 2) > 0))then
#endif
{
	_dir = _this select 2;
}else{
	_dir = [];
};

diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] count _typeList %1", count _typeList];

_grp1 = (_typeList call gosa_fnc_selectRandomWeighted);
_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;

_uav = false;
_uav = ([_types, ["UAV"]] call gosa_fnc_CheckIsKindOfArray);
if({getNumber (LIB_cfgVeh >> _x >> "isUav") == 1} count _types > 0)then{
	_uav = true;
};
if(_uav)then{
	_patrol = true;
};

_b = ([_types, ["StaticWeapon"]] call gosa_fnc_CheckIsKindOfArray);
if(_b)then{
	_pos = civilianBasePos;
	_patrol = false;
};

if (_pos call gosa_fnc_isZeroPos) exitWith {
		diag_log format ["gosa_fnc_call_reinforcement.sqf _pos = [0,0] _players = %1 ", _players];
};


if (missionNamespace getVariable "gosa_rearmament" > 0) then {
	_reweapon = true;
}else{
	_reweapon = false;
};

	#ifndef __ARMA3__
	if (_reweapon) then {
		// Замена типа некоторых юнитов.
		// TODO: Нужна отдельная функция.
		_types = [_types] call gosa_fnc_reweapon;
	};
	#endif

	_SafePosParams = ([_types] call gosa_fnc_SafePosParams_v2);
	_withinMap = if (_SafePosParams select 10 && (missionNamespace getVariable "gosa_aiSpawnInMap" > 0)) then {true} else {false};
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
		_dir,
		_withinMap,
		_SafePosParams select 9
	];
	if (_patrol)then{
		_SafePosParams set [1,((_SafePosParams select 1) * 2)];
	};
	// TODO: Нужна более лучшая функция.
	_pos_resp = _arr call gosa_fnc_findSafePos;
	if (count _pos_resp < 1) exitWith {
		diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] _pos_resp isNil ", nil];
	};

	if ({_x isKindOf "SPE_FlaK_36"} count _types > 0) then {
		_positions_static = [_pos_resp select 0, _SafePosParams select 1, _types, _SafePosParams select 0]
			call gosa_fnc_find_pos_static;
		_groups = ([_pos_resp, _side, _grp1 select 0, _positions_static] call gosa_fnc_spawnGroup);
	}else{
	_groups = ([_pos_resp, _side, _grp1 select 0] call gosa_fnc_spawnGroup);
	};

	// TODO: Получать эти данные сразу из fnc_spawnGroup.
	_units = []; _vehicles=[]; _crew = []; _cargo=[];
	{
		_grp = _x;
		if(_patrol)then{
			_grp setVariable ["patrol", true, true];
		};
		{
			_units set [count _units, _x];
			_veh = vehicle _x;
			if(_veh != _x)then{
				_crew set [count _crew, _x];
				if!(_veh in _vehicles)then{
					_vehicles set [count _vehicles, _veh];
				};
			}else{
				_cargo set [count _cargo, _x];
			};
		}forEach units _grp;

	}forEach _groups;

	{
		if (_skill >= 0) then {
			_x setSkill _skill;
		};
		_x call gosa_fnc_vehInit;
	} foreach _units + _vehicles;

	#ifndef __ARMA3__
	if (_reweapon) then {
		[_units + _vehicles] call gosa_fnc_reweapon;
	};
	#endif

	if (count _vehicles > 0) then {
		// посадить в багажное отделение
		[_vehicles, _cargo] call gosa_fnc_MoveInCargo;

		// Vehicle in Vehicle Transport.
		#ifdef __ARMA3__
			{
				_obj = _x;
				{
					if (_obj canVehicleCargo _x select 0 && _obj != _x && isNull isVehicleCargo _obj) then {
						diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] %1 setVehicleCargo %2", _obj, _x];
						_obj setVehicleCargo _x;
					};
				} forEach _vehicles;
			} forEach _vehicles;
		#endif
	};

	// Чтобы отличать от чужого контента.
	for "_i" from 0 to (count _units) do {
		_units select _i setVariable ["gosa", true, true];
	};
	for "_i" from 0 to (count _vehicles) do {
		_vehicles select _i setVariable ["gosa", true, true];
	};

	#ifdef __ARMA3__
		for "_i" from 0 to (count _units) do {
			if (vehicle (_units select _i) isEqualTo (_units select _i)) then {
				// ИИ застревают в полусогнутом состоянии, в анимации перетаскивания раненого, "acinpknlmstpsraswrfldnon".
				(_units select _i) switchMove "";
			};
		};

		{
			_x addCuratorEditableObjects [_units+_vehicles, true];
		} forEach allCurators;
	#endif

for "_i" from 0 to (count _groups) do {
	_groups select _i setVariable ["grp_created", true, true];
	_groups select _i setVariable ["gosa_grp_ready", true, true];
	diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] %1 готова", _groups select _i];
};
