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
		_players = [];
		{
			if(isPlayer _x) then
			{
				// [_players, _x] call BIS_fnc_arrayPush;
				_players = (_players + [_x]);
			}
		} foreach playableUnits;
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

switch (_side) do {
	case (east):
	{
		//_pos=eastBasePos;
		_typeList=AllGroupsEast;
	};
	case (west):
	{
		//_pos= westBasePos;
		_typeList=AllGroupsWest;
	};
	case (resistance):
	{
		//_pos= resistanceBasePos;
		_typeList=AllGroupsGuerrila;
	};
	// case (civilian):
	// {
		// _pos= getmarkerpos "respawn_civilian";
	// };
	default {};
};
		
private["_grp1"];
private["_types"];
private["_SafePosParams"];
private["_pos_resp"];
_grp1 = (_typeList call BIS_fnc_selectRandomWeighted);
_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;
_SafePosParams = ([_types] call m_fnc_SafePosParams);

if (_patrol)then{
	_SafePosParams set [0,((_SafePosParams select 0) * 2)];
	_SafePosParams set [1,((_SafePosParams select 1) * 2)];
};

_pos_resp = ([_pos]+_SafePosParams+[_side] call m_fnc_findSafePos);

private["_groups"];
_groups = ([_pos_resp, _side, _grp1 select 0] call m_fnc_spawnGroup);

private ["_units","_vehicles","_crew","_cargo"];
_units = []; _vehicles=[]; _crew = []; _cargo=[]; 
{
	private ["_grp"];
	_grp = _x;
	if(_patrol)then{
		_grp setVariable ["patrol", true];
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

	_grp setCombatMode "RED";
	_grp enableIRLasers true;
	_grp enableGunLights true;

}forEach _groups;

private["_cargo2"];
_cargo2 = _cargo - (units (_groups select 0));

{
	_x enableAI "TARGET";
	_x enableAI "AUTOTARGET";
	_x setSkill ["commanding", 1];
	_x call m_fnc_vehInit;
} foreach _units + _vehicles;

[_units + _vehicles] call m_fnc_reweapon; // перевооружить
// _units call m_fnc_RankToSkill; //выставить skill в зависимости от ранга
if (count _vehicles > 0) then {
	[_vehicles, _cargo] call m_fnc_MoveInCargo; // посадить в багажное отделение
};


// время удаления, и прочее
if (_patrol)then{
	{
		_x setVariable ["time", time + 60];
	} foreach _vehicles;
	{
		_x setVariable ["time", time + (60 * 2) + (60 * (1.5))];
	} foreach (_units );
	_groups select 0 setVariable ["patrol_pos", _pos_resp];
	_groups select 0 setBehaviour "SAFE";
}else{
	if (("air" in _types) || ("plane" in _types) || ("uav" in _types))then{
		{
			_x setVariable ["time", time + 60];
		} foreach _vehicles;
		{
			_x setVariable ["time", time + (60 * (5 + random 5))];
		} foreach _units;
	}else{
		{
			_x setVariable ["time", time + 60];
		} foreach _vehicles;
		{
			_x setVariable ["time", time + (60 * (30))];
		} foreach (_units);
	};
};

if(count _cargo2 > 0)then{
	{
		_x setVariable ["time", time + (60 * (10))];
	} foreach (_cargo2);
};

{
	[_x] call m_fnc_waypoints;
}forEach _groups;

/// удаление группы если та не сдвинулась с места возрождения
[_groups select 0]+[_pos_resp]+[_units+_vehicles]spawn {
	sleep 20;
	private["_pos"];
	_pos = getpos leader (_this select 0);
	sleep 60;
	if([leader (_this select 0), _pos] call BIS_fnc_distance2D < 25)then{
		{
			deleteVehicle _x;
		} foreach (_this select 2);
		// sleep 5;
		// deleteGroup (_this select 0);
		// {_x setVariable ["time", time + 10]} foreach (_this select 2);
	};
};

_groups;
