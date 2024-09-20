#define __A2OA__
/*
	Скрипт создает ракету и отправляет в игрока, если он высоко летает.
	TODO: Ракету нужно сделать видимой для других игроков.
*/

if(missionNamespace getVariable "gosa_airDefense" != 1)exitWith{
	diag_log format ["Log: [while_aa_hidden] exitWith %1", time];
};

#ifdef __A2OA__
private["_testPos","_dir","_posPlayerASL","_height","_heightMax","_veh","_aa","_unit","_hills","_dist","_aaType","_grp","_aaSide","_fps_conf"];

if(isNil {_aaType})then{
	if(gosa_playerSide getFriend EAST < 0.6)then{
		_aaType = "Igla_AA_pod_TK_EP1";
		_aaSide = EAST;
	};
};
if(isNil {_aaType})then{
	if(gosa_playerSide getFriend WEST < 0.6)then{
		_aaType = "Stinger_Pod_US_EP1";
		_aaSide = WEST;
	};
};
if(isNil {_aaType})then{
	// if(gosa_playerSide getFriend RESISTANCE < 0.6)then{
		_aaType = "Igla_AA_pod_TK_EP1";
		_aaSide = RESISTANCE;
	// };
};

if(isNil {_aaType})exitWith{};

_fps_conf = (missionNamespace getVariable "gosa_ai_client_create_fps");
if (_fps_conf == 0) then {
	_fps_conf = 30;
}else{
	_fps_conf = _fps_conf min 30;
};


waitUntil{!isNil {group_system_units}};

_aa = objNull;
_unit = objNull;

while {true} do {

		// не включать при низком fps
		if(diag_fps > _fps_conf)then{

			_veh = vehicle player;

			if (_veh isKindOf "Air" && {effectiveCommander _veh == player}) then {

				_posPlayerASL = getPosASL _veh;

				_height = (getPos _veh) select 2;

				if (_veh isKindOf "Plane") then {
					if ({_x == "CMFlareLauncher"} count getArray (configFile >> "CfgVehicles" >> typeOf _veh >> "weapons") > 0) then {
						_heightMax = 40 + random 900;
					}else{
						_heightMax = 80 + random 900;
					};
				};

				if (_veh isKindOf "Helicopter") then {
					if ({_x == "CMFlareLauncher"} count getArray (configFile >> "CfgVehicles" >> typeOf _veh >> "weapons") > 0) then {
						_heightMax = 25 + random 900;
					}else{
						_heightMax = 50 + random 900;
					};
				};

				if (_height > _heightMax) then {

					_dir = random 360;
					_testPos = [(_posPlayerASL select 0) + 999*sin _dir, (_posPlayerASL select 1) + 999*cos _dir, _posPlayerASL select 2];

					if(!(surfaceIsWater _testPos) or (random 100 < 10))then{

						_hills = false;

						// проверки холмов
						if(_height < 250)then{
							// тестовая позиция для проверки холмов 1000 метров
							_testPos = [(_posPlayerASL select 0) + 999*sin _dir, (_posPlayerASL select 1) + 999*cos _dir, _posPlayerASL select 2];
							// проверка холмов, нагрузка на cpu, 1000 метров
							_hills = lineIntersects [_posPlayerASL, _testPos, _veh, objNull];
						};

						if(!_hills)then{

								_dist = 3000 + random 2000;
								_testPos = [(_posPlayerASL select 0) + _dist*sin _dir, (_posPlayerASL select 1) + _dist*cos _dir, _posPlayerASL select 2];
								if([_testPos, 3000] call gosa_fnc_CheckPlayersDistance)exitWith{};

								if(!canFire _aa or !alive _unit or isNull _unit or isNull _aa)then{

									{
										_x setDamage 1;
										deleteVehicle _x;
									} forEach [_unit, _aa];

									_aa = _aaType createVehicleLocal [(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)) , (gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2))];

									_unit = (group_system_units createUnit [getText (configFile >> "CfgVehicles" >> _aaType >> "crew"), [(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)) , (gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2))], [], 0, "CAN_COLLIDE"]);

									hideObject _aa;
									hideObject _unit;

									_unit setCaptive true;
									_unit moveInGunner _aa;

								};

								_aa setPosASL _testPos;
								_aa setDir (_dir - 180);

								_aa doWatch _veh;

								sleep 1;

								_aa fireAtTarget [_veh];

								{
									_x setDamage 1;
									deleteVehicle _x;
								} forEach [_unit, _aa];

						};

					};
				};

			};
		};

	sleep 4 + random 8;

};

#endif
