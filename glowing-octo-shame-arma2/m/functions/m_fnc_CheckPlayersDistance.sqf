private["_visible","_Pos","_distance","_player"];
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
if(isMultiplayer)then{
	ScopeName "CheckPlayer";
	{
		if (_x call fnc_isPlayer) then {
			_player = vehicle _x;
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
	diag_log format ["m_fnc_CheckPlayersDistance.sqf %1 %2", _Pos, _visible];
_visible;
