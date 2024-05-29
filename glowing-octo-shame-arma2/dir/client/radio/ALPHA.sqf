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

[] execVM "dir\spectator\while_spec_prio.sqf";
[] execVM "dir\spectator\while_cam_auto.sqf";
gosa_spectator_exit = true;
gosa_spectator_prio_exit = gosa_spectator_exit;
