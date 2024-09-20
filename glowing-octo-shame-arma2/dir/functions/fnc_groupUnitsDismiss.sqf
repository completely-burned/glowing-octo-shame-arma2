private ["_units","_grp"];
_units = _this;

if (count _units < 2) then {
	_grp = grpNull;
}else{
	_grp = createGroup gosa_playerSide;
};
_units join _grp;
