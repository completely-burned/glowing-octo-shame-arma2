/*
 * Скрипт размещает юнитов за пушки.
 */

private["_crew","_distance","_dist_player","_cfgVeh","_barracks","_grp",
	"_gunner","_building","_side","_vehiclesGetIn",
	"_vehicles","_veh","_orderGetIn","_orderGetOut","_units"];
_cfgVeh = LIB_cfgVeh;

_distance = 300;
_dist_player = 5;

_vehiclesGetIn = [];
_orderGetOut = [];
_orderGetIn = [];

// Проходим по списку казарм.
_barracks = [barrack];

while {sleep 10} do {
	_vehiclesGetIn resize 0;
	_orderGetOut resize 0;
	_orderGetIn resize 0;
	for "_b" from 0 to (count _barracks -1) do {
		_building = _barracks select _b;
		//- Отряд закреплен за казармой.
		_grp = _building getVariable "gosa_grp_defense";
		if !(isNil "_grp") then {
			//- Доступные юниты.
			_units = units _grp;

			// TODO: Назначать обычных стрелков в приоритете.

			_vehicles = (_building nearEntities ["StaticWeapon", _distance]);
			for "_i" from 0 to (count _vehicles -1) do {
				_veh = _vehicles select _i;
				_gunner = gunner _veh;
				_crew = [_gunner];
				if (alive _gunner) then {
					if (_gunner in _units) then {
						// Если рядом игрок, то пушку необходимо освободить.
						if ([_veh, _dist_player] call gosa_fnc_CheckPlayersDistance) then {
							_orderGetOut set [count _orderGetOut, _gunner];
						} else {
							_units = _units - _crew;
						};
					};
				} else {
					_vehiclesGetIn set [count _vehiclesGetIn, _veh];
				};
			};
			//systemChat format ["%1 getOut %2", time, _orderGetOut];
			_orderGetOut orderGetIn false;

			for "_i" from 0 to ((count _vehiclesGetIn min count _units) -1) do {
				_veh = _vehiclesGetIn select _i;
				_gunner = _units select _i;
				_gunner assignAsGunner _veh;
				_orderGetIn set [count _orderGetIn, _gunner];
			};
			_orderGetIn orderGetIn true;
			//systemChat format ["%1 GetIn %2", time, _orderGetIn];
		};
	};
};
