
#ifdef __ARMA3__
	if (true) exitWith {
		diag_log format ["Log: [mpf_override] exitWith %1", time];
	};
#endif


#define __A2OA__

waitUntil{!isNil{BIS_MPF_InitDone}};


private ["_library"];

_library = [
"move",
"moveIn",
"land",
"addWPCur", //takes object and for his group on his local sets current WP
"animate",
"setDate",
"playmusic",
"playsound",
"switchmove",
"playmove",
"playmovenow",
"playAction",
"playActionnow",
"switchAction",
"hint",
"hintC",
"showCommandingMenu",
"globalChat",
"globalRadio",
"sideChat",
"sideRadio",
"groupChat",
"groupRadio",
//"vehicleChat",
"kbAddTopic",
"kbRemoveTopic",
//"kbtell",
"kbreact",
"deleteWP",
"setWPdesc",
"setWPtype",
"setOvercast",	// --> CorePatch fix -> Prevent some errors in A2 Missions that are still using the RE command rSETOVERCAST
"setGroupID",
"createSimpleTask",
"taskHint",
"createDiaryRecord",
"removeAllWeapons",
"addWeapon",
"addWeaponCargo",
"addMagazine",
"addMagazineCargo",
"clearMagazineCargo",
"clearWeaponCargo",
"endMission",
"failMission",
"titleCut",
"titleText",
//"cutText",
"say",
"playMusic",
"switchCamera",
//"setMusic",
//"fadeSound",
"fadeMusic",
"fadeSound",
"addAction",
"removeAction",
"setCaptive",
"setDir", //caution: works weird (often overwritten by server, tied to setpos)
"setObjectTexture",
// используется
// "execfsm",
// замена не запускается
// "execVM",
"spawn",
// "JIPrequest", //requesting JIP (RE persistent commands) from server by executing this via RE (on server) - parameter: logic local on client
// "JIPexec", // custom scripting functions

"addAction",
"skiptime", //bad
///
/// ! CAUTION - following are not working exactly like engine!
///
"setSimpleTaskDescription",
"setSimpleTaskDestination",
"setCurrentTask",
"setCurrentTaskArrays",
"createTaskSet",
"setTaskState",
"debugLog",
"enablesimulation",
"addEventhandler",
"createMarkerLocal",
"setMarkerPosLocal",
"hideObject",
"callVar"
];
private ["_libraryCustom"];

_libraryCustom =
[
];

private ["_code"];
_code = {
	diag_log format ['Log: [TK] %1', _this];
};

private["_i", "_name"];
for [{_i=0}, {_i< count _library}, {_i = _i + 1}] do
{
  _name = "r" + (_library select _i);
  call compile format ["waitUntil {!isNil{%1code}}",_name];
  call compile format ["%1code = %3",_name, (_library select _i), _code];
};

rsetRank = 'setRank';
rsetRankcode = {
	// private ["_caller", "_target", "_state"];
	// _caller = _this select 0;
	// _target = _this select 1;
	// _state = _this select 2;

	// Поведение при использовании на игроков в многопользовательской кажется непредсказуемым
	if !(_this select 1 call gosa_fnc_isPlayer)then{
		_this select 1 setRank (_this select 2);
	};
};

rvehInit = 'vehInit';
rvehInitcode = {
	[_this select 1] call gosa_fnc_vehInit2;
};

rhintresurrected = 'hintResurrected';
rhintresurrectedcode = {
	private ["_z"];
	_z = _this select 1;
	if (group _z == group player) then {
		_z groupChat 		"+++ resurrected +++ " + (_this select 2) + " +++";
	};
	_z = vehicle _z;
	if (_z == vehicle player) then {
		// сообщение выводится от локального игрока, а не от возродившегося, но это особенности мотора
		_z vehicleChat 	"+++ shell-shocked +++ " + (_this select 2) + " +++";
	};
};

rspawn = 'spawn';
rspawncode = {
#ifdef __A2OA__
	systemChat format["%1: %2", localize "STR_gosa_cheat_detected", _this];
#endif
};

rselectLeader = 'selectLeader';
rselectLeadercode = {
	_this select 1 selectLeader (_this select 2);
};

/* rsetOwner не используется
rsetOwner = 'setOwner';
rsetOwnercode = {
	private ["_z"];
	_z = owner (_this select 2);
	diag_log format ["Log: [mpf] %1 setOwner %2", _this select 1, [_z, _this select 2] ];
	_this select 1 setOwner _z;
};*/

rselectPlayer = 'selectPlayer';
rselectPlayercode = {
	diag_log format ["Log: [respawnRandom] mpf %1", _this];
	if (isServer) then {
		private ["_z"];
		_z = _this select 1 getVariable "gosa_player_owner";
		if (isNil "_z") then {
			diag_log format ["Log: [respawnRandom] mpf setVariable %1", _this select 2];
			// FIXME: переменная остается
			_this select 1 setVariable ["gosa_player_owner", _this select 2, true];
		}else {
			diag_log format ["Log: [respawnRandom] mpf variable == %1", _z];
		};
	};
};

rremoteControl = 'remoteControl';
rremoteControlcode = {
	diag_log format ["Log: [remoteControl] mpf %1", _this];
	if (isServer) then {
		private ["_z"];
		_z = _this select 1 getVariable "gosa_remoteControl_owner";
		if (isNil "_z") then {
			diag_log format ["Log: [remoteControl] mpf setVariable %1", _this select 2];
			_this select 1 setVariable ["gosa_remoteControl_owner", _this select 2, true];
		}else {
			diag_log format ["Log: [remoteControl] mpf variable == %1", _z];
		};
	};
};

// FIXME: Конфликт у новых подключений.
rgosa_setMapPlayers = 'gosa_setMapPlayers';
rgosa_setMapPlayerscode = {
	diag_log format ["Log: [MPF] rgosa_setMapPlayers %1", _this];
	private["_map","_n"];
	_map = gosa_MapPlayers;
	diag_log format ["Log: [MapPlayers] %1", _map];
	_n = (_map select 0) find (_this select 2);
	diag_log format ["Log: [MPF] rgosa_setMapPlayers %1 _n %2", _this select 2, _n];
	if (_n < 0) then {
		_n = 0;
		//-- id
		_map select 0 set [_n, _this select 2];
	};
	//-- data
	_map select 1 set [_n, [_this select 1, _this select 3]];
	diag_log format ["Log: [MapPlayers] %1", _map];
};


gosa_MPF_InitDone = true;
diag_log format ['Log: [mpf_override.sqf] done %1', time];
