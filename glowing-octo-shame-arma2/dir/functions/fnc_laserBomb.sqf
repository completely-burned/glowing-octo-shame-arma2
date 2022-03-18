#define __A2OA__

/*

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
 #ifdef __A2OA__

	_laserMarker = _this select 0;
	_designatorUnit = _this select 1;

	if (isNull _laserMarker) exitWith {
		diag_log format["Log: [fnc_laserBomb] _laserMarker %1", _laserMarker];
		objNull;
	};

	// не нужно много бомб, выйти если бомба уже в полете
	_shell = _designatorUnit getVariable "gosa_laserBoShell";
	if (!isNil {_shell} && {alive _shell}) exitWith {
		diag_log format["Log: [fnc_laserBomb] бомба %1 уже отправленна", _shell];
	};

	// начальная позиция бомбы, нуждается в доработке
	_dirB = random 360;
	_posB = [_laserMarker, random 300, _dirB] call BIS_fnc_relPos;
	// высота
	_posB set [2,2000]; 

	// получилось только с A10, мишень лучше имхо
	// не работает если переместить подземлю, сразу уничтожается
	// не работает при создании на большем растоянии от игрока, проблемы синхронизации
	_vehicle = createVehicle ["A10", _posB, [], 0, "CAN_COLLIDE"];

	// удаляем эффекты
	_vehicle removeAllEventHandlers "Killed";
	_vehicle removeAllEventHandlers "fire";

	// если мод меняет тип боеприпаса, за красных фаб не наводится
	_vehicle addMagazine "4Rnd_GBU12";
	_vehicle addWeapon "BombLauncherA10";

	// стрелок
	_unit = group_system_units createUnit [
		getText (configFile >> "CfgVehicles" >> "A10" >> "crew"), [
			// TODO: может зацепить игроков
			(getPos player select 0) + 100, 
			getPos player select 1,
			// при столкновении ничего страшного, но нужно незаметно
			100 
		], [], 0, "CAN_COLLIDE"
	];

	// скрытие возможно не понадобится если делать выстрел за пределами видимости и после setPos для бомбы на нужною позицию
	//[nil, _vehicle, rHideObject, true] call RE;
	//[nil, _unit, rHideObject, true] call RE;

	// _unit setCaptive true; // side civilian

	// gunner?
	_unit moveInDriver _vehicle;

	// часто вверх ногами
	_vehicle setVectorDirAndUp [[0,0,-1], [0,1,0]]; 

	// reveal за 1000m возможно не имеет смысла
	//_vehicle reveal _laserMarker;

	diag_log format["Log: [fnc_laserBomb] создано %1 %2", _vehicle, getPos _vehicle];

	_ammo = "Bo_GBU12_LGB";

	// на всякий случай, а вдруг лучше
	sleep 2; 
	_vehicle fireAtTarget [_laserMarker, "BombLauncherA10"];

	// addEventHandler "fired" не действует ??
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

	diag_log format["Log: [fnc_laserBomb] отправленно %1", _shell];

	// игроки могут пролетать рядом, но это маловероятно
	// _shell setPos _posB;

	diag_log format["Log: [fnc_laserBomb] %1 новая позиция %2", _shell, getPos _shell];

	_designatorUnit setVariable ["gosa_laserBoShell", _shell];

	{
		// нужно отключить эффект смерти
		_x setDamage 1; 
		deleteVehicle _x;
	} forEach [_unit, _vehicle];

	diag_log format["Log: [fnc_laserBomb] чистка %1", [_unit, _vehicle]];

_shell;
#endif