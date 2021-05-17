if !(requiredVersion "1.60") then {
	failMission "LOSER";
}else{

	[] execVM "m\common\mpf_override.sqf";

	if (!IsDedicated) then {
		[] execVM "m\client\playerStartPos.sqf";
		[] execVM "m\client\briefing.sqf";
	};
	if (isServer) then {
		[] Call Compile preprocessFileLineNumbers "m\server\params.sqf";
	};

	[] execVM "m\common\setOvercast.sqf";

	if (isServer) then {
		[] execVM "m\server\StartTime.sqf"
	};

	debug=false;

	gosa_loglevel = missionNamespace getVariable "debugLevel";

	if(isNil "gosa_loglevel")then{
		gosa_loglevel=0;
	};

	if(gosa_loglevel>0)then{
		debug=true;
	}else{
		debug=false;
	};
	gosa_loglevel_perf = gosa_loglevel;
	publicVariable "gosa_loglevel";

	[] Call Compile preprocessFileLineNumbers "m\init_common.sqf";
	if (isServer) then {
		[] spawn Compile preprocessFileLineNumbers "m\server\init_server.sqf";
	};
	if (!IsDedicated) then {
		[] Call Compile preprocessFileLineNumbers "m\client\init_client.sqf";
	};

	if (!hasInterface && !isServer) then {
		execVM "init_HC.sqf";
	};
};
