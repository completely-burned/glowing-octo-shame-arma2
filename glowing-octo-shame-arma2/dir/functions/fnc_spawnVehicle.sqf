diag_log format ["Log: [fnc_spawnVehicle] %1", _this];

private ["_pos", "_azi", "_type", "_param4", "_grp", "_side", "_newGrp",
	"_sim", "_veh", "_crew","_air"];

_pos = _this select 0;
_azi = _this select 1;
_type = _this select 2;
_param4 = _this select 3;

if ((typeName _param4) == (typeName sideEnemy)) then {
	_side = _param4;
	_grp = createGroup _side;
	_newGrp = true;
}else{
	_grp = _param4;
	_side = side _grp;
	_newGrp = false;
};

_sim = toLower getText(configFile >> "CfgVehicles" >> _type >> "simulation");
_air = if (_sim in ["airplane","helicopter","airplanex","helicopterrtd","helicopterx"]) then {true} else {false};

if (_air) then {
	_pos set [2,200];

	_veh = createVehicle [_type, _pos, [], 0, "FLY"];

	_veh setDir _azi;
	if (_sim in ["airplane","airplanex"]) then
	{
		_veh setVelocity [50 * (sin _azi), 50 * (cos _azi), 60];
		#ifdef __ARMA3__
	}else{
		// FIXME: a3 тс не инициализируются без этого.
		_veh setVelocity [0,0,1];
		#endif
	};

}else{
	#ifdef __ARMA3__
		// Невозможно сразу указать наклон при создании объекта.
		_pos set [2,1900];
	#else
		_pos resize 2;
	#endif
	_veh = createVehicle [_type, _pos, [], 0, "FORM"];
	_veh setDir _azi;
	#ifdef __ARMA3__
		// a3, тс на некоторых позициях взрываются из-за наклона поверхности.
		_veh setVectorUp surfaceNormal _pos;
		// a3, ии покидают тс после ранения от столкновения.
		// Высота не должна быть большой или малой.
		private _box = boundingBox _veh;
		diag_log format ["Log: [fnc_spawnVehicle] %1, boundingBox %2", _this, _box];
		_pos set [2, _box select 1 select 2];
		_veh setPos _pos;
	#else
	// FIXME: Почему здесь -1?
	_veh setVelocity [0,0,-1];
	#endif
};

// FIXME: Не пониаю в котором порядке нужно выполнять эту команду.
_grp addVehicle _veh;

diag_log format ["Log: [fnc_spawnVehicle] %1, created %2 %3 %4", _this, _sim, getPos _veh, _veh];

#ifdef __ARMA3__
	[_veh, "fnc_spawnVehicle"] remoteExec ["gosa_fnc_vehInit2"];
#else
	[nil, _veh, rvehInit] call RE;
#endif

if ((count _this) > 4) then {
	_crew = [_veh, _grp, _this select 4] call gosa_fnc_spawnCrew;
} else {
	_crew = [_veh, _grp] call gosa_fnc_spawnCrew;
};

if (_newGrp) then {
	_grp selectLeader (commander _veh);
};

#ifdef __ARMA3__
	// С этим кодом авиация приземляется.
	if !(_air) then {
		// Без этого некоторые ТС в A3 стоят на месте.
		_veh doMove _pos;
	};
#endif

[_veh, _crew, _grp]
