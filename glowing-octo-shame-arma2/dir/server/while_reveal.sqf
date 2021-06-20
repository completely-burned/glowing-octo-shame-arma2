if(missionNamespace getVariable "reveal" != 1)exitWith{};

private["_grp","_veh","_knowledge","_nearEntities"];

while{true}do{

	// UAV все существа в радиусе
	if (false) then {
		{
			_veh = _x;
			if (_veh call gosa_fnc_isUAV) then {
				_nearEntities = (position _veh nearEntities 1000);
				{
					_grp = _x;
					if (( side _x getFriend side _veh) >= 0.6 ) then {
						private ["_pos1","_pos2"];
						{
							// if (_veh knowsAbout _x > 0) then {
							_pos1 = getPos _veh;
							_pos2 = getPos _x;
							if (_pos1 distance _pos2 < 1000) then {
								if (!lineIntersects [ _pos1, _pos2, _veh, _x]) then {
									_grp reveal _x;
								};
							};
							// };

						} forEach _nearEntities;
					};
				} forEach allGroups;
			};

		} forEach vehicles;
	};

	// обнаруженные
	if (true) then {
		{
			// _veh цель
			_veh = _x;

				{
					_grp = _x;

					// группа не  знает о цели
					if (_grp knowsAbout _veh == 0) then {

						// сторона знает о цели
						if (side _grp knowsAbout _veh > 0) then {

							// пехота
							if (leader _grp distance _veh < 750) then {
								_grp reveal _veh;
							};

							// техника
							if ( { vehicle _x == _x } count units _grp == 0 ) then {

								// авиация
								if ( { vehicle _x isKindOf "Air" } count units _grp > 0 ) then {
									_grp reveal _veh;
								};

								// наземная
								if (leader _grp distance _veh < 2500) then {
									if ({vehicle _x isKindOf "LandVehicle"} count units _grp > 0 ) then {
										_grp reveal _veh;
									};
								};
							};

						};
					};

				} forEach allGroups;

		} forEach allUnits + vehicles;
	};

	sleep 10;
};

// нужно установить ограничение количества целей
