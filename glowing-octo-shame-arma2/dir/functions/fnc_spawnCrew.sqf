#define true 1
#define false 0

private ["_type","_crewType","_typicalCargo","_unit","_crew","_vehicle","_grp","_entry","_hasDriver","_turrets","_rank","_cfg_turret","_t","_commanding"];
_vehicle = _this select 0;
_grp = _this select 1;

_type = typeOf _vehicle;

_entry = configFile >> "CfgVehicles" >> _type;
_crew = [];

if ((count _this) > 2) then {
	_typicalCargo = (_this select 2);
	_crewType = (_typicalCargo select 0);
}else{
	_typicalCargo=[];
	if (((getNumber (_entry >> "side")) call gosa_fnc_getSide) == side _grp) then {
		_crewType = getText (_entry >> "crew");
	}else{
		_crewType = ([_grp, _type, side _grp] call gosa_fnc_defaultCrew);
	};
};

_hasDriver = getNumber (_entry >> "hasDriver");

if ((_hasDriver == 1) && (isNull (driver _vehicle))) then
{
		_unit = _grp createUnit [_crewType, getPos _vehicle, [], 0, "FORM"];
		_crew set [count _crew, _unit];

		_unit moveInDriver _vehicle;
};

_turrets = ([_entry >> "turrets",[]] call gosa_fnc_returnVehicleTurrets);

if(_type == "FDF_leopard2a4")then{
	_turrets = [[0],[0,0]];
};

{
	_t=_x;
	if (isNull (_vehicle turretUnit _t)) then {
		if(count _typicalCargo > count _crew)then{
			_unit = _grp createUnit [(_typicalCargo select (count _crew)), getPos _vehicle, [], 0, "FORM"];
		}else{
			_unit = _grp createUnit [_crewType, getPos _vehicle, [], 0, "FORM"];
		};
		_crew set [count _crew, _unit];

		_rank = "CORPORAL";
		//--- turrets
		_cfg_turret = _entry;
		{
			_cfg_turret = ((_cfg_turret  >> "turrets") select _x);
		} forEach _t;
		_commanding = getNumber (_cfg_turret >> "commanding");
		//--- gunner
		if ( _commanding == 1 ) then {
			_rank = "SERGEANT";
		};
		//--- commander
		if ( _commanding == 2 ) then {
			_rank = "LIEUTENANT";
		};
		//--- set rank
		[nil, _unit, rsetRank, _rank] call RE;

		_unit moveInTurret [_vehicle, _t];
	};
} forEach _turrets;

_crew
