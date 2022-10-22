/*
Функция возвращает транспорт и другие юниты группы.
TODO: Объединить с fnc_getGroupType.
*/
private ["_veh","_vehicles","_types","_r","_unit","_units"];

diag_log format ["Log: [fnc_getGroupUnits] _this %1", _this];

_units = _this;


_types = [];
_vehicles = [];
for "_i" from 0 to (count _units -1) do {
	_unit = _units select _i;
	_types set [count _types, typeOf _unit];
	// fnc_assignedVeh возвращает так-же {vehicle _unit}.
	_veh = _unit call gosa_fnc_assignedVeh;
	if !(isNull _veh) then {
		if !(_veh in _vehicles) then {
			_vehicles set [count _vehicles, _veh];
			_types set [count _types, typeOf _veh];
		};
	};
};

_r = [_types,_vehicles];
diag_log format ["Log: [fnc_getGroupUnits] _r %1", _r];
_r;
