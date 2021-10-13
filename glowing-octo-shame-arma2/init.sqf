#define __A2OA__
/*---------------------------------------------------------------------------
это отладочная версия сценария // diag_log
---------------------------------------------------------------------------*/

diag_log format ["Log: [init.sqf] *** mission starting %1 ***", worldname];

#ifdef __A2OA__
if !(requiredVersion "1.60") then {
	failMission "LOSER";
}else{
#endif

	[] execVM "dir\common\mpf_override.sqf";

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

	gosa_loglevel = missionNamespace getVariable "gosa_debugLevel"; // diag_log

	if(isNil "gosa_loglevel")then{ // diag_log
		gosa_loglevel=0;
	}; // diag_log

	if(gosa_loglevel>0)then{ // diag_log
		debug=true; // diag_log
	}else{ // diag_log
		debug=false; // diag_log
	}; // diag_log
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
