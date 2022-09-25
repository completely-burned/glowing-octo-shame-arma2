
private ["_list_BIS_FNC_createmenu2","_list_BIS_FNC_createmenu","_tmp_arr",
	"_dataListUnit","_dataListUnitNames","_fnc_vehicles","_libEnabled","_z"];
	// ["teleport", "teleport", [[getmarkerpos 'respawn_west', getmarkerpos 'respawn_east', getmarkerpos 'respawn_guerrila'],['respawn_west','respawn_east','respawn_guerrila']], "","player setpos %1"] call BIS_FNC_createmenu;

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
	[localize "STR_gosa_leave_the_squad", "[] execVM 'dir\actions\act_join_grpNull.sqf'"],
	[localize "STR_gosa_car_flip", "nearestObjects [vehicle player, ['AllVehicles'], 10] call gosa_fnc_turnVehicle;"],
	["camera.sqf","[] execvm 'camera.sqf'"],
	["SetGroupIconsVisible [true,true]","SetGroupIconsVisible [true,true];"],
	[localize "STR_gosa_setTerrainGrid","","#USER:setTerrainGrid_0"],
	[localize "STR_gosa_setViewDistance","","#USER:setViewDistance_0"],

	// TODO: лидер переключаеся на ии снова в данном коде, возможно группа должна быть локальной или owner ии принадлежать игроку
	// 					_g selectLeader _p;
	["selectLeader (%SELECTED_UNIT_ID)","[] call gosa_fnc_menu_selectLeader"],
	[Localize "STR_gosa_dismiss_unit" + " (%SELECTED_UNIT_ID)","{[_x] join grpNull; moveOut _x; deleteVehicle _x;} foreach GroupSelectedUnits player;"],
	[Localize "STR_gosa_join_the_squad",
		"[] execVM 'dir\functions\fnc_joinMenu.sqf'"]
	/*setOwner не возвращает контроль над юнитами, но ломает управление игрокам
	["setOwner (%SELECTED_UNIT_ID) player","
		{
			[nil, _x, rsetOwner, player] call RE;
		} foreach GroupSelectedUnits player;
		private ['_z'];
		_z = leader player;
		if (_z != player) then {
			[nil, _z, rsetOwner, player] call RE;
		};
	"]*/
	// ["deleteVehicle vehicle player", "if(({alive _x} count crew vehicle player)<=1)then {deleteVehicle vehicle player};"],
	// ["leader move player","leader player move getpos player"],
	// ["setAccTime 0.5","setAccTime 0.5"],
];
// Если можно просто переключиться в одиночной игре,
// то меню выбора роли не нужно.
if (isMultiplayer) then {
	_tmp_arr=_tmp_arr+[
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
	["BuyMenu", "BuyMenu", [
		[
			"#USER:Man_0","#USER:Ammo_0","#USER:StaticWeapon_0",
			"#USER:Car_0","#USER:Motorcycle_0","#USER:Tank_0",
			"#USER:Helicopter_0","#USER:Plane_0"
			//, "#USER:Ship_0"
		],
		[
			gettext(configfile >> "cfgvehicles" >> "Man" >> "displayName"),
			gettext(configfile >> "cfgvehicles" >> "ReammoBox" >> "displayName"),
			gettext(configFile >> "CfgVehicleClasses" >> "static" >> "displayName"),
			gettext(configfile >> "cfgvehicles" >> "Car" >> "displayName"),
			gettext(configfile >> "cfgvehicles" >> "Motorcycle" >> "displayName"),
			gettext(configfile >> "cfgvehicles" >> "Tank" >> "displayName"),
			gettext(configfile >> "cfgvehicles" >> "Helicopter" >> "displayName"),
			gettext(configfile >> "cfgvehicles" >> "Plane" >> "displayName")
			//, gettext(configfile >> "cfgvehicles" >> "Ship" >> "displayName")
		],
		[
			1,1,1,
			1,1,1,
			1,1
			//,1
		]
	], "%1", ""] call BIS_FNC_createmenu;
	_tmp_arr=_tmp_arr+[
		[localize "STR_gosa_purchase","","#USER:BuyMenu_0"]
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
private["_fnc_create_buy_menu"];
	_fnc_create_buy_menu = {
		private["_current","_list","_items","_itemsName","_usermenu"];
		_list = _this select 0;
		_current = _this select 1;
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
				};
				[_usermenu2, _usermenu2, [_items3, _itemsName3, _itemEnable], "","['%1'] spawn gosa_fnc_Client_BuyUnit"] call BIS_FNC_createmenu;
			};
			[_usermenu, _usermenu, [_items2, _itemsName2], "%1",""] call BIS_FNC_createmenu;
		};
		[_current, _current, [_items, _itemsName], "%1",""] call BIS_FNC_createmenu;
	};

if (missionNamespace getVariable "gosa_shop" in [1,2]) then {

	waitUntil{!isNil "gosa_fnc_libEnabled"};
		waitUntil{!isNil "gosa_fnc_CheckIsKindOfArray"};
		waitUntil{!isNil "gosa_fnc_setNestedElement"};
		waitUntil{!isNil "availableVehicles"};
		waitUntil{!isNil "availableWeapons"};
		waitUntil{!isNil "availableMagazines"};

	//-- Ammo
		private ["_list"];
		_list = [[],[],[]];
		{
			private ["_entry"]; private["_type"];
			_entry = ((configFile >> "CfgVehicles") >> _x); _type = _x;
			private["_faction"]; private["_vehicleclass"];
			if(_type == "gosa_megaAmmoBox")then{
				_faction = "Default"; _vehicleclass = "Ammo";
			}else{
				_faction = getText(_entry >> "faction"); _vehicleclass = getText(_entry >> "vehicleclass");
			};
							if (_vehicleclass in ["Ammo","ACE_Ammunition","Backpacks"]) then
							{
								private["_factionclasses"];
								_factionclasses = _list select 0;
								private["_find_faction"];
								if (_faction in _factionclasses)then{
									_find_faction = _factionclasses find _faction;
								}else{
									private["_count"];
									_count = count _factionclasses;
									[_list,[0,_count],_faction] call gosa_fnc_setNestedElement;
									[_list,[1,_count],[]] call gosa_fnc_setNestedElement;
									[_list,[2,_count],[]] call gosa_fnc_setNestedElement;
									_find_faction = _factionclasses find _faction;
								};
								private["_vehicleclasses"];
								_vehicleclasses = ((_list select 1) select _find_faction);
								private["_find_vehicleclass"];
								if (_vehicleclass in _vehicleclasses)then{
									_find_vehicleclass = _vehicleclasses find _vehicleclass;
								}else{
									private["_count"];
									_count = count _vehicleclasses;
									[_list,[1,_find_faction,_count],_vehicleclass] call gosa_fnc_setNestedElement;
									[_list,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
									_find_vehicleclass = _vehicleclasses find _vehicleclass;
								};
								private["_types"];
								_types = (((_list select 2) select _find_faction) select _find_vehicleclass);
								if (_type in _types)then{
								}else{
									_count = count _types;
									[_list,[2,_find_faction,_find_vehicleclass,_count],_type] call gosa_fnc_setNestedElement;
								};
							};
		}forEach availableVehicles+["gosa_megaAmmoBox"];
		[_list,"Ammo"] call _fnc_create_buy_menu;

	// _dataListAmmoBox = _dataListAmmoBox + [["all","[] execvm 'm\functions\gosa_fnc_MegaAmmoBox.sqf'"]];
		// _dataListAmmoBox = _dataListAmmoBox call _list_BIS_FNC_createmenu2;

	//-- Units
		private ["_list"];
		_list = [[],[],[]];
		{
			private ["_entry"]; private["_type"];
			_entry = ((configFile >> "CfgVehicles") >> _x); _type = _x;
							if (((getNumber(_entry >> "side")) == (getNumber(configFile >> "CfgVehicles">> typeof player >> "side"))) or !isMultiplayer) then {
								if (
									((toLower getText(_entry >> "simulation")) == "soldier") &&
									(getNumber(_entry >> "isMan") == 1) &&
									!(toLower _type in gosa_blacklisted_player_classes_L) &&
									!(toLower getText(_entry >> "model") in ["\ca\characters_e\invisibleman"])
								) then {
									private["_faction"]; private["_vehicleclass"];
									_faction = getText(_entry >> "faction"); _vehicleclass = getText(_entry >> "vehicleclass");
									private["_factionclasses"];
									_factionclasses = _list select 0;
									private["_find_faction"];
									if (_faction in _factionclasses)then{
										_find_faction = _factionclasses find _faction;
									}else{
										private["_count"];
										_count = count _factionclasses;
										[_list,[0,_count],_faction] call gosa_fnc_setNestedElement;
										[_list,[1,_count],[]] call gosa_fnc_setNestedElement;
										[_list,[2,_count],[]] call gosa_fnc_setNestedElement;
										_find_faction = _factionclasses find _faction;
									};
									private["_vehicleclasses"];
									_vehicleclasses = ((_list select 1) select _find_faction);
									private["_find_vehicleclass"];
									if (_vehicleclass in _vehicleclasses)then{
										_find_vehicleclass = _vehicleclasses find _vehicleclass;
									}else{
										private["_count"];
										_count = count _vehicleclasses;
										[_list,[1,_find_faction,_count],_vehicleclass] call gosa_fnc_setNestedElement;
										[_list,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
										_find_vehicleclass = _vehicleclasses find _vehicleclass;
									};
									private["_types"];
									_types = (((_list select 2) select _find_faction) select _find_vehicleclass);
									if (_type in _types)then{
									}else{
										_count = count _types;
										[_list,[2,_find_faction,_find_vehicleclass,_count],_type] call gosa_fnc_setNestedElement;
									};
								};
							};
		}forEach availableVehicles;
		[_list,"Man"] call _fnc_create_buy_menu;

	//-- vehicles
		private ["_fnc_vehicles"];
		_fnc_vehicles = {
			private ["_list"];
			_list = [[],[],[]];
			{
				private ["_entry"]; private["_type"];
				_entry = ((configFile >> "CfgVehicles") >> _x); _type = _x;
								if !(getText(_entry >> "simulation") in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
									if!(configname _entry isKindOf "Chukar")then{
										if ([[(configname _entry)],[_this]] call gosa_fnc_CheckIsKindOfArray) then {
											private["_faction"]; private["_vehicleclass"];
											_faction = getText(_entry >> "faction"); _vehicleclass = getText(_entry >> "vehicleclass");
											private["_factionclasses"];
											_factionclasses = _list select 0;
											private["_find_faction"];
											if (_faction in _factionclasses)then{
												_find_faction = _factionclasses find _faction;
											}else{
												private["_count"];
												_count = count _factionclasses;
												[_list,[0,_count],_faction] call gosa_fnc_setNestedElement;
												[_list,[1,_count],[]] call gosa_fnc_setNestedElement;
												[_list,[2,_count],[]] call gosa_fnc_setNestedElement;
												_find_faction = _factionclasses find _faction;
											};
											private["_vehicleclasses"];
											_vehicleclasses = ((_list select 1) select _find_faction);
											private["_find_vehicleclass"];
											if (_vehicleclass in _vehicleclasses)then{
												_find_vehicleclass = _vehicleclasses find _vehicleclass;
											}else{
												private["_count"];
												_count = count _vehicleclasses;
												[_list,[1,_find_faction,_count],_vehicleclass] call gosa_fnc_setNestedElement;
												[_list,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
												_find_vehicleclass = _vehicleclasses find _vehicleclass;
											};
											private["_types"];
											_types = (((_list select 2) select _find_faction) select _find_vehicleclass);
											if (_type in _types)then{
											}else{
												_count = count _types;
												[_list,[2,_find_faction,_find_vehicleclass,_count],_type] call gosa_fnc_setNestedElement;
											};
										};
									};
								};
			}forEach availableVehicles;
			[_list,_this] call _fnc_create_buy_menu;
		};
		{
			_x call _fnc_vehicles
		} forEach ["Car","Tank","Helicopter","Plane","Motorcycle","Ship","StaticWeapon"];

	//-- Pilot
		private ["_list"];
		_list = [[],[],[]];
		{
			private ["_entry"]; private["_type"];
			_entry = ((configFile >> "CfgVehicles") >> _x); _type = _x;
							if (((getNumber(_entry >> "side")) == (getNumber(configFile >> "CfgVehicles">> typeof player >> "side")))) then {
								if (((getText(_entry >> "simulation")) == "soldier") && (getNumber(_entry >> "isMan") == 1)) then {
									if ([[(configname _entry)],["USMC_Soldier_Pilot", "CDF_Soldier_Pilot", "RU_Soldier_Pilot", "Ins_Soldier_Pilot", "GUE_Soldier_Pilot", "US_Soldier_Pilot_EP1", "TK_Soldier_Pilot_EP1", "UN_CDF_Soldier_Pilot_EP1", "Soldier_Pilot_PMC", "BAF_Pilot_MTP", "Pilot", "TK_CIV_Takistani01_EP1"]] call gosa_fnc_CheckIsKindOfArray) then {
										private["_faction"]; private["_vehicleclass"];
										_faction = getText(_entry >> "faction"); _vehicleclass = getText(_entry >> "vehicleclass");
										private["_factionclasses"];
										_factionclasses = _list select 0;
										private["_find_faction"];
										if (_faction in _factionclasses)then{
											_find_faction = _factionclasses find _faction;
										}else{
											private["_count"];
											_count = count _factionclasses;
											[_list,[0,_count],_faction] call gosa_fnc_setNestedElement;
											[_list,[1,_count],[]] call gosa_fnc_setNestedElement;
											[_list,[2,_count],[]] call gosa_fnc_setNestedElement;
											_find_faction = _factionclasses find _faction;
										};
										private["_vehicleclasses"];
										_vehicleclasses = ((_list select 1) select _find_faction);
										private["_find_vehicleclass"];
										if (_vehicleclass in _vehicleclasses)then{
											_find_vehicleclass = _vehicleclasses find _vehicleclass;
										}else{
											private["_count"];
											_count = count _vehicleclasses;
											[_list,[1,_find_faction,_count],_vehicleclass] call gosa_fnc_setNestedElement;
											[_list,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
											_find_vehicleclass = _vehicleclasses find _vehicleclass;
										};
										private["_types"];
										_types = (((_list select 2) select _find_faction) select _find_vehicleclass);
										if (_type in _types)then{
										}else{
											_count = count _types;
											[_list,[2,_find_faction,_find_vehicleclass,_count],_type] call gosa_fnc_setNestedElement;
										};
									};
								};
							};
		}forEach availableVehicles;;
		[_list,"Pilot"] call _fnc_create_buy_menu;

	//-- Support
		private ["_list"];
		_list = [[],[],[]];
		{
			private ["_entry"]; private["_type"];
			_entry = ((configFile >> "CfgVehicles") >> _x); _type = _x;
							if !(getText(_entry >> "simulation") in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
								if!(configname _entry isKindOf "Chukar")then{
									if ((getNumber(_entry >> "transportammo")> 0) or (getNumber(_entry >> "transportrepair")> 0) or (getNumber(_entry >> "transportfuel")> 0) or ([[configname _entry], listSalvageTruck] call gosa_fnc_CheckIsKindOfArray)) then {
										private["_faction"]; private["_vehicleclass"];
										_faction = getText(_entry >> "faction"); _vehicleclass = getText(_entry >> "vehicleclass");
										private["_factionclasses"];
										_factionclasses = _list select 0;
										private["_find_faction"];
										if (_faction in _factionclasses)then{
											_find_faction = _factionclasses find _faction;
										}else{
											private["_count"];
											_count = count _factionclasses;
											[_list,[0,_count],_faction] call gosa_fnc_setNestedElement;
											[_list,[1,_count],[]] call gosa_fnc_setNestedElement;
											[_list,[2,_count],[]] call gosa_fnc_setNestedElement;
											_find_faction = _factionclasses find _faction;
										};
										private["_vehicleclasses"];
										_vehicleclasses = ((_list select 1) select _find_faction);
										private["_find_vehicleclass"];
										if (_vehicleclass in _vehicleclasses)then{
											_find_vehicleclass = _vehicleclasses find _vehicleclass;
										}else{
											private["_count"];
											_count = count _vehicleclasses;
											[_list,[1,_find_faction,_count],_vehicleclass] call gosa_fnc_setNestedElement;
											[_list,[2,_find_faction,_count],[]] call gosa_fnc_setNestedElement;
											_find_vehicleclass = _vehicleclasses find _vehicleclass;
										};
										private["_types"];
										_types = (((_list select 2) select _find_faction) select _find_vehicleclass);
										if (_type in _types)then{
										}else{
											_count = count _types;
											[_list,[2,_find_faction,_find_vehicleclass,_count],_type] call gosa_fnc_setNestedElement;
										};
									};
								};
							};
		}forEach availableVehicles;;
		[_list,"Support"] call _fnc_create_buy_menu;

};

buyMenuLoaded=true;
