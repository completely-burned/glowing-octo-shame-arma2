private["_side"];
if(count _this > 0)then{
		_side = _this select 0;
}else{
		_side = [[east,west,resistance],[0.5,0.5,0.5]] call BIS_fnc_selectRandomWeighted;
};

private["_pos"];
private["_typeList"];
private["_player"];

_player = player;
_pos = getPos _player;

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

private["_grp1"];
private["_types"];
private["_SafePosParams"];
private["_pos_resp"];
_grp1 = (_typeList call BIS_fnc_selectRandomWeighted);
_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;

_SafePosParams = ([_types] call m_fnc_SafePosParams);

_SafePosParams set [0,((_SafePosParams select 0) * 2)];
_SafePosParams set [1,((_SafePosParams select 1) * 2)];

_pos_resp = ([_pos]+_SafePosParams+[_side] call m_fnc_findSafePos);
if(count (_pos_resp select 0) == 0)exitWith{grpNull};

private["_groups"];
_groups = ([_pos_resp, _side, _grp1 select 0] call m_fnc_spawnGroup);

private ["_units","_vehicles","_crew","_cargo"];
_units = []; _vehicles=[]; _crew = []; _cargo=[];
{
	private ["_grp"];
	_grp = _x;

	// тип группы
	_grp setVariable ["patrol", true, true];

	// arrays
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
	// фонарики
	_grp enableGunLights true;

}forEach _groups;

// посадить в багажное отделение
if (count _vehicles > 0) then {
	[_vehicles, _cargo] call m_fnc_MoveInCargo;
};


{
	// установить уровень навыков
	if (m_skill >= 0) then {
		_x setSkill m_skill;
	};
	// хз
	_x call m_fnc_vehInit;
} foreach _units + _vehicles;

// перевооружить
[_units + _vehicles] call m_fnc_reweapon;

// готовность группы
{_x setVariable ["grp_created",true,true]}forEach _groups;

_groups;
