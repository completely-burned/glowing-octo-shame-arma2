#define __A2OA__
/*
 * TODO: Рефакторинг.
 */

// Маркеры возрождения должны присутствовать до начала миссии.
[] execVM "dir\client\while_markers.sqf";

private ["_str","_n","_arr"];
_arr = [];

// Для совместимости.
if (isNil "gosa_SquadRole") then {
	gosa_SquadRole = -2;
};

if (isNil "gosa_playerStartingClass") then {
	_str = typeOf player;
	while {sleep 0.01; _str == ""} do {
		_str = typeOf player;
	};
	_arr set [0,_str];
	_n = 0;
	if (_str in gosa_pilotL) then {
		_n = 1;
	};
	_arr set [1,_n];
	gosa_playerStartingClass = _n;
	diag_log format ["Log: [init_client] player typeOf %2, Class %3", nil, _str, _n];
};

gosa_squadOn = [];
gosa_squadOff = [];
gosa_squadOnW = [];
gosa_squadOffW = [506,600,605];
gosa_MapPlayer = [];
availableVehiclesBuyMenu = [[],[],[]];

//--- Окружение-погружение.
if(worldName == "namalsk")then{
	enableEnvironment false;
};
SetGroupIconsVisible [true,false];

#ifndef __ARMA3__
	waitUntil{!isNil "bis_fnc_init"};
#endif
waitUntil{!isNil "gosa_fnc_init"};

/*
[] spawn {
	// BIS_Effects_AirDestructionStage2
	waitUntil {!isNil "BIS_Effects_Secondaries"};
	if (ACE_Avail) then {waitUntil {!isNil "WARFX_Effects_Init"}};
	BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "dir\Client\AirDestructionStage2.sqf";
};
*/

_str = getPlayerUID player;
if (isMultiplayer) then {
while {sleep 0.01; _str == ""} do {
	_str = getPlayerUID player;
};
};
gosa_playerOwner = _str;
gosa_owner = _str;
_arr set [2, _str];
diag_log format ["Log: [init_client] Player UI %1", _str];

#ifndef __ARMA3__
// В файле беспорядок, поэтому сюда поместил временно.
diag_log format ["Log: [init_client] waitUntil gosa_MapPlayers", nil];
waitUntil{!isNil "gosa_MapPlayers"};
diag_log format ["Log: [init_client] post waitUntil gosa_MapPlayers", nil];
#endif

[] execVM "dir\client\init_gameMode.sqf";
[] execVM "dir\client\while_debug_notice.sqf";
[] execVM "dir\client\while_sp_rating.sqf";
[] spawn gosa_fnc_handleLocationTask;
[] execVM "dir\client\clientMenu.sqf";
[] execVM "dir\client\while_localGroup.sqf";
[] execVM "dir\client\while_act_BuyMenu.sqf";
[] execVM ("dir\client\while_aa_hidden.sqf");
[] execVM ("dir\client\while_keyEH_smoke.sqf");
[] execVM ("dir\client\while_respawnRandom.sqf");
[] execVM ("dir\common\while_reinforcement_v2.sqf");
[] execVM ("dir\client\while_assignedVehicle.sqf");
[] execVM ("dir\ban\while_ban.sqf");
[] execVM "dir\testing\while_act_laserBomb.sqf";
[] execVM "dir\functions\fnc_SSM_updateMenu.sqf";
[] execVM "dir\client\while_survival.sqf";


if(!isServer)then{
	// FIXME: Сервер не может считать obj assignedVehicle для не серверных ИИ?
	[] execVM ("dir\client\while_groups_other.sqf");
};


/*
// TODO: Нужна функция.
if ([[player], Officers] call gosa_fnc_CheckIsKindOfArray) then {
	waitUntil{!isNil "gosa_HC_logic"};
	[] call compile preprocessFileLineNumbers "dir\client\gosa_hc.sqf";
	[] execVM "dir\client\while_hc.sqf";
	[player] execVM ("\ca\modules\hc\data\scripts\HC_GUI.sqf");
	[] execVM "dir\client\gosa_hc_gui_wp_attack.sqf";
};
*/

// [] call compile preprocessFileLineNumbers  "dir\Client\coin.sqf";

/* _player = (createVehicle [typeOf player, position player, [], 0, "FORM"]);
selectPlayer _player;
 */

// TODO: Нужна функция.
"respawn" spawn gosa_fnc_RespawnWeaponsAdd;

// TODO: Нужна функция.
player addEventHandler ["killed", {
	skipAddAction = true;
	// _this select 0 setVariable ["BIS_IS_Dead", true, true];
	_this spawn {
		waitUntil{alive player};
		player setCaptive false;
		skipAddAction = nil;
	};
}];

// TODO: Нужна функция для addEventHandler-ов.
if (isMultiplayer) then {
	player addEventHandler ["Respawn", {call gosa_fnc_eh_playerRespawn}];
	// player addEventHandler ["killed", {_this spawn gosa_fnc_killcam}];
	// player addEventHandler ["respawn", {player spawn gosa_fnc_RespawnWeaponsAdd}];
	player addEventHandler ["killed", {"respawn" spawn gosa_fnc_RespawnWeaponsAdd}];
	player addEventHandler ["killed", {_this spawn gosa_fnc_resetActions}];
	// player addEventHandler ["killed", {_this select 0 call {_this setVariable ["BIS_lifestate","ALIVE",true]}}];
	if(missionNamespace getVariable "respawn" != 1)then{
		player addEventHandler ["killed", {call gosa_fnc_eh_playerKilled}];
		waitUntil{!isNil "gosa_MPF_InitDone"};
		#ifdef __ARMA3__
			[nil, player, _arr select 2] remoteExec ["rgosa_setMapPlayerscode", 2];
		#else
			[nil, player, rgosa_setMapPlayers, _arr select 2] call RE;
		#endif
	};
}else{
	onTeamSwitch {
		SetGroupIconsVisible [true,false];
		#ifndef __ARMA3__
			40 CutRsc["OptionsAvailable","PLAIN",0];
		#endif
	};

	{
		if (side _x in [sideLogic]) then {
			diag_log format ["Log: [init_client] not delete switchableUnit %1", _x];
		}else{
			diag_log format ["Log: [init_client] delete switchableUnit %1", _x];
			deleteVehicle _x;
		};
	} forEach switchableUnits - units group player;
	EnableTeamSwitch true;

	PlayerType = [typeOf leader player, rank leader player];
	player addEventHandler ["killed", {_this call gosa_fnc_playerRespawnSP}];
};

// радио 0-0, чтоб разные скрипты тестировать
[] call compile preprocessFileLineNumbers  "dir\Client\radio\init.sqf";

if (gosa_loglevel > 0) then {	//diag_log
	// Военные обозначения, показ всех, чтобы видеть как и где создаются боты.	//diag_log
	_arr = ([] call BIS_fnc_getFactions);	//diag_log
	// player setVariable ["MARTA_showRules", ["USMC", 1, "CDF", 0]];	//diag_log
	for "_i" from (count _arr * 2 -1) to 1 step -2 do {	//diag_log
		_arr set [_i, 1];	//diag_log
	};	//diag_log
	for "_i" from (count _arr * 2 -2) to 0 step -2 do {	//diag_log
		_arr set [_i, _arr select _i];	//diag_log
	};	//diag_log
	gosa_MARTA_showRules = _arr;	//diag_log
};  //diag_log

diag_log format ["Log: [init_client] Done %1", time];
