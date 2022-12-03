#define __A2OA__
/*
Перемещает игрока после подключения на стартовую позицию.
*/

// FIXME: Возможно для A2 то-же нужно, но не проверено.
#ifdef __A2OA__
	#define __playerStartPos
#endif

// A3 перемещает игрока после выбора маркера через gui.
#ifdef __ARMA3__
	#undef __playerStartPos
#endif


#ifdef __playerStartPos
if(!isMultiplayer)exitWith{
	playerReady = true;

	// подготовить объекты. обнаруживает противников
	{
		player reveal _x;
	} forEach (player nearObjects 100);
};

waitUntil {!isNull player};
player setPos [-2000 - random 500, 1000 - random 500];

waitUntil {time > 0};
startLoadingScreen["Loading My Mission"];

waitUntil {!isNil "gosa_fnc_init" or time > 30};
progressLoadingScreen 0.5;

waitUntil {!isNil {gosa_respawnMarkers} or time > 30};
progressLoadingScreen 0.75;

if (!isNil "gosa_respawnMarkers" && {count gosa_respawnMarkers > 0}) then {
	player setPos getMarkerPos (gosa_respawnMarkers call BIS_fnc_selectRandom);
}else{
	player setPos getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
};

waitUntil {!isNil "respawnDone" or time > 30};

endLoadingScreen;

playerReady = true;

// подготовить объекты. обнаруживает противников
{
	player reveal _x;
} forEach (player nearObjects 100);
#endif
playerReady = true;
