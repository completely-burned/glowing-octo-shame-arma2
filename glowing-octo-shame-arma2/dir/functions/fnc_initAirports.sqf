/*
Генерирует начальный список аэропортов.
*/

private ["_airports_tmp","_airports","_str","_obj","_tmp_arr","_num"];


_airports_tmp = [];

//-- Поиск по всем объектам карты.
/*
// Не работает
#ifdef __A2OA__
	_tmp_arr = allMissionObjects "";
	for "_i" from 0 to (count _tmp_arr -1) do {
		_obj = _tmp_arr select _i;
		if ([[_obj], gosa_typesOf_airports] call gosa_fnc_CheckIsKindOfArray) then {
			_airports_tmp set [count _airports_tmp, _obj];
		};
	};
	diag_log format ["Log: [fnc_getAirports] _airports_tmp %1", _airports_tmp];
#endif
*/

//-- Заранее заданные объекты.
for "_i" from 0 to 99 do {
	_str = format["gosa_airportHangar%1", _i];
	if !(isNil _str) then {
		_obj = call compile _str;
		// Нужно отсеить дубликаты.
		if !(_obj in _airports_tmp) then {
			_airports_tmp set [count _airports_tmp, _obj];
		};
	};
};
diag_log format ["Log: [fnc_getAirports] _airports_tmp %1", _airports_tmp];

_airports = [];
for "_i" from 0 to (count _airports_tmp - 1) do {
	_obj = _airports_tmp select _i;
	if (_obj isKindOf "Logic") then {
		_obj = nearestBuilding position _obj;
	};
	_pos = getPos _obj;
	if !(isNull _obj) then {
		if (alive _obj) then {
			_num = 1;
		}else{
			_num = 0;
		};
		_str = str _obj;
		// [[логика, объект, имя маркера, статус, позиция]]
		_airports set [_i,[objNull, _obj, _str, _num, _pos]];
	};
};
diag_log format ["Log: [fnc_getAirports] _airports %1", _airports];

_airports;
