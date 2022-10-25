/*
Это лишь заготовка.
*/

if(missionNamespace getVariable "reveal" != 1)exitWith{};

private["_grp","_target","_knowledge","_nearEntities","_grp_types",
	"_grp_units","_leader","_grp_side","_arty_targets_o",
	"_arty_targets_b","_arty_targets_r"];

gosa_arty_targets_o = [];
gosa_arty_targets_b = [];
gosa_arty_targets_r = [];

while{true}do{

	// UAV все существа в радиусе
	/*
	if (false) then {
		{
			_target = _x;
			if (_target call gosa_fnc_isUAV) then {
				_nearEntities = (position _target nearEntities 1000);
				{
					_grp = _x;
					if (( side _x getFriend side _target) >= 0.6 ) then {
						private ["_pos1","_pos2"];
						{
							// if (_target knowsAbout _x > 0) then {
							_pos1 = getPos _target;
							_pos2 = getPos _x;
							if (_pos1 distance _pos2 < 1000) then {
								if (!lineIntersects [ _pos1, _pos2, _target, _x]) then {
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
	*/

	//--- обнаруженные
	if (true) then {
		_arty_targets_o = [];
		_arty_targets_b = [];
		_arty_targets_r = [];
		{
			// _target цель
			_target = _x;
			if (alive _target) then {
				{
					_grp = _x;
					_leader = leader _grp;
					_grp_side = side _grp;
					//-- Сторона знает о цели.
					if (_grp_side knowsAbout _target > 0) then {
						_grp_units = units _grp call gosa_fnc_getGroupUnits;
						_grp_types = (_grp_units select 0 call gosa_fnc_getGroupType);
						diag_log format ["Log: [while_reveal] _grp_types %1", _grp_types];

						//-- Артиллерия.
						// TODO: Не нужно вызывать если силы равны.
						// TODO: Вызывать если нет возможности атаковать на прямую.
						if ((_grp_side getFriend side _target) < 0.6 ) then {
							if (_target isKindOf "Land") then {
								if (_grp_side knowsAbout _target >= 1.5) then {
									switch (_grp_side) do {
										case (east):
										{
											_arty_targets_o set [count _arty_targets_o, _target];
										};
										case (west):
										{
											_arty_targets_b set [count _arty_targets_b, _target];
										};
										case (resistance):
										{
											_arty_targets_r set [count _arty_targets_r, _target];
										};
										default {};
									};
								};
							};
						};

						//-- Группа не знает о цели.
						if (_grp knowsAbout _target == 0) then {
							//-- пехота
							if (_leader distance _target < 750) then {
								diag_log format ["Log: [while_reveal] %1 reveal %2, distance < 750", _grp, _target];
								_grp reveal _target;
							};

							//-- техника
							if (count (_grp_units select 1) > 0) then {

								//-- авиация
								if ("Air" in _grp_types) then {
									diag_log format ["Log: [while_reveal] %1 reveal %2, Air", _grp, _target];
									_grp reveal _target;
								};

								//-- наземная
								if (_leader distance _target < 2500) then {
									if ({vehicle _x isKindOf "LandVehicle"} count units _grp > 0 ) then {
										diag_log format ["Log: [while_reveal] %1 reveal %2, LandVehicle", _grp, _target];
										_grp reveal _target;
									};
								};
							};

						};
					};

				} forEach allGroups;
			};
		} forEach (allUnits + vehicles);
	};

	gosa_arty_targets_o = (_arty_targets_o - [objNull]);
	gosa_arty_targets_b = (_arty_targets_b - [objNull]);
	gosa_arty_targets_r = (_arty_targets_r - [objNull]);

	sleep 10;
};

// нужно установить ограничение количества целей
