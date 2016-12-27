private["_veh","_cargo","_name","_actid","_pos","_altitude","_velocity","_chute","_dir","_side"];
_veh=_this select 0;
_cargo = _this select 3;
_side = side (_this select 0);

if ((isNull _cargo) || ((_cargo distance _veh) > 25) ) exitWith {};

_veh setVariable ["m_fnc_WinchManager_cargo", _cargo];

_name=gettext(configFile >> "CfgVehicles" >> (typeof _cargo) >> "displayName");
_actid = _veh addAction [format ["Drop: %1", _name], "m\functions\ACT_WinchDrop.sqf", _cargo];

while{(!isNil {_veh getVariable "m_fnc_WinchManager_cargo"}) && (alive _veh) && ((_veh emptyPositions "driver")==0) && (({alive _x} count (crew _cargo))==0)} do 
{
	sleep 0.02;
	_pos = getposATL _veh;
	_altitude = (_pos select 2);	
	_velocity = velocity _veh;

	if( _altitude > 5) then 
	{
		_cargo setdir getdir _veh;
		_cargo setposATL [(_pos select 0),(_pos select 1),(_pos select 2)-5];		
		_cargo setvelocity [(_velocity select 0),(_velocity select 1),(_velocity select 2)];
	}
 	else
 	{
		_cargo setdir getdir _veh;
		_cargo setposATL [(_pos select 0),(_pos select 1),0];		
		_cargo setvelocity [(_velocity select 0),(_velocity select 1),0];
	};
};

_veh removeAction _actid;

if ((((getPosATL _veh) select 2) > 70) && (alive _veh) && !(isNull _veh)) then	
{
	_pos=getPosATL _cargo;
	_dir=getDir _cargo;
	_chute = format["ParachuteMedium%1",_side];
	while {((_cargo distance _veh)<=15) && (alive _cargo)} do
	{
		sleep 0.5;
	};
	_chute=_chute createVehicle [0,0,0];
	_chute setPosATL [_pos select 0,_pos select 1,(_pos select 2)+10];
	_chute setDir _dir; 
	_cargo attachTo [_chute,[0,0,0]];
	while {(alive _chute) && ((getPosATL _cargo select 2)>5) && (alive _cargo)} do
	{
		sleep 2;
	};
	detach  _cargo;
	_pos=getPosATL _cargo;
	_chute setPos [(_pos select 0)+3,(_pos select 1)+3,_pos select 2];
	sleep 5;
	deleteVehicle _chute;
};
