#define __A2OA__
/*
 * TODO: Рефакторинг.
 */

private ["_z","_n","_item","_arr","_param_ratio"];
waitUntil{!isNil "bis_fnc_init"};
waitUntil{!isNil "gosa_fnc_init"};

// черный список позиций, где респ ботов запрещен, островки
PosBlacklist=[];
for [{_n = 0},{_n < 100},{_n = _n + 1}] do {
	if !(isNil format ["PosBlacklist_%1",_n]) then {
		PosBlacklist = PosBlacklist + [call compile format  ["PosBlacklist_%1",_n]];
	};
};

private["_fnc4","_fnc1"];

_fnc4={
	private["_grp","_types"];
	_grp = (_this select 0); // [[[[[_types,_positions,_ranks],[_types,_positions,_ranks]]],[[_types,_positions,_ranks]]],[0.5,0.5]]
	private["_max_rarity"];
	_max_rarity = 0;
	{
		_max_rarity = _max_rarity max (_x select 1);
	}forEach (_this select 1);
	for "_i" from 0 to ((count (_grp select 0)) - 1) do {
		_types = [_grp, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement;
		{
			if( ([_types, _x select 0] call gosa_fnc_CheckIsKindOfArray) && !([_types, ["AllVehicles"], _x select 0] call gosa_fnc_CheckIsKindOfArray) )then {
				private["_rarity"];
				_rarity = ([_grp, [1, _i]] call BIS_fnc_returnNestedElement);
				_rarity = ((_rarity * (_x select 1))/_max_rarity);
				[_grp, [1, _i],  _rarity] call BIS_fnc_setNestedElement;
			};

		}forEach (_this select 1);
	};
};

// Функция меняет баланс для фракции.
private ["_fnc6"];
_fnc6={
	private["_grp","_factions","_raritySet","_types","_rarity"];

	_grp = (_this select 0);
	_factions = (_this select 1);
	_raritySet = (_this select 2);

	for "_i" from 0 to ((count (_grp select 0)) - 1) do {
		_types = ([_grp, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement);
			diag_log format ["init_groups.sqf _rarity_fnc6 %1", _types];
		if( { toUpper getText (configFile >> "CfgVehicles" >> _x >> "faction") in _factions } count _types > 0)then {
			_rarity = ([_grp, [1, _i]] call BIS_fnc_returnNestedElement);
				diag_log format ["init_groups.sqf _rarity %1", _rarity];
			_rarity = (_rarity * _raritySet);
			[_grp, [1, _i],  _rarity] call BIS_fnc_setNestedElement;
				diag_log format ["init_groups.sqf _rarity new %1", ([_grp, [1, _i]] call BIS_fnc_returnNestedElement)];
		};
	};

	nil;
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// AllGroupsWest=([["west"],[],[]] call gosa_fnc_returnGroups);
// AllGroupsEast = ([["east"],[],[]] call gosa_fnc_returnGroups);
// AllGroupsGuerrila=([["Guerrila"],[],[]] call gosa_fnc_returnGroups);
// if (configName(configFile >> "CfgGroups" >> "PLAgrps") != "") then {
	// AllGroupsGuerrila=(AllGroupsGuerrila+([["PLAgrps"],[],[]] call gosa_fnc_returnGroups));
// };

#ifdef __ARMA3__
	[] call compile preprocessFileLineNumbers "dir\arma3\config_groups.sqf";
#else
[] call compile preprocessFileLineNumbers "dir\server\config_groups.sqf";
#endif

//AllGroupsWestOld 		= AllGroupsWest;
//AllGroupsEastOld 		= AllGroupsEast;
//AllGroupsGuerrilaOld	= AllGroupsGuerrila;

_z=[
	[["Man"], 					missionNamespace getVariable "Man"],
	[["Air"], 					missionNamespace getVariable "Air"],
	[["Tank"], 					missionNamespace getVariable "Tank"],
	[["Car","Motorcycle"],		missionNamespace getVariable "Car"],
	[["StaticWeapon"], 			missionNamespace getVariable "StaticWeapon"],
	[["Ship"], 					missionNamespace getVariable "Ship"]
];

// _arr13453=[
	// [["Man"], 				0],
	// [["Air"], 				0],
	// [["Tank"], 				0],
	// [["Ship"], 				1],
	// [["Car","Motorcycle"], 0]
// ];

#ifdef __A2OA__
// AllGroupsWestOld 		= ([AllGroupsWestOld, [[["Air"],0.5]]] call _fnc4);
// AllGroupsEastOld 		= ([AllGroupsEastOld, [[["Air"],0.5]]] call _fnc4);
// AllGroupsGuerrilaOld 	= ([AllGroupsGuerrilaOld, [[["Air"],0.5]]] call _fnc4);

[AllGroupsWest, _z] call gosa_fnc_groupsRarity;
[AllGroupsEast, _z] call gosa_fnc_groupsRarity;
[AllGroupsGuer, _z] call gosa_fnc_groupsRarity;

// Множители фракций.
_arr = ["RU","BIS_TK","BIS_TK_INS","INS"];
for "_i" from 0 to (count _arr -1) do {
	_item = (_arr select _i);
	_n = missionNamespace getVariable ("gosa_faction_multiplier_"+_item);
	if !(isNil "_n") then {
		if (_n < 1 && _n >= 0) then {
			[AllGroupsEast, [_item], _n] call _fnc6;
		};
	};
};
_arr = ["USMC","BIS_US","BIS_CZ","BIS_GER","BIS_BAF","CDF"];
for "_i" from 0 to (count _arr -1) do {
	_item = (_arr select _i);
	_n = missionNamespace getVariable ("gosa_faction_multiplier_"+_item);
	if !(isNil "_n") then {
		if (_n < 1 && _n >= 0) then {
			[AllGroupsWest, [_item], _n] call _fnc6;
		};
	};
};
_arr = ["PMC_BAF","GUE","BIS_TK_GUE","BIS_UN"];
for "_i" from 0 to (count _arr -1) do {
	_item = (_arr select _i);
	_n = missionNamespace getVariable ("gosa_faction_multiplier_"+_item);
	if !(isNil "_n") then {
		if (_n < 1 && _n >= 0) then {
			[AllGroupsGuer, [_item], _n] call _fnc6;
		};
	};
};


// Ограничить сверхдержав если игроки играют за независимых.
// FIXME: Некоторые игроки любят сложнее.
if !(west in gosa_friendlyside or east in gosa_friendlyside) then {
	_arr = ["RU","BIS_TK"];
	for "_i" from 0 to (count _arr -1) do {
		_item = (_arr select _i);
		_n = missionNamespace getVariable ("gosa_faction_multiplier_"+_item);
		if !(isNil "_n") then {
			if (_n == -1) then {
				[AllGroupsEast, [_item], 0.25] call _fnc6;
			};
		};
	};
	_arr = ["USMC","BIS_US","BIS_CZ","BIS_GER","BIS_BAF"];
	for "_i" from 0 to (count _arr -1) do {
		_item = (_arr select _i);
		_n = missionNamespace getVariable ("gosa_faction_multiplier_"+_item);
		if !(isNil "_n") then {
			if (_n == -1) then {
				[AllGroupsWest, [_item], 0.25] call _fnc6;
			};
		};
	};
	_arr = ["PMC_BAF"];
	for "_i" from 0 to (count _arr -1) do {
		_item = (_arr select _i);
		_n = missionNamespace getVariable ("gosa_faction_multiplier_"+_item);
		if !(isNil "_n") then {
			if (_n == -1) then {
				[AllGroupsGuer, [_item], 0.25] call _fnc6;
			};
		};
	};
};

//--- лес
if(toLower worldname in ["chernarus", "utes", "fdf_isle1_a",  "woodland_acr","namalsk","bootcamp_acr"])then{
	_z=["PMC_BAF"];
	for "_i" from 0 to count _z -1 do {
		_item = _z select _i;
		if (missionNamespace getVariable ("gosa_faction_multiplier_"+_item) == -1) then {
			[AllGroupsGuer, [_item], 0.25] call _fnc6;
		};
	};
};

if(toLower worldName == "utes")then{
	[AllGroupsWest, [[["Ship"], 15]]] call gosa_fnc_groupsRarity;
	[AllGroupsEast, [[["Ship"], 15]]] call gosa_fnc_groupsRarity;
	[AllGroupsGuer, [[["Ship"], 15]]] call gosa_fnc_groupsRarity;
};

	[AllGroupsWest, [[["Air"], 0.5]]] call gosa_fnc_groupsRarity;
	[AllGroupsEast, [[["Air"], 0.5]]] call gosa_fnc_groupsRarity;
	[AllGroupsGuer, [[["Air"], 0.5]]] call gosa_fnc_groupsRarity;

// Woodland_ACR ии не может должным образом использовать дороги
if(toLower worldName == "woodland_acr")then{
	diag_log format ["Log: [init_groups.sqf] worldName %1, rarity", worldName];
	_z = [
		[["Car","Motorcycle"], 0.3]
	];
	[AllGroupsWest, _z] call gosa_fnc_groupsRarity;
	[AllGroupsEast, _z] call gosa_fnc_groupsRarity;
	[AllGroupsGuer, _z] call gosa_fnc_groupsRarity;
};

#endif

#ifdef __ARMA3__
	// Горы.
	if (gosa_IslandType select 2 >= 750) then {
		for "_i" from 0 to 3 do {
			_arr = gosa_Groups_common select _i;
			if !(isNil "_arr") then {
					[_arr, [[["Tank"], 1/3]]] call gosa_fnc_groupsRarity;
			};
		};
	};
#endif

publicVariable "AllGroupsWest";
publicVariable "AllGroupsEast";
publicVariable "AllGroupsGuer";
publicVariable "gosa_Groups_common";
GroupsStarted=true;
publicVariable "GroupsStarted";

diag_log format ["Log: [init_groups.sqf] west %1", count (AllGroupsWest select 0)];
diag_log format ["Log: [init_groups.sqf] east %1", count (AllGroupsEast select 0)];
diag_log format ["Log: [init_groups.sqf] guer %1", count (AllGroupsGuer select 0)];
diag_log format ["Log: [init_groups.sqf] end %1", time];
