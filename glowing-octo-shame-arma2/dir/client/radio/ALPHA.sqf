if (true) exitWith {};

cameraon commandFollow leader cameraon;

{
	deleteVehicle vehicle _x;
	deleteVehicle _x;
} forEach units cameraon;

setAccTime 1;
