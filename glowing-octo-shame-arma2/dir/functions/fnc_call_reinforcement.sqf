diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] %1", _this];

private["_side"];
if(count _this > 0)then{
		_side = _this select 0;
}else{
		//_side = [east,west,resistance] call BIS_fnc_selectRandom;
		_side = [[east,west,resistance],[0.5,0.5,0.5]] call BIS_fnc_selectRandomWeighted;
};

private["_pos"];
private["_typeList"];
private["_patrol"];
if(count _this > 1)then{
	private ["_players"];
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
			_typeList=LocationAllGroupsEast;
		};
		case (west):
		{
			_typeList=LocationAllGroupsWest;
		};
		case (resistance):
		{
			_typeList=LocationAllGroupsGuer;
		};
		default {};
	};
};

diag_log format ["Log: [gosa_fnc_call_reinforcement.sqf] %1", _typeList];

private["_grp1"];
private["_types"];
private["_SafePosParams"];
private["_pos_resp"];
if (isNil "_typeList") exitWith {
		diag_log format ["Log: [while_patrols.sqf] isNil _typeList", nil];
};
_grp1 = (_typeList call BIS_fnc_selectRandomWeighted);
_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;

private["_run"];
_run = true;

if (_pos distance [0,0] < 1) then {
		diag_log format ["gosa_fnc_call_reinforcement.sqf _pos = [0,0] _players = %1 ", _players];
	_run = false;
};

if(_run)then{
	_SafePosParams = ([_types] call gosa_fnc_SafePosParams);

	if (_patrol)then{
		_SafePosParams set [1,((_SafePosParams select 1) * 2)];
	};

	_pos_resp = ([_pos]+_SafePosParams+[_side] call gosa_fnc_findSafePos);
	if(count (_pos_resp select 0) == 0 && count (_pos_resp select 1) == 0)exitWith{
		diag_log format ["Log: [__FILE__] _pos_resp %1 ", _pos_resp];
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

	[_units + _vehicles] call gosa_fnc_reweapon; // перевооружить
	// _units call gosa_fnc_RankToSkill; //выставить skill в зависимости от ранга
	if (count _vehicles > 0) then {
		[_vehicles, _cargo] call gosa_fnc_MoveInCargo; // посадить в багажное отделение
	};


	// время удаления, и прочее
	private["_random2","_random5","_random10"];
	_random2 = random 2; _random5 = random 5; _random10 = random 10;
	if (_patrol)then{
		{
			_x setVariable ["time", time + (60 * 9) + (60 * _random2)];
		} foreach (_units );
		_groups select 0 setVariable ["patrol_pos", _pos_resp];
		_groups select 0 setBehaviour "SAFE";
	}else{
		if (("air" in _types) || ("plane" in _types) || ("uav" in _types))then{
			{
				_x setVariable ["time", time + (60 * (5 + _random5))];
			} foreach _units;
		}else{
			{
				_x setVariable ["time", time + (60 * (40 + _random10))];
			} foreach (_units);
		};
	};

	if(count _cargo2 > 0)then{
		{
			_x setVariable ["time", time + (60 * (10 + _random5))];
		} foreach (_cargo2);
	};

	{_x setVariable ["grp_created",true,true]}forEach _groups;

	_groups;
}else{
	grpNull;
};
