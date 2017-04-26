private ["_players"];
if(isMultiplayer)then{
	_players = [];
	{
		if(isPlayer _x)then{
			_players = (_players + [_x]);
		};
	} foreach playableunits;
}else{
	_players = [player];
};
_players;
