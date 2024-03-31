/*
 * Вычисляет локально и устанавливает глобально приоритет для наблюдения.
 */

private ["_obj","_nominees","_targets","_target","_units",
	"_switchCamera","_arr","_str","_grp","_n","_allUnits",
	"_unit","_prio","_prio_orig","_veh"];

gosa_spectator_prio_exit = true;
sleep 2;
gosa_spectator_prio_exit = nil;

while {sleep 1; isNil "gosa_spectator_prio_exit"} do {
	{
		_grp = _x;
		_units = units _grp;
		for "_i" from 0 to (count _units -1) do
		{
			_obj = _units select _i;

			if (local _obj) then {
				_veh = vehicle _obj;

				_prio_orig = _obj getVariable "gosa_spec_prio";
				if (isNil "_prio_orig") then {_prio_orig = 100000};
				_prio = _prio_orig;

				if (alive _obj && getDammage _obj < 0.9) then {
					#ifdef __ARMA3__
						_target = getAttackTarget _obj;
						if !(isNull _target) then {
							//_targets set [count _targets, _target];
							_prio = _prio + 100;
						};
					#endif

					_target = assignedTarget _obj;
					if !(isNull _target) then {
						//_targets set [count _targets, _target];
						_prio = _prio + 100;
					};

					// TODO: Следует за игроком.
					// TODO: Жертва (in _targets).
					// TODO: Игрок.
					// TODO: AFK.
					// TODO: Сидит.
					// TODO: Застрял.

					#ifdef __ARMA3__
						_arr = _grp targets [true, 500];
						_prio = _prio + count _arr;
					#else
						_arr = _obj nearTargets 500;
						_prio = _prio + (side _grp countSide _arr);
					#endif

					if (currentCommand _obj in ["ATTACK","FIRE","ATTACKFIRE"]) then {
						_prio = _prio + 100;
					};

					if !(isNil {_grp getVariable "patrol"}) then {
						_prio = _prio - 100;
					};

					#ifndef __ARMA3__
						if (_veh isKindOf "Air") then {
							_prio = _prio - 100;
						};
					#endif

					//- Лодки.
					if !(vehicle _obj isKindOf "LandVehicle") then {
						_prio = _prio - 100;
					};

					#ifndef __ARMA3__
						if (_veh != _obj) then {
							_prio = _prio - 100;
						};
					#endif

				}else{
					_prio = -100000;
				};

				if (_prio != _prio_orig) then {
					diag_log format ["Log: [loop_spec_prio] %1, setVariable 'gosa_spec_prio' %2", _obj, _prio];
					_obj setVariable ["gosa_spec_prio", _prio, true];
				};
			};
		};
	} forEach allGroups;
};