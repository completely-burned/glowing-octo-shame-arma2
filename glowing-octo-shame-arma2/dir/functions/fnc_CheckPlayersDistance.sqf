/*
Проверка дистанции до игроков.
TODO: Исключить isNull.
*/

private ["_visible","_Pos","_distance","_player","_cache","_arr","_obj"];
_Pos = _this select 0;
if (typeName _Pos == typeName objNull) then {
	_Pos = vehicle _Pos;
};
if (count _this > 1) then {
	_distance = _this select 1;
}else{
	_distance = -1;
};
_visible = false;
_player = objNull;
ScopeName "CheckPlayer";

#ifndef __ARMA3__
	_cache = (gosa_MapPlayers select 1);
	diag_log format ["Log: [checkPlayersDistance] _cache %1", _cache];
		for "_i" from 0 to (count _cache -1) do {
			_player = vehicle ((_cache select _i) select 0);
			if !(isNull _player) then {
				if (_pos distance _player < _distance)then{
					_visible = true;
					BreakTo "CheckPlayer";
				};
			};
		};
#else
// gosa_cachePlayers кеширует список игроков чтобы не проверять всегда всех юнитов
if (isNil "gosa_cachePlayers") then {
	_cache = [];
}else{
	_cache = gosa_cachePlayers;
};

if(isMultiplayer)then{

	for "_i" from 0 to ((count _cache) - 1) do {
		_obj = _cache select _i;
		if (_obj call gosa_fnc_isPlayer) then {
			_player = vehicle _obj;
			diag_log format ["Log: [checkPlayersDistance] Проверяем %1, из кэша", _player];
			if (_pos distance _player < _distance)then{
				_visible = true;
				BreakTo "CheckPlayer";
			};
		}else{
			diag_log format ["Log: [checkPlayersDistance] %1 удален из кэша игроков", _obj];
			_cache set [_i, objNull];
		};
	};

	_arr = allUnits;
	for "_i" from 0 to ((count _arr) - 1) do
	{
		_obj = _arr select _i;
		if (_obj call gosa_fnc_isPlayer) then {
			if !(_obj in _cache) then {
				_cache set [count _cache, _obj];
				diag_log format ["Log: [checkPlayersDistance] %1 добавлен в кэш игроков", _obj];
			};
			_player = vehicle _obj;
			diag_log format ["Log: [checkPlayersDistance] Проверяем %1, из allUnits", _player];
			if (_pos distance _player < _distance)then{
				_visible = true;
				BreakTo "CheckPlayer";
			};
		};
	};

}else{
	if ((vehicle player distance _Pos) < _distance)then{
		_visible = true;
	};
};

gosa_cachePlayers = _cache-[objNull];
#endif

	diag_log format ["Log: [checkPlayersDistance] %1 %2", _Pos, _visible];
_visible;
