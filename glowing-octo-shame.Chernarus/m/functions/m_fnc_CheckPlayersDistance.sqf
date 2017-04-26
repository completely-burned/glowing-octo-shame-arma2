private["_visible","_Pos","_distance","_player"];
_Pos = _this select 0;
_distance = _this select 1;
_visible = false;
_player = objNull;
if(isMultiplayer)then{
	ScopeName "CheckPlayer";
	{
		_player = vehicle _x;
		if (IsPlayer _player) then {
			if (!isNull _player)then{
				if ((_player distance _Pos) <= _distance)then{
					_visible = true;
					BreakTo "CheckPlayer";
				};
			};
		};
		// sleep 0.001;
	} foreach playableunits;
}else{
	// if (([player, _pos] call BIS_fnc_distance2D) < _distance)then{
	_player = vehicle player;
	if (!isNull _player)then{
		if ((_player distance _Pos) <= _distance)then{
			_visible = true;
		};
	};
};
// diag_log format ["m_fnc_CheckPlayersDistance.sqf 41, %1", time];
// _visible = false;

_visible;