#define		CLICK_DELAY	0.2

_logic = player;

waitUntil{!isNil{player getVariable "GUI_WP_ATTACK"}};

_GUI_WP_ATTACK = {scriptname "HC: _GUI_WP_ATTACK";
	_is3D = _this select 0;
	_group = _this select 1; // My group
	_target = _this select 2; // Attacked group
	_ctrl = _this select 3;
	_selected = _this select 4;
	_logic = player getvariable "BIS_HC_scope";

	//--- Need some delay to check if RMB is still pressed
	if !(_is3D) then {sleep CLICK_DELAY};

	//--- Button is still pressed - Exit
	if (_logic getvariable "LMB_hold") exitwith {};
	
	//--- Create new waypoint
	if !(_ctrl) then {

		//--- Reset waypoints
		while {count (waypoints _group) > 0} do {deletewaypoint ((waypoints _group) select 0)};
	};

	_wp = _group addwaypoint [position vehicle leader _target,0];
	_wp setwaypointstatements ["false",""];
	_wp waypointattachvehicle (vehicle leader _target);
	_wp setwaypointtype "sad";
	_wp showwaypoint "never";
	if (isNil "_ctrl") then {_ctrl = false};	//--- CorePatch HotFix
	if !(_ctrl) then {_group setcurrentwaypoint _wp};
	_wpdescription = localize "str_ac_destroy";
	_wp setwaypointdescription _wpdescription;
	_id = 0.1 / time;
	_wp setwaypointcompletionradius _id; //<-- Hack - set waypoint's ID

	[_target,"hc_attackedby",[_group]] call bis_fnc_variablespaceadd;

	//_sound = ["ready to kick ass","attacking","assaulting enemy positions","engaging","moving to contact","advancing"] call BIS_fnc_selectRandom;
	//[_sound] execVM ("ca\modules\HC\data\scripts\HC_sound.sqf");

	//--- Report
	if (count _selected > 1) then {_selected = _selected - [group player]};
	if ((_selected select 0) == _group) then {(leader _group) sideradio "HC_Attack"};

	//--- Assign icon
	_icon = -1;
	if (isnil {_target getvariable "hc_attackicon"}) then {
		_icon = _target addgroupicon ["hc_selectedEnemy"];
		_target setvariable ["hc_attackicon",_icon];
	};

	//--- Move handler
	_handler = _logic getvariable "onGroupMove";
	if (!isnil "_handler") then {[_group,_wp,_target] spawn _handler};

	//--- Check if group is still attacking target
	//while {waypointtype _wp == "move" && !isnull _target} do {

	//--- Update position if waypoint is not cancelled, group is alive and visible (and same for target)
	while {waypointcompletionradius _wp == _id && if !(isnull _target) then {getgroupiconparams _target select 3} else {false} && !isnull _group} do {
		//--- HOTFIX
		if ((position vehicle leader _target) distance [0,0,0] < 1) exitwith {debuglog "[HC]: Wreck hotfix"};

		//_wp setwaypointposition [position vehicle leader _target,0];
		_wp waypointattachvehicle (vehicle leader _target);
		_attackers = _target getvariable "hc_attackedby";

		//--- To show or not to show
		if !(isnil "_attackers") then {
			if ({hcleader _x == player} count _attackers > 0) then {_target setgroupicon [_icon,"hc_selectedEnemy"]} else {_target setgroupicon [_icon,"flag"]};
		};
		sleep 0.05;
	};

	//if (waypointdescription _wp == _wpdescription) then {_wp setwaypointdescription ""};
	_newarray = if (!isnil {_target getvariable "hc_attackedby"} && !isnull _target) then {[_target,"hc_attackedby",[_group]] call bis_fnc_variablespaceremove} else {[]};

	//--- No other attackers left
	if (count _newarray == 0) then {
		_target removegroupicon (_target getvariable "hc_attackicon");
		if (!isnil {_target getvariable "hc_attackicon"} && !isnull _target) then {_target setvariable ["hc_attackicon",nil]};
		if (!isnil {_target getvariable "hc_attackedby"} && !isnull _target) then {_target setvariable ["hc_attackedby",nil]};
	};
	if (waypointcompletionradius _wp == _id) then {deletewaypoint _wp};
	//if (waypointdescription _wp == _wpdescription) then {deletewaypoint _wp};
};

_logic setvariable ["GUI_WP_ATTACK",_GUI_WP_ATTACK];
