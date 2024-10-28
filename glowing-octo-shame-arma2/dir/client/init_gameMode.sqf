if (isMultiplayer) then {
	if !(gosa_pvp) then {
		if (hasInterface) then {
			waitUntil {!isNil "gosa_friendlyside"};
			if !(gosa_playerSide in gosa_friendlyside or gosa_playerSide in [sideLogic, civilian]) then {
				// TODO: Нужно сообщать игроку причину его возврата в лобби.
				gosa_init_gameMode_fail = true;
				diag_log format ["Log: [init_gameMode] failMission, %1", [gosa_playerSide, gosa_friendlyside]];
				#ifdef __ARMA3__
					// TODO: Нужен более надежный способ отключения противника.
					setplayerrespawntime 99999;
					["wrong_side", false] call BIS_fnc_endMission;
				#else
					failMission "LOSER";
				#endif
			};
		};
	};
};
gosa_init_gameMode_done = true;
