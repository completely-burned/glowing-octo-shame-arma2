﻿waitUntil {sleep 5; !isNil "locationStarted"};

private["_east1","_west1","_resistance1","_listPlayers","_s_1g"];
_east1 = 0;_west1 = 0;_resistance1 = 0;

// пространство на отряд
_s_1g = 130^2;

/* количество отрядов
_s_all = _s_1g * ({{alive _x && !(_x call gosa_fnc_isPlayer)} count units _x > 0} count allGroups);
// радиус
_r = sqrt(_s_all/pi);*/

_time = time;

while{true}do{
	_delay = (time - _time);
	_time = time;

	if !(isNil "CivilianLocation") then {
		private["_sizeLocation"];
		_sizeLocation = sqrt((_s_1g * ({{alive _x && !(_x call gosa_fnc_isPlayer)} count units _x > 0} count allGroups))/pi) max 100;
		if(gosa_locationSize != _sizeLocation)then{
			gosa_locationSize = +_sizeLocation;
			publicVariable "gosa_locationSize";
		};

		Private["_objects"];
		_objects = (civilianBasePos nearEntities [["AllVehicles"], gosa_locationSize]);

		Private["_west","_east","_resistance"];
		Private["_westPlayers","_eastPlayers","_resistancePlayers"];

		_west = West CountSide _objects;
		_east = East CountSide _objects;
		_resistance = Resistance CountSide _objects;

		_westPlayers = 0;
		_eastPlayers = 0;
		_resistancePlayers = 0;

		{
			private["_veh"];
			_veh = effectiveCommander _x;
			if(_veh call gosa_fnc_isPlayer)then{
				switch (side _veh) do {
					case (west):
					{
						_westPlayers = _westPlayers + 1;
					};
					case (east):
					{
						_eastPlayers = _eastPlayers + 1;
					};
					case (resistance):
					{
						_resistancePlayers = _resistancePlayers + 1;
					};
					default {};
				};
			};
		}forEach _objects;

		if (missionNamespace getVariable "respawn" == 0) then {
			// FIXME: не понимаю, зачем это вообще нужно, возможно в режиме возрождения база слишком медленный захват
			// FIXME: это слишком много кмк
			_westPlayers = _westPlayers * 10;
			_eastPlayers = _eastPlayers * 10;
			_resistancePlayers = _resistancePlayers * 10;
		};

		_west = _westPlayers + _west;
		_east = _eastPlayers + _east;
		_resistance = _resistancePlayers + _resistance;

		_westEnemies = 0;
		_eastEnemies = 0;
		_resistanceEnemies = 0;

		if (east getFriend west < 0.6) then {
			_east = (_east - _west);
			_eastEnemies = _eastEnemies + _west;
		};
		if (east getFriend resistance < 0.6) then {
			_east = (_east - _resistance);
			_eastEnemies = _eastEnemies + _resistance;
		};
		if (west getFriend east < 0.6) then {
			_west = (_west - _east);
			_westEnemies = _westEnemies + _east;
		};
		if (west getFriend resistance < 0.6) then {
			_west = (_west - _resistance);
			_westEnemies = _westEnemies + _resistance;
		};
		if (resistance getFriend west < 0.6) then {
			_resistance = (_resistance - _west);
			_resistanceEnemies = _resistanceEnemies + _west;
		};
		if (resistance getFriend east < 0.6) then {
			_resistance = (_resistance - _east);
			_resistanceEnemies = _resistanceEnemies + _east;
		};

		// _east = (_east max -50);
		// _west = (_west max -50);
		// _resistance = (_resistance max -50) ;

		// _east = (_east min 50);
		// _west = (_west min 50);
		// _resistance = (_resistance min 50) ;

		// _countGroups = count allGroups;
		// _east1 = ((_east1 + _east) max 0);
		// _west1 = ((_west1 + _west) max 0);
		// _resistance1 = ((_resistance1 + _resistance) max 0);

		_east1 = (_east1 + (_east *  _delay));
		_west1 = (_west1 + (_west *  _delay));
		_resistance1 = (_resistance1 + (_resistance *  _delay));

		_east1 = (_east1 max 0);
		_west1 = (_west1 max 0);
		_resistance1 = (_resistance1 max 0) ;

		_east1 = (_east1 min 50000);
		_west1 = (_west1 min 50000);
		_resistance1 = (_resistance1 min 50000) ;


		_listPlayers = ([] call BIS_fnc_listPlayers);

		private["_next"];
		_next = false;
		if(isMultiplayer)then{
			if (((_east1 >=  50000 && east CountSide _listPlayers > 0 && _eastEnemies * 3 < _east) || (_west1 >=  50000 && west CountSide _listPlayers > 0 && _westEnemies * 3 < _west) || (_resistance1 >=  50000 && resistance CountSide _listPlayers > 0 && _resistanceEnemies * 3 < _resistance))) then {
				_next = true;
			};
		}else{
			if (((_east1 >=  50000 && playerSide == east  && _eastEnemies * 3 < _east) || (_west1 >=  50000 && playerSide == west && _westEnemies * 3 < _west) || (_resistance1 >=  50000 && playerSide == resistance && _resistanceEnemies * 3 < _resistance))) then {
				_next = true;
			};
		};
		if(_next)then{
			[] call locationNext;
			_east1 = 0;
			_west1 = 0;
			_resistance1 = 0;
		};
	};
	sleep 1;
};
