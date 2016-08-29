#define BIS_SSM_CURRENTDISPLAY UInamespace getVariable "currentCutDisplay"
waitUntil {!isNil "buyMenuLoaded"};
waitUntil {!isNil "CivilianLocation"};
waitUntil {!isNil "civilianBasePos"};

private ["_HQ","_BuyMenu","_OptionsAvailable","_Buy_UAV"];
_HQ = [];
{
	if(configName(configFile >> "CfgVehicles" >> _x) != "")then{
		_HQ = _HQ + [_x]; 
	};
} forEach ["BRDM2_HQ_Base","BTR90_HQ","LAV25_HQ","BMP2_HQ_Base","M1130_CV_EP1","Warfare_HQ_base_unfolded"];

_BuyMenu = [
	["#USER:Man_0","#USER:Ammo_0","#USER:Car_0","#USER:Tank_0","#USER:Helicopter_0","#USER:Plane_0","#USER:Motorcycle_0","#USER:Ship_0","#USER:UAV_0"],
	[gettext(configfile >> "cfgvehicles" >> "Man" >> "displayName"),
	gettext(configfile >> "cfgvehicles" >> "ReammoBox" >> "displayName"),
	gettext(configfile >> "cfgvehicles" >> "Car" >> "displayName"),
	gettext(configfile >> "cfgvehicles" >> "Tank" >> "displayName"),
	gettext(configfile >> "cfgvehicles" >> "Helicopter" >> "displayName"),
	gettext(configfile >> "cfgvehicles" >> "Plane" >> "displayName"),
	gettext(configfile >> "cfgvehicles" >> "Motorcycle" >> "displayName"),
	gettext(configfile >> "cfgvehicles" >> "Ship" >> "displayName"),
	gettext(configfile >> "cfgvehicles" >> "UAV" >> "displayName")],
	[0,0,0,0,0,0,0,0,0]
];

40 CutRsc["OptionsAvailable","PLAIN",0];

_OptionsAvailable = [];

private ["_respawn_pos"];
switch (playerSide) do {
	case (resistance):
	{
		_respawn_pos = getMarkerPos "respawn_guerrila";
	};
	case (civilian):
	{
		_respawn_pos = getMarkerPos "respawn_civilian";
	};
	case (west):
	{
		_respawn_pos = getMarkerPos "respawn_west";
	};
	case (east):
	{
		_respawn_pos = getMarkerPos "respawn_east";
	};
	default {
		_respawn_pos = getMarkerPos format["respawn_%1", playerSide];
	};
};

private["_CivilianLocation","_task"];
_CivilianLocation = CivilianLocation;
_task = player createSimpleTask ["currentTask"];
_task setSimpleTaskDestination civilianBasePos;
_task setTaskState "Created";
_task SetSimpleTaskDescription [localize "str_disp_xbox_desc_cityconflict",localize "str_ac_guard",localize "str_ac_guard"];
player setCurrentTask _task;
[objNull,objNull,_task, "Created"] execVM "ca\Modules\MP\data\scriptCommands\taskHint.sqf";

private ["_markers","_units"];
_markers = [];
_units = [];

private ["_join_action","_join_action_vehicle","_player","_cursorTarget","_join_target_vehicle"];
_join_target_vehicle = objNull;

while {true} do {
	if(CivilianLocation != _CivilianLocation)then {
		_task setTaskState "succeeded";
		[objNull,objNull,_task, "succeeded"] call compile (preprocessFileLineNumbers "ca\Modules\MP\data\scriptCommands\taskHint.sqf");
		_task = player createSimpleTask ["currentTask"];
		_task setSimpleTaskDestination civilianBasePos;
		_task setTaskState "Created";
		_task SetSimpleTaskDescription [localize "str_disp_xbox_desc_cityconflict",localize "str_ac_guard",localize "str_ac_guard"];
		player setCurrentTask _task;
		[objNull,objNull,_task, "Created"] call compile (preprocessFileLineNumbers "ca\Modules\MP\data\scriptCommands\taskHint.sqf");
		_CivilianLocation = CivilianLocation;
	};

	private["_Objects"];
	private["_Buy_Man","_Buy_Car","_Buy_Tank","_Buy_Helicopter","_Buy_Plane","_Buy_Ship"];
	_Buy_Man = false;	_Buy_Car = false;	_Buy_Tank = false;	_Buy_Helicopter = false;	_Buy_Plane = false;	_Buy_Ship = false;

	// if ((player distance _respawn_pos) < 100 ) then {
		// _Buy_Man = true;	_Buy_Car = true;	_Buy_Tank = true;	_Buy_Helicopter = true;
	// };

	_Objects = (nearestObjects [player, [
	//"ReammoBox",
	"LandVehicle",
	"Air",
	"Land_nav_pier_m_2","Land_nav_pier_m_F",
	"Base_WarfareBVehicleServicePoint",
	"Land_SS_hangar","WarfareBAirport","Land_Mil_hangar_EP1","Land_Hangar_F",
	"Base_WarfareBBarracks","Base_WarfareBLightFactory",
	"Base_WarfareBHeavyFactory","Base_WarfareBAircraftFactory"], 100]);
	if ((count _Objects > 0) && (vehicle player == player)) then {
		{
			private["_type","_Object"];
			_Object = _x;
			_type = (typeOf _Object);
			
			if (alive _Object) then {
				// if (true && _type isKindOf "ReammoBox") then {
					// [_Object,_type] call _fnc_reamoBox;
				// };

				if (_type isKindOf "Base_WarfareBVehicleServicePoint") then {
					_Object setammocargo 1;
					_Object setfuelcargo 1;
					_Object setrepaircargo 1;
				};

				if (!_Buy_Man) then {
					if ([[_type],["Base_WarfareBBarracks"]] call m_fnc_CheckIsKindOfArray) then {
						_Buy_Man = true;
					};
				};

				if !(_Buy_Car) then {
					if ([[_type],["Base_WarfareBLightFactory"]] call m_fnc_CheckIsKindOfArray) then {
						_Buy_Car = true;
					};
				};

				if !(_Buy_Tank) then {
					if ([[_type],["Base_WarfareBHeavyFactory"]] call m_fnc_CheckIsKindOfArray) then {
						_Buy_Tank = true;
					};
				};

				if !(_Buy_Helicopter) then {
					if ([[_type],["Base_WarfareBAircraftFactory"]] call m_fnc_CheckIsKindOfArray) then {
						_Buy_Helicopter = true;
					}else{
					};
				};

				if !(_Buy_Plane) then {
					if ([[_type],["Land_SS_hangar","WarfareBAirport","Land_Mil_hangar_EP1","Land_Hangar_F"]] call m_fnc_CheckIsKindOfArray) then {
						_Buy_Plane = true;
					};
				};

				if !(_Buy_Ship) then {
					if ([[_type],["Land_nav_pier_m_2","Land_nav_pier_m_F"]] call m_fnc_CheckIsKindOfArray) then {
						_Buy_Ship = true;
					};
				};

				if ([[_type],["LandVehicle","Air"]] call m_fnc_CheckIsKindOfArray) then {
					_Object setAmmoCargo 1;
					_Object setRepairCargo 1;
					_Object setFuelCargo 1;
					if (isNil {_Object getVariable "hintCrewAction"}) then {
						private["_action"];
						_action = _Object addAction ['Crew','m\client\ACT\ACT_HintCrew.sqf',[],0, false];
						_Object setVariable ["hintCrewAction",_action];
					};
				};
			};
		} foreach _Objects;
	};

	private["_uav_action","_uav_terminals"];
	_uav_action = false;
	_uav_terminals = [];
	_Objects = (nearestObjects [player, ["Base_WarfareBUAVterminal","HMMWV_Terminal_EP1"], 10]);
	if (count _Objects > 0) then {
		{
				private["_type","_Object"];
				_Object = _x;
				_type = (typeOf _Object);
				
				if (alive _Object) then {
					if !(_uav_action) then {
						if ([[_type],["Base_WarfareBUAVterminal","HMMWV_Terminal_EP1"]] call m_fnc_CheckIsKindOfArray) then {
							_uav_action = true; _uav_terminals set [count _uav_terminals, _Object];
						};
					};
				};
		} foreach _Objects;
	};


	if !(_uav_action) then {
		if (typeOf unitBackpack player == "US_UAV_Pack_EP1") then {
			_uav_action = true; _uav_terminals set [count _uav_terminals, unitBackpack player];
		};
	};
	if (_uav_action) then {
		if (isnil {player getvariable "_uav_action"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "str_uav_action", "m\functions\uav_interface.sqf", [_Object, _uav_terminals], 1, false, false];
			player setvariable ["_uav_action",_action];
		};
		if (isnil {player getvariable "_uav_heli_action"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "STR_EP1_ULB_action", "m\functions\uav_heli_interface.sqf", [_Object, _uav_terminals], 1, false, false];
			player setvariable ["_uav_heli_action",_action];
		};
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_uav_ca.paa")]; 
	}else{
		player removeAction (player getVariable "_uav_action");
		player setvariable ["_uav_action", nil];
		player removeAction (player getVariable "_uav_heli_action");
		player setvariable ["_uav_heli_action", nil];
	};

	[] call m_fnc_teleport;
	if (isnil {vehicle player getvariable "_teleport_action"} && !isnull player) then {
		private ["_action"];
		_action = vehicle player addaction ["Teleport", "m\functions\action_buy_menu.sqf", '#USER:teleport_0', 0.5, false, false, "","_target == vehicle player"];
		vehicle player setvariable ["_teleport_action",_action];
	};

	if (isnil {player getvariable "_join_grpNull"} && !isnull player) then {
		private ["_action"];
		_action = player addaction ["leave group", "m\functions\join_grpNull.sqf", "", 0.5, false, false, "","((_target == player) && ((count units player)>1))"];
		player setvariable ["_join_grpNull",_action];
	};

	if (_Buy_Man) then {
		// (BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 0)) CtrlSetText ("\CA\Warfare2\Images\icon_barracks.paa");
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_gear_ca.paa")]; 
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_barracks_ca.paa")]; 
		_Buy_Man = 1;
		if (isnil {player getvariable "_Buy_Man"} && !isnull player && (leader player == player)) then {
			private ["_action"];
			_action = player addaction [localize "str_buy_gear_buy" + " " + gettext(configfile >> "cfgvehicles" >> "Man" >> "displayName"), "m\functions\action_buy_menu.sqf", "#USER:Man_0", 1, false, false];
			player setvariable ["_Buy_Man",_action];
		};
		if (isnil {player getvariable "_Buy_Ammo"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "str_buy_gear_buy" + " " + gettext(configfile >> "cfgvehicles" >> "ReammoBox" >> "displayName"), "m\functions\action_buy_menu.sqf", "#USER:Ammo_0", 1, false, false];
			player setvariable ["_Buy_Ammo",_action];
		};
	}else{
		// (BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 0)) CtrlSetText ("");
		_Buy_Man = 0;
		player removeAction (player getVariable "_Buy_Man");
		player setvariable ["_Buy_Man", nil];
		player removeAction (player getVariable "_Buy_Ammo");
		player setvariable ["_Buy_Ammo", nil];
	};
	if (_Buy_Car or _Buy_Ship) then {
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_lvs_ca.paa")]; 
	};
	if (_Buy_Car) then {
		_Buy_Car = 1;
		if (isnil {player getvariable "_Buy_Car"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "str_buy_gear_buy" + " " + gettext(configfile >> "cfgvehicles" >> "Car" >> "displayName"), "m\functions\action_buy_menu.sqf", "#USER:Car_0", 1, false, false];
			player setvariable ["_Buy_Car",_action];
		};
		if (isnil {player getvariable "_Buy_Motorcycle"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "str_buy_gear_buy" + " " + gettext(configfile >> "cfgvehicles" >> "Motorcycle" >> "displayName"), "m\functions\action_buy_menu.sqf", "#USER:Motorcycle_0", 1, false, false];
			player setvariable ["_Buy_Motorcycle",_action];
		};
	}else{
		_Buy_Car = 0;
		player removeAction (player getVariable "_Buy_Car");
		player setvariable ["_Buy_Car", nil];
		player removeAction (player getVariable "_Buy_Motorcycle");
		player setvariable ["_Buy_Motorcycle", nil];
	};
	if (_Buy_Tank) then {
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_hvs_ca.paa")]; 
		_Buy_Tank = 1;
		if (isnil {player getvariable "_Buy_Tank"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "str_buy_gear_buy" + " " + gettext(configfile >> "cfgvehicles" >> "Tank" >> "displayName"), "m\functions\action_buy_menu.sqf", "#USER:Tank_0", 1, false, false];
			player setvariable ["_Buy_Tank",_action];
		};
	}else{
		_Buy_Tank = 0;
		player removeAction (player getVariable "_Buy_Tank");
		player setvariable ["_Buy_Tank", nil];
	};
	if (_Buy_Helicopter) then {
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_air_ca.paa")]; 
		_Buy_Helicopter = 1;
		if (isnil {player getvariable "_Buy_Helicopter"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "str_buy_gear_buy" + " " + gettext(configfile >> "cfgvehicles" >> "Helicopter" >> "displayName"), "m\functions\action_buy_menu.sqf", "#USER:Helicopter_0", 1, false, false];
			player setvariable ["_Buy_Helicopter",_action];
		};
	}else{
		_Buy_Helicopter = 0;
		player removeAction (player getVariable "_Buy_Helicopter");
		player setvariable ["_Buy_Helicopter", nil];
	};
	if (_Buy_Plane) then {
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_hangar_ca.paa")]; 
		_Buy_Plane = 1;
		if (isnil {player getvariable "_Buy_Plane"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "str_buy_gear_buy" + " " + gettext(configfile >> "cfgvehicles" >> "Plane" >> "displayName"), "m\functions\action_buy_menu.sqf", "#USER:Plane_0", 1, false, false];
			player setvariable ["_Buy_Plane",_action];
			_action = player addaction [localize "str_buy_gear_buy" + " " + localize "str_support", "m\functions\action_buy_menu.sqf", "#USER:Support_0", 1, false, false];
			player setvariable ["_Buy_Support",_action];
			_action = player addaction [localize "str_buy_gear_buy" + " " + localize "str_getin_pos_pilot", "m\functions\action_buy_menu.sqf", "#USER:Pilot_0", 1, false, false];
			player setvariable ["_Buy_Pilot",_action];
		};
	}else{
		_Buy_Plane = 0;
		player removeAction (player getVariable "_Buy_Plane");
		player setvariable ["_Buy_Plane", nil];
		player removeAction (player getVariable "_Buy_Support");
		player setvariable ["_Buy_Support", nil];
		player removeAction (player getVariable "_Buy_Pilot");
		player setvariable ["_Buy_Pilot", nil];
	};
	if (_Buy_Ship) then {
		_Buy_Ship = 1;
		if (isnil {player getvariable "_Buy_Ship"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "str_buy_gear_buy" + " " + gettext(configfile >> "cfgvehicles" >> "Ship" >> "displayName"), "m\functions\action_buy_menu.sqf", "#USER:Ship_0", 1, false, false];
			player setvariable ["_Buy_Ship",_action];
		};
	}else{
		_Buy_Ship = 0;
		player removeAction (player getVariable "_Buy_Ship");
		player setvariable ["_Buy_Ship", nil];
	};
		_Buy_UAV = 0;
	
	_BuyMenu set [2,[_Buy_Man,_Buy_Man,_Buy_Car,_Buy_Tank,_Buy_Helicopter,_Buy_Plane,_Buy_Car,_Buy_Ship,_Buy_UAV]];
	["BuyMenu", "BuyMenu", _BuyMenu, "%1", ""] call BIS_FNC_createmenu; 
	
	for "_i" from 0 to (count _OptionsAvailable - 1) do {
		(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + _i)) CtrlSetText (_OptionsAvailable select _i);
	};
	for "_i" from (count _OptionsAvailable) to (4) do {
		(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + _i)) CtrlSetText ("");
	};
	_OptionsAvailable = [];
	
	if(isMultiplayer)then{
		{
			if(!(_x in _units) && (side _x == playerSide))then{
				_units set [count _units, _x];
				_markers set [count _markers, createMarkerLocal [str _x,position _x]];
			};
		}forEach playableUnits;

		for "_i" from 0 to (count _units - 1) do {
			private ["_unit","_marker"];
			_unit = (_units select _i);
			_marker = (_markers select _i);
			if (!isNull _unit && alive _unit) then {
				private ["_veh"];
				_veh = vehicle _unit;							
				if ((_veh == _unit) || (_unit == (effectiveCommander _veh))) then {	
					_marker setMarkerPosLocal (position _veh);
					_marker setMarkerTypeLocal "vehicle";
					// _marker setMarkerDirLocal getDir _veh;
					_marker setMarkerSizeLocal [3,3];
					private ["_text"];
					_text = name _unit;
					if (lifeState _unit == "UNCONSCIOUS") then {
						_text = _text + (" " + "{" + Localize "str_reply_injured" + "}");
					};
					_text = (_text + " " + "[" + getText(configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'displayName') + "]");
					_marker setMarkerTextLocal _text;
				}else{
					//set marker to invisible area on the map
					_marker setMarkerPosLocal [35000,35000];
				};
			}else{
				deleteMarkerLocal _marker;
				_units set [_i,-1];
				_markers set [_i,-1];
			};
		};

		_units = (_units - [-1]);
		_markers = (_markers - [-1]);
	};

	_cursorTarget = effectiveCommander cursorTarget;
	if (alive _cursorTarget && side _cursorTarget == playerSide && _cursorTarget isKindOf "Man") then {
		if (_join_target_vehicle != _cursorTarget) then {
			if !(isNil "_join_action") then {
				_join_action_vehicle removeAction _join_action;
				_join_action = nil;
				_join_target_vehicle = objNull;
			};
		};
		if (isNil "_join_action") then {
			_player = player;
			_join_action = _player addaction ["join group" + " " + name _cursorTarget, "m\functions\join_grp.sqf", _cursorTarget, 0.5, false, false, "","alive cursorTarget && side cursorTarget == playerSide && (effectiveCommander cursorTarget) isKindOf 'Man'"];
			_join_action_vehicle = _player;
			_join_target_vehicle = _cursorTarget;
		};
	}else{
		if !(isNil "_join_action") then {
			_join_action_vehicle removeAction _join_action;
			_join_action = nil;
			_join_target_vehicle = objNull;
		};
	};
	
	// First aid is not working properly //Первая помощь не работает должным образом 
	{
		_x call m_FirstAid;
	} forEach allUnits;

	sleep 0.5;
};
