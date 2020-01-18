scriptName "UAV\data\scripts\uav_interface.sqf";
/*
	File: uav_interface.sqf
	Author: Karel Moricky

	Description:
		UAV Interface system

	Returned value(s):
		Nothing
*/
_arguments = _this select 3;
_logic = _arguments select 0;
_defaultPlayer = _arguments select 1;
_defaultTeamswitch = teamswitchenabled;

//////////////////////////////////////////////////
startLoadingScreen ["UAV","RscDisplayLoadMission"];
//////////////////////////////////////////////////

//--- Select UAV
_uav = _this select 0;

//--- UAV destroyed
if (isnull _uav) exitwith {
	endLoadingScreen;
	hintc format [localize "strwfbasestructuredestroyed",localize "str_uav_action"];
	//textLogFormat ["Log: [UAV] ERROR! Cannot start UAV view - not UAV assigned to %1",_logic]
};

//--- Select terminal
_dis = 10;
_terminalsAll = _arguments select 1;
_terminal = objnull;
{
	if ((player distance _x < _dis && (abs speed _x < 1 || player in _x) && alive _x) || (unitbackpack player == _x)) then {_terminal = _x};
} foreach _terminalsAll;
if (isnull _terminal) exitwith {
	endLoadingScreen;
	hint (localize "str_uav_action" + " - " + localize "str_mp_logged_out");
};

//--- Terminal is away
_isTerminalAway = [_terminal,_dis] spawn {
	_terminal = _this select 0;
	_dis = _this select 1;
	waituntil {
		sleep 1;
		((player distance _terminal >= _dis || abs speed _terminal >= 1 || !alive _terminal) && !(unitbackpack player == _terminal)) || cameraon != BIS_UAV_PLANE || isnil "BIS_UAV_PLANE"
	};
	if (cameraon == BIS_UAV_PLANE) then {
		bis_uav_terminate = true;
		hint (localize "str_uav_action" + " - " + localize "str_mp_logged_out");
	};
};
//if (true) exitwith {debuglog ["Log::::::::::::::::::::::::::::::XXXXXXXXXXXXXXXXXXXXXXXXX"];};

driver _uav setCombatMode "BLUE";

//--- Switch view
gunner _uav removeweapon "nvgoggles";
_uav switchcamera "internal";
player remoteControl gunner _uav;
_locked = locked _uav;
_uav lock true;
_uav selectweapon (weapons _uav select 0);
enableteamswitch false;
titletext ["","black in"];
BIS_UAV_TIME = 0;
BIS_UAV_PLANE = _uav;

//--- Action!
_action_leave = _uav addaction [
	localize "STR_EP1_UAV_action_exit",
	"ca\modules_e\uav\data\scripts\uav_actionCommit.sqf",
	[0],
	1,
	false,
	true,
	"PersonView",
	"isnil 'BIS_UAV_noExit'"
];

//--- Disable HC
if (hcShownBar) then {hcshowbar false};

//--- Show MARTA icons
if (isnil "BIS_UAV_visible") then {BIS_UAV_visible = groupiconsvisible};
setGroupIconsVisible [true,true];
(group _uav) setvariable ["MARTA_waypoint",[true,[-1,-1,-1,-1]]];

//--- Prostprocess effects
//setaperture 24;
_ppColor = ppEffectCreate ["ColorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [0.2, 0.2, 0.2, 0]];
_ppColor ppEffectCommit 0;


//--- RSC
progressLoadingScreen 0.5;

//--- Detect pressed keys (temporary solution)
BIS_UAV_HELI_keydown = {
	_key = _this select 1;
	_uav = BIS_UAV_PLANE;

	//--- END
	//if (_key in (actionkeys 'menuback') && isnil 'BIS_UAV_noExit') then {bis_uav_terminate = true};

	//--- MARKER
	if (_key in (actionkeys 'binocular') && !visiblemap) then {
		_id = 1;
		while {markertype format ['_user_defined_UAV_MARKER_%1',_id] != ''} do {
			_id = _id + 1;
		};
		_worldpos = screentoworld [0.5,0.5];
		_marker = createmarker [format ['_user_defined_UAV_MARKER_%1',_id],_worldpos];
		_marker setmarkertype 'mil_destroy';
		_marker setmarkercolor 'colorred';
		_marker setmarkersize [0.5,0.5];
		_markertime = [daytime] call bis_fnc_timetostring;
		_marker setmarkertext format ['UAV %1: %2',_id,_markertime];
	};

	//--- UP
	if (_key in (actionkeys 'HeliUp')) then {
		_newHeight = (position _uav select 2) + 50;
		if (_newHeight > 1000) then {_newHeight = 1000};
		if (speed _uav < 1) then {_uav domove position _uav;};
		_uav land 'none';
		_uav flyinheight _newHeight;
	};

	//--- DOWN
	if (_key in (actionkeys 'HeliDown')) then {
		_newHeight = (position _uav select 2) - 50;
		if (_newHeight < 100) then {_newHeight = 100};
		_uav land 'none';
		_uav flyinheight _newHeight;
	};
};
_displayEH_keydown = (finddisplay 46) displayaddeventhandler ["keydown","_sqf = _this spawn BIS_UAV_HELI_keydown"];

//--- Detect pressed mouse buttons
_displayEH_mousebuttondown = (finddisplay 46) displayaddeventhandler ["mousebuttondown","
	disableserialization;
	_button = _this select 1;
	if (_button == 007 && !visiblemap) then {comment 'DISABLED';
		_display = uinamespace getvariable 'BIS_UAV_DISPLAY';
		_controls = [112401,112402,112403,112404];
		{
			_control = _display displayctrl _x;
			_control ctrlshow !(ctrlshown _control);
			_control ctrlcommit 0;
		} foreach _controls;
	};
"];


//_display = findDisplay 12;
//_map = _display displayCtrl 51;
_mapEH_mousebuttondown = ((findDisplay 12) displayCtrl 51) ctrladdeventhandler ["mousebuttondown", "
	_button = _this select 1;
	if (_button == 0) then {
		_uav = BIS_UAV_PLANE;
		if (!isnil {(vehicle _uav) getvariable 'BIS_UAV_keepWaypoints'}) exitwith {};

		while {count (waypoints _uav) > 0} do {deletewaypoint ((waypoints _uav) select 0)};

		_worldpos = (_this select 0) posscreentoworld [_this select 2,_this select 3];

		_radius = 1000;
		_wpcount = 4;
		_step = 360 / _wpcount;
		_add = 0;
		_dir = 45;
		for '_d' from 0 to (360-_step) step _step do
		{
			_add = _d;
			_pos = [_worldpos, _radius, _dir+_add] call bis_fnc_relPos;
			_wp = (group _uav) addwaypoint [_pos,0];
			_wp setWaypointType 'MOVE';
			_wp setwaypointdescription ' ';
			_wp setwaypointcompletionradius (1000/_wpcount);
		};
		_pos = [_worldpos, _radius, _dir] call bis_fnc_relPos;
		_wp = (group _uav) addwaypoint [_pos,0];
		_wp setWaypointType 'CYCLE';
		_wp setWaypointBehaviour 'CARELESS';
		_wp setwaypointdescription ' ';
		_wp setwaypointcompletionradius (1000/_wpcount);

		(group _uav) setcurrentwaypoint _wp;
	};
"];

//////////////////////////////////////////////////
endLoadingScreen;
//////////////////////////////////////////////////


//--- TERMINATE
waituntil {!isnil "bis_uav_terminate" || !alive _uav};
if (!alive _uav) then {
	hint format [localize "strwfbasestructuredestroyed",localize "str_uav_action"];
};
terminate _isTerminalAway;
_uav lock _locked;
titletext ["","black in"];
bis_uav_terminate = nil;
BIS_UAV_TIME = nil;
BIS_UAV_PLANE = nil;
objnull remoteControl gunner _uav;
vehicle player switchcamera "internal";
enableteamswitch _defaultTeamswitch;

_uav removeaction _action_leave;

setGroupIconsVisible BIS_UAV_visible;
BIS_UAV_visible = nil;
(group _uav) setvariable ["MARTA_waypoint",[false,[-1,-1,-1,-1]]];

ppEffectDestroy _ppColor;


//1124 cuttext ["","plain"];
(finddisplay 46) displayremoveeventhandler ["keydown",_displayEH_keydown];
(finddisplay 46) displayremoveeventhandler ["mousebuttondown",_displayEH_mousebuttondown];
//(finddisplay 46) displayremoveeventhandler ["mousezchanged",_displayEH_mousezchanged];
((findDisplay 12) displayCtrl 51) ctrlremoveeventhandler ["mousebuttondown",_mapEH_mousebuttondown];