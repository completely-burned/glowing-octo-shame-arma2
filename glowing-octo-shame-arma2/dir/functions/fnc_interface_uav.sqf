diag_log format ["Log: [fnc_interface_uav] %1", _this];

if (_this select 4 isKindOf "Helicopter") then {
	//_this execVM 'dir\uav\uav_heli_interface.sqf';
	hint format ["UAV type %1 is not completed in the script", _this select 5];
} else {
	_this execVM 'dir\uav\uav_interface.sqf';
};
