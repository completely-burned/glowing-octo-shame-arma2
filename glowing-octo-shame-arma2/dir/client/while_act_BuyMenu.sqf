#define __A2OA__
/*
 * Скрипт добавляет и обновляет различные взаимодействия,
 * например меню покупки при нахождении в определенных места.
 * TODO: Нужно оптимизировать.
 * TODO: Учёт Side.
 */

#ifndef __ARMA3__
	#define BIS_SSM_CURRENTDISPLAY UInamespace getVariable "currentCutDisplay"
	40 CutRsc["OptionsAvailable","PLAIN",0];
#endif

waitUntil {!isNil "buyMenuLoaded"};


private ["_HQ","_BuyMenu","_OptionsAvailable","_Buy_UAV","_nearestObjects",
	"_Objects","_Buy_Man","_Buy_Car","_Buy_Tank","_Buy_Helicopter","_Buy_Plane",
	"_Buy_Ship","_Airport","_teleport","_menu","_BuyDist","_uav_action","_coin",
	"_uav_terminals","_actionObj","_action_uav","_types_MHQ","_types_HQ",
	"_player_veh","_factory_HQ","_factory_all","_logic","_class","_num",
	"_action_factory","_action_num","_action_object","_b","_dist","_str",
	"_var_synchronizedObjects","_respawn_type_Aircraft_carrier",
	"_factory_use","_respawn_type_Pilot","_respawn_type_All","_startingClass",
	"_type","_Object","_action","_0","_1","_2","_listHQ_str","_arr","_listHQ",
	"_action_teleport","_action_menu","_action_buy","_resetActions","_shop"];

_var_synchronizedObjects = "gosa_synchronizedObjects";

_HQ = [];
{
	if(configName(configFile >> "CfgVehicles" >> _x) != "")then{
		_HQ = _HQ + [_x];
	};
} forEach HQ;

_factory_use = [];

_respawn_type_Pilot = 1;
_respawn_type_Aircraft_carrier = 2;
_respawn_type_All = 0;

_nearestObjects = [
	"LandVehicle",
	"Air",
	"Base_WarfareBVehicleServicePoint"] + HQ + Airport + pier;

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

if (missionNamespace getVariable "gosa_coin" > 0) then
{
	_coin = true;
}else{
	_coin = false;
};

if (isNil "gosa_playerStartingClass") then {
	_startingClass = 0;
}else{
	_startingClass = gosa_playerStartingClass;
};


_listHQ_str = format["gosa_listHQ_%1", gosa_playerSide];

waitUntil {!isNil "gosa_list_LocationAirport"};

while {sleep 0.5; true} do {

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
				_class = _arr select 1;
				// Штаб.
				if (_class < 1) then {
					_dist = _logic distance _player_veh;
					if (_shop) then {
						_action = _logic getVariable "gosa_act_factory";
						if !(isNil "_action") then {
							// action obj
							_action_object = _action select 0;
							// action id
							_num = _action select 1;
							_action_factory = _action select 2;

							// removeAction
							_b = false;
							if (_action_object != _player_veh) then {
								_b = true;
							};
							if (_dist >= _BuyDist) then {
								_b = true;
							};
							if !(alive _logic) then {
								_b = true;
							};
							if (_b) then {
								diag_log format ["Log: [while_act_BuyMenu] %1 removeAction %2", _action_object, _num];
								_action_object removeAction _num;
								_logic setVariable ["gosa_act_factory", nil, false];
								_action = nil;
							};
						};

						// addAction
						_b = false;
						if (_dist < _BuyDist && alive _logic) then {
							_b = true;
						};
						if (_b) then {
							if (isNil "_action") then {
								_str = "#USER:gosa_menu_factory_FactoryAll_0";
								_num = _player_veh addAction [
									format ["%1 %2", localize "STR_gosa_purchase", _logic],
									"dir\actions\act_buy_factory.sqf",
									[_str, _arr],
									1,
									false,
									false
								];
								_logic setVariable ["gosa_act_factory", [_player_veh, _num, _logic], false];
								diag_log format ["Log: [while_act_BuyMenu] %1 addAction %2, %3", _player_veh, _num, _logic];
							};
							_teleport = true;
							_menu = true;
						};
					};
				};
			};
		};

		//-- Проходим по списку локаций.
		// TODO: Перенести в скрипт обновления локаций.
		// TODO: Объединить с маркерами.
		_list = gosa_list_LocationAirport;
		if (true) then {
			for "_i" from 0 to (count _list -1) do {
				_logic = _list select _i;
				_arr = synchronizedObjects _logic;
				#ifndef __ARMA3__
					// Синхронизации в редакторе A2 имеют локальный для сервера эффект.
					if (count _arr <= 0) then {
						_arr = _logic getVariable _var_synchronizedObjects;
						if (isNil "_arr") then {_arr = []};
					};
				#endif
				// Для совместимости.
				if (count _arr <= 0) then {
					_arr = [_logic];
				};
				for "_i0" from 0 to (count _arr -1) do {
					_logic = _arr select _i0;
					_obj = _logic getVariable "gosa_building";
					if (isNil "_obj") then {_obj = _logic};
					_dist = _obj distance _player_veh;
					_action = _obj getVariable "gosa_act_factory";
					if !(isNil "_action") then {
						// action obj
						_action_object = _action select 0;
						// action id
						_num = _action select 1;
						_action_factory = _action select 2;

						// removeAction
						_b = false;
						if (_action_object != _player_veh) then {
							_b = true;
						};
						if (_dist >= _BuyDist) then {
							_b = true;
						};
						if !(alive _obj) then {
							_b = true;
						};
						if (_b) then {
							diag_log format ["Log: [while_act_BuyMenu] %1 removeAction %2", _action_object, _num];
							_action_object removeAction _num;
							_obj setVariable ["gosa_act_factory", nil, false];
							_action = nil;
						};
					};

					// addAction
					_b = false;
					if (_dist < _BuyDist && alive _obj) then {
						_b = true;
					};
					if (_b) then {
						_num = _logic getVariable "gosa_respawn_type";
						if (isNil "_num") then {
							if (_logic isKindOf "LocationRespawnPoint_F") then {
								_num = _respawn_type_All;
							}else{
								_num = -1;
							};
						};
						switch (_num) do {
							case _respawn_type_Pilot: {
								if (_startingClass != 1) then {
									_b = false;
									_teleport = true;
								}else{
									_str = "#USER:gosa_menu_factory_AircraftFactory_0";											
								};
							};
							// TODO: Aircraft_carrier_Factory
							case _respawn_type_Aircraft_carrier: {
								_str = "#USER:gosa_menu_factory_FactoryAll_0";
							};
							case _respawn_type_All: {
								_str = "#USER:gosa_menu_factory_FactoryAll_0";
							};
							default {
								_b = false;
							};
						};
					};

					if (_b) then {
						if (isNil "_action") then {
							_num = _player_veh addAction [
								format ["%1 %2", localize "STR_gosa_purchase", _obj],
								"dir\actions\act_buy_factory.sqf",
								[_str, [_obj, 0]],
								1,
								false,
								false
							];
							_obj setVariable ["gosa_act_factory", [_player_veh, _num, _obj], false];
							diag_log format ["Log: [while_act_BuyMenu] %1 addAction %2, %3", _player_veh, _num, _obj];
						};

						_teleport = true;
						_menu = true;
					};
				};
			};
		};


		_list = gosa_list_LocationBase;
		if (true) then {
			for "_i" from 0 to (count _list -1) do {
				_logic = _list select _i;
				_arr = synchronizedObjects _logic;
				#ifndef __ARMA3__
					if (count _arr <= 0) then {
						_arr = _logic getVariable _var_synchronizedObjects;
						if (isNil "_arr") then {_arr = []};
					};
				#endif
				// Для совместимости.
				if (count _arr <= 0) then {
					_arr = [_logic];
				};
				for "_i0" from 0 to (count _arr -1) do {
					_logic = _arr select _i0;
					_obj = _logic getVariable "gosa_building";
					if (isNil "_obj") then {_obj = _logic};
					_dist = _obj distance _player_veh;
					_action = _obj getVariable "gosa_act_factory";
					if !(isNil "_action") then {
						// action obj
						_action_object = _action select 0;
						// action id
						_num = _action select 1;
						_action_factory = _action select 2;

						// removeAction
						_b = false;
						if (_action_object != _player_veh) then {
							_b = true;
						};
						if (_dist >= _BuyDist) then {
							_b = true;
						};
						if !(alive _obj) then {
							_b = true;
						};
						if (_b) then {
							diag_log format ["Log: [while_act_BuyMenu] %1 removeAction %2", _action_object, _num];
							_action_object removeAction _num;
							_obj setVariable ["gosa_act_factory", nil, false];
							_action = nil;
						};
					};

					// addAction
					_b = false;
					if (_dist < _BuyDist && alive _obj) then {
						_b = true;
					};
					if (_b) then {
						_num = _logic getVariable "gosa_respawn_type";
						if (isNil "_num") then {
							if (_logic isKindOf "LocationRespawnPoint_F") then {
								_num = _respawn_type_All;
							}else{
								_num = -1;
							};
						};
						switch (_num) do {
							case _respawn_type_Pilot: {
								if (_startingClass != 1) then {
									_b = false;
									_teleport = true;
								}else{
									_str = "#USER:gosa_menu_factory_AircraftFactory_0";											
								};
							};
							// TODO: Aircraft_carrier_Factory
							case _respawn_type_Aircraft_carrier: {
								_str = "#USER:gosa_menu_factory_FactoryAll_0";
							};
							case _respawn_type_All: {
								_str = "#USER:gosa_menu_factory_FactoryAll_0";
							};
							default {
								_b = false;
							};
						};
					};

					if (_b) then {
						if (isNil "_action") then {
							_num = _player_veh addAction [
								format ["%1 %2", localize "STR_gosa_purchase", _obj],
								"dir\actions\act_buy_factory.sqf",
								[_str, [_obj, 0]],
								1,
								false,
								false
							];
							_obj setVariable ["gosa_act_factory", [_player_veh, _num, _obj], false];
							diag_log format ["Log: [while_act_BuyMenu] %1 addAction %2, %3", _player_veh, _num, _obj];
						};

						_teleport = true;
						_menu = true;
					};
				};
			};
		};


		// Совместимость.
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
				};
			} foreach _Objects;
		};

		if (_teleport && !_resetActions) then {
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
	};
};
