/*
 * Скрипт запускает световые ракеты.
 * TODO: Рефакторинг.
 * TODO: Оптимизация.
 */
private [ "_flare_dist","_players","_player","_types_flare","_m","_multi_def",
	"_flare_dist_player","_obj","_str","_pos","_flareHeightOffset",
	"_item","_arr","_b","_blacklist","_flare_failover","_n"];

_flare_dist_player = 750;
_multi_def = 150;
_flareHeightOffset = 80;
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
			scopename "scope1";
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
				_n = _multi_def;

				// FIXME: Возможно устарело.
				if (worldName == "Hyde_Sark") then {
					_n = _n/5;
				};

				_n = ((_n / 7) * (_player call gosa_fnc_canSee));
				_m = missionNamespace getVariable "gosa_flares";
				_n = (_n*(_m/100));
				sleep ((_n + random (_n/2))/(count _players));
				//- Запуск ракеты.
				_arr = _player nearEntities [["Man"], _flare_dist_player];
				_arr = _arr - units _player;
				_obj = [_arr, _blacklist, _flare_failover] call gosa_fnc_unitFlareFire;
				// Ночи стали заметно темнее, поэтому огни должны быть даже если нет юнитов.
				if (isNull _obj) then {
					// TODO: Нужна функция для выбора между selectRandom и selectRandomWeighted.
					if (count _flare_failover > 0) then {
						if (typeName (_flare_failover select 0) == typeName []) then {
							if (count (_flare_failover select 0) > 0) then {
								_str = _flare_failover call gosa_fnc_selectRandomWeighted;
							}else{
								breakTo "scope1";
							};
						}else{
							_str = _flare_failover call BIS_fnc_selectRandom;
						};

						_pos = getPos _player;
						diag_log format["Log: [while_flare] call spawnFlare %1", [_pos, _str, _flareHeightOffset]];
						[_pos, _str, _flareHeightOffset] call gosa_fnc_spawnFlare;
					};
				};
			};
		};
	// FIXME: Слишком долгая пауза плохо сказывается при отладке с ускоренным временем.
	}else{sleep 60};
};
