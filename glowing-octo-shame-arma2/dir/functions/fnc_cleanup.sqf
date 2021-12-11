
for "_i" from 0 to (count _this -1) do {
	if !(_this select _i in gosa_GC_array) then {
	  gosa_GC_array set [count gosa_GC_array, _this select _i];
	};
};



/*
private["_min_dist","_min_vehicles_count"];
_min_dist = 2500;
_min_vehicles_count = 250;

_min_dist = _min_dist - (count _this) + _min_vehicles_count;

Private["_deleteList"];
_deleteList = _this;

private["_veh"];
Private["_type"];

while { count _deleteList > _min_vehicles_count } do {

	_veh = _deleteList call BIS_fnc_selectRandom;
	_type = typeOf _veh;

	_deleteList = _deleteList - [_veh];

	if !([_veh, _min_dist] call gosa_fnc_CheckPlayersDistance) then {
		if (getNumber(configFile >> "CfgVehicles" >> _type >> "isMan") == 1) then {
			moveOut _veh;
		};
		diag_log format ["gosa_fnc_cleanup.sqf deleteVehicle %1", _veh];
		deleteVehicle _veh;
	};

};
*/
