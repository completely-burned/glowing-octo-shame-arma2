private ["_pos","_players","_nearestPlayer","_dist"];
_pos = _this select 0;

if(isMultiplayer)then
{
	_players = [];
	{
		if(isplayer _x) then
		{
			[_players, _x] call BIS_fnc_arrayPush;
		};
	} foreach playableunits;
}
else
{
	_players = [player];
};

_nearestPlayer = objNull;
_dist = -1;
if(count _players > 0)then{
	_nearestPlayer = _players select 0;
	{
		_dist = _pos distance vehicle _nearestPlayer;
		if((_pos distance vehicle _x) < _dist)then{
			_nearestPlayer = _x
		};
	} foreach _players;
};
[_nearestPlayer,_dist]
