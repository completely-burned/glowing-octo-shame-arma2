// vehicle: Object - Vehicle the event handler is assigned to
// position: String - Can be either "driver", "gunner", "commander" or "cargo"
// unit: Object - Unit that entered the vehicle

private ["_vehicle","_position","_unit"];
_vehicle = _this select 0;
_position = _this select 1;
_unit = _this select 2;

private ["_grp"];
_grp = group _unit;

// экипаж
private ["_newGrp"];
_newGrp = _grp getVariable "grpCrewOld";
if(!isNil {_newGrp})then{
	[_unit] joinSilent _newGrp;
};
