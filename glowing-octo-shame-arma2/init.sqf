#define __A2OA__
/*---------------------------------------------------------------------------
это отладочная версия сценария // diag_log
---------------------------------------------------------------------------*/

diag_log format ["Log: [init.sqf] *** mission starting %1 ***", worldname];

gosa_loglevel = missionNamespace getVariable "gosa_debugLevel"; // diag_log
	debug=false;
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

#ifdef __A2OA__
if !(requiredVersion "1.60") then {
	failMission "LOSER";
}else{
#endif

#ifdef __ARMA3__
	BIS_fnc_init = true;
#endif

	[] execVM "dir\common\mpf_override.sqf";

	if (!IsDedicated) then {
		[] execVM "dir\client\playerStartPos.sqf";
		[] execVM "dir\client\briefing.sqf";
	};

	[] Call Compile preprocessFileLineNumbers "dir\common\params.sqf";

	[] execVM "dir\common\setOvercast.sqf";

	if (isServer) then {
		[] execVM "dir\server\StartTime.sqf"
	};

	gosa_pvp = false;

	[] Call Compile preprocessFileLineNumbers "dir\init_common.sqf";
	if (isServer) then {
		[] execVM "dir\server\init_server.sqf";
	};

	#ifndef __A2OA__
	hasInterface = false;
	if !(IsDedicated) then {
		hasInterface = true;
	};
	#endif

	if (!IsDedicated) then {
		if (hasInterface) then {
			[] execVM "dir\client\init_client.sqf";
		}else{
			execVM "init_HC.sqf";
		};
	};


#ifdef __A2OA__
};
#endif
