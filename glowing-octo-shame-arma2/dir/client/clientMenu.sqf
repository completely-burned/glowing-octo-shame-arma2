/*
 * TODO: Рефакторинг.
 */

private ["_list_BIS_FNC_createmenu2","_list_BIS_FNC_createmenu","_tmp_arr",
	"_arr","_count","_b","_cfg","_0","_1","_2","_3","_obj","_n","_allow",
	"_mod_i44","_startingClass","_types_pilot","_types_mhq_virt","_str",
	"_availableWeapons","_availableBackpacks",
	"_menu_expression_default","_cfgVeh",
	"_menu_expression_coin","_coin","_type","_fnc_create_buy_menu",
	"_dataListUnit","_dataListUnitNames","_fnc_vehicles","_libEnabled","_z"];
	// ["teleport", "teleport", [[getmarkerpos 'respawn_west', getmarkerpos 'respawn_east', getmarkerpos 'respawn_guerrila'],['respawn_west','respawn_east','respawn_guerrila']], "","player setpos %1"] call BIS_FNC_createmenu;

_cfgVeh = LIB_cfgVeh;
_startingClass = gosa_playerStartingClass;
_types_pilot = gosa_pilotL;
_types_mhq_virt = gosa_types_mhq_virt;
_mod_i44 = if (configName(configFile >> "CfgVehicles" >> "I44_Man") != "") then{true}else{false};

waitUntil{!isNil "BIS_FNC_createmenu"};

_list_BIS_FNC_createmenu2={
	private["_arr1","_arr2","_arr3","_arr4"];
	_arr1=[];
	_arr2=[];
	_arr3=[];
	_arr4=[];
	for "_i" from 0 to (count _this - 1) do
	{
		_arr1 = _arr1 + [(_this select _i) select 0];
		_arr2 = _arr2 + [(_this select _i) select 1];
		_arr3 = _arr3 + [1];
		if (count (_this select _i) > 2) then {
			_arr4 = _arr4 + [(_this select _i) select 2];
		}else{
			_arr4 = _arr4 + [""];
		};
	};
	[_arr1,_arr2,_arr3,_arr4];
};
waitUntil{!isNil "gosa_fnc_RespawnWeaponsAdd"};
_tmp_arr=[
	[localize "STR_gosa_car_flip", "nearestObjects [vehicle player, ['AllVehicles'], 10] call gosa_fnc_turnVehicle;"],
	["camera.sqf","[] execvm 'camera.sqf'"],
	["SetGroupIconsVisible [true,true]","SetGroupIconsVisible [true,true];"],
	[localize "STR_gosa_setTerrainGrid","","#USER:setTerrainGrid_0"],
	[localize "STR_gosa_setViewDistance","","#USER:setViewDistance_0"],

	// TODO: лидер переключаеся на ии снова в данном коде, возможно группа должна быть локальной или owner ии принадлежать игроку
	// 					_g selectLeader _p;
	["selectLeader (%SELECTED_UNIT_ID)","[] call gosa_fnc_menu_selectLeader"],
	[Localize "STR_gosa_dismiss_unit" + " (%SELECTED_UNIT_ID)","(GroupSelectedUnits player) call gosa_fnc_groupUnitsDismiss"],
	[localize "STR_gosa_leave_the_squad", "[] execVM 'dir\actions\act_join_grpNull.sqf'"],
	[Localize "STR_gosa_join_the_squad",
		"[] execVM 'dir\functions\fnc_menu_join.sqf'"]
	/*
	setOwner не возвращает контроль над юнитами, но ломает управление игрокам
	["setOwner (%SELECTED_UNIT_ID) player","
		{
			[nil, _x, rsetOwner, player] call RE;
		} foreach GroupSelectedUnits player;
		private ['_z'];
		_z = leader player;
		if (_z != player) then {
			[nil, _z, rsetOwner, player] call RE;
		};
	"]
	*/
	// ["deleteVehicle vehicle player", "if(({alive _x} count crew vehicle player)<=1)then {deleteVehicle vehicle player};"],
	// ["leader move player","leader player move getpos player"],
	// ["setAccTime 0.5","setAccTime 0.5"],
];
// Если можно просто переключиться в одиночной игре,
// то меню выбора роли не нужно.
if (isMultiplayer) then {
	_tmp_arr=_tmp_arr+[
		["selectPlayer Random","[] spawn gosa_fnc_selectPlayer_manual"],
		["setSquad&Role prio.","[] execVM 'dir\functions\fnc_setSquadRole.sqf'"]
	];
};
// Сохранение снаряжения работает только при возрождении на базе.
if (missionNamespace getVariable "respawn" == 0) then {
	_tmp_arr=_tmp_arr+[
		[localize "STR_gosa_maintain_equipment",
			"'save' call gosa_fnc_RespawnWeaponsAdd"]
	];
};

if (missionNamespace getVariable "gosa_shop" == 2) then {
	_tmp_arr=_tmp_arr+[
		["*" + localize "STR_gosa_purchase","","#USER:BuyMenu_0"]
	];
}else{
	_tmp_arr=_tmp_arr+[
		["*" + localize "STR_gosa_purchase", "[] spawn gosa_fnc_menu_factories"]
	];
};

_list_BIS_FNC_createmenu = _tmp_arr call _list_BIS_FNC_createmenu2;

["#USER:c_0", "c", [_list_BIS_FNC_createmenu select 1, _list_BIS_FNC_createmenu select 0, _list_BIS_FNC_createmenu select 2, _list_BIS_FNC_createmenu select 3], "","%1"] call gosa_fnc_createmenu;
["setTerrainGrid", "setTerrainGrid", [[50,25,12.5,6.25,3.125],["50","25","12.5","6.25","3.125"]], "","setTerrainGrid %1"] call BIS_FNC_createmenu;
["setViewDistance", "setViewDistance", [
	[ -1,  2000,  2500,  3000,  3500,  4000,  4500,  5000,  5500,  6000,  6500,  7000,  7500,  8000,  8500,  9000,  9500,  10000],
	["-1","2000","2500","3000","3500","4000","4500","5000","5500","6000","6500","7000","7500","8000","8500","9000","9500","10000"]
], "","setViewDistance %1"] call BIS_FNC_createmenu;

#ifndef __ARMA3__
BIS_MENU_GroupCommunication = [
	["User menu",true],
	[localize "str_more_menu", [2], "#USER:c_0", -5, [["expression", ""]], "1", "1"],
	[localize "str_usract_lock_target", [3], "#WATCH", -5, [["expression", ""]], "1", "1"],
	[localize "STR_gosa_heli_transport"+ " (testing) CursorOnGround", [4], "", -5, [["expression",
		"
			if (vehicle player == player) then {
				player setVariable ['gosa_transportPos', _pos, true];
				vehicle player setVariable ['gosa_transportPosVeh',  nil, true];
			}else{
				player setVariable ['gosa_transportPos',  nil, true];
				vehicle player setVariable ['gosa_transportPosVeh', _pos, true];
			}
		"
	]], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca.paa"],
	[localize "STR_EP1_MENU_TITLE", [5], "#USER:gosa_supportMenu_0", -5, [["expression", ""]], "1", "1"]
];
#endif

waitUntil{!isNil "BIS_FNC_createmenu"};
	_menu_expression_coin = "
		BIS_CONTROL_CAM_LMB = false;
		scopename 'main';
		_item = '%1';
		_id = %2;
		_array = (call compile '%3') select _id;

		_params = [_item];
		BIS_coin_logic setvariable ['BIS_COIN_params',_params];
	";
	_menu_expression_default = "['%1'] spawn gosa_fnc_Client_BuyUnit";

	_fnc_create_buy_menu = {
		diag_log format ["Log: [Menu] _fnc_create_buy_menu, %1", _this];
		private["_current","_list","_items","_itemsName","_usermenu",
			"_expression","_coin"];
		_list = _this select 0;
		_current = _this select 1;
		_coin = if (_current in ["StaticWeapon","Ammo","House","GhostPreview"]) then {true} else {false};
		if (missionNamespace getVariable "gosa_coin_v2" <= 0) then {_coin = false};

		_items = []; _itemsName = [];
		for "_i" from 0 to (count (_list select 0) - 1) do {
			_usermenu = format["m_menu_%1_%2",_current, _list select 0 select _i];
			_items set [count _items, "#USER:" + _usermenu + "_0"];
			_itemsName set [count _itemsName, getText (configFile >> "CfgFactionClasses" >> _list select 0 select _i >> "displayName")];

			private["_items2","_itemsName2","_usermenu2"];
			_items2 = []; _itemsName2 = [];
			for "_ii" from 0 to ((count ((_list select 1) select _i)) - 1) do {
				_usermenu2 = format["m_menu_%1_%2_%3",_current, _list select 0 select _i, _list select 1 select _i select _ii];
				_items2 set [count _items2, "#USER:" + _usermenu2 + "_0"];
				_itemsName2 set [count _itemsName2, getText (configFile >> "CfgVehicleClasses" >> _list select 1 select _i select _ii >> "displayName")];

				private["_items3","_itemsName3","_itemEnable"];
				_items3 = []; _itemsName3 = []; _itemEnable = [];
				for "_iii" from 0 to ((count (((_list select 2) select _i) select _ii)) - 1) do {
					_items3 set [count _items3, (((_list select 2) select _i) select _ii) select _iii];
					private["_name"];
					_name = (((_list select 2) select _i) select _ii) select _iii;
					_z = configName(configFile >> "CfgVehicles" >> _name >> "displayName");
						if (_z != "") then {
							_z = getText (configFile >> "CfgVehicles" >> _name >> "displayName");
						};
						if (_z == "") then {
							_z = str _name;
						}else{
							if (_z in _itemsName3) then {
								_z = _name + " " + _z;
							};
						};
						_itemsName3 set [count _itemsName3, _z];
					_itemEnable set [count _itemEnable, 1];

					//- MHQ
					_n = (_types_mhq_virt select 1 find toLower _name);
					if (_n >= 0) then {
						if (_types_mhq_virt select 0 select _n == playerSide) then {
							_name = (_types_mhq_virt select 2 select _n);
							if (configName (configFile >> "CfgVehicles" >> _name) == "") then {
								_items3 set [count _items3, _name];
								_itemsName3 set [count _itemsName3, "MHQ " + _z];
								_itemEnable set [count _itemEnable, 1];
							};
						};
					};
				};
				_expression = _menu_expression_default;
				#ifndef __ARMA3__
					if (_coin) then {
						_expression = _menu_expression_coin;
					};
				#endif
				[_usermenu2, _usermenu2, [_items3, _itemsName3, _itemEnable], "", _expression] call BIS_FNC_createmenu;
			};
			[_usermenu, _usermenu, [_items2, _itemsName2], "%1",""] call BIS_FNC_createmenu;
		};
		[_current, _current, [_items, _itemsName], "%1",""] call BIS_FNC_createmenu;
	};

_b = if (missionNamespace getVariable "gosa_shop" in [1,2]) then {
		diag_log format ["Log: [Menu] shop, enable, params", nil];
		true;
	}else{
		// Пилоты
		if (_startingClass in [1]) then {
			diag_log format ["Log: [Menu] shop, enable, pilot", nil];
			true;
		}else{
			diag_log format ["Log: [Menu] shop, disable", nil];
			false;
		};
	};

if (_b) then {
	diag_log format ["Log: [Menu] shop %1", missionNamespace getVariable "gosa_shop"];

	waitUntil{!isNil "gosa_fnc_libEnabled"};
		waitUntil{!isNil "gosa_fnc_CheckIsKindOfArray"};
		waitUntil{!isNil "gosa_fnc_setNestedElement"};
		waitUntil{!isNil "availableVehicles"};
		waitUntil{!isNil "availableWeapons"};
		waitUntil{!isNil "availableMagazines"};
		diag_log format ["Log: [Menu] shop, post waitUntil %1", time];
	_availableWeapons = availableWeapons;

	//-- Ammo
	// TODO: Устранить дубликаты.
	private ["_entry","_type","_faction","_class","_factionclasses",
		"_find_faction","_vehicleclasses","_find_vehicleclass",
		"_count","_types","_vehicleclass"];

		if (_mod_i44) then {
			_allow = ["i44_ammo","backpacks"];
		}else{
			_allow = ["ammo","ace_ammunition","backpacks"];
		};
		_tmp_arr = [[],[],[]];
		{

			_type = _x;
			_entry = ((configFile >> "CfgVehicles") >> _type);

			// Спец. ящик.
			if(_type == "gosa_megaAmmoBox")then{
				_faction = "Default";
				_class = "Ammo";
			}else{
				_faction = getText(_entry >> "faction");
				_class = getText(_entry >> "vehicleclass");
			};

						if (toLower _class in _allow) then {
							//- Фракция.
								_factionclasses = _tmp_arr select 0;
								if (_faction in _factionclasses)then{
									_find_faction = _factionclasses find _faction;
								}else{
									//- Фракции нет в списке.
									_count = count _factionclasses;
									[_tmp_arr,[0,_count],_faction] call gosa_fnc_setNestedElement;
									[_tmp_arr,[1,_count],[]] call gosa_fnc_setNestedElement;
									[_tmp_arr,[2,_count],[]] call gosa_fnc_setNestedElement;
									_find_faction = _factionclasses find _faction;
								};

							//- Тип объекта.
								_vehicleclasses = ((_tmp_arr select 1) select _find_faction);
								if (_class in _vehicleclasses)then{
									_find_vehicleclass = _vehicleclasses find _class;
								}else{
									_count = count _vehicleclasses;
									[_tmp_arr,[1,_find_faction,_count],_class] call gosa_fnc_setNestedElement;
									[_tmp_arr,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
									_find_vehicleclass = _vehicleclasses find _class;
								};

							//- Добавление объекта в меню.
								_types = (((_tmp_arr select 2) select _find_faction) select _find_vehicleclass);
								if !(_type in _types)then{
									_count = count _types;
									[_tmp_arr,[2,_find_faction,_find_vehicleclass,_count],_type] call gosa_fnc_setNestedElement;
								};
						};
		}forEach availableVehicles+["gosa_megaAmmoBox"];
		[_tmp_arr,"Ammo"] call _fnc_create_buy_menu;

	//-- GhostPreview
		_tmp_arr = [[],[],[]];
		{
			_type = _x;
			_entry = (_cfgVeh >> _type);

			_str = getText (_entry >> "GhostPreview");
			_b = if (_str == "") then {false} else {true};
			if (toLower _str == toLower _type) then {_b = false};
			_str = getText (_entry >> "displayName");
			if (_str == "") then {_b = false};

			if (_b) then {
				_faction = getText(_entry >> "faction");
				_class = getText(_entry >> "vehicleclass");

				_factionclasses = _tmp_arr select 0;
				if (_faction in _factionclasses)then{
					_find_faction = _factionclasses find _faction;
				}else{
					_count = count _factionclasses;
					[_tmp_arr,[0,_count],_faction] call gosa_fnc_setNestedElement;
					[_tmp_arr,[1,_count],[]] call gosa_fnc_setNestedElement;
					[_tmp_arr,[2,_count],[]] call gosa_fnc_setNestedElement;
					_find_faction = _factionclasses find _faction;
				};

				_vehicleclasses = ((_tmp_arr select 1) select _find_faction);
				if (_class in _vehicleclasses)then{
					_find_vehicleclass = _vehicleclasses find _class;
				}else{
					_count = count _vehicleclasses;
					[_tmp_arr,[1,_find_faction,_count],_class] call gosa_fnc_setNestedElement;
					[_tmp_arr,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
					_find_vehicleclass = _vehicleclasses find _class;
				};

				_types = (((_tmp_arr select 2) select _find_faction) select _find_vehicleclass);
				if !(_type in _types)then{
					_count = count _types;
					[_tmp_arr,[2,_find_faction,_find_vehicleclass,_count],_type] call gosa_fnc_setNestedElement;
				};
			};
		} forEach availableVehicles;
		[_tmp_arr, "GhostPreview"] call _fnc_create_buy_menu;

	// _dataListAmmoBox = _dataListAmmoBox + [["all","[] execvm 'm\functions\gosa_fnc_MegaAmmoBox.sqf'"]];
		// _dataListAmmoBox = _dataListAmmoBox call _list_BIS_FNC_createmenu2;

	//-- Units
		_arr = [[],[],[]];
		{
			_type = _x;
			_entry = ((configFile >> "CfgVehicles") >> _type);

			_b = if (_startingClass in [1]) then {
					if ([[(configname _entry)], _types_pilot] call gosa_fnc_CheckIsKindOfArray) then {
						true;
					}else{
						false;
					};
				}else{
					true;
				};

			if (_b) then {
				if (((getNumber(_entry >> "side")) ==
					(getNumber(configFile >> "CfgVehicles">> typeof player >> "side"))) or
					!isMultiplayer) then
				{
					if (((toLower getText(_entry >> "simulation")) == "soldier") &&
						(getNumber(_entry >> "isMan") > 0) &&
						!(toLower _type in gosa_blacklisted_player_classes_L) &&
						!(toLower getText(_entry >> "model") in ["\ca\characters_e\invisibleman"])) then
					{
						_faction = getText(_entry >> "faction");
						_vehicleclass = getText(_entry >> "vehicleclass");
						_factionclasses = _arr select 0;
						if (_faction in _factionclasses) then {
							_find_faction = _factionclasses find _faction;
						}else{
							_n = count _factionclasses;
							[_arr,[0,_n],_faction] call gosa_fnc_setNestedElement;
							[_arr,[1,_n],[]] call gosa_fnc_setNestedElement;
							[_arr,[2,_n],[]] call gosa_fnc_setNestedElement;
							_find_faction = _factionclasses find _faction;
						};
						_vehicleclasses = ((_arr select 1) select _find_faction);
						if (_vehicleclass in _vehicleclasses) then {
							_find_vehicleclass = _vehicleclasses find _vehicleclass;
						}else{
							_n = count _vehicleclasses;
							[_arr,[1,_find_faction,_n],_vehicleclass] call gosa_fnc_setNestedElement;
							[_arr,[2,_find_faction,_n],[]] call gosa_fnc_setNestedElement;
							_find_vehicleclass = _vehicleclasses find _vehicleclass;
						};
						_types = (((_arr select 2) select _find_faction) select _find_vehicleclass);
						if !(_type in _types) then {
							_n = count _types;
							[_arr,[2,_find_faction,_find_vehicleclass,_n],_type] call gosa_fnc_setNestedElement;
						};
					};
				};
			};
		} forEach availableVehicles;
		[_arr,"Man"] call _fnc_create_buy_menu;

	//-- vehicles
		private ["_fnc_vehicles"];
		_fnc_vehicles = {
			diag_log format ["Log: [Menu] _fnc_vehicles, %1", _this];

			_tmp_arr = [[],[],[]];
			{
				private ["_entry"]; private["_type"];
				_entry = ((configFile >> "CfgVehicles") >> _x); _type = _x;
								if !(getText(_entry >> "simulation") in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
									if!(configname _entry isKindOf "Chukar")then{
										if ([[(configname _entry)],[_this]] call gosa_fnc_CheckIsKindOfArray) then {
											private["_faction","_vehicleclass","_factionclasses","_find_faction",
												"_vehicleclasses","_find_vehicleclass"];
											_faction = getText(_entry >> "faction");
											_vehicleclass = getText(_entry >> "vehicleclass");

											_factionclasses = _tmp_arr select 0;
											if (_faction in _factionclasses)then{
												_find_faction = _factionclasses find _faction;
											}else{
												_count = count _factionclasses;
												[_tmp_arr,[0,_count],_faction] call gosa_fnc_setNestedElement;
												[_tmp_arr,[1,_count],[]] call gosa_fnc_setNestedElement;
												[_tmp_arr,[2,_count],[]] call gosa_fnc_setNestedElement;
												_find_faction = _factionclasses find _faction;
											};

											_vehicleclasses = ((_tmp_arr select 1) select _find_faction);
											if (_vehicleclass in _vehicleclasses)then{
												_find_vehicleclass = _vehicleclasses find _vehicleclass;
											}else{
												_count = count _vehicleclasses;
												[_tmp_arr,[1,_find_faction,_count],_vehicleclass] call gosa_fnc_setNestedElement;
												[_tmp_arr,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
												_find_vehicleclass = _vehicleclasses find _vehicleclass;
											};

											_types = (((_tmp_arr select 2) select _find_faction) select _find_vehicleclass);
											if (_type in _types)then{
											}else{
												_count = count _types;
												[
													_tmp_arr,
													[2,_find_faction,_find_vehicleclass,_count], 
													_type
												] call gosa_fnc_setNestedElement;
											};
										};
									};
								};
			}forEach availableVehicles;
			[_tmp_arr,_this] call _fnc_create_buy_menu;
		};
		{
			_x call _fnc_vehicles
		} forEach ["Car","Tank","Helicopter","Plane","Motorcycle","Ship","StaticWeapon"];

	// Для совместимости.
	//-- Pilot
		_tmp_arr = [[],[],[]];
		{
			private ["_entry"]; private["_type"];
			_entry = ((configFile >> "CfgVehicles") >> _x); _type = _x;
							if (((getNumber(_entry >> "side")) == (getNumber(configFile >> "CfgVehicles">> typeof player >> "side")))) then {
								if (((getText(_entry >> "simulation")) == "soldier") && (getNumber(_entry >> "isMan") == 1)) then {
									if ([[(configname _entry)],["USMC_Soldier_Pilot", "CDF_Soldier_Pilot", "RU_Soldier_Pilot", "Ins_Soldier_Pilot", "GUE_Soldier_Pilot", "US_Soldier_Pilot_EP1", "TK_Soldier_Pilot_EP1", "UN_CDF_Soldier_Pilot_EP1", "Soldier_Pilot_PMC", "BAF_Pilot_MTP", "Pilot", "TK_CIV_Takistani01_EP1"]] call gosa_fnc_CheckIsKindOfArray) then {
										private["_faction"]; private["_vehicleclass"];
										_faction = getText(_entry >> "faction"); _vehicleclass = getText(_entry >> "vehicleclass");
										private["_factionclasses"];
										_factionclasses = _tmp_arr select 0;
										private["_find_faction"];
										if (_faction in _factionclasses)then{
											_find_faction = _factionclasses find _faction;
										}else{
											private["_count"];
											_count = count _factionclasses;
											[_tmp_arr,[0,_count],_faction] call gosa_fnc_setNestedElement;
											[_tmp_arr,[1,_count],[]] call gosa_fnc_setNestedElement;
											[_tmp_arr,[2,_count],[]] call gosa_fnc_setNestedElement;
											_find_faction = _factionclasses find _faction;
										};
										private["_vehicleclasses"];
										_vehicleclasses = ((_tmp_arr select 1) select _find_faction);
										private["_find_vehicleclass"];
										if (_vehicleclass in _vehicleclasses)then{
											_find_vehicleclass = _vehicleclasses find _vehicleclass;
										}else{
											private["_count"];
											_count = count _vehicleclasses;
											[_tmp_arr,[1,_find_faction,_count],_vehicleclass] call gosa_fnc_setNestedElement;
											[_tmp_arr,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
											_find_vehicleclass = _vehicleclasses find _vehicleclass;
										};
										private["_types"];
										_types = (((_tmp_arr select 2) select _find_faction) select _find_vehicleclass);
										if (_type in _types)then{
										}else{
											_count = count _types;
											[_tmp_arr,[2,_find_faction,_find_vehicleclass,_count],_type] call gosa_fnc_setNestedElement;
										};
									};
								};
							};
		}forEach availableVehicles;;
		[_tmp_arr,"Pilot"] call _fnc_create_buy_menu;

	//-- Support
		_tmp_arr = [[],[],[]];
		{
			private ["_entry"]; private["_type"];
			_entry = ((configFile >> "CfgVehicles") >> _x); _type = _x;
							if !(getText(_entry >> "simulation") in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
								if!(configname _entry isKindOf "Chukar")then{
									if ((getNumber(_entry >> "transportammo")> 0) or (getNumber(_entry >> "transportrepair")> 0) or (getNumber(_entry >> "transportfuel")> 0) or ([[configname _entry], listSalvageTruck] call gosa_fnc_CheckIsKindOfArray)) then {
										private["_faction"]; private["_vehicleclass"];
										_faction = getText(_entry >> "faction"); _vehicleclass = getText(_entry >> "vehicleclass");
										private["_factionclasses"];
										_factionclasses = _tmp_arr select 0;
										private["_find_faction"];
										if (_faction in _factionclasses)then{
											_find_faction = _factionclasses find _faction;
										}else{
											private["_count"];
											_count = count _factionclasses;
											[_tmp_arr,[0,_count],_faction] call gosa_fnc_setNestedElement;
											[_tmp_arr,[1,_count],[]] call gosa_fnc_setNestedElement;
											[_tmp_arr,[2,_count],[]] call gosa_fnc_setNestedElement;
											_find_faction = _factionclasses find _faction;
										};
										private["_vehicleclasses"];
										_vehicleclasses = ((_tmp_arr select 1) select _find_faction);
										private["_find_vehicleclass"];
										if (_vehicleclass in _vehicleclasses)then{
											_find_vehicleclass = _vehicleclasses find _vehicleclass;
										}else{
											private["_count"];
											_count = count _vehicleclasses;
											[_tmp_arr,[1,_find_faction,_count],_vehicleclass] call gosa_fnc_setNestedElement;
											[_tmp_arr,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
											_find_vehicleclass = _vehicleclasses find _vehicleclass;
										};
										private["_types"];
										_types = (((_tmp_arr select 2) select _find_faction) select _find_vehicleclass);
										if (_type in _types)then{
										}else{
											_count = count _types;
											[_tmp_arr,[2,_find_faction,_find_vehicleclass,_count],_type] call gosa_fnc_setNestedElement;
										};
									};
								};
							};
		}forEach availableVehicles;;
		[_tmp_arr,"Support"] call _fnc_create_buy_menu;


	//-- Меню по типу завода.
	// TODO: Сжатие кода.
	#define __ON 1

	_arr = [[],[],[],[]];
	_0 = _arr select 0;
	_1 = _arr select 1;
	_2 = _arr select 2;
	_3 = _arr select 3;

	//- Heavy Factory
	_n = 0;
	_0 set [_n, "#USER:Tank_0"];
	_1 set [_n, gettext(configfile >> "cfgvehicles" >> "Tank" >> "displayName")];
	_2 set [_n, __ON];
	["Heavy Factory", "gosa_menu_factory_HeavyFactory", _arr, "%1", ""] call BIS_FNC_createmenu;


	//- Plane Factory
	_0 set [_n, "#USER:Plane_0"];
	_1 set [_n, gettext(configfile >> "cfgvehicles" >> "Plane" >> "displayName")];
	_2 set [_n, __ON];
	["Plane Factory", "gosa_menu_factory_PlaneFactory", _arr, "%1", ""] call BIS_FNC_createmenu;


	//- Light Factory
	_0 set [_n, "#USER:Car_0"];
	_1 set [_n, gettext(configfile >> "cfgvehicles" >> "Car" >> "displayName")];
	_2 set [_n, __ON];
	_n = _n+1;
	_0 set [_n, "#USER:Motorcycle_0"];
	_1 set [_n, gettext(configfile >> "cfgvehicles" >> "Motorcycle" >> "displayName")];
	_2 set [_n, __ON];
	["Light Factory", "gosa_menu_factory_LightFactory", _arr, "%1", ""] call BIS_FNC_createmenu;


	//- Aircraft Factory
	_n = 0;
	_0 set [_n, "#USER:Helicopter_0"];
	_1 set [_n, gettext(configfile >> "cfgvehicles" >> "Helicopter" >> "displayName")];
	_2 set [_n, __ON];
	_n = _n+1;
	_0 set [_n, "#USER:Plane_0"];
	_1 set [_n, gettext(configfile >> "cfgvehicles" >> "Plane" >> "displayName")];
	_2 set [_n, __ON];
	["Aircraft Factory", "gosa_menu_factory_AircraftFactory", _arr, "%1", ""] call BIS_FNC_createmenu;


	//- Barracks Factory
	_n = 0;
	//if (leader player == player) then {
		_0 set [_n, "#USER:Man_0"];
		_1 set [_n, gettext(configfile >> "cfgvehicles" >> "Man" >> "displayName")];
		_2 set [_n, __ON];
	//};
	_n = _n+1;
	_0 set [_n, "#USER:Ammo_0"];
	_1 set [_n, gettext(configfile >> "cfgvehicles" >> "ReammoBox" >> "displayName")];
	_2 set [_n, __ON];
	_n = _n+1;
	_0 set [_n, "#USER:StaticWeapon_0"];
	_1 set [_n, gettext(configFile >> "CfgVehicleClasses" >> "static" >> "displayName")];
	_2 set [_n, __ON];
	["Barracks", "gosa_menu_factory_Barracks", _arr, "%1", ""] call BIS_FNC_createmenu;


	//- Меню строительства.
	_arr = [[],[],[],[]];
	_0 = _arr select 0;
	_1 = _arr select 1;
	_2 = _arr select 2;
	_3 = _arr select 3;

	_0 set [count _2, "#USER:Ammo_0"];
	_1 set [count _2, gettext(_cfgVeh >> "ReammoBox" >> "displayName")];
	_2 set [count _2, __ON];

	_0 set [count _2, "#USER:StaticWeapon_0"];
	_1 set [count _2, gettext(configFile >> "CfgVehicleClasses" >> "static" >> "displayName")];
	_2 set [count _2, __ON];

	_0 set [count _2, "#USER:GhostPreview_0"];
	_1 set [count _2, "GhostPreview"];
	_2 set [count _2, __ON];

	["Coin", "BIS_Coin_categories", _arr, "%1", ""] call BIS_FNC_createmenu;


	//- Mega Factory
	_arr = [[],[],[],[]];
	_0 = _arr select 0;
	_1 = _arr select 1;
	_2 = _arr select 2;
	_3 = _arr select 3;

	#ifdef __ARMA3__
		waitUntil{!isNil "gosa_logic_ArsenalBox"};
		_obj = gosa_logic_ArsenalBox;
		if (isNil "ace_arsenal_fnc_initBox") then {
			[_obj,_availableWeapons,false,false] call BIS_fnc_addVirtualWeaponCargo;
			[_obj,true,false,false] call bis_fnc_addVirtualBackpackCargo;
			[_obj,true,false,false] call bis_fnc_addVirtualMagazineCargo;
			[_obj,true,false,false] call bis_fnc_addVirtualItemCargo;
			_3 set [count _2, {['Open', [nil, gosa_logic_ArsenalBox]] call BIS_fnc_arsenal}];
		} else {
			[_obj, _availableWeapons] call ace_arsenal_fnc_initBox;
			_3 set [count _2, {[gosa_logic_ArsenalBox, player] call ace_arsenal_fnc_openBox}];
		};
		_0 set [count _2, ""];
		_1 set [count _2, localize "STR_A3_Arsenal"];
		_2 set [count _2, __ON];
	#endif

	#ifndef __ARMA3__
		_0 set [count _2, ""];
		_1 set [count _2, localize "str_coin_action"];
		_3 set [count _2, 'dir\coin\coin_interface_v2.sqf'];
		_2 set [count _2, missionNamespace getVariable "gosa_coin_v2"];
	#endif

	//if (leader player == player) then {
		_0 set [count _2, "#USER:Man_0"];
		_1 set [count _2, gettext(configfile >> "cfgvehicles" >> "Man" >> "displayName")];
		_2 set [count _2, __ON];
	//};

	// Меню строительства не работает в A3.
	#ifdef __ARMA3__
	if (true) then
	#else
	if (missionNamespace getVariable "gosa_coin_v2" <= 0) then
	#endif
	{
	_0 set [count _2, "#USER:Ammo_0"];
	_1 set [count _2, gettext(configfile >> "cfgvehicles" >> "ReammoBox" >> "displayName")];
	_2 set [count _2, __ON];

	_0 set [count _2, "#USER:StaticWeapon_0"];
	_1 set [count _2, gettext(configFile >> "CfgVehicleClasses" >> "static" >> "displayName")];
	_2 set [count _2, __ON];
	};

	_0 set [count _2, "#USER:Car_0"];
	_1 set [count _2, gettext(configfile >> "cfgvehicles" >> "Car" >> "displayName")];
	_2 set [count _2, __ON];
	_0 set [count _2, "#USER:Motorcycle_0"];
	_1 set [count _2, gettext(configfile >> "cfgvehicles" >> "Motorcycle" >> "displayName")];
	_2 set [count _2, __ON];

	_0 set [count _2, "#USER:Tank_0"];
	_1 set [count _2, gettext(configfile >> "cfgvehicles" >> "Tank" >> "displayName")];
	_2 set [count _2, __ON];

	_0 set [count _2, "#USER:Helicopter_0"];
	_1 set [count _2, gettext(configfile >> "cfgvehicles" >> "Helicopter" >> "displayName")];
	_2 set [count _2, __ON];

	_0 set [count _2, "#USER:Plane_0"];
	_1 set [count _2, gettext(configfile >> "cfgvehicles" >> "Plane" >> "displayName")];
	_2 set [count _2, __ON];

	_0 set [count _2, "#USER:Ship_0"];
	_1 set [count _2, gettext(configfile >> "cfgvehicles" >> "Ship" >> "displayName")];
	_2 set [count _2, 0];

	#ifndef __ARMA3__
		_n = if (missionNamespace getVariable "gosa_UAVManager" == 0) then {0} else {1};
		_0 set [count _2, ""];
		_1 set [count _2, "RC: " + gettext(_cfgVeh >> "UAVManager" >> "displayName")];
		_3 set [count _2, gosa_fnc_createMenu_uavs];
		_2 set [count _2, _n];
	#endif

	gosa_menu_factory_FactoryAll_array = _arr;
	["Factory", "gosa_menu_factory_FactoryAll", _arr, "%1", "
		private ['_arr','_item'];
		_arr = gosa_menu_factory_FactoryAll_array;
		_item = (_arr select 3 select %2);
		if (typeName _item == typeName {}) exitWith {gosa_act_array spawn _item};
		if (typeName _item == typeName '') exitWith {gosa_act_array execVM _item};
	", _3] call BIS_FNC_createmenu;

	// Для совместимости.
	BuyMenu_0 = gosa_menu_factory_FactoryAll_0;
};

buyMenuLoaded=true;
diag_log format ["Log: [Menu] buyMenuLoaded %1", buyMenuLoaded];
