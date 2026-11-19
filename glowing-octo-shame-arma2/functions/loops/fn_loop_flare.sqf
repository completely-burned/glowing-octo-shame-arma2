/*
 * Скрипт запускает световые ракеты.
 * TODO: Освещать не только игроков, а также бои и окружение.
 */
private [ "_flare_dist","_players","_player","_types_flare","_m","_multi_def",
	"_flare_dist_player","_obj","_str","_pos","_flareHeightOffset","_cfgAmm",
	"_item","_arr","_b","_blacklist","_flare_failover","_n"];

_cfgAmm = LIB_cfgAmm;

_flare_dist_player = 750;
_flareHeightOffset = 70;
#ifdef __ARMA3__
	_multi_def = 3;
	_flare_dist = 75;
#else
	_multi_def = 80;
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

diag_log format["Log: [while_flare] Started %1", time];

_arr = [];

while {sleep 0.01; true} do {
	if ([daytime] call gosa_fnc_isNight) then {
		_players = ([] call gosa_fnc_listPlayers);
		for "_iP" from 0 to (count _players -1) do {
			scopename "scope1";

			_n = _multi_def;

			// TODO: Проверка уровня освещения.

			_player = _players select _iP;
			_pos = getPos _player;

			if !(isNull _player) then {
				_m = missionNamespace getVariable "gosa_flares";
				if (_m > 0) then {
					_n = (_n*(_m/100));
					sleep ((_n + random (_n/2))/(count _players));

					// random 7 никогда не будет == 7
					if (random 6.05 >= (_player call gosa_fnc_canSee)) then {
						// Ночи стали заметно темнее, поэтому огни должны быть даже если нет юнитов.
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

							diag_log format["Log: [while_flare] call spawnFlare %1", [_pos, _str, _flareHeightOffset]];
							[_pos, _str, _flareHeightOffset] call gosa_fnc_spawnFlare;
							// В a2oa они очень яркие.
							// FIXME: Этот метод не подходит.
							#ifndef __ARMA3__
								//_n = getNumber (_cfgAmm >> _str >> "timeToLive");
								//_n = (_n*(_m/100));
								// 80% +-10%
								//sleep (_n*0.8) + random (_n*0.1);
							#endif
						};
					};
				};
			};
		};
	}else{
		// FIXME: Слишком долгая пауза плохо сказывается при отладке с ускоренным временем.
		sleep 10;
	};
};
