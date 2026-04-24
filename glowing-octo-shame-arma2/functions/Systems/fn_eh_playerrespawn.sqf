diag_log format ["Log: [fnc_eh_playerRespawn] %1", _this];

//-- После смерти.

//WaitUntil {alive player};
//-- После возрождения.
[nil, _this select 0, rgosa_setMapPlayers, gosa_owner] call RE;
