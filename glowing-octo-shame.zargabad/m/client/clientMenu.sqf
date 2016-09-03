
private ["_list_BIS_FNC_createmenu2","_list_BIS_FNC_createmenu","_dataListUnit","_dataListUnitNames","_fnc_vehicles","_libEnabled"];
	// ["teleport", "teleport", [[getmarkerpos 'respawn_west', getmarkerpos 'respawn_east', getmarkerpos 'respawn_guerrila'],['respawn_west','respawn_east','respawn_guerrila']], "","player setpos %1"] call BIS_FNC_createmenu; 

waitUntil{!isNil "fnc_libEnabled"};
waitUntil{!isNil "BIS_FNC_createmenu"};
waitUntil{!isNil "m_fnc_CheckIsKindOfArray"};

_list_BIS_FNC_createmenu2=
{
	private["_arr1","_arr2","_arr3"];
	_arr1=[];
	_arr2=[];
	_arr3=[];
	for "_i" from 0 to (count _this - 1) do
	{
		_arr1 = _arr1 + [(_this select _i) select 0];
		_arr2 = _arr2 + [(_this select _i) select 1];
		_arr3 = _arr3 + [1];
	};
	[_arr1,_arr2,_arr3];
};
waitUntil{!isNil "m_fnc_RespawnWeaponsAdd"};
_list_BIS_FNC_createmenu=([
	[format ["%1 %3",localize "str_disp_arcmap_save",localize "str_weapon",localize "str_log_gear"],"'save' call m_fnc_RespawnWeaponsAdd"],
	["camera.sqf","[] execvm 'camera.sqf'"],
	["SetGroupIconsVisible [true,true]","SetGroupIconsVisible [true,true];"],
	// ["setCaptive true","player setCaptive true"],
	["player setDammage 1","player setDammage 1"],
	["crew", "[] execvm 'm\client\ACT\ACT_HintCrew.sqf'"],
	["nearestVehicle setVectorUp [0,0,100]", "{_x setVectorUp [0,0,100]}foreach [nearestObject [getpos player,'AllVehicles']];"],
	["leave group", "[] execVM 'm\functions\join_grpNull.sqf'"],
	["deleteVehicle vehicle player", "if(({alive _x} count crew vehicle player)<=1)then {deleteVehicle vehicle player};"]
	// ["setdamage 0 LandVehicle nearestObject", "{_x setdamage 0}foreach [nearestObject [getpos player,'LandVehicle']];"],
	// ["leader move player","leader player move getpos player"],
	// ["setAccTime 0.5","setAccTime 0.5"],
	// ["vehicle player setVehicleAmmo 1","vehicle player setVehicleAmmo 1"],
	// ["hint typeof nearestBuilding player","hint typeof nearestBuilding player"]
] call _list_BIS_FNC_createmenu2);


		
private ["_dataListAmmoBox"];
_dataListAmmoBox = [];
for "_i" from 0 to ((count (configFile >> "CfgVehicles")) - 1) do {
	private ["_entry"];
	_entry = ((configFile >> "CfgVehicles") select _i);
	if (isClass _entry) then
	{
			if ((getNumber(_entry >> "scope")) == 2) then
			{
				_libEnabled = [_entry] call fnc_libEnabled;
				if (_libEnabled) then
				{
					if (getText(_entry >> "vehicleclass") in ["Ammo","ACE_Ammunition"]) then
					{
						_dataListAmmoBox = _dataListAmmoBox + [configname _entry];
					};
				};
			};
	};
};
// _dataListAmmoBox = _dataListAmmoBox + [["all","[] execvm 'm\functions\m_fnc_MegaAmmoBox.sqf'"]];
// _dataListAmmoBox = _dataListAmmoBox call _list_BIS_FNC_createmenu2;
private ["_dataListAmmoBoxNames"];
_dataListAmmoBoxNames = [];
{
	_dataListAmmoBoxNames = _dataListAmmoBoxNames + [format["%1, %2",_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
}foreach (_dataListAmmoBox );

private ["_fnc_units"];
_fnc_units = {
	private ["_dataListUnit"];
	_dataListUnit = [];
	for "_i" from 0 to ((count (configFile >> "CfgVehicles")) - 1) do {
		private ["_entry"];
		_entry = ((configFile >> "CfgVehicles") select _i);
		if (isClass _entry) then {
			if (((getNumber(_entry >> "side")) == (getNumber(configFile >> "CfgVehicles">> typeof player >> "side")))) then {
				if (((getText(_entry >> "vehicleclass")) == (getText(configFile >> "CfgVehicles">> typeof player >> "vehicleclass"))) or (!isMultiplayer)) then {
					if (((getText(_entry >> "faction")) == (getText(configFile >> "CfgVehicles">> typeof player >> "faction"))) or (!isMultiplayer)) then {
						// if ((getNumber(_entry >> "cost")) <= (getNumber(configFile >> "CfgVehicles">> typeof player >> "cost"))) then {
							if ((getNumber(_entry >> "scope")) == 2) then {
								_libEnabled = [_entry] call fnc_libEnabled;
								if (_libEnabled) then {
									if (((getText(_entry >> "simulation")) == "soldier") && (getNumber(_entry >> "isMan") == 1)) then {
										if ([[(configname _entry)],_this] call m_fnc_CheckIsKindOfArray) then {
											_dataListUnit = _dataListUnit + [configname _entry];
										};
									};
								};
							};
						// };
					};
				};
			};
		};
	};
	private ["_dataListUnitNames"];
	_dataListUnitNames = [];
	{
		_dataListUnitNames = _dataListUnitNames + [format ["%1, %2, %3", getText(configfile >> "CfgVehicles" >> _x >> "displayName"),getText(configFile >> "CfgFactionClasses" >> (getText(configfile >> "CfgVehicles" >> _x >> "faction")) >> "displayName"),getText(configFile >> "CfgvehicleClasses" >> (getText(configfile >> "CfgVehicles" >> _x >> "vehicleclass")) >> "displayName")]];
	}foreach _dataListUnit;
	[_dataListUnit, _dataListUnitNames];
};

private ["_fnc_vehicles"];
_fnc_vehicles = {
	private ["_dataListVeh","_libEnabled","_dataListVehNames"];
	_dataListVeh = [];
	for "_i" from 0 to ((count (configFile >> "CfgVehicles")) - 1) do {
		private ["_entry"];
		_entry = ((configFile >> "CfgVehicles") select _i);
		if (isClass _entry) then
		{
			if (((getNumber(_entry >> "side")) == (getNumber(configFile >> "CfgVehicles">> typeof player >> "side"))) or (!isMultiplayer)) then
			{
				if ((getNumber(_entry >> "scope")) == 2) then
				{
					_libEnabled = [_entry] call fnc_libEnabled;
					if (_libEnabled) then
					{
						if ([[(configname _entry)],_this] call m_fnc_CheckIsKindOfArray) then {
							if ((getText(_entry >> "simulation")) == "soldier") then{
								if (getNumber(_entry >> "isMan") == 1) then{
									_dataListVeh = _dataListVeh + [configname _entry];
								};
							}else{
								if !(getText(_entry >> "simulation") in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
									if!(configname _entry isKindOf "Chukar")then{
										_dataListVeh = _dataListVeh + [configname _entry];
									};
								};
							};
						};
					};
				};
			};
		};
	};
	_dataListVehNames = [];
	{
		_dataListVehNames = _dataListVehNames + [format ["%1 %2", getText(configfile >> "CfgVehicles" >> _x >> "displayName"),getText(configFile >> "CfgFactionClasses" >> (getText(configfile >> "CfgVehicles" >> _x >> "faction")) >> "displayName")]];
	}foreach _dataListVeh;
	[_dataListVeh, _dataListVehNames];
};
["Man", "Man", ["Man"] call _fnc_units, "","['%1'] call Client_BuyUnit"] call BIS_FNC_createmenu; 
["Ammo", "Ammo", [_dataListAmmoBox, _dataListAmmoBoxNames], "","['%1'] call Client_BuyUnit"] call BIS_FNC_createmenu; 
["UAV", "UAV", ["UAV"] call _fnc_vehicles, "","['%1'] call Client_BuyUnit"] call BIS_FNC_createmenu; 
{
	[_x, _x, [_x] call _fnc_vehicles, "","['%1'] call Client_BuyUnit"] call BIS_FNC_createmenu; 
} forEach ["Car","Tank","Helicopter","Plane","Motorcycle","Ship"];

["Pilot", "Pilot", ["USMC_Soldier_Pilot", "CDF_Soldier_Pilot", "RU_Soldier_Pilot", "Ins_Soldier_Pilot", "GUE_Soldier_Pilot", "US_Soldier_Pilot_EP1", "TK_Soldier_Pilot_EP1", "UN_CDF_Soldier_Pilot_EP1", "Soldier_Pilot_PMC", "BAF_Pilot_MTP", "Pilot", "TK_CIV_Takistani01_EP1"] call _fnc_units, "","['%1'] call Client_BuyUnit"] call BIS_FNC_createmenu; 

private ["_fnc_vehicles_support"];
_fnc_vehicles_support = {
	private ["_dataListVeh","_libEnabled","_dataListVehNames"];
	_dataListVeh = [];
	for "_i" from 0 to ((count (configFile >> "CfgVehicles")) - 1) do {
		private ["_entry"];
		_entry = ((configFile >> "CfgVehicles") select _i);
		if (isClass _entry) then
		{
			if (((getNumber(_entry >> "side")) == (getNumber(configFile >> "CfgVehicles">> typeof player >> "side"))) or (!isMultiplayer)) then
			{
				if ((getNumber(_entry >> "scope")) == 2) then
				{
					_libEnabled = [_entry] call fnc_libEnabled;
					if (_libEnabled) then
					{
						if ((getNumber(_entry >> "transportammo")> 0) or (getNumber(_entry >> "transportrepair")> 0) or (getNumber(_entry >> "transportfuel")> 0) or ([[configname _entry], listSalvageTruck] call m_fnc_CheckIsKindOfArray)) then {
							if ((getText(_entry >> "simulation")) == "soldier") then{
								if (getNumber(_entry >> "isMan") == 1) then{
									_dataListVeh = _dataListVeh + [configname _entry];
								};
							}else{
								if !(getText(_entry >> "simulation") in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
									if!(configname _entry isKindOf "Chukar")then{
										_dataListVeh = _dataListVeh + [configname _entry];
									};
								};
							};
						};
					};
				};
			};
		};
	};
	_dataListVehNames = [];
	{
		_dataListVehNames = _dataListVehNames + [format ["%1 %2", getText(configfile >> "CfgVehicles" >> _x >> "displayName"),getText(configFile >> "CfgFactionClasses" >> (getText(configfile >> "CfgVehicles" >> _x >> "faction")) >> "displayName")]];
	}foreach _dataListVeh;
	[_dataListVeh, _dataListVehNames];
};
["Support", "Support", "Support" call _fnc_vehicles_support, "","['%1'] call Client_BuyUnit"] call BIS_FNC_createmenu; 


["#USER:c_0", "c", [_list_BIS_FNC_createmenu select 1, _list_BIS_FNC_createmenu select 0, _list_BIS_FNC_createmenu select 2], "","%1"] call BIS_FNC_createmenu; 
["setTerrainGrid", "setTerrainGrid", [[50,25,12.5,6.25,3.125],["50","25","12.5","6.25","3.125"]], "","setTerrainGrid %1"] call BIS_FNC_createmenu; 
["setViewDistance", "setViewDistance", [
	[ -1,  1600,  2000,  2500,  3000,  3500,  4000,  4500,  5000,  5500,  6000,  6500,  7000,  7500,  8000,  8500,  9000,  9500,  10000],
	["-1","1600","2000","2500","3000","3500","4000","4500","5000","5500","6000","6500","7000","7500","8000","8500","9000","9500","10000"]
], "","setViewDistance %1"] call BIS_FNC_createmenu; 



buyMenuLoaded=true;

BIS_MENU_GroupCommunication = [

	//--- Name, context sensitive

	["User menu",true],

	//--- Item name, shortcut, -5 (do not change), expression, show, enable

	["BuyMenu", [2], "#USER:BuyMenu_0", -3, [["expression", ""]], "1", "1"],

	[localize "str_usract_lock_target", [3], "#WATCH", -5, [["expression", ""]], "1", "1"],

	["setTerrainGrid", [4], "#USER:setTerrainGrid_0", -5, [["expression", ""]], "1", "1"],

	["setViewDistance", [5], "#USER:setViewDistance_0", -5, [["expression", ""]], "1", "1"],

	// [format ["%1, %2, %3",localize "str_dn_cars" ,localize "str_dn_armored" ,localize "str_dn_air"], [5], "#USER:d_0", -5, [["expression", ""]], "1", "1"],

	[localize "STR_SOM_REQUEST_SUPPORT", [6], "#USER:BIS_MENU_SOM_Support", -5, [["expression", ""]], "1", "1", -1],

	// [ "s_dn_mo", [6], "#USER:f_0", -5, [["expression", ""]], "1", "1"],

	[localize "str_more_menu", [7], "#USER:c_0", -5, [["expression", ""]], "1", "1"],

	["Teleport", [8], "#USER:teleport_0", -5, [["expression", ""]], "1", "1"],
	// ["Teleport", [8], "", -5, [["expression", "[] call m_fnc_teleport"]], "1", "1"],

	[Localize "STR_SQLCOMMDISBANDSEL" + " (%SELECTED_UNIT_ID)",[9],"",-5,[["expression","{moveOut _x; deleteVehicle _x;} foreach GroupSelectedUnits player;"]],"1","1",-1]

	// ["ygaJIuTb TexHuKy",[10],"",-5,[["expression","deleteVehicle vehicle player"]],"1","IsAloneInVehicle"]

]; 
