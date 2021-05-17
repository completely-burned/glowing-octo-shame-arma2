private ["_players"];
if(isMultiplayer)then{
	_players = [];
	{
		if(_x call gosa_fnc_isPlayer)then{
			_players set [count _players, _x];
		};
	} foreach allUnits;
}else{
	_players = [player];
};
_players;
