startLoadingScreen["Loading My Mission"];
waitUntil {!isNil "m_fnc_init"};

waitUntil {!isNil "draga_respawnMarkers"};
sleep 1.5;
player setPos getMarkerPos (draga_respawnMarkers call BIS_fnc_selectRandom);

endLoadingScreen;
