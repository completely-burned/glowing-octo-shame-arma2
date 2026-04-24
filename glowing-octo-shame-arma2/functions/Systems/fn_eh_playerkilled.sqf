/*
 * Аргументы [_unit, _killer]
 */

BIS_COIN_QUIT = true;
bis_uav_terminate = true;
gosa_COIN_QUIT = true;
if !(isNil "BIS_CONTROL_CAM_Handler") then {
	["",""] call BIS_CONTROL_CAM_Handler;
};
