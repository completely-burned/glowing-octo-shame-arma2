#define __A2OA__

/*
 * Функция вызывает подкрепление.
 * TODO: Рефакторинг.
 */

diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] %1", _this];

private["_side","_b","_run","_uav","_grp1","_types","_SafePosParams",
	"_players","_groups","_units","_vehicles","_crew","_cargo","_reweapon",
	"_skill",
	"_pos_resp","_pos","_typeList","_patrol","_dir","_n"];

_side = _this select 0;
_skill = gosa_ai_skill;

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
_arr = (gosa_Groups_common select _n);
_arr0 = [_arr];
_arr1 = [count (_arr select 1)];

if ([daytime - 1] call gosa_fnc_isNight) then {
	_arr = (gosa_Groups_Night select _n);
	_arr0 set [count _arr0, _arr];
	_arr1 set [count _arr1, count (_arr select 1)];
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
		false,
		_SafePosParams select 9
	];
	if (_patrol)then{
		_SafePosParams set [1,((_SafePosParams select 1) * 2)];
	};
	_pos_resp = _arr call gosa_fnc_findSafePos;
	if (count _pos_resp < 1) exitWith {
		diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] _pos_resp isNil ", nil];
	};

	_groups = ([_pos_resp, _side, _grp1 select 0] call gosa_fnc_spawnGroup);

	_units = []; _vehicles=[]; _crew = []; _cargo=[];
	{
		private ["_grp"];
		_grp = _x;
		if(_patrol)then{
			_grp setVariable ["patrol", true, true];
		};
		{
			_units set [count _units, _x];
			private ["_veh"];
			_veh = vehicle _x;
			if(_veh != _x)then{
				_crew set [count _crew, _x];
				if!(_veh in _vehicles)then{
					_vehicles set [count _vehicles, _veh];
				};
			}else{
				_cargo set [count _cargo, _x];
				#ifdef __ARMA3__
					// ИИ застревают в полусогнутом состоянии, в анимации перетаскивания раненого.
					_x switchMove "";
				#endif
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
	};

	{_x setVariable ["grp_created",true,true]}forEach _groups;
