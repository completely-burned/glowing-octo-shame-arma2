if !(requiredVersion "1.60") then {
	failMission "LOSER";
}else{
	debug=false;
	if (!IsDedicated) then {
		[] execVM "m\client\playerSetPosRespawn.sqf"
		[] execVM "m\client\StartTime.sqf"
	};
	if (isServer) then {
		[] Call Compile preprocessFileLineNumbers "m\server\params.sqf";
		[] execVM "m\server\StartTime.sqf"
	};
	[] Call Compile preprocessFileLineNumbers "m\init_common.sqf";
	if (isServer) then {
		[] spawn Compile preprocessFileLineNumbers "m\server\init_server.sqf";
	};
	if (!IsDedicated) then {
		[] Call Compile preprocessFileLineNumbers "m\client\init_client.sqf";
	};
};
