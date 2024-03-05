/*
 * Скрипт запускает световые ракеты.
 * FIXME: Количество игроков не учитывается.
 */
private [ "_flare_dist","_players","_player","_types_flare",
	"_item","_arr","_b"];

 _flare_dist = 500;
 _types_flare = [
	"FlareBase",
	"gm_Flare_base",
	// Пули не светятся.
	"flareBullet_base",
	"gm_flareBullet_base"
];
_arr = [];

while {sleep 15 + random 15; true} do {
	if ([daytime] call gosa_fnc_isNight) then {
		_players = ([] call gosa_fnc_listPlayers);
		for "_iP" from 0 to (count _players -1) do {
			_player = _players select _iP;
			//- Проверка уровня освещения.

			//- Поиск уже имеющихся рядом источников света.
			_arr resize 0;
			_b = true;
			for "_i" from 0 to (count _types_flare -1) do {
				_item = _types_flare select _i;
				_arr = getPosATL _player nearObjects [_item, _flare_dist];
				if (count _arr > 0) exitWith {
					_b = false;
				};
			};

			if (_b) then {
				_n = ((150 / 7) * (_player call gosa_fnc_canSee));
				sleep (_n + random (_n/2));
				//- Запуск ракеты.
				_arr = _player nearEntities [["Man"], _flare_dist];
				_arr = _arr - units _player;
				[_arr] call gosa_fnc_unitFlareFire;
			};
		};
	// Слишком долгая пауза плохо сказывается при отладке с ускоренным временем.
	}else{sleep 60};
};
