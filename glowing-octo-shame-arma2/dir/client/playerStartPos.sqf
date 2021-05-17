waitUntil {!isNull player};
player setPos [-2000 - random 500, 1000 - random 500];

waitUntil {time > 0};
startLoadingScreen["Loading My Mission"];

waitUntil {!isNil "gosa_fnc_init" or time > 30};
progressLoadingScreen 0.5;

waitUntil {!isNil {gosa_respawnMarkers} or time > 30};
progressLoadingScreen 0.75;

player setPos getMarkerPos (gosa_respawnMarkers call BIS_fnc_selectRandom);

waitUntil {!isNil "respawnDone" or time > 30};

endLoadingScreen;

playerReady = true;
