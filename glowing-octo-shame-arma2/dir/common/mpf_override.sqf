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
"kbtell",
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
// "execfsm", // используется
// "execVM",// замена не запускается
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

rspawn = 'spawn';
rspawncode = {
	systemChat format["MF spawn code %1: %2", localize "STR_gosa_cheat_detected", _this];
};

diag_log format ['Log: [mpf_override.sqf] done %1', time];
