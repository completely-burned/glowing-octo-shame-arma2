﻿
private ["_pos", "_azi", "_type", "_param4", "_grp", "_side", "_newGrp"];
_pos = _this select 0;
_azi = _this select 1;
_type = _this select 2;
_param4 = _this select 3;

diag_log format ["Log: [fnc_spawnVehicle] %1", _this];

if ((typeName _param4) == (typeName sideEnemy)) then {
	_side = _param4;
	_grp = createGroup _side;
	_newGrp = true;
}else{
	_grp = _param4;
	_side = side _grp;
	_newGrp = false;
};


private ["_sim", "_veh", "_crew"];
_sim = toLower getText(configFile >> "CfgVehicles" >> _type >> "simulation");

if (_sim in ["airplane", "helicopter"]) then {
	if ((count _pos) == 2) then {
		_pos = _pos + [200];
	};

	_veh = createVehicle [_type, _pos, [], 0, "FLY"];

	if (_sim == "airplane") then {
		_veh setVelocity [50 * (sin _azi), 50 * (cos _azi), 60];
	};

}else{
	_pos resize 2;
	_veh = createVehicle [_type, _pos, [], 0, "FORM"];
	_veh setVelocity [0,0,-1];
};

diag_log format ["Log: [fnc_spawnVehicle] %1", _veh];

#ifdef __ARMA3__
	[_veh] call gosa_fnc_vehInit2;
#else
[nil, _veh, rvehInit] call RE;
#endif

_veh setDir _azi;

if ((count _this) > 4) then {
	_crew = [_veh, _grp, _this select 4] call gosa_fnc_spawnCrew;
} else {
	_crew = [_veh, _grp] call gosa_fnc_spawnCrew;
};
_grp addVehicle _veh;

if (_newGrp) then {
	_grp selectLeader (commander _veh);
};

[_veh, _crew, _grp]
