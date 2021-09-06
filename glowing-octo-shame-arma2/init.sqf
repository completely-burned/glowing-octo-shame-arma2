#define __A2OA__

diag_log format ["Log: [init.sqf] *** mission starting %1 ***", worldname];

#ifdef __A2OA__
if !(requiredVersion "1.60") then {
	failMission "LOSER";
}else{
#endif

#ifdef __A2OA__
	[] execVM "dir\common\mpf_override.sqf";
#endif

	if (!IsDedicated) then {
		[] execVM "dir\client\playerStartPos.sqf";
		[] execVM "dir\client\briefing.sqf";
	};
	if (isServer) then {
		[] Call Compile preprocessFileLineNumbers "dir\server\params.sqf";
	};

	[] execVM "dir\common\setOvercast.sqf";

	if (isServer) then {
		[] execVM "dir\server\StartTime.sqf"
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

	[] Call Compile preprocessFileLineNumbers "dir\init_common.sqf";
	if (isServer) then {
		[] spawn Compile preprocessFileLineNumbers "dir\server\init_server.sqf";
	};
	if (!IsDedicated) then {
		[] Call Compile preprocessFileLineNumbers "dir\client\init_client.sqf";
	};

#ifdef __A2OA__
	if (!hasInterface && !isServer) then {
		execVM "init_HC.sqf";
	};
#endif
#ifdef __A2OA__
};
#endif
