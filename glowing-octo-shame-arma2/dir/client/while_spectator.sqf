/*
 * Это лишь заготовка.
 * Режим наблюдателя, автоматический.
 * FIXME: Не работает в мультиплеере.
 */

private ["_obj","_nominees","_targets","_target",
	"_switchCamera","_arr","_str","_grp","_n","_allUnits","_unit"];
gosa_spectator_exit = true;
sleep 0.1;
gosa_spectator_exit = nil;

_nominees = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]];
_targets = _nominees select 2;

while {isNil "gosa_spectator_exit"} do {
	scopeName "main";
	sleep 2;
	_unit = cameraOn;
	_switchCamera = false;

	for "_i" from 0 to (count _nominees -1) do {
		_nominees select _i resize 0;
	};

	_allUnits = allUnits;
	_allUnits = (_allUnits - units group player);
	for "_i" from 0 to (count _allUnits -1) do {
		_obj = _allUnits select _i;

		if (alive _obj) then {
			#ifdef __ARMA3__
				_n = 0;
				_target = getAttackTarget _obj;
				if !(isNull _target) exitWith {
					_nominees select _n set [count (_nominees select _n), _obj];
					_targets set [count _targets, _target];
					diag_log format ["Log: [while_spectator] %1, _nominees %2 added", _obj, _n];
					diag_log format ["Log: [while_spectator] %1, _nominees %2 added", _obj, 2];
				};
			#endif

			_n = 1;
			_target = assignedTarget _obj;
			if !(isNull assignedTarget _obj) exitWith {
				_nominees select _n set [count (_nominees select _n), _obj];
				_targets set [count _targets, _target];
					diag_log format ["Log: [while_spectator] %1, _nominees %2 added", _obj, _n];
					diag_log format ["Log: [while_spectator] %1, _nominees %2 added", _obj, 2];
			};

			// _targets == _nominees select 2;

			_n = 3;
			_grp = group _obj;
			if (isNil {_grp getVariable "patrol"}) exitWith {
				_nominees select _n set [count (_nominees select _n), _obj];
				diag_log format ["Log: [while_spectator] %1, _nominees %2 added", _obj, _n];
			};

			_n = 4;
			if !(vehicle _obj isKindOf "Air") exitWith {
				_nominees select _n set [count (_nominees select _n), _obj];
				diag_log format ["Log: [while_spectator] %1, _nominees %2 added", _obj, _n];
			};

			_n = 5;
			if !(vehicle _obj isKindOf "LandVehicle") exitWith {
				_nominees select _n set [count (_nominees select _n), _obj];
				diag_log format ["Log: [while_spectator] %1, _nominees %2 added", _obj, _n];
			};

			_n = 6;
			_nominees select _n set [count (_nominees select _n), _obj];
			diag_log format ["Log: [while_spectator] %1, _nominees %2 added ", _obj, _n];
		};
	};

	for "_i" from 0 to (count _nominees -1) do {
		diag_log format ["Log: [while_spectator] _nominees %1, %2", _i, _nominees select _i];
		if (_unit in (_nominees select _i)) exitWith {
			diag_log format ["Log: [while_spectator] %1 in _nominees %2, breakTo ", _unit, _i];
		};
		if (count (_nominees select _i) > 0) exitWith {
			_switchCamera = true;
			diag_log format ["Log: [while_spectator] %1 out _nominees %2, _switchCamera = true", _unit, _i];
		};
	};

	_grp = group _unit;
	_arr = units _grp;
	#ifdef __ARMA3__
		if ({!isNull getAttackTarget _x} count _arr > 0) then {
			diag_log format ["Log: [while_spectator] %1, getAttackTarget", _unit];
			_switchCamera = false;
		};
		if (count (_grp targets [true, 500]) > 0) then {
			diag_log format ["Log: [while_spectator] %1, targets %2 > 0", _unit, _grp];
			_switchCamera = false;
		};
	#endif
	if ({!isNull assignedTarget _x} count _arr > 0) then {
		diag_log format ["Log: [while_spectator] %1, assignedTarget", _unit];
		_switchCamera = false;
	};
	if (_unit in _targets) then {
		diag_log format ["Log: [while_spectator] %1, in _targets %2", _unit, _targets];
		_switchCamera = false;
	};

	if ([_unit] call gosa_fnc_unit_isAttacker) then {
		diag_log format ["Log: [while_spectator] %1, isAttacker", _unit];
		_switchCamera = false;
	};

	if (_unit == player) then {
		diag_log format ["Log: [while_spectator] %1 == %2", _unit, player];
		_switchCamera = true;
	};

	if !(alive _unit) then {
		diag_log format ["Log: [while_spectator] %1 not alive", _unit];
		_switchCamera = true;
	};

	if (_switchCamera) then {
		for "_i" from 0 to (count _nominees -1) do {
			//for "_i0" from 0 to (count (_nominees select _i) -1) do {
				_arr = (_nominees select _i);
				if (count _arr > 0) then {
					_unit = (_arr call BIS_fnc_selectRandom);
					preloadCamera getPos _unit;
					_str = "INTERNAL";
					sleep 2;
					if (vehicle _unit != _unit) then {
						_str = "GUNNER";
					};
					_unit switchCamera _str;
				};
			//};
		};
	};
};
