if !(gosa_pvp) then {
	if (hasInterface) then {
		waitUntil {!isNil "gosa_friendlyside"};
		if !(playerSide in gosa_friendlyside) then {
			// TODO: Нужно сообщать игроку причину его возврата в лобби.
			failMission "LOSER";
		};
	};
};