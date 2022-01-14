skipAddAction = true;

_arguments = _this select 3;
_terminal = _this select 0;
_uav = _this select 1;
_logic = _terminal;

_defaultPlayer = player;

//////////////////////////////////////////////////
// startLoadingScreen ["UAV","RscDisplayLoadMission"];
//////////////////////////////////////////////////

//--- UAV destroyed
if (isnull _uav) exitwith {
	// endLoadingScreen;
	hintc format [localize "strwfbasestructuredestroyed",localize "str_uav_action"];
	diag_log format ["Log: [uav_interface] isnull _uav %1", _uav];
};

_gunner = gunner _uav;
if (isnull _gunner) exitwith {
	// endLoadingScreen;
	hintc format [localize "strwfbasestructuredestroyed",localize "str_uav_action"];
	diag_log format ["Log: [uav_interface] isnull _gunner %1", _gunner];
};

//--- Select terminal
_dis = 10;
if (isnull _terminal) exitwith {
	// endLoadingScreen;
	hint (localize "str_uav_action" + " - " + localize "str_mp_logged_out");
	diag_log format ["Log: [uav_interface] isnull _terminal %1", _terminal];
};

//--- Switch view
_gunner removeweapon "nvgoggles";
_uav switchcamera "internal";
_defaultPlayer remoteControl _gunner;
_uav selectweapon (weapons _uav select 0);
titletext ["","black in"];
BIS_UAV_TIME = 0;
BIS_UAV_PLANE = _uav;

//--- Terminal is away
_isTerminalAway = [_terminal,_dis] spawn {
	_terminal = _this select 0;
	_dis = _this select 1;

	while {true} do {
		sleep 1;

		if (isnil "BIS_UAV_PLANE") exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, isnil camera %1", nil];
		};

		if (cameraon != BIS_UAV_PLANE) exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, cameraon %1", [cameraon, BIS_UAV_PLANE]];
		};

		if !(alive player) exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, player is dead", nil];
		};

		if !(alive _terminal) exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, not alive %1 _terminal", _terminal];
		};

		if ((player distance _terminal >= _dis || abs speed _terminal >= 1 || !alive _terminal)
			&& !(unitbackpack player == _terminal)
		) exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, %1", _terminal];
		};

	};

	bis_uav_terminate = true;
};

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

//--- Prostprocess effects
//setaperture 24;
_ppColor = ppEffectCreate ["ColorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [0.2, 0.2, 0.2, 0]];
_ppColor ppEffectCommit 0;


//--- RSC
// progressLoadingScreen 0.5;

//--- Detect pressed keys (temporary solution)
if (isNil {BIS_UAV_HELI_keydown}) then {
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
		if (_newHeight > 2500) then {_newHeight = 2500};
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
};
_displayEH_keydown = (finddisplay 46) displayaddeventhandler ["keydown","nil = _this spawn BIS_UAV_HELI_keydown"];

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
if (isNil {BIS_UAV_HELI_mapEH_mousebuttondown}) then {
	BIS_UAV_HELI_mapEH_mousebuttondown = {
			_button = _this select 1;
			if (_button == 0) then {
				// private["_nextWP","_wp","_DirWP","_DirUav","_minus","_plus","_step"];
				_uav = BIS_UAV_PLANE;
				// if (!isnil {(vehicle _uav) getvariable 'BIS_UAV_keepWaypoints'}) exitwith {};
				// if (!isnil {(group _uav) getvariable 'BIS_UAV_keepWaypoints'}) exitwith {};
				// _gosa_UAV_WaypointPosCenter = _uav getVariable "_gosa_UAV_WaypointPosCenter";
				_worldpos = (_this select 0) posscreentoworld [_this select 2,_this select 3];
				group _uav setVariable ["_gosa_UAV_WaypointPosCenter", _worldpos, true];
				while {count (waypoints _uav) > 0} do {deletewaypoint ((waypoints _uav) select 0)};
				/*for "_i" from count waypoints _uav - 1 to 1 step -1 do {
					deleteWaypoint [group _uav, _i];
				};*/
				_radius = 1500;
				_wpcount = 4;
				_step = 360 / _wpcount;
				_add = 0;
				_dir = _step/2;
				for '_d' from 0 to (360-_step) step _step do
				{
					_add = _d;
					_pos = [_worldpos, _radius, _dir+_add] call bis_fnc_relPos;
					_wp = (group _uav) addwaypoint [_pos,0];
					_wp setWaypointType 'MOVE';
					_wp setWaypointBehaviour 'CARELESS';
					_wp setWaypointCombatMode 'BLUE';
					_wp setwaypointdescription 'uav wp created by user';
					_wp setwaypointcompletionradius (_radius/_wpcount);
				};
				_pos = [_worldpos, _radius, _dir] call bis_fnc_relPos;
				_wp = (group _uav) addwaypoint [_pos,0];
				_wp setWaypointType 'CYCLE';
				_wp setWaypointBehaviour 'CARELESS';
				_wp setWaypointCombatMode 'BLUE';
				_wp setwaypointdescription 'uav wp created by user';
				_wp setwaypointcompletionradius (_radius/_wpcount);
				{
					if (waypointType _x != "CYCLE") then {
						// _nextWP = (_x select 1) +1;
						_DirWP = [getWPPos _x, getWPPos [_x select 0, (_x select 1) +1] ] call BIS_fnc_dirTo;
						_DirUav = [ _uav, getWPPos _x ] call BIS_fnc_dirTo;
						_minus = _DirWP - _step;
						_plus  = _DirWP + _step;
						if (_DirUav+1000000 <= _plus+1000000 && _DirUav+1000000 > _minus+1000000) then {
							_wp = _x;
						};
						diag_log format ["gosa_UAV_wp %1", [_DirWP, _DirUav, _x, [_minus,_plus]] ];
					};
				} forEach waypoints (group _uav);
				(group _uav) setcurrentwaypoint _wp;
				//(group _uav) setSpeedMode "LIMITED";
			};
	};
};
_mapEH_mousebuttondown = ((findDisplay 12) displayCtrl 51) ctrladdeventhandler ["mousebuttondown", "nil = _this spawn BIS_UAV_HELI_mapEH_mousebuttondown"];

//////////////////////////////////////////////////
// endLoadingScreen;
//////////////////////////////////////////////////


//--- TERMINATE
waituntil {!isnil "bis_uav_terminate" || !alive _uav};
if (alive _uav) then {
	if (cameraon == BIS_UAV_PLANE) then {
		hint (localize "str_uav_action" + " - " + localize "str_mp_logged_out");
	};
}else{
	hint format [localize "strwfbasestructuredestroyed",localize "str_uav_action"];
};

terminate _isTerminalAway;
titletext ["","black in"];
bis_uav_terminate = nil;
BIS_UAV_TIME = nil;
BIS_UAV_PLANE = nil;
objnull remoteControl _gunner;
vehicle player switchcamera "internal";

_uav removeaction _action_leave;

BIS_UAV_visible = nil;

ppEffectDestroy _ppColor;


//1124 cuttext ["","plain"];
(finddisplay 46) displayremoveeventhandler ["keydown",_displayEH_keydown];
(finddisplay 46) displayremoveeventhandler ["mousebuttondown",_displayEH_mousebuttondown];
//(finddisplay 46) displayremoveeventhandler ["mousezchanged",_displayEH_mousezchanged];
((findDisplay 12) displayCtrl 51) ctrlremoveeventhandler ["mousebuttondown",_mapEH_mousebuttondown];

skipAddAction = nil;
