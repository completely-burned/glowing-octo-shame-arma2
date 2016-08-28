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
	_crewType = getText (_entry >> "crew");
};

_hasDriver = getNumber (_entry >> "hasDriver");

if ((_hasDriver == 1) && (isNull (driver _vehicle))) then
{
		_unit = _grp createUnit [_crewType, position _vehicle, [], 0, "FORM"];
		_crew = _crew + [_unit];

		_unit moveInDriver _vehicle;
};

_turrets = ([_entry >> "turrets",[]] call m_fnc_returnVehicleTurrets);
if(_type == "M1A2_TUSK_MG")then{
	_turrets = [[0],[0,0]];
};
if(_type == "M1A2_US_TUSK_MG_EP1")then{
	_turrets = [[0],[0,0]];
};
if(_type == "FDF_leopard2a4")then{
	_turrets = [[0],[0,0]];
};

{
	if (isNull (_vehicle turretUnit _x)) then {
		if(count _typicalCargo > count _crew)then{
			_crewType = (_typicalCargo select (count _crew));
		}else{
			_crewType = getText (_entry >> "crew");
		};
		_unit = _grp createUnit [_crewType, position _vehicle, [], 0, "FORM"];
		_crew = _crew + [_unit];
		_unit moveInTurret [_vehicle, _x];
	};
} forEach _turrets;

_crew
