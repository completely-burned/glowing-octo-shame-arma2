if !(requiredVersion "1.60") then {
	failMission "LOSER";
}else{

	if (!IsDedicated) then {
		[] execVM "m\client\briefing.sqf";
	};
	if (isServer) then {
		[] Call Compile preprocessFileLineNumbers "m\server\params.sqf";
		[] execVM "m\server\StartTime.sqf"
	};

	draga_loglevel = missionNamespace getVariable "debugLevel";;
	if(draga_loglevel>0)then{
		debug=true;
	}else{
		debug=false;
	};
	draga_loglevel_perf = draga_loglevel;

	[] Call Compile preprocessFileLineNumbers "m\init_common.sqf";
	if (isServer) then {
		[] spawn Compile preprocessFileLineNumbers "m\server\init_server.sqf";
	};
	if (!IsDedicated) then {
		[] Call Compile preprocessFileLineNumbers "m\client\init_client.sqf";
	};
};
