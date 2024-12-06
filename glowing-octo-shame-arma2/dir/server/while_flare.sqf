/*
 * Скрипт запускает световые ракеты.
 * FIXME: Количество игроков не учитывается.
 * TODO: Рефакторинг.
 * TODO: Оптимизация.
 */
private [ "_flare_dist","_players","_player","_types_flare",
	"_item","_arr","_b","_blacklist","_flare_failover","_n"];

#ifdef __ARMA3__
	_flare_dist = 75;
#else
 _flare_dist = 500;
#endif
 _types_flare = [
	"FlareBase",
	"SPE_40mm_White",
	"gm_Flare_base",
	// Пули не светятся.
	"flareBullet_base",
	"gm_rocket_ILLUM_Base",
	"gm_shell_artillery_Illum_Base",
	"gm_flareBullet_base"
];
_blacklist = gosa_flare_blacklist;
_flare_failover = gosa_flare_Weighted;

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
				_n = count _arr;
				for "_iF" from 0 to (count _arr -1) do {
					_flare = _arr select _iF;
					if ({_flare isKindOf _x} count _blacklist > 0) then {
						diag_log format["Log: [while_flare] %1 in blacklist %2", _flare, _blacklist];
						_n = _n -1;
					};
				};
				if (_n > 0) exitWith {
					diag_log format["Log: [while_flare] %1 flare found %2", _player, _arr];
					_b = false;
				};
			};

			if (_b) then {
				_n = 150;
				if (worldName == "Hyde_Sark") then {
					_n = 30;
				};
				_n = ((_n / 7) * (_player call gosa_fnc_canSee));
				sleep (_n + random (_n/2));
				//- Запуск ракеты.
				_arr = _player nearEntities [["Man"], _flare_dist];
				_arr = _arr - units _player;
				[_arr, _blacklist, _flare_failover] call gosa_fnc_unitFlareFire;
			};
		};
	// Слишком долгая пауза плохо сказывается при отладке с ускоренным временем.
	}else{sleep 60};
};
