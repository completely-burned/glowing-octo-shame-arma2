if (isMultiplayer) then {
	if !(gosa_pvp) then {
		if (hasInterface) then {
			waitUntil {!isNil "gosa_friendlyside"};
			if !(playerSide in gosa_friendlyside or playerSide == sideLogic) then {
				// TODO: Нужно сообщать игроку причину его возврата в лобби.
				diag_log format ["Log: [init_gameMode] failMission, %1", [playerSide, gosa_friendlyside]];
				#ifdef __ARMA3__
					["wrong_side", false] call BIS_fnc_endMission;
				#else
					failMission "LOSER";
				#endif
			};
		};
	};
};
