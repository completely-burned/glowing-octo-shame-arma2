#define __A2OA__
/*
 * Перемещает игрока после подключения на стартовую позицию.
 */
 private ["_arr","_n"];

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

//waitUntil {time > 0};
	// LoadingScreen
	if (gosa_loglevel > 0) then {
		_n = 15;
	}else{
		_n = 99999999999999999999;
	};
	[["Loading My Mission","RscDisplayLoadMission"],{!isNil "respawnDone"},_n,[
		{!isNil format["gosa_listHQ_%1", playerSide]},
		{!isNil "gosa_list_LocationAirport"},
		{!isNil "gosa_list_LocationBase"},
		{!isNil "GroupsStarted"},
		{!isNil "gosa_framesAVG"},
		{!isNil "civilianBasePos"},
		{!isNil "gosa_MPF_InitDone"},
		{!isNil "gosa_playerStartingClass"},
		{!isNil "gosa_friendlyside"},
		{!isNull player},
		{!isNil "BIS_fnc_init"},
		{!isNil "gosa_fnc_init"},
		{!isNil "gosa_towns"},
		{!isNil "gosa_respawnMarkers"}
	]] execVM "dir\client\while_LoadingScreen.sqf";

waitUntil {!isNull player};
player setPos [-2000 - random 500, 1000 - random 500];

if (!isNil "gosa_respawnMarkers" && {count gosa_respawnMarkers > 0}) then {
	player setPos getMarkerPos (gosa_respawnMarkers call BIS_fnc_selectRandom);
}else{
	_arr = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_arr resize 2;
	player setPos _arr;
};

playerReady = true;

// подготовить объекты. обнаруживает противников
{
	player reveal _x;
} forEach (player nearObjects 100);
#endif
playerReady = true;
