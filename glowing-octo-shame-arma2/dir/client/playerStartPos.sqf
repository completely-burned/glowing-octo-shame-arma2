#define __A2OA__
/*
 * Перемещает игрока после подключения на стартовую позицию.
 */
 private ["_arr","_n","_code"];

if(!isMultiplayer)exitWith{
	playerReady = true;

	// подготовить объекты. обнаруживает противников
	{
		player reveal _x;
	} forEach (player nearObjects 100);
};

_code = {!isNil "gosa_respawnDone" && (!isNil "gosa_respawnMarkers" or !isNil "gosa_respawnRandom")};
//waitUntil {time > 0};
	// LoadingScreen
	if (gosa_loglevel > 0) then {
		_n = time+15;
	}else{
		_n = time+99999999999999999999;
	};
	#ifdef __ARMA3__
		// Конфликтуют с respawnMenu.
		waitUntil {missionNamespace getVariable ["BIS_RscRespawnControlsMap_shown", false] or time > _n};
	#endif
	// FIXME: Можно не запускать при возрождении на базе.
	[["Loading My Mission","RscDisplayLoadMission"], _code, _n, [
		{!isNil format["gosa_listHQ_%1", gosa_playerSide]},
		{!isNil "gosa_list_LocationAirport"},
		{!isNil "gosa_list_LocationBase"},
		{!isNil "GroupsStarted"},
		{!isNil "gosa_framesAVG"},
		{!isNil "civilianBasePos"},
		{!isNil "gosa_MPF_InitDone"},
		{!isNil "gosa_playerStartingClass"},
		{!isNil "gosa_friendlyside"},
		{!isNil "BIS_fnc_init"},
		{!isNil "gosa_fnc_init"},
		{!isNil "gosa_towns"},
		{!isNull player}
	]] execVM "dir\client\while_LoadingScreen.sqf";

#ifndef __ARMA3__
waitUntil {!isNull player};
player setPos [-2000 - random 500, 1000 - random 500];

waitUntil _code;
// A3 перемещает игрока после выбора маркера через gui.
if (isNil "gosa_respawnRandom") then {
if (!isNil "gosa_respawnMarkers" && {count gosa_respawnMarkers > 0}) then {
	player setPos getMarkerPos (gosa_respawnMarkers call BIS_fnc_selectRandom);
}else{
	_arr = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_arr resize 2;
	player setPos _arr;
};
};

playerReady = true;

// подготовить объекты. обнаруживает противников
{
	player reveal _x;
} forEach (player nearObjects 100);
#endif
playerReady = true;
