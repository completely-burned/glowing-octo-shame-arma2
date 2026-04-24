diag_log format ["Log: [gosa_fnc_init] start %1", time];

//--- Необходимые переменные для некоторых функций.
// для fnc_deleteGroup
deadGroup = grpNull;
gosa_cache_HQ = [objNull];

private["_path","_prefix"];
_path = "dir\Functions\";

// файлы без приставки
_prefix="gosa_";

#ifndef __ARMA3__
	waitUntil {!isNil "BIS_fnc_init"};
#endif

#ifdef __ARMA3__
	BIS_fnc_distance2D = {_this select 0 distance2D (_this select 1)};
#else
	BIS_fnc_listPlayers = gosa_fnc_listPlayers;
	BIS_fnc_selectRandomWeighted = gosa_fnc_selectRandomWeighted;
#endif

gosa_fnc_init = true;
diag_log format ["Log: [gosa_fnc_init] done %1", time];
