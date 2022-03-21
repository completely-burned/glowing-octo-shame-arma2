{
	diag_log format ["Log: [fnc_clean_vars] %1, get = %3, setVar '%2' = nil", _this, _x, _this getVariable _x];
	_this setVariable [_x, nil];
} forEach [
	/*
	// TODO: нуждается в проверке на конфликты.
	"gosa_ban_handleDamage","selectPlayerDisable","gosa_act_teleport",
	"gosa_act_hintCrew","gosa_act_repair","gosa_fnc_WinchManager_cargo",
	"gosa_grpCrewLeave",
	"gosa_transportPos",
	"gosa_transportPosVeh",
	"gosa_playerTransport","transportPlayer",
	"gosa_respawn_blt",
	"gosa_laserBoShell",
	"gosa_SSM_WaypointReached","_gosa_fnc_StaticWeapon_commandGetIn","_crew",
	"gosa_SSM_RequestPos","patrol","_gosa_fnc_StaticWeapon_commandGetOut",
	"_gosa_fnc_waypoints",
	*/
	"gosa_allowCrewInImmobile","gosa_forceSpeed","gosa_disableAIMove",
	"gosa_assignedVehicle",
	"gosa_player_owner","MARTA_showRules","gosa_megaAmmoBox",
	"gosa_skill_aimAcc_def","gosa_skill_aimAcc","gosa_skill_aimAcc_static"
];
