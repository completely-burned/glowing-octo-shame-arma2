{
	private["_veh"];
	_veh = _x;
	if ({_x call gosa_fnc_isPlayer} count crew _veh == 0) then {
		_veh setVectorUp [0,0,100];
	};
}forEach _this;
