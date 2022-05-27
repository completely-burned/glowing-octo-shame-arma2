private["_visible","_Pos","_distance","_player","_cache"];
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

// gosa_cachePlayers кеширует список игроков чтобы не проверять всегда всех юнитов
if (isNil "gosa_cachePlayers") then {
	_cache = [];
}else{
	_cache = gosa_cachePlayers;
};

if(isMultiplayer)then{

	for "_i" from 0 to ((count _cache) - 1) do {
		if (_cache select _i call gosa_fnc_isPlayer) then {
			_player = vehicle (_cache select _i);
			diag_log format ["Log: [checkPlayersDistance] %1 _cache %2", _Pos, _player];
			if (_pos distance _player < _distance)then{
				_visible = true;
				BreakTo "CheckPlayer";
			};
		}else{
			_cache set [_i, objNull];
		};
	};

	{
		if (_x call gosa_fnc_isPlayer) then {
			_cache set [count _cache, _x];
			_player = vehicle _x;
			diag_log format ["Log: [checkPlayersDistance] %1 allUnits_x %2", _Pos, _player];
			if (_pos distance _player < _distance)then{
				_visible = true;
				BreakTo "CheckPlayer";
			};
		};
	} foreach allUnits;

}else{
	if ((vehicle player distance _Pos) < _distance)then{
		_visible = true;
	};
};

gosa_cachePlayers = _cache-[objNull];

	diag_log format ["Log: [checkPlayersDistance] %1 %2", _Pos, _visible];
_visible;
