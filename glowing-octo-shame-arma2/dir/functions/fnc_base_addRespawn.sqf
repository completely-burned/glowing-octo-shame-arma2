private ["_l_base","_respawn","_type","_arr","_logic","_pos","_arr0",
	"_offset"];
diag_log format ["Log: [fnc_base_addRespawn] _this %1", _this];

_l_base = _this select 0;
_respawn = _this select 1;

_type = "LocationRespawnPoint_F";

_arr0 = [];
for "_i" from 0 to (count (_respawn select 0) -1) do {
	_offsets = _respawn select 1 select _i;
	if (typeName _offsets == typeName "") then {
		_offsets = [[0,0,0]];
	}else{
		_offsets = _offsets select 1;
	};

	diag_log format ["Log: [fnc_base_addRespawn] _offsets %1", _offsets];
	for "_o" from 0 to (count _offsets -1) do {
		_offset = _offsets select _o;
		_pos = getPos (_respawn select 0 select _i);
		_dir = getDir (_respawn select 0 select _i);

		// TODO: Наклон.
		_pos set [2, (_pos select 2) + (_offset select 2)];
		// FIXME: Возможно есть более лучшее решение.
		_pos set [0, (_pos select 0) + 
			((_offset select 0) * sin (_dir+90)) +
			((_offset select 1) * sin (_dir))
		];
		_pos set [1, (_pos select 1) + 
			((_offset select 0) * cos (_dir+90)) +
			((_offset select 1) * cos (_dir))
		];

		// FIXME: Может быть другой тип объекта.
		_arr = _pos nearObjects [_type, 10];
		if (count _arr <= 0) then {
			_logic = group _l_base createUnit [_type, _pos, [], 0, "CAN_COLLIDE"];
			//_logic setPos _pos;
			_logic synchronizeObjectsAdd [_l_base];
			_l_base synchronizeObjectsAdd [_logic];
			_arr0 set [count _arr0, _logic];
		};
	};
};

diag_log format ["Log: [fnc_base_addRespawn] _r %1", [_arr0]];
[_arr0];
