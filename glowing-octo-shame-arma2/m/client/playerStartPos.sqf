startLoadingScreen["Loading My Mission"];

waitUntil {!isNull player};
player setPos [-100000000 - random 1000000, -100000000 - random 1000000];

waitUntil {!isNil "m_fnc_init"};

waitUntil {!isNil "draga_respawnMarkers"};
sleep 1.5;
player setPos getMarkerPos (draga_respawnMarkers call BIS_fnc_selectRandom);

endLoadingScreen;
