/*laser скрипт при обнаружении лазерной метки создает бомбу и сбрасывает ее
*/

private ["_lt"];

waitUntil{!isNil {group_system_units}};
waitUntil{!isNil {safeSpawnDistance}};

while{true}do{

	{
		_lt = laserTarget _x;
		if(!isNull _lt && !(_x call gosa_fnc_isPlayer))then{ // для игроков нужно делать запуск бомбы через меню действия
			[_lt, _x] call gosa_fnc_laserBomb;
		};
		sleep 0.05; // производительность
	} forEach allUnits; // проверяем юнитов т.к. laserTarget узнать можно от них

	sleep 15;
};
