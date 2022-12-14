#define __A2OA__
/*
 * Скрипт добавляет и обновляет различные взаимодействия,
 * например меню покупки при нахождении в определенных места.
 * TODO: Нужно оптимизировать.
 */

#ifndef __ARMA3__
	#define BIS_SSM_CURRENTDISPLAY UInamespace getVariable "currentCutDisplay"
	40 CutRsc["OptionsAvailable","PLAIN",0];
#endif

waitUntil {!isNil "buyMenuLoaded"};
waitUntil {!isNil "MHQ_list"};


private ["_HQ","_BuyMenu","_OptionsAvailable","_Buy_UAV","_nearestObjects",
	"_Objects","_Buy_Man","_Buy_Car","_Buy_Tank","_Buy_Helicopter","_Buy_Plane",
	"_Buy_Ship","_Airport","_teleport","_menu","_BuyDist","_uav_action",
	"_uav_terminals","_actionObj","_action_uav","_types_MHQ","_types_HQ",
	"_player_veh","_factory_HQ","_factory_all","_logic","_class",
	"_type","_Object","_action","_0","_1","_2","_listHQ_str","_arr","_listHQ",
	"_action_teleport","_action_menu","_action_buy","_resetActions","_shop"];

_HQ = [];
{
	if(configName(configFile >> "CfgVehicles" >> _x) != "")then{
		_HQ = _HQ + [_x];
	};
} forEach (MHQ_list select 0) + HQ;

_OptionsAvailable = [];

_nearestObjects = [
	"LandVehicle",
	"Air",
	"Base_WarfareBVehicleServicePoint"] + (MHQ_list select 0) + HQ + Airport + pier;

	if(!isServer)then{
		_nearestObjects set [count _nearestObjects,"ReammoBox"];
	};


if (missionNamespace getVariable "gosa_shop" == 1) then {
	_nearestObjects = _nearestObjects + [
		"Base_WarfareBBarracks","Base_WarfareBLightFactory",
		"Base_WarfareBHeavyFactory","Base_WarfareBAircraftFactory"
	];
	_shop = true;
	_BuyDist = gosa_BuyDistance;
}else{
	_shop = false;
	_BuyDist = 50;
};

_listHQ_str = format["gosa_listHQ_%1", playerSide];

while {true} do {

	if (!isNil {player getVariable "resetActions_handleBuyMenu"}) then {
		_resetActions = true;
		player setvariable ["resetActions_handleBuyMenu", nil];
	}else{
		_resetActions = false;
	};

	if (alive player && isNil {skipAddAction}) then {
		scopeName "scope2";

		_factory_all = false;
		_factory_HQ = false;
		_Buy_Man = false;
		_Buy_Car = false;
		_Buy_Tank = false;
		_Buy_Helicopter = false;
		_Buy_Plane = false;
		_Buy_Ship = false;
		_Airport = false;
		_teleport = false;
		_menu = false;

		_BuyMenu = [[],[],[]];

		_player_veh = vehicle player;

		//-- Проходим по списку штабов.
		_listHQ = ([] call compile _listHQ_str);
		if !(isNil "_listHQ") then {
			for "_i" from 0 to (count _listHQ -1) do {
				_arr = _listHQ select _i;
				_logic = _arr select 0;
				if (alive _logic) then {
					_class = _arr select 1;
					// Штаб.
					if (_class < 1) then {
						if (_logic distance _player_veh < _BuyDist) then {
							_factory_HQ = true;
							diag_log format ["Log: [while_act_BuyMenu] _factory_HQ = %1", _factory_HQ];
							breakTo "scope2";
						};
					};
				};
			};
		};

		if (_factory_HQ) then {
			#ifdef __ARMA3__
				_factory_all = true;
				diag_log format ["Log: [while_act_BuyMenu] _factory_all = %1", _factory_all];
			#endif
			_teleport = true;
			_menu = true;
		};

		if (_factory_all) then {
			_Buy_Man = true;
			_Buy_Car = true;
			_Buy_Tank = true;
			_Buy_Helicopter = true;
			_Buy_Plane = true;
			_Buy_Ship = true;
		};

		_Objects = (nearestObjects [vehicle player, _nearestObjects, _BuyDist]);
		if ((count _Objects > 0)) then {
			{
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

					if (_shop) then {
						if (!_Buy_Man or !_Buy_Car or !_Buy_Tank or !_Buy_Helicopter or !_Buy_Plane or !_Buy_Ship) then {
							#ifdef __A2OA__
							if ([[_type],HQ] call gosa_fnc_CheckIsKindOfArray or (missionNamespace getVariable "gosa_coin" != 1 && ([[_type],(MHQ_list select 0)] call gosa_fnc_CheckIsKindOfArray))) then
							#else
							if ([[_type],(MHQ_list select 0) + HQ] call gosa_fnc_CheckIsKindOfArray) then
							#endif
							{
								_Buy_Man = true;	_Buy_Car = true;	_Buy_Tank = true;	_Buy_Helicopter = true;	_Buy_Plane = true;
							};
						};
						if (!_Buy_Man) then {
							if ([[_type],["Base_WarfareBBarracks"]] call gosa_fnc_CheckIsKindOfArray) then {
								_Buy_Man = true;
							};
						};

						if !(_Buy_Car) then {
							if ([[_type],["Base_WarfareBLightFactory"]] call gosa_fnc_CheckIsKindOfArray) then {
								_Buy_Car = true;
							};
						};

						if !(_Buy_Tank) then {
							if ([[_type],["Base_WarfareBHeavyFactory"]] call gosa_fnc_CheckIsKindOfArray) then {
								_Buy_Tank = true;
							};
						};

						if !(_Buy_Helicopter) then {
							if ([[_type],["Base_WarfareBAircraftFactory"]] call gosa_fnc_CheckIsKindOfArray) then {
								_Buy_Helicopter = true;
							}else{
							};
						};

						if (!_Buy_Plane or !_Buy_Helicopter) then {
							if ([[_type],Airport] call gosa_fnc_CheckIsKindOfArray) then {
								_Buy_Plane = true; _Airport = true; _Buy_Helicopter = true;
							};
						};

						if !(_Buy_Ship) then {
							if ([[_type],pier] call gosa_fnc_CheckIsKindOfArray) then {
								_Buy_Ship = true;
							};
						};
					};

					if !(_teleport) then {
						if ([[_type],(MHQ_list select 0)+(MHQ_list select 1) + gosa_objectsTeleport] call gosa_fnc_CheckIsKindOfArray) then {
							_teleport = true;
						};
					};

					if ([[_type],["LandVehicle","Air"]] call gosa_fnc_CheckIsKindOfArray) then {
						if (_shop) then {
							_Object setAmmoCargo 1;
							_Object setRepairCargo 1;
							_Object setFuelCargo 1;
						};

						#ifndef __ARMA3__
						if (isNil {_Object getVariable "gosa_act_hintCrew"}) then {
							_action = _Object addAction [format ["%1 %2",localize "STR_ACT_Crew",getText (configFile >> "CfgVehicles" >> _type >> "displayName")],'dir\client\ACT\ACT_HintCrew.sqf',[],0, false];
							_Object setVariable ["gosa_act_hintCrew",_action];
						};
						#endif
					};

					#ifndef __ARMA3__
					[_Object, _type] call gosa_fnc_act_repairVehicle;
					#endif

					if ([[_type],["ReammoBox"]] call gosa_fnc_CheckIsKindOfArray) then {
						if (alive _Object) then {
							_Object call gosa_fnc_updateReammoBox;
						}else{
							if (local _Object) then {
								deleteVehicle _Object;
							};
						};
					};

					if !(_menu) then {
						if ([[_type],(MHQ_list select 0) + HQ + gosa_objectsCoinBase] call gosa_fnc_CheckIsKindOfArray) then {
							_menu = true;
						};
					};
				};
			} foreach _Objects;
		};

		_uav_action = false;
		_uav_terminals = [];
		_Objects = (nearestObjects [vehicle player, UAVterminal, 10]);
		if (count _Objects > 0) then {
			{
					_Object = _x;
					_type = (typeOf _Object);

					if (alive _Object) then {
						if !(_uav_action) then {
							if ([[_type],UAVterminal] call gosa_fnc_CheckIsKindOfArray) then {
								_uav_action = true; _uav_terminals set [count _uav_terminals, _Object];
							};
						};
					};
			} foreach _Objects;
		};


		#ifdef __A2OA__
		if !(_uav_action) then {
			if (typeOf unitBackpack player == "US_UAV_Pack_EP1") then {
				_uav_action = true; _uav_terminals set [count _uav_terminals, unitBackpack player];
			};
		};
		#endif
		if (_uav_action && !isMultiplayer && !_resetActions) then {
			_actionObj = player;
			if (!isnil "_action_uav")then{
				if (_action_uav select 0 != _actionObj)then{
					_action_uav select 0 removeAction (_action_uav select 1);
					_action_uav = nil;
				};
			};
			if (isnil "_action_uav" && !isnull player) then {
				_action = _actionObj addaction [localize "str_uav_action", "dir\actions\act_uav.sqf", [_Object, _uav_terminals], 1, false, false];
				_action_uav = [_actionObj, _action];
			};
			_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_uav_ca.paa")];
		}else{
			if (!isnil "_action_uav")then{
				_action_uav select 0 removeAction (_action_uav select 1);
				_action_uav = nil;
			};
		};

		if (_Buy_Man or _teleport) then {
			_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_gear_ca.paa")];
		};

		if (_teleport && !_resetActions) then {
			private["_veh"];
			_veh = vehicle player;
			if (!isnil "_action_teleport")then{
				if (_action_teleport select 0 != _veh)then{
					_action_teleport select 0 removeAction (_action_teleport select 1);
					_action_teleport = nil;
				};
			};
			if (isnil "_action_teleport" && !isnull _veh) then {
				_action = _veh addaction [localize "STR_gosa_teleportation", "dir\actions\act_teleport.sqf", '#USER:teleport_0', 0.5, false, false];
				_action_teleport = [_veh, _action];
			};
		}else{
			if (!isnil "_action_teleport")then{
				_action_teleport select 0 removeAction (_action_teleport select 1);
				_action_teleport = nil;
			};
		};

		if (_menu && !_resetActions) then {
			private["_veh"];
			_veh = vehicle player;
			if (!isnil "_action_menu")then{
				if (_action_menu select 0 != _veh)then{
					_action_menu select 0 removeAction (_action_menu select 1);
					_action_menu = nil;
				};
			};
			if (isnil "_action_menu" && !isnull _veh) then {
				_action = _veh addaction ["Menu", "dir\client\main_menu.sqf", '#User:BIS_Menu_GroupCommunication', 0.5, false, false];
				_action_menu = [_veh, _action];
			};
		}else{
			if (!isnil "_action_menu")then{
				_action_menu select 0 removeAction (_action_menu select 1);
				_action_menu = nil;
			};
		};

		if (_shop) then {
			_0 = _BuyMenu select 0;
			_1 = _BuyMenu select 1;
			_2 = _BuyMenu select 2;
			if (_Buy_Man) then {
				// (BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 0)) CtrlSetText ("\CA\Warfare2\Images\icon_barracks.paa");

				if (leader player == player) then {
					_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_barracks_ca.paa")];
					_0 set [count _0, "#USER:Man_0"];
					_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Man" >> "displayName")];
					_2 set [count _2, 1];
				};

				_0 set [count _0, "#USER:Ammo_0"];
				_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "ReammoBox" >> "displayName")];
				_2 set [count _2, 1];

				_0 set [count _0, "#USER:StaticWeapon_0"];
				_1 set [count _1, gettext(configFile >> "CfgVehicleClasses" >> "static" >> "displayName")];
				_2 set [count _2, 1];
			};
			if (_Buy_Car or _Buy_Ship) then {
				_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_lvs_ca.paa")];
			};
			if (_Buy_Car) then {
				_0 set [count _0, "#USER:Car_0"];
				_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Car" >> "displayName")];
				_2 set [count _2, 1];
				_0 set [count _0, "#USER:Motorcycle_0"];
				_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Motorcycle" >> "displayName")];
				_2 set [count _2, 1];
			};
			if (_Buy_Tank) then {
				_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_hvs_ca.paa")];
				_0 set [count _0, "#USER:Tank_0"];
				_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Tank" >> "displayName")];
				_2 set [count _2, 1];
			};
			if (_Buy_Helicopter) then {
				_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_air_ca.paa")];
				_0 set [count _0, "#USER:Helicopter_0"];
				_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Helicopter" >> "displayName")];
				_2 set [count _2, 1];
			};
			if (_Buy_Plane) then {
				_OptionsAvailable=_OptionsAvailable+[("\ca\ui\data\icon_wf_building_hangar_ca.paa")];
				_0 set [count _0, "#USER:Plane_0"];
				_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Plane" >> "displayName")];
				_2 set [count _2, 1];
				if (_Airport) then {
					_0 set [count _0, "#USER:Support_0"];
					_1 set [count _1, localize "str_support"];
					_2 set [count _2, 1];
					_0 set [count _0, "#USER:Pilot_0"];
					_1 set [count _1, localize "str_getin_pos_pilot"];
					_2 set [count _2, 1];
				};
			};
			if (_Buy_Ship) then {
				_0 set [count _0, "#USER:Ship_0"];
				_1 set [count _1, gettext(configfile >> "cfgvehicles" >> "Ship" >> "displayName")];
				_2 set [count _2, 1];
			};

			if ((_Buy_Man or _Buy_Car or _Buy_Tank or _Buy_Helicopter or _Buy_Plane or _Buy_Ship) && !_resetActions) then {
				_actionObj = player;
				if (!isnil "_action_buy")then{
					if (_action_buy select 0 != _actionObj)then{
						_action_buy select 0 removeAction (_action_buy select 1);
						_action_buy = nil;
					};
				};
				if (isnil "_action_buy" && !isnull player) then {
					_action = _actionObj addaction [localize "STR_gosa_purchase", "dir\actions\act_buy_menu.sqf", "#USER:BuyMenu_0", 1, false, false];
					_action_buy = [_actionObj, _action];
				};
			}else{
				if (!isnil "_action_buy")then{
					_action_buy select 0 removeAction (_action_buy select 1);
					_action_buy = nil;
				};
			};

			["BuyMenu", "BuyMenu", _BuyMenu, "%1", ""] call BIS_FNC_createmenu;
		};

		#ifndef __ARMA3__
		for "_i" from 0 to (count _OptionsAvailable - 1) do {
			(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + _i)) CtrlSetText (_OptionsAvailable select _i);
		};
		for "_i" from (count _OptionsAvailable) to (10) do {
			(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + _i)) CtrlSetText ("");
		};
		#endif

		_OptionsAvailable = [];

	};

	sleep 0.5;
};
