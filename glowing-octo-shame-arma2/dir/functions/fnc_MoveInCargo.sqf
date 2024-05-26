private ["_cargo","_vehicles","_n","_veh","_unit","_ep","_t"];
_vehicles = _this select 0;
_cargo = _this select 1;
_n = 0;
for "_i" from 0 to (count _vehicles -1) do {
	_veh = _vehicles select _i;
	_ep = _veh emptyPositions "cargo";
	_t = (_n +_ep);
	_t = _t min count _cargo;
	for "_i0" from _n to (_t -1) do {
		_unit = _cargo select _i0;
		diag_log format ["Log: [fnc_MoveInCargo] %1 moveInCargo < %2", _veh, _unit];
		_unit assignAsCargo _veh;
		_unit moveInCargo _veh;
		#ifdef __ARMA3__
			if (leader _veh == _unit) then {
				diag_log format ["Log: [fnc_MoveInCargo] %1 setEffectiveCommander %2", _veh, _unit];
				_veh setEffectiveCommander _unit;
			};
		#endif
	};
	_n = _n + _ep;
};
