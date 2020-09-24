waitUntil {!isNull player};
player setPos [-2000 - random 500, 1000 - random 500];

waitUntil {time > 0};
startLoadingScreen["Loading My Mission"];

waitUntil {!isNil "m_fnc_init" or time > 30};
progressLoadingScreen 0.5;

waitUntil {!isNil {draga_respawnMarkers} or time > 30};
waitUntil {count draga_respawnMarkers > 0 or time > 30};
progressLoadingScreen 0.75;

player setPos getMarkerPos (draga_respawnMarkers call BIS_fnc_selectRandom);

waitUntil {!isNil "respawnDone" or time > 30};

endLoadingScreen;
