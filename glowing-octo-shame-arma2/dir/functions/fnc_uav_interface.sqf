/*
 * Интерфест беспилотника.
 * Скрипт приводит к ошибкам в многопользовательской игре.
 * Например:
 *	Type Script, expected ..
 * TODO: Возможно неисправен и нуждается в проверке.
 * TODO: Маштабирование карты.
 * TODO: Исправление множественного запуска.
 */
private ["_arguments","_arr","_terminal","_uav","_logic",
	"_defaultPlayer","_ppColor",
	"_gunner","_o","_action_leave","_displayEH_keydown",
	"_mapEH_mousebuttondown",
	"_isTerminalAway","_displayEH_mousebuttondown"];
diag_log format ["Log: [uav_interface] %1", _this];

_arguments = _this select 3;
_terminal = _this select 0;
_uav = _this select 1;
_logic = _terminal;

_defaultPlayer = player;

//////////////////////////////////////////////////
startLoadingScreen ["UAV","RscDisplayLoadMission"];
//////////////////////////////////////////////////


if !(isNil "gosa_UAV_PLANE") exitwith {
	endLoadingScreen;
	hint "Reloading interface";
	diag_log format ["Log: [uav_interface] Reloading %1", gosa_UAV_PLANE];
};

//--- UAV destroyed
if (isNull _uav) exitwith {
	endLoadingScreen;
	hintc format [localize "strwfbasestructuredestroyed",localize "str_uav_action"];
	diag_log format ["Log: [uav_interface] _uav %1", _uav];
};

_gunner = gunner _uav;
if (isNull _gunner) exitwith {
	endLoadingScreen;
	hintc format [localize "strwfbasestructuredestroyed",localize "str_uav_action"];
	diag_log format ["Log: [uav_interface] _gunner %1", _gunner];
};

//--- Select terminal
_dis = (10 max ((_defaultPlayer distance _terminal) +1));
diag_log format ["Log: [uav_interface] _dis %1", _dis];

if (isNull _terminal) exitwith {
	endLoadingScreen;
	hint (localize "str_uav_action" + " - " + localize "str_mp_logged_out");
	diag_log format ["Log: [uav_interface] _terminal %1", _terminal];
};

//--- Switch view
if (isMultiplayer) then {
	_o = gosa_owner;
	[nil, _gunner, rremoteControl, _o] call RE;
	private ["_time","_var"];
	_time = time+10;
	while {isNil "_var" && time < _time} do {
		_var = _gunner getVariable "gosa_remoteControl_owner";
		sleep 0.05;
	};
	if (isNil "_var" or {_var != _o}) exitWith {
		endLoadingScreen;
		hint (localize "str_uav_action" + " - " + localize "str_mp_logged_out");
		diag_log format ["Log: [uav_interface] rremoteControl %1 exitWith", _o];
	};
};

{removeAllWeapons _x} forEach crew _uav;
_gunner removeweapon "nvgoggles";
_uav switchcamera "internal";
_defaultPlayer remoteControl _gunner;
_arr = weapons _uav;
if (count _arr > 0) then {_uav selectweapon (_arr select 0)};

// FIXME: Что это?
titletext ["","black in"];

gosa_UAV_TIME = 0;
gosa_UAV_PLANE = _uav;

//--- Terminal is away
_isTerminalAway = [_terminal, _dis, _defaultPlayer] spawn {
	private ["_terminal","_dis","_defaultPlayer"];
	_terminal = _this select 0;
	_dis = _this select 1;
	_defaultPlayer = _this select 2;

	while {!isNil "gosa_UAV_PLANE" && isNil "gosa_uav_terminate"} do {
		sleep 0.1;
		if (isNil "gosa_UAV_PLANE") exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, isNil camera %1", nil];
		};

		if (cameraon != gosa_UAV_PLANE) exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, cameraon %1", [cameraon, gosa_UAV_PLANE]];
		};

		if !(alive _defaultPlayer) exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, player is dead", nil];
		};

		if !(alive _terminal) exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, not alive %1 _terminal", _terminal];
		};

		if ((_defaultPlayer distance _terminal >= _dis || abs speed _terminal >= 1 || !alive _terminal)
			&& !(unitbackpack _defaultPlayer == _terminal)
		) exitWith {
			diag_log format ["Log: [uav_interface] uav terminate, terminal %1", _terminal];
		};
	};

	gosa_uav_terminate = true;
};

//--- Prostprocess effects
//setaperture 24;
_ppColor = ppEffectCreate ["ColorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [0.2, 0.2, 0.2, 0]];
_ppColor ppEffectCommit 0;

//--- RSC, Полоса загрузки.
progressLoadingScreen 0.5;

//--- Обработка нажатий клавиш.
	gosa_UAV_HELI_keydown = {
		private ["_key","_uav","_id","_worldpos","_marker","_markertime","_newHeight"];
		_key = _this select 1;
		_uav = gosa_UAV_PLANE;
		//systemChat format ["Log: [uav_interface] %1, keydown %2", _uav, _this];

		//--- END
		if ((_key in (actionkeys 'menuback') or _key in (actionkeys 'PersonView')) && isNil 'gosa_UAV_noExit') then {gosa_uav_terminate = true};

		//--- MARKER
		if (_key in (actionkeys 'binocular') && !visiblemap) then {
			_worldpos = screentoworld [0.5,0.5];
			systemChat format ['UAV: %1', mapGridPosition _worldpos];
		};

		//--- UP
		if (_key in (actionkeys 'HeliUp')) then {
			_newHeight = (position _uav select 2) + 50;
			if (_newHeight > 2500) then {_newHeight = 2500};
			if (speed _uav < 1) then {
				diag_log format ["Log: [uav_interface] %1, на взлёт", _uav];
				_uav domove position _uav;
			};
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
_displayEH_keydown = (finddisplay 46) displayaddeventhandler ["keydown","call gosa_UAV_HELI_keydown"];

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

	gosa_UAV_HELI_mapEH_mousebuttondown = {
			private ["_button","_uav","_id","_worldpos","_marker","_markertime","_newHeight",
				"_radius","_wpcount","_add","_dir","_pos",
				"_nextWP","_wp","_DirWP","_DirUav","_minus","_plus","_step"];
			_uav = gosa_UAV_PLANE;
			_button = _this select 1;
			//systemChat format ["Log: [uav_interface] %1, keydown %2", _uav, _this];
			if (_button == 0) then {
				// if (!isnil {(vehicle _uav) getvariable 'BIS_UAV_keepWaypoints'}) exitwith {};
				// if (!isnil {(group _uav) getvariable 'BIS_UAV_keepWaypoints'}) exitwith {};
				// _gosa_UAV_WaypointPosCenter = _uav getVariable "_gosa_UAV_WaypointPosCenter";
				_worldpos = (_this select 0) posscreentoworld [_this select 2,_this select 3];
				group _uav setVariable ["gosa_UAV_WaypointPosCenter", _worldpos, true];
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
_mapEH_mousebuttondown = ((findDisplay 12) displayCtrl 51) ctrladdeventhandler ["mousebuttondown", "call gosa_UAV_HELI_mapEH_mousebuttondown"];

//////////////////////////////////////////////////
endLoadingScreen;
//////////////////////////////////////////////////


//--- TERMINATE
while {isNil "gosa_uav_terminate" && alive _uav} do {
	sleep 0.1;
};
if (alive _uav) then {
	if (cameraon == gosa_UAV_PLANE) then {
		hint (localize "str_uav_action" + " - " + localize "str_mp_logged_out");
		diag_log format ["Log: [uav_interface] %1 uav terminate, cameraon %2", _uav, gosa_UAV_PLANE];
	};
}else{
	hint format [localize "strwfbasestructuredestroyed",localize "str_uav_action"];
	diag_log format ["Log: [uav_interface] %1 uav terminate, not alive", _uav];
};

terminate _isTerminalAway;

(finddisplay 46) displayremoveeventhandler ["keydown", _displayEH_keydown];
if !(isNil "_displayEH_mousebuttondown") then {(finddisplay 46) displayremoveeventhandler ["mousebuttondown", _displayEH_mousebuttondown]};
if !(isNil "_mapEH_mousebuttondown") then {((findDisplay 12) displayCtrl 51) ctrlremoveeventhandler ["mousebuttondown", _mapEH_mousebuttondown]};

ppEffectDestroy _ppColor;
// FIXME: Что это?
titletext ["","black in"];

// Чтобы игрок успел понять что с ним случилось.
if !(alive _uav) then {sleep 1};
objNull remoteControl _gunner;
vehicle player switchcamera "internal";

gosa_uav_terminate = nil;
gosa_UAV_TIME = nil;
_gunner setVariable ["gosa_remoteControl_owner", nil, true];
if !(isNil "_action_leave") then {_uav removeaction _action_leave};

// TODO: Исправление множественного запуска.
sleep 1;
gosa_UAV_PLANE = nil;

// FIXME: Что это?
//1124 cuttext ["","plain"];
