private ["_players"];
if(isMultiplayer)then{
	_players = [];
	{
		if(_x call fnc_isPlayer)then{
			_players = (_players + [_x]);
		};
	} foreach allUnits;
}else{
	_players = [player];
};
_players;
