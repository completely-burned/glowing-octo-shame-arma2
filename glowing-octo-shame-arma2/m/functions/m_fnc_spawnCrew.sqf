#define true 1
#define false 0

private ["_type","_crewType","_typicalCargo","_unit","_crew","_vehicle","_grp","_entry","_hasDriver","_turrets"];
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
	if (((getNumber (_entry >> "side")) call m_fnc_getSide) == side _grp) then {
		_crewType = getText (_entry >> "crew");
	}else{
		_crewType = ([_grp, _type, side _grp] call m_fnc_defaultCrew);
	};
};

_hasDriver = getNumber (_entry >> "hasDriver");

if ((_hasDriver == 1) && (isNull (driver _vehicle))) then
{
		_unit = _grp createUnit [_crewType, getPos _vehicle, [], 0, "FORM"];
		_crew set [count _crew, _unit];

		_unit moveInDriver _vehicle;
};

_turrets = ([_entry >> "turrets",[]] call m_fnc_returnVehicleTurrets);

if(_type == "FDF_leopard2a4")then{
	_turrets = [[0],[0,0]];
};

{
	if (isNull (_vehicle turretUnit _x)) then {
		if(count _typicalCargo > count _crew)then{
			_unit = _grp createUnit [(_typicalCargo select (count _crew)), getPos _vehicle, [], 0, "FORM"];
		}else{
			_unit = _grp createUnit [_crewType, getPos _vehicle, [], 0, "FORM"];
		};
		_crew set [count _crew, _unit];
		_unit moveInTurret [_vehicle, _x];
	};
} forEach _turrets;

#undef true
#undef false
//if (_type isKindOf "Tank") then {
	private["_commander","_gunner"];
	_commander = commander _vehicle;
	_gunner = gunner _vehicle;
	{
		[nil, _x, "per", rsetRank, "CORPORAL"] call RE;
	} forEach _crew-[_commander]-[_gunner]-[driver _vehicle];
	[nil, _commander, "per", rsetRank, "LIEUTENANT"] call RE;
	[nil, _gunner, "per", rsetRank, "SERGEANT"] call RE;
//};

_crew
