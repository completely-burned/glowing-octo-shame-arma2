#define __A2OA__

diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] %1", _this];

private["_side","_z","_run","_uav","_grp1","_types","_SafePosParams","_pos_resp","_pos","_typeList","_patrol","_dir"];
if(count _this > 0)then{
		_side = _this select 0;
}else{
		//_side = [east,west,resistance] call BIS_fnc_selectRandom;
		_side = [[east,west,resistance],[0.5,0.5,0.5]] call BIS_fnc_selectRandomWeighted;
};

#ifdef __A2OA__
if(count _this > 1 && {!isNull(_this select 1)})then
#else
if(count _this > 1 && (!isNull(_this select 1)))then
#endif
{
	private ["_players"];
	if (typeName (_this select 1) == typeName objNull) then {
		_pos = getPos (_this select 1);
		_players = [_this select 1];
	} else {
	if(isMultiplayer)then{
		_players = ([] call BIS_fnc_listPlayers);
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

if(_patrol)then{
	switch (_side) do {
		case (east):
		{
			_typeList=AllGroupsEast;
		};
		case (west):
		{
			_typeList=AllGroupsWest;
		};
		case (resistance):
		{
			_typeList=AllGroupsGuer;
		};
		default {};
	};
}else{
	switch (_side) do {
		case (east):
		{
			if (isNil "LocationAllGroupsEast") then {
				_typeList=AllGroupsEast;
			} else {
				_typeList=LocationAllGroupsEast;
			};
		};
		case (west):
		{
			if (isNil "LocationAllGroupsWest") then {
				_typeList=AllGroupsWest;
			} else {
				_typeList=LocationAllGroupsWest;
			};
		};
		case (resistance):
		{
			if (isNil "LocationAllGroupsGuer") then {
				_typeList=AllGroupsGuer;
			} else {
				_typeList=LocationAllGroupsGuer;
			};
		};
		default {};
	};
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

if (isNil "_typeList") exitWith {
		diag_log format ["Log: [while_patrols.sqf] isNil _typeList", nil];
};
_grp1 = (_typeList call BIS_fnc_selectRandomWeighted);
_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;

_uav = false;
_uav = ([_types, ["UAV"]] call gosa_fnc_CheckIsKindOfArray);
if({getNumber (LIB_cfgVeh >> _x >> "isUav") == 1} count _types > 0)then{
	_uav = true;
};
if(_uav)then{
	_patrol = true;
};

_z = ([_types, ["StaticWeapon"]] call gosa_fnc_CheckIsKindOfArray);
if(_z)then{
	_pos = civilianBasePos;
	_patrol = false;
};


_run = true;

if (_pos call gosa_fnc_isZeroPos) then {
		diag_log format ["gosa_fnc_call_reinforcement.sqf _pos = [0,0] _players = %1 ", _players];
	_run = false;
};

if(_run)then{

	#ifndef __ARMA3__
	if (missionNamespace getVariable "gosa_rearmament" == 1) then {
		_types = [_types] call gosa_fnc_reweapon;
	};
	#endif

	_SafePosParams = ([_types] call gosa_fnc_SafePosParams);

	if (_patrol)then{
		_SafePosParams set [1,((_SafePosParams select 1) * 2)];
	};

	_pos_resp = ([_pos]+_SafePosParams+[_side]+[_dir] call gosa_fnc_findSafePos);
	if(count _pos_resp == 0)exitWith{
		diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] _pos_resp isNil ", nil];
		grpNull
	};

	private["_groups"];
	_groups = ([_pos_resp, _side, _grp1 select 0] call gosa_fnc_spawnGroup);

	private ["_units","_vehicles","_crew","_cargo"];
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
			};
		}forEach units _grp;

		// _grp enableIRLasers true;
		// _grp enableGunLights true;

	}forEach _groups;

	private["_cargo2"];
	_cargo2 = _cargo - (units (_groups select 0));

	{
		if (m_skill >= 0) then {
			_x setSkill m_skill;
		};
		_x call gosa_fnc_vehInit;
		// _x enableAI "TARGET";
		// _x enableAI "AUTOTARGET";
		// _x disableAI "FSM";
	} foreach _units + _vehicles;

	#ifndef __ARMA3__
	if (missionNamespace getVariable "gosa_rearmament" == 1) then {
		[_units + _vehicles] call gosa_fnc_reweapon;
	};
	#endif

	//выставить skill в зависимости от ранга
	// _units call gosa_fnc_RankToSkill;
	if (count _vehicles > 0) then {
		// посадить в багажное отделение
		[_vehicles, _cargo] call gosa_fnc_MoveInCargo;
	};

	{_x setVariable ["grp_created",true,true]}forEach _groups;

	_groups;
}else{
	grpNull;
};
