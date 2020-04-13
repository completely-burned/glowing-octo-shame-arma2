private["_testPos","_dir","_posPlayerASL","_height","_heightMax","_veh"];
waitUntil{!isNil {group_system_units}};
while {true} do {

		_veh = vehicle player;

		if (effectiveCommander _veh == player && _veh isKindOf "Air") then {

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

					if(!lineIntersects [_posPlayerASL, _testPos, _veh, objNull])then{

						[_veh, _posPlayerASL, _dir] spawn {

							private["_testPos","_dir","_dist","_posPlayerASL","_veh","_aaType","_aa","_grp","_unit","_aaSide"];
							_veh = _this select 0;
							_posPlayerASL = _this select 1;
							_dir = _this select 2;

							_dist = 3000 + random 2000;
							_testPos = [(_posPlayerASL select 0) + _dist*sin _dir, (_posPlayerASL select 1) + _dist*cos _dir, _posPlayerASL select 2];
							if([_testPos, 3000] call m_fnc_CheckPlayersDistance)exitWith{};

							if(isNil {_aaType})then{
								if(playerSide getFriend EAST < 0.6)then{
									_aaType = "Igla_AA_pod_TK_EP1";
									_aaSide = EAST;
								};
							};
							if(isNil {_aaType})then{
								if(playerSide getFriend WEST < 0.6)then{
									_aaType = "Stinger_Pod_US_EP1";
									_aaSide = WEST;
								};
							};
							if(isNil {_aaType})then{
								// if(playerSide getFriend RESISTANCE < 0.6)then{
									_aaType = "Igla_AA_pod_TK_EP1";
									_aaSide = RESISTANCE;
								// };
							};

							if(isNil {_aaType})exitWith{};


							_aa = _aaType createVehicleLocal [(draga_posDefaultHiden select 0) + ((random draga_posDefaultHidenRandom) - (draga_posDefaultHidenRandom/2)) , (draga_posDefaultHiden select 1) + ((random draga_posDefaultHidenRandom) - (draga_posDefaultHidenRandom/2))];
							hideObject _aa;

							_unit = group_system_units createUnit [getText (configFile >> "CfgVehicles" >> _aaType >> "crew"), [(draga_posDefaultHiden select 0) + ((random draga_posDefaultHidenRandom) - (draga_posDefaultHidenRandom/2)) , (draga_posDefaultHiden select 1) + ((random draga_posDefaultHidenRandom) - (draga_posDefaultHidenRandom/2))], [], 0, "CAN_COLLIDE"];
							hideObject _unit;
							_unit setCaptive true;
							_unit moveInGunner _aa;

							_aa setPosASL _testPos;
							_aa setDir (_dir - 180);

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

	sleep 0.5 + random 8;

};
