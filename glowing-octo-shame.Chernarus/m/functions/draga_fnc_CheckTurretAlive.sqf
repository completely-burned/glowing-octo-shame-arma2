private["_veh","_all","_turrets","_count_turrets","_alive_turrets","_true","_entry"];

_veh = _this select 0;
_all = _this select 1;

_entry = configFile >> "CfgVehicles" >> typeOf _veh;
_turrets = ([_entry >> "turrets",[]] call m_fnc_returnVehicleTurrets);
_count_turrets = count _turrets;
_alive_turrets = 0;
{
	if(alive (_veh turretUnit _x))then{
		_alive_turrets = _alive_turrets + 1;
	};
} forEach _turrets;

_true = true;
if(_alive_turrets < _count_turrets)then{
	if(_all)then{
		_true = false;
	}else{
		if(_alive_turrets == 0)then{
			_true = false;
		};
	};
};
_true;
