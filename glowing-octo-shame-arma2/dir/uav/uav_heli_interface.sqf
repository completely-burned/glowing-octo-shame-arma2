scriptName "UAV_Heli\data\scripts\uav_interface.sqf";
/*
	File: uav_interface.sqf

	Description:
		UAV Heli Interface system

	Returned value(s):
		Nothing
*/
_arguments = _this select 3;
_logic = _arguments select 1 select 0;
_defaultPlayer = _arguments select 1;
_defaultTeamswitch = teamswitchenabled;

//////////////////////////////////////////////////
startLoadingScreen ["UAV","RscDisplayLoadMission"];
//////////////////////////////////////////////////

//--- Select UAV
_uav = _this select 0;

//--- UAV destroyed
if (isnull _uav || isnull gunner _uav) exitwith {
	endLoadingScreen;
	hint format [localize "strwfbasestructuredestroyed",localize "STR_EP1_ULB_action"];
	//debuglog format ["Log: [UAV] ERROR! Cannot start UAV view - not UAV assigned to %1",_logic]
};

//--- Select terminal
_terminalsAll = _arguments select 1;
if (count _terminalsAll > 0) then {
	_terminal = objnull;
	_dis = 10;
	{
		if ((player distance _x < _dis && abs speed _x < 1 && alive _x) || (unitbackpack player == _x)) then {_terminal = _x};
	} foreach _terminalsAll;
	if (isnull _terminal) exitwith {
		hint (localize "str_uav_action" + " - " + localize "str_mp_logged_out");
	};

	//--- Terminal is away
	_isTerminalAway = [_terminal,_dis] spawn {
		_terminal = _this select 0;
		_dis = _this select 1;
		waituntil {
			sleep 1;
			((player distance _terminal >= _dis || abs speed _terminal >= 1 || !alive _terminal) && !(unitbackpack player == _terminal)) || cameraon != BIS_UAV_HELI_PLANE || isnil "BIS_UAV_HELI_PLANE"
		};
		if (cameraon == BIS_UAV_HELI_PLANE) then {
			bis_uav_terminate = true;
			hint (localize "str_uav_action" + " - " + localize "str_mp_logged_out");
		};
	};
};

//--- Switch view
_camera = gunner _uav;
_camera removeweapon "nvgoggles";
_uav switchcamera "gunner";
_player = player;
_player remoteControl _camera;
if (isengineon vehicle _player) then {vehicle _player action ["autohover",vehicle _player]};
_player setvelocity [0,0,0];
_player setdir (direction _player);
_player selectweapon "hellfirelauncher";
_locked = locked _uav;
_uav lockturret [[1],false];
_uav lock true;
if (count weapons cameraon > 0) then {cameraon selectweapon (weapons _uav select 0)};
_uav removeweapon "nvgoggles";
enableteamswitch false;
titletext ["","black in"];
BIS_UAV_HELI_TIME = 0;
BIS_UAV_HELI_PLANE = _uav;
//showhud false;

//--- Action!
_action_fire = _uav addaction [
	localize "STR_usract_fire",
	"ca\modules_e\uav_heli\data\scripts\uav_actionCommit.sqf",
	[0],
	1,
	false,
	false,
	"Fire",
	""//"((vehicle player) ammo BIS_UAV_HELI_weapon > 0)"
];
_action_leave = _uav addaction [
	localize "STR_EP1_ULB_action_exit",
	"ca\modules_e\uav_heli\data\scripts\uav_actionCommit.sqf",
	[1],
	1,
	false,
	true,
	"PersonView",
	"isnil 'BIS_UAV_HELI_noExit'"
];

if (!("Laserdesignator_mounted" in weapons _uav) && isnil {_uav getvariable "BIS_ULB_noLaser"}) then {
	_uav addmagazine "laserbatteries";
	_uav addweapon "laserdesignator_mounted";
	_uav selectweapon "laserdesignator_mounted";
};

//--- Disable HC
if (hcShownBar) then {hcshowbar false};

//--- Disable sentences
enableSentences false;
clearradio;

//--- Show MARTA icons

if (isnil "BIS_UAV_visible") then {BIS_UAV_visible = groupiconsvisible};
setGroupIconsVisible [true,false];
(group _uav) setvariable ["MARTA_waypoint",[true,[-1,-1,-1,-1]]];


//--- Prostprocess effects
_ppColor = ppEffectCreate ["ColorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [0.2, 0.2, 0.2, 0]];
_ppColor ppEffectCommit 0;

//--- Detect weapon
_veh = vehicle player;
_weaponsAll = weapons _veh;
_magazinesAll = magazines _veh;
_weapons = [];
_magazines = [];
{
	_configAmmo = gettext (configfile >> "cfgmagazines" >> _x >> "ammo");
	_configLaserLock = getnumber (configfile >> "cfgammo" >> _configAmmo >> "laserLock");
	if (_configLaserLock == 1) then {_magazines = _magazines + [_x]};
} foreach _magazinesAll;
{
	_weapon = _x;
	_configMagazines = getarray (configfile >> "cfgweapons" >> _x >> "magazines");
	{
		if (_x in _magazines) exitwith {_weapons = _weapons + [_weapon]};
	} foreach _configMagazines;
} foreach _weaponsAll;

BIS_UAV_HELI_weapon = if (count _weapons > 0) then {_weapons select 0} else {""};
BIS_UAV_HELI_missile = objnull;
BIS_UAV_HELI_missiles = [];

//--- Fire event handler
_eh_fired = _veh addeventhandler ["fired",{
	_veh = _this select 0;
	_weapon = _this select 1;
	if (_weapon == BIS_UAV_HELI_weapon) then {
		_ammo = _this select 4;
		_missile = nearestobject [_veh,_ammo];
		BIS_UAV_HELI_missile = _missile;
		BIS_UAV_HELI_missiles = BIS_UAV_HELI_missiles + [_missile];
	};
}];


//--- HUD
with uinamespace do {
	_classDisplay = if (!isnil {_uav getvariable "BIS_ULB_display"}) then {_uav getvariable "BIS_ULB_display"} else {"RscUnitInfoUAVHeli"};
	1001 cutrsc [_classDisplay,"plain"];
};

//--- UAV Megaloop
[_uav,_logic] spawn {
	_uav = _this select 0;
	_logic = _this select 1;
	_veh = vehicle player;
	_weapon = BIS_UAV_HELI_weapon;
	_uavName = gettext (configfile >> "cfgvehicles" >> typeof _uav >> "displayname");
	_vehName = gettext (configfile >> "cfgvehicles" >> typeof _veh >> "displayname");
	_wpnName = gettext (configfile >> "cfgweapons" >> _weapon >> "displayname");
	_wpnName = toupper _wpnName;
	_delay = 0.1;
	_cannotFireTime = -1;
	_i = 0;

	BIS_UAV_HELI_missiles = BIS_UAV_HELI_missiles - [objnull];

	//--- LOOP -------------------------------------------------
	while {cameraon == _uav} do {
		if (visiblemap) then {1001 cuttext ["","plain"]; with uinamespace do {BIS_UAV_HELI_DISPLAY = nil;}};
		waituntil {!visiblemap || cameraon != _uav};
		if (cameraon != _uav) exitwith {};

		(vehicle player) setvelocity [0,0,0];
		(vehicle player) setdir (direction (vehicle player));

		_i = _i + 1;
		_target = lasertarget _uav;
		_targetCursor = cursortarget;
		_missile = BIS_UAV_HELI_missile;
		_missiles = BIS_UAV_HELI_missiles;
		if (typename _missile == typename 0) then {
			_cannotFireTime = _missile;
			BIS_UAV_HELI_missile = objnull;
			_missile = objnull;
		} else {
			//--- More missiles on the way - show distance to closest one
			if (count _missiles > 1 && !isnull _target) then {
				_missileTemp = objnull;
				_dis = 99999;
				{
					_disTemp = _x distance _target;
					if (_disTemp < _dis) then {_dis = _disTemp; _missileTemp = _x};
				} foreach _missiles;
				_missile = _missileTemp;
			};
		};

		//--- Rotate heli towards target
		if (!isnull _target) then {
			_dirLimitDef = 5;
			_dirNow = direction _veh;
			_dirTo = ([_veh,_target] call bis_fnc_dirto);
			_dirRel = _dirTo - _dirNow;
			if (_dirRel < -180) then {_dirRel = _dirRel + 360};

			_dirAdd = _dirRel / abs(_dirRel);
			_dirLimit = abs (_dirLimitDef * _dirRel / 10);
			if (abs _dirLimit < 1) then {_dirLimit = 0;};
			if (_dirLimit > 5) then {_dirLimit = 5;};
			_veh setdir (_dirNow + _dirAdd * _dirLimit);
		};

		with uinamespace do {
			if (isNil "BIS_UAV_HELI_DISPLAY") then {
				_classDisplay = if (!isnil {_uav getvariable "BIS_ULB_display"}) then {_uav getvariable "BIS_ULB_display"} else {"RscUnitInfoUAVHeli"};
				1001 cutrsc [_classDisplay,"plain"];
				[_logic] call BIS_UAV_HELI_eventHandlers;
			};

			_accNumber = _veh aimedAtTarget [_target,_weapon];
			_acc = if (isnull _target) then {""} else {
				_n = round (_accNumber*100);
				if (_n % 10 == 0) then {if (_n == 0) then {str _n + ".0"} else {str (_n / 100) + "0"}} else {_n / 100};
			};
			_vehdistance = "";
			_targetFrames = [1042,1043,1044,1045];
			_targetCursorFrames = [1038,1039,1040,1041];
			_accFrames = [1046,1047,1048,1049];
			_misFrames = [1050,1051,1052,1053];

			//--- Universal function
			_showFrame = {
				_status = _this select 0;
				_frames = _this select 1;
				{
					if (!isNil "BIS_UAV_HELI_DISPLAY") then {
						(BIS_UAV_HELI_DISPLAY displayctrl _x) ctrlshow _status;
						(BIS_UAV_HELI_DISPLAY displayctrl _x) ctrlcommit 0;
					};
				} foreach _frames;
			};
			//------------------------

			//--- Flickering screen
			//(BIS_UAV_HELI_DISPLAY displayctrl 1004) ctrlsetbackgroundcolor [0,1,0,0.05 + random (0.01 + damage _uav * 0.05)];
			//(BIS_UAV_HELI_DISPLAY displayctrl 1004) ctrlcommit _delay;

			//--- Cursors
			if (isnull _target) then {
				[false,_targetFrames + _accFrames + _misFrames + [1002,1006,1007,1008]] call _showFrame;

				//--- Cannot fire
				if (time - _cannotFireTime < 0.666) then {[_i % 2 == 0,[1008]] call _showFrame;} else {[false,[1008]] call _showFrame;};
			} else {
				//--- Missile distance
				if (isnull _missile) then {
					_vehdistance = round (_veh distance _target);
					[false,_misFrames + [1007]] call _showFrame;
				} else {
					_vehdistance = round (_missile distance _target);
					[true,_misFrames + [1007]] call _showFrame;
				};
				[true,_targetFrames + [1002]] call _showFrame;

				//--- Cannot fire
				if (time - _cannotFireTime < 0.666) then {[_i % 2 == 0,[1008]] call _showFrame;} else {[false,[1008]] call _showFrame;};

				//--- Accuracy
				if (_accNumber > 0) then {
					_posLaser = getposasl _target;
					_posVeh = getposasl _veh;
					_dis = (_target distance _veh) / 10;

					_dX = (_posLaser select 0) - ((_posLaser select 0) - (_posVeh select 0)) / _dis;
					_dY = (_posLaser select 1) - ((_posLaser select 1) - (_posVeh select 1)) / _dis;
					_dZ = (getposatl _target select 2) - ((_posLaser select 2) - (_posVeh select 2)) / _dis;
					_posWorld = [_dX,_dY,_dZ];
					_pos = worldtoscreen _posWorld;

					//--- Directional icon
					if (count _pos > 0) then {
						_dis = _pos distance [0.5,0.5];
						_disFinal = 0.2 / _dis;
						_pos = [0.5 + (((_pos select 0) - 0.5) * _disFinal),0.5 + (((_pos select 1) - 0.5) * _disFinal)];
						
						if (!isNil "BIS_UAV_HELI_DISPLAY") then {
							(BIS_UAV_HELI_DISPLAY displayctrl 1006) ctrlsetposition [(_pos select 0)-0.04*safezoneH,(_pos select 1)-0.04*safezoneH,0.08*safezoneH,0.08*safezoneH];
							(BIS_UAV_HELI_DISPLAY displayctrl 1006) ctrlshow true;
							(BIS_UAV_HELI_DISPLAY displayctrl 1006) ctrlcommit 0;
						};
					} else {[false,[1006]] call _showFrame;};
					[true,_accFrames] call _showFrame;
				} else {
					[false,_accFrames + [1006]] call _showFrame;
				};

			};

			_side = "";
			if (isnull _targetCursor) then {
				[false,_targetCursorFrames + [1003]] call _showFrame;
			} else {
				_pos = worldtoscreen position _targetCursor;
				if (count _pos > 0) then {
					if (!isNil "BIS_UAV_HELI_DISPLAY") then {
						(BIS_UAV_HELI_DISPLAY displayctrl 1003) ctrlsetposition [(_pos select 0)-0.04*safezoneH,(_pos select 1)-0.04*safezoneH,0.08*safezoneH,0.08*safezoneH];
						(BIS_UAV_HELI_DISPLAY displayctrl 1003) ctrlshow true;
						(BIS_UAV_HELI_DISPLAY displayctrl 1003) ctrlcommit 0;
						[true,_targetCursorFrames] call _showFrame;
					};
				};
				_side = side _targetCursor;
				if (_side == civilian) then {_side = ""};
			};

			//--- Left
			_text = format [
				"%1\n\nACC\n%2\n\nDST\n%3\n\nMIS",
				_vehName,
				_acc,
				_vehdistance,
				if (isnull _target) then {""} else {round (_veh distance _target)}
			];
			
			if (!isNil "BIS_UAV_HELI_DISPLAY") then {
				(BIS_UAV_HELI_DISPLAY displayctrl 1010) ctrlsettext _text;
				(BIS_UAV_HELI_DISPLAY displayctrl 1010) ctrlcommit 0;
			};

			//--- Left Bottom
			_text = format [
				"%1\nAMMO %2",
				_wpnName,
				_veh ammo _weapon
			];
			
			if (!isNil "BIS_UAV_HELI_DISPLAY") then {
				(BIS_UAV_HELI_DISPLAY displayctrl 1011) ctrlsettext _text;
				(BIS_UAV_HELI_DISPLAY displayctrl 1011) ctrlcommit 0;
			};

			//--- Right
			_text = format [
				"%1\n\nTGT\n%2\n\nLSR\n\nDST\n%3",
				_uavName,
				_side,
				if (isnull _target) then {""} else {round (_uav distance _target)}
			];
			if (!isNil "BIS_UAV_HELI_DISPLAY") then {
				(BIS_UAV_HELI_DISPLAY displayctrl 1020) ctrlsettext _text;
				(BIS_UAV_HELI_DISPLAY displayctrl 1020) ctrlcommit 0;
			};
		};

		sleep _delay;
	};
};

//--- Default height
/*
_newalt = BIS_UAV_HELI_PLANE getvariable 'BIS_UAV_HELI_height';
if (isnil "_newalt") then {
	_alt = position _uav select 2;
	_newalt = (round (_alt / 20)) * 20;
	if (_newalt < 10) then {_newalt = 0};
	_uav flyinheight _newalt;
	_uav setvariable ['BIS_UAV_HELI_height',_newalt];
};
*/

//--- Detect pressed keys (temporary solution)
BIS_UAV_HELI_keydown = {
	_key = _this select 1;
	_uav = BIS_UAV_HELI_PLANE;
	if !(isnil "bis_debug_cam") exitwith {}; //--- Terminate when camera.sqs is running

	//--- END
	//if (_key in (actionkeys 'menuback') && isnil 'BIS_UAV_HELI_noExit') then {bis_uav_terminate = true};


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
		_newHeight = (position _uav select 2) + 20;
		if (_newHeight > 1000) then {_newHeight = 1000};
		if (speed _uav < 1) then {_uav domove position _uav;};
		_uav land 'none';
		_uav flyinheight _newHeight;
	};

	//--- DOWN
	if (_key in (actionkeys 'HeliDown')) then {
		_newHeight = (position _uav select 2) - 20;
		if (_newHeight < 0) then {_newHeight = 0};
		_uav land 'none';
		_uav flyinheight _newHeight;
	};

	//--- LEFT
	if (_key in (actionkeys 'HeliRudderLeft')) then {
		if (abs speed _uav < 1) then {_uav setdir (direction _uav - 1)};
	};

	//--- RIGHT
	if (_key in (actionkeys 'HeliRudderRight')) then {
		if (abs speed _uav < 1) then {_uav setdir (direction _uav + 1)};
	};

	//--- Fire!
/*
	if (_key == 210) then {
		_target = lasertarget _uav;
		_veh = vehicle player;
		_weapon = BIS_UAV_HELI_weapon;
		if ((_veh aimedAtTarget [_target,_weapon] > 0) && (_veh ammo _weapon > 0)) then {
			_fire = (vehicle player) fireAtTarget [_target,_weapon];
		} else {
			BIS_UAV_HELI_missile = time;
		};
	};
*/
};


//--- 3D - Detect pressed mouse buttons
//_displayEH_mousebuttondown = (finddisplay 46) displayaddeventhandler ["mousebuttondown","_sqf = _this spawn BIS_UAV_HELI_mousebuttondown"];


//--- 2D - Detect pressed mouse buttons
BIS_UAV_HELI_mousebuttondown = {
	_button = _this select 1;
	if (_button == 0) then {
		_uav = BIS_UAV_HELI_PLANE;
		_shift = _this select 4;
		_ctrl = _this select 5;

		comment '--- Shift is reserved for personal markers';
		if (_shift) exitwith {};

		if (!_ctrl) then {while {count (waypoints _uav) > 0} do {deletewaypoint ((waypoints _uav) select 0)}};

		_worldpos = (_this select 0) posscreentoworld [_this select 2,_this select 3];
		_wp = (group _uav) addwaypoint [_worldpos,0];
		_wp setWaypointType 'MOVE';
		if (!_ctrl) then {(group _uav) setcurrentwaypoint _wp};
	};
};


BIS_UAV_HELI_eventHandlers = {
	_logic = _this select 0;
	_end = if (count _this > 1) then {_this select 1} else {false};

	//--- Remove
	if (!isnil {_logic getvariable "display_keydown"}) then {(finddisplay 46) displayremoveeventhandler ["keydown",_logic getvariable "display_keydown"];};
	if (!isnil {_logic getvariable "map_mousebuttondown"}) then {((findDisplay 12) displayCtrl 51) ctrlremoveeventhandler ["mousebuttondown",_logic getvariable "map_mousebuttondown"];};

	if (_end) exitwith {};
	//--- Add
	_displayEH_keydown = (finddisplay 46) displayaddeventhandler ["keydown","_sqf = _this spawn BIS_UAV_HELI_keydown"];
	_mapEH_mousebuttondown = ((findDisplay 12) displayCtrl 51) ctrladdeventhandler ["mousebuttondown", "_sqf = _this spawn BIS_UAV_HELI_mousebuttondown"];
	_logic setvariable ["display_keydown",_displayEH_keydown];
	_logic setvariable ["map_mousebuttondown",_mapEH_mousebuttondown];
};
[_logic] call BIS_UAV_HELI_eventHandlers;


//_logic setvariable ["mousebuttondown",_displayEH_mousebuttondown];


//////////////////////////////////////////////////
endLoadingScreen;
//////////////////////////////////////////////////
titletext ["","black in"];


//--- TERMINATE
waituntil {!isnil "bis_uav_terminate" || !alive _uav || !canmove _uav || cameraon != _uav || !alive player};
if (!alive _uav || !canmove _uav) then {
	hint format [localize "strwfbasestructuredestroyed",localize "STR_EP1_ULB_action"];
};
_uav lock _locked;
if ("Laserdesignator_mounted" in weapons _uav) then {
	_uav removeweapon "laserdesignator_mounted";
	_uav removemagazine "laserbatteries";
	if (!isnull lasertarget _uav) then {deletevehicle lasertarget _uav};
};
titletext ["","black in"];
showhud true;
vehicle player switchcamera "internal";
objnull remoteControl _camera;
enableteamswitch _defaultTeamswitch;
bis_uav_terminate = nil;
1001 cuttext ["","plain"];
with uinamespace do {BIS_UAV_HELI_DISPLAY = nil};

//--- Reenable sentences
enableSentences true;

_uav removeaction _action_fire;
_uav removeaction _action_leave;

setGroupIconsVisible BIS_UAV_visible;
BIS_UAV_visible = nil;
(group _uav) setvariable ["MARTA_waypoint",[false,[-1,-1,-1,-1]]];

ppEffectDestroy _ppColor;

_veh removeeventhandler ["fired",_eh_fired];

BIS_UAV_HELI_weapon = nil;
BIS_UAV_HELI_missile = nil;
BIS_UAV_HELI_missiles = nil;

[_logic,true] call BIS_UAV_HELI_eventHandlers;