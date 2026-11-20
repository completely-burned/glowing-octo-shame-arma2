private["_vehicles","_island","_obj"];

_vehicles = _this select 0;

if (count _vehicles > 0) then {
	// [190,1942,100]
	_island = [] call gosa_fnc_getIslandType;

	// Экраны
	if (_island select 1 < 1943) then {
		for "_i" from 0 to (count _vehicles -1) do {
			_obj = _vehicles select _i;
			if ([[_obj], ["SPE_Tank_base","LIB_Tank_base"]] call gosa_fnc_CheckIsKindOfArray) then {
				diag_log format ["Log: [fn_vehReplace] Hide Shields %2 %1", _obj, typeOf _obj];
				[
					_obj,
					nil, 
					["Hide_Shields_Hull",1,"Hide_Shields_Turret",1,"hide_shield_brackets_source",1]
				] call BIS_fnc_initVehicle;
			};
		};
	};
};
