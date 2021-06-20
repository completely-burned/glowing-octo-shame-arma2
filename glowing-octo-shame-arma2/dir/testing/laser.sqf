/*laser скрипт при обнаружении лазерной метки создает бомбу и сбрасывает ее

LaserTarget Class
All
	LaserTarget
		LaserTargetBase
			LaserTargetCBase
				LaserTargetC
			LaserTargetWBase
				LaserTargetW
					LaserTargetWStatic
			LaserTargetEBase
				LaserTargetE
					LaserTargetEStatic
	FireSectorTarget

*/

private ["_createBomb","_laserMarker","_unit","_designatorUnit","_vehicle","_lt","_posB","_dirB","_shell","_ammo","_l","_closest","_dist"];


waitUntil{!isNil {group_system_units}};
waitUntil{!isNil {safeSpawnDistance}};


_createBomb = {

	_laserMarker = _this select 0;
	_designatorUnit = _this select 1;

	// не нужно много бомб, выйти если бомба уже в полете
	_shell = _designatorUnit getVariable "gosa_laserBoShell";
	if (!isNil {_shell} && {alive _shell}) exitWith {
	};

	// начальная позиция бомбы, нуждается в доработке
	_dirB = random 360;
	_posB = [_laserMarker, random 500, _dirB] call BIS_fnc_relPos;
	_posB set [2,5000]; // высота

	// получилось только с A10, мишень лучше имхо
	_vehicle = "A10" createVehicle [
		(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)),
		(gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)),
		 200
	 ];

	// удаляем эффекты
	_vehicle removeAllEventHandlers "Killed";
	_vehicle removeAllEventHandlers "fire";

	// если мод меняет тип боеприпаса, за красных фаб не наводится
	_vehicle addMagazine "4Rnd_GBU12";
	_vehicle addWeapon "BombLauncherA10";

	// стрелок
	_unit = group_system_units createUnit [
		getText (configFile >> "CfgVehicles" >> "A10" >> "crew"), [
			(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)),
			(gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2))
		 ], [], 0, "NONE"
	];

	// скрытие возможно не понадобится если делать выстрел за пределами видимости и после setPos для бомбы на нужною позицию
	//[nil, _vehicle, rHideObject, true] call RE;
	//[nil, _unit, rHideObject, true] call RE;

	// _unit setCaptive true; // side civilian

	// gunner?
	_unit moveInDriver _vehicle;

	_vehicle setVectorDirAndUp [[0,0,-1], [0,1,0]]; // часто вверх ногами

	// reveal за 1000m возможно не имеет смысла
	//_vehicle reveal _laserMarker;

	_vehicle fireAtTarget [_laserMarker, "BombLauncherA10"];

	// addEventHandler "fired" не действует ??
	_ammo = "Bo_GBU12_LGB";
	_shell = nearestObject [_vehicle, _ammo];

	if (isNull(_shell)) then
	{
		_closest = 9999;
		_l = (_vehicle nearObjects [_ammo, 200]);
		{
			_dist = _vehicle distance _x;
			if (_dist < _closest) then
			{
				_closest = _dist;
				_shell = _x;
			};
		} forEach _l;
	};

	// игроки могут пролетать рядом, но это маловероятно
	_shell setPos _posB;

	_designatorUnit setVariable ["gosa_laserBoShell", _shell];

	{
		_x setDamage 1; // нужно отключить эффект смерти
		deleteVehicle _x;
	} forEach [_unit, _vehicle];

};



while{true}do{

	{
		_lt = laserTarget _x;
		if(!isNull _lt && !(_x call gosa_fnc_isPlayer))then{ // для игроков нужно делать запуск бомбы через меню действия
			[_lt, _x] call _createBomb;
		};
		sleep 0.05; // производительность
	} forEach allUnits; // проверяем юнитов т.к. laserTarget узнать можно от них

	sleep 15;
};
