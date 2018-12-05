private["_visible","_Pos","_distance","_player","_playerVeh"];
_Pos = _this select 0;
if (typeName _Pos == typeName objNull) then {
    _Pos = vehicle _Pos;
};
_distance = _this select 1;
_visible = false;
_player = objNull;
if(isMultiplayer)then{
	ScopeName "CheckPlayer";
	{
		_player = _x;
		_playerVeh = vehicle _player;
		if (IsPlayer _player) then {
			if ([_playerVeh, _Pos] call BIS_fnc_distance2D <= _distance)then{
				_visible = true;
				BreakTo "CheckPlayer";
			};
		};
		// sleep 0.001;
	} foreach playableunits;
}else{
	// if (([player, _pos] call BIS_fnc_distance2D) < _distance)then{
	_player = player;
	_playerVeh = vehicle _player;
	if (!isNull _playerVeh)then{
		if ((_playerVeh distance _Pos) <= _distance)then{
			_visible = true;
		};
	};
};
// diag_log format ["m_fnc_CheckPlayersDistance.sqf 41, %1", time];
// _visible = false;

_visible;
