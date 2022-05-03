#define __A2OA__
/*
	laser скрипт при обнаружении лазерной метки создает бомбу и сбрасывает ее
*/

#ifdef __ARMA3__
 if (true) exitWith {
	 diag_log format ["Log: [laser] exitWith %1", time];
 };
#endif

#ifdef __A2OA__
private ["_lt"];

waitUntil{!isNil {group_system_units}};
waitUntil{!isNil {safeSpawnDistance}};

while{true}do{

	{
		_lt = laserTarget _x;
		// для игроков нужно делать запуск бомбы через меню действия
		if(!isNull _lt && !(_x call gosa_fnc_isPlayer))then{
			[_lt, _x] call gosa_fnc_laserBomb;
		};
		// производительность
		sleep 0.05;
	// проверяем юнитов т.к. laserTarget узнать можно от них
	} forEach allUnits;

	sleep 15;
};

#endif
