private ["_obj","_nominees","_targets","_target","_units",
	"_switchCamera","_arr","_str","_grp","_n","_allUnits",
	"_unit","_prio","_prio_curent","_veh","_camera"];

_nominees = [[],[]];

gosa_spectator_exit = true;
sleep 3;
gosa_spectator_exit = nil;

while {isNil "gosa_spectator_exit"} do {
	scopeName "main";

	sleep 2;

	_camera = cameraOn;

	_prio_curent = -100000;
	{
		_prio = _x getVariable "gosa_spec_prio";
		if !(isNil "_prio") then {_prio_curent = _prio_curent max _prio};
	} forEach crew _camera;
	
	//if (isNil "_prio_curent") then {_prio_curent = -100000};
	if !(isNil "_prio_curent") then {
		for "_i" from 0 to (count _nominees -1) do {_nominees select _i resize 0};

		{
			_grp = _x;
			_units = units _grp;
			for "_i" from 0 to (count _units -1) do
			{
				_obj = _units select _i;
				_prio = _obj getVariable "gosa_spec_prio";
				if !(isNil "_prio") then {
					if (alive _obj && _obj != player) then {
						if (_prio > 0) then {
							if (_prio > _prio_curent) then {
								_nominees select 0 set [count (_nominees select 1), _obj];
								_nominees select 1 set [count (_nominees select 1), _prio];
							};
						};
					};
				};
			};
		} forEach allGroups;

		// TODO: Сортировка.

		if (count (_nominees select 1) > 0) then {
			// FIXME: selectRandomWeighted не подходит, потому что потом найдутся еще кандидаты.
			_obj = _nominees call gosa_fnc_selectRandomWeighted;
			preloadCamera getPos _obj;
			_str = "INTERNAL";
			diag_log format ["Log: [while_cam_auto] %1 switchCamera %2, %3", _camera, _obj, [_prio_curent, _prio]];
			_veh = vehicle _obj;
			if (_veh == _obj) then {
				_obj switchCamera _str;
			}else{
				_str = "EXTERNAL";
				_veh switchCamera _str;
			};
		};
	};
};
