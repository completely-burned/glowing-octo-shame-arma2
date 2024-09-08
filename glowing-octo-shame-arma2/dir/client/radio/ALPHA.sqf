if (true) exitWith {};

cameraon commandFollow leader cameraon;

{
	deleteVehicle vehicle _x;
	deleteVehicle _x;
} forEach units cameraon;

{
	_x allowDamage false;
} forEach units player;

cameraon disableAI "LIGHTS";
cameraon setPilotLight true;
cameraon enableGunLights "ForceOn";

{
	_x enableGunLights "ForceOn";
} forEach allGroups;

[cameraOn] allowGetIn true;
[cameraOn] orderGetIn true;

//commander cameraon action ["TurnOut", cameraon];

setAccTime 1;

player allowDamage false;
player setCaptive true;

group cameraon setVariable ["lambs_danger_enableGroupReinforce", true, true];

[] execVM "dir\spectator\while_spec_prio.sqf";
[] execVM "dir\spectator\while_cam_auto.sqf";
gosa_spectator_exit = true;
gosa_spectator_prio_exit = gosa_spectator_exit;

tmp_veh = vehicle cameraOn;
tmp_speed = 15;
tmp_azi = getdir tmp_veh;
tmp_veh setVelocity [tmp_speed * (sin tmp_azi), tmp_speed * (cos tmp_azi), 5];

{
	deleteVehicle vehicle _x;
	deleteVehicle _x;
} forEach allUnits+vehicles;

tmp_arr = [typeOf cameraOn, effectiveCommander vehicle cameraOn, [commander vehicle cameraOn, gunner vehicle cameraOn, driver vehicle cameraOn]];
{
	tmp_arr set [count tmp_arr, [_x, assignedVehicleRole _x, rank _x]];
} forEach crew cameraOn;
tmp_arr;
