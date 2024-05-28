if (true) exitWith {};

cameraon commandFollow leader cameraon;

{
	deleteVehicle vehicle _x;
	deleteVehicle _x;
} forEach units cameraon;

cameraon disableAI "LIGHTS";
cameraon setPilotLight true;

//commander cameraon action ["TurnOut", cameraon];

setAccTime 1;

player allowDamage false;
player setCaptive true;
