/*
скрипт вылечивает раненные ноги ии, при отсутствии игроков рядом
*/

while{true}do{
	{
		if !(canStand _x) then {
			if !([vehicle _x, 100] call gosa_fnc_CheckPlayersDistance)then{
				_x setHit["legs",0];
			};
		};
	} forEach allUnits;
	sleep 30 + random 10;
};
