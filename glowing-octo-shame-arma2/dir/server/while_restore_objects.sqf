/*
 * Этот скрипт восстанавливает ящики в изначальной позиции.
 */

private ["_arr","_arr0","_dist_max","_var_noDelete"];
_var_noDelete = gosa_var_noDelete;
_dist_max = 50;

// Создаем список восстанавливаемых объектов.
_arr = (allMissionObjects 
	#ifdef __ARMA3__
		"ReammoBox_F"
	#else
		"ReammoBox"
	#endif
	);

// TODO: Фильтровать по параметрам.

_arr0 = [];
for "_i" from 0 to (count _arr -1) do {
	_arr0 set [_i, [typeOf (_arr select _i), getPos (_arr select _i), getDir (_arr select _i)]];
	_arr select _i setVariable [_var_noDelete, true];
};
diag_log format ["Log: [while_restore_objects] %1", _arr0];


while {sleep 58 + random 5; true} do {
	for "_i" from 0 to (count _arr0 -1) do {
		if (!alive (_arr select _i)
			#ifdef __ARMA3__
				// В Arma 3 ящики могут улететь от столкновений или взрывов.
				or (getPos (_arr select _i) distance2D (_arr0 select _i select 1) > _dist_max)
			#endif
			) then
		{
			diag_log format ["Log: [while_restore_objects] %1 восстановление.", _arr0 select _i];
			//_arr select _i setDamage 1;
			_arr select _i setVariable [_var_noDelete, nil];

			_arr set [_i, createVehicle [_arr0 select _i select 0, _arr0 select _i select 1, [], 0, "CAN_COLLIDE"]];
			_arr select _i setVariable [_var_noDelete, true];
			_arr select _i setDir (_arr0 select _i select 2);
		};
	};
};
