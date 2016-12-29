#define BIS_SSM_CURRENTDISPLAY UInamespace getVariable "currentCutDisplay"
waitUntil {!isNil "buyMenuLoaded"};

private ["_HQ","_BuyMenu","_OptionsAvailable","_Buy_UAV"];
_HQ = [];
{
	if(configName(configFile >> "CfgVehicles" >> _x) != "")then{
		_HQ = _HQ + [_x]; 
	};
} forEach HQ;

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

private ["_nearestObjects"];
_nearestObjects = [
	"LandVehicle",
	"Air",
	"Base_WarfareBVehicleServicePoint",
	"Base_WarfareBBarracks","Base_WarfareBLightFactory",
	"Base_WarfareBHeavyFactory","Base_WarfareBAircraftFactory"] + HQ + Airport + pier;
	if(!isServer)then{
		_nearestObjects set [count _nearestObjects,"ReammoBox"];
	};

while {true} do {
	private["_Objects"];
	private["_Buy_Man","_Buy_Car","_Buy_Tank","_Buy_Helicopter","_Buy_Plane","_Buy_Ship","_Airport","_teleport","_menu"];
	_Buy_Man = false;	_Buy_Car = false;	_Buy_Tank = false;	_Buy_Helicopter = false;	_Buy_Plane = false;	_Buy_Ship = false; _Airport = false; _teleport = false; _menu = false;

	if ((vehicle player distance _respawn_pos) < 100 ) then {
		_Buy_Man = true;	_Buy_Car = true;	_Buy_Tank = true;	_Buy_Helicopter = true;	_Buy_Plane = true;
	};

	_BuyMenu = [[],[],[]];

	_Objects = (nearestObjects [vehicle player, _nearestObjects, 100]);
	if ((count _Objects > 0)) then {
		{
			private["_type","_Object"];
			_Object = _x;
			_type = (typeOf _Object);
			
			if (alive _Object) then {
				// if (true && _type isKindOf "ReammoBox") then {
					// [_Object,_type] call _fnc_reamoBox;
				// };

				if (!_Buy_Man or !_Buy_Car or !_Buy_Tank or !_Buy_Helicopter or !_Buy_Plane or !_Buy_Ship) then {
					if ([[_type],HQ] call m_fnc_CheckIsKindOfArray) then {
						_Buy_Man = true;	_Buy_Car = true;	_Buy_Tank = true;	_Buy_Helicopter = true;	_Buy_Plane = true;
					};
				};

				if (_type isKindOf "Base_WarfareBVehicleServicePoint") then {
					_Object setammocargo 1;
					_Object setfuelcargo 1;
					_Object setrepaircargo 1;
				};

				if (_respawn_pos distance vehicle player > safeDistance) then {

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

				if (!_Buy_Plane or !_Buy_Helicopter) then {
					if ([[_type],Airport] call m_fnc_CheckIsKindOfArray) then {
						_Buy_Plane = true; _Airport = true; _Buy_Helicopter = true;
					};
				};

				if !(_Buy_Ship) then {
					if ([[_type],pier] call m_fnc_CheckIsKindOfArray) then {
						_Buy_Ship = true;
					};
				};

				};

				if !(_teleport) then {
					if ([[_type],["WarfareBBaseStructure","BASE_WarfareBFieldhHospital"]+HQ] call m_fnc_CheckIsKindOfArray) then {
						_teleport = true;
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

				if ([[_type],["ReammoBox"]] call m_fnc_CheckIsKindOfArray) then {
					if (alive _Object) then {
						_Object call m_fnc_updateReammoBox;
					}else{
						if (local _Object) then {
							deleteVehicle _Object;
						};
					};
				};

				if !(_menu) then {
					if ([[_type],HQ] call m_fnc_CheckIsKindOfArray) then {
						_menu = true;
					};
				};
			};
		} foreach _Objects;
	};

	private["_uav_action","_uav_terminals"];
	_uav_action = false;
	_uav_terminals = [];
	_Objects = (nearestObjects [vehicle player, UAVterminal, 10]);
	if (count _Objects > 0) then {
		{
				private["_type","_Object"];
				_Object = _x;
				_type = (typeOf _Object);
				
				if (alive _Object) then {
					if !(_uav_action) then {
						if ([[_type],UAVterminal] call m_fnc_CheckIsKindOfArray) then {
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

	if (_Buy_Man or _teleport) then {
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_gear_ca.paa")]; 
	};

	if (_teleport) then {
		private["_veh"];
		_veh = vehicle player;
		if (isnil {_veh getvariable "_teleport_action"} && !isnull _veh) then {
			private ["_action"];
			_action = _veh addaction ["Teleport", "m\functions\action_teleport.sqf", '#USER:teleport_0', 0.5, false, false, "","_target == vehicle player"];
			_veh setvariable ["_teleport_action",_action];
		};
	}else{
		private["_veh"];
		_veh = vehicle player;
		_veh removeAction (_veh getVariable "_teleport_action");
		_veh setvariable ["_teleport_action", nil];
	};

	if (_menu) then {
		private["_veh"];
		_veh = vehicle player;
		if (isnil {_veh getvariable "_menu_action"} && !isnull _veh) then {
			private ["_action"];
			_action = _veh addaction ["Menu", "m\client\main_menu.sqf", '#User:BIS_Menu_GroupCommunication', 0.5, false, false, "","_target == vehicle player"];
			_veh setvariable ["_menu_action",_action];
		};
	}else{
		private["_veh"];
		_veh = vehicle player;
		_veh removeAction (_veh getVariable "_menu_action");
		_veh setvariable ["_menu_action", nil];
	};

	if (_Buy_Man) then {
		// (BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 0)) CtrlSetText ("\CA\Warfare2\Images\icon_barracks.paa");

		private["_0","_1","_2"];
		if (leader player == player) then {
			_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_barracks_ca.paa")]; 
			_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
			_0 set [count _0, "#USER:Man_0"];
			_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Man" >> "displayName")];
			_2 set [count _2, 1];
			_BuyMenu = [_0,_1,_2];
		};

		_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
		_0 set [count _0, "#USER:Ammo_0"];
		_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "ReammoBox" >> "displayName")];
		_2 set [count _2, 1];
		_BuyMenu = [_0,_1,_2];

		_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
		_0 set [count _0, "#USER:StaticWeapon_0"];
		_1 set [count _1, gettext(configFile >> "CfgVehicleClasses" >> "static" >> "displayName")];
		_2 set [count _2, 1];
		_BuyMenu = [_0,_1,_2];
	};
	if (_Buy_Car or _Buy_Ship) then {
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_lvs_ca.paa")]; 
	};
	if (_Buy_Car) then {
		private["_0","_1","_2"];
		_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
		_0 set [count _0, "#USER:Car_0"];
		_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Car" >> "displayName")];
		_2 set [count _2, 1];
		_BuyMenu = [_0,_1,_2];
		_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
		_0 set [count _0, "#USER:Motorcycle_0"];
		_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Motorcycle" >> "displayName")];
		_2 set [count _2, 1];
		_BuyMenu = [_0,_1,_2];
	};
	if (_Buy_Tank) then {
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_hvs_ca.paa")]; 
		private["_0","_1","_2"];
		_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
		_0 set [count _0, "#USER:Tank_0"];
		_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Tank" >> "displayName")];
		_2 set [count _2, 1];
		_BuyMenu = [_0,_1,_2];
	};
	if (_Buy_Helicopter) then {
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_air_ca.paa")]; 
		private["_0","_1","_2"];
		_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
		_0 set [count _0, "#USER:Helicopter_0"];
		_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Helicopter" >> "displayName")];
		_2 set [count _2, 1];
		_BuyMenu = [_0,_1,_2];
	};
	if (_Buy_Plane) then {
		_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_hangar_ca.paa")]; 
		private["_0","_1","_2"];
		_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
		_0 set [count _0, "#USER:Plane_0"];
		_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Plane" >> "displayName")];
		_2 set [count _2, 1];
		_BuyMenu = [_0,_1,_2];
		if (_Airport) then {
			_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
			_0 set [count _0, "#USER:Support_0"];
			_1 set [count _1, localize "str_support"];
			_2 set [count _2, 1];
			_BuyMenu = [_0,_1,_2];
			_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
			_0 set [count _0, "#USER:Pilot_0"];
			_1 set [count _1, localize "str_getin_pos_pilot"];
			_2 set [count _2, 1];
			_BuyMenu = [_0,_1,_2];
		};
	};
	if (_Buy_Ship) then {
		private["_0","_1","_2"];
		_0 = _BuyMenu select 0; _1 = _BuyMenu select 1; _2 = _BuyMenu select 2;
		_0 set [count _0, "#USER:Ship_0"];
		_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Ship" >> "displayName")];
		_2 set [count _2, 1];
		_BuyMenu = [_0,_1,_2];
	};
	
	if (_Buy_Man or _Buy_Car or _Buy_Tank or _Buy_Helicopter or _Buy_Plane or _Buy_Ship) then {
		if (isnil {player getvariable "_Buy_Menu"} && !isnull player) then {
			private ["_action"];
			_action = player addaction [localize "str_buy_gear_buy", "m\functions\action_buy_menu.sqf", "#USER:BuyMenu_0", 1, false, false, "", "_target == _this"];
			player setvariable ["_Buy_Menu",_action];
		};
	}else{
		player removeAction (player getVariable "_Buy_Menu");
		player setvariable ["_Buy_Menu", nil];
	};

	["BuyMenu", "BuyMenu", _BuyMenu, "%1", ""] call BIS_FNC_createmenu; 
	
	for "_i" from 0 to (count _OptionsAvailable - 1) do {
		(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + _i)) CtrlSetText (_OptionsAvailable select _i);
	};
	for "_i" from (count _OptionsAvailable) to (10) do {
		(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + _i)) CtrlSetText ("");
	};
	_OptionsAvailable = [];
	
	sleep 0.5;
};
