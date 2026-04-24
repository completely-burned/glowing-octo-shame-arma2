private ["_wp","_obj","_pos"];

_wp = _this;
_obj = waypointAttachedVehicle _wp;
_pos = getPos _obj;
if (isNull _obj) then {
	waypointPosition _wp;
}else{
	_pos;
};
