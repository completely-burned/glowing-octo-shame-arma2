///--- бардак, комментировать нечего
private ["_arr13453","_n"];
waitUntil{!isNil "bis_fnc_init"};
waitUntil{!isNil "m_fnc_init"};

// черный список позиций, где респ ботов запрещен, островки
PosBlacklist=[];
for [{_n = 0},{_n < 100},{_n = _n + 1}] do {
	if !(isNil format ["PosBlacklist_%1",_n]) then {
		PosBlacklist = PosBlacklist + [call compile format  ["PosBlacklist_%1",_n]];
	};
};

private["_fnc4","_fnc1","_fnc5"];
_fnc5={
	private["_grp","_types","_true"];
	_grp = _this; // [[[[[_types,_positions,_ranks],[_types,_positions,_ranks]]],[[_types,_positions,_ranks],[_types,_positions,_ranks]]],[0.5,0.5]]
	for "_i" from 0 to ((count (_grp select 0)) - 1) do {
		_types = [_grp, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement;
			_true=false;
			 ScopeName "Check_fnc5";
			{
				if (configName(LIB_cfgVeh >> _x) == "")  then {
					_true=true;
					diag_log format ["init_Groups.sqf _fnc5; %1; %2", _x, _types];
					 BreakTo "Check_fnc5";
				};
			}forEach _types;

			if (_true) then {
				[_grp, [1, _i],  0] call BIS_fnc_setNestedElement;
			};
	};
	_grp
};

_fnc4={
	private["_grp","_types"];
	_grp = +(_this select 0); // [[[[[_types,_positions,_ranks],[_types,_positions,_ranks]]],[[_types,_positions,_ranks]]],[0.5,0.5]]
	private["_max_rarity"];
	_max_rarity = 0;
	{
		_max_rarity = _max_rarity max (_x select 1);
	}forEach (_this select 1);
	for "_i" from 0 to ((count (_grp select 0)) - 1) do {
		_types = [_grp, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement;
		{
			if ([_types, _x select 0] call m_fnc_CheckIsKindOfArray) then {
				private["_rarity"];
				_rarity = ([_grp, [1, _i]] call BIS_fnc_returnNestedElement);
				_rarity = ((_rarity * (_x select 1))/_max_rarity);
				[_grp, [1, _i],  _rarity] call BIS_fnc_setNestedElement;
			};

		}forEach (_this select 1);
	};
	_grp
};

// функция приводит к виду [[[_groups],[_groups]],[0.5,0.5]]
_fnc1={
	private["_groups"];
	_groups=[];
	private["_weights"];
	_weights=[];
	{
		_groups = _groups+[[_x select 0]];
		_weights = _weights+[_x select 1];
	} foreach _this;
	[_groups,_weights];
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// AllGroupsWest=([["west"],[],[]] call m_fnc_returnGroups);
// AllGroupsEast = ([["east"],[],[]] call m_fnc_returnGroups);
// AllGroupsGuerrila=([["Guerrila"],[],[]] call m_fnc_returnGroups);
// if (configName(configFile >> "CfgGroups" >> "PLAgrps") != "") then {
	// AllGroupsGuerrila=(AllGroupsGuerrila+([["PLAgrps"],[],[]] call m_fnc_returnGroups));
// };
[] call compile preprocessFileLineNumbers "m\server\config_groups.sqf";

AllGroupsWest = AllGroupsWest call _fnc1;
AllGroupsEast = AllGroupsEast call _fnc1;
AllGroupsGuer = AllGroupsGuer call _fnc1;

AllGroupsWest = AllGroupsWest call _fnc5;
AllGroupsEast = AllGroupsEast call _fnc5;
AllGroupsGuer = AllGroupsGuer call _fnc5;

//AllGroupsWestOld 		= AllGroupsWest;
//AllGroupsEastOld 		= AllGroupsEast;
//AllGroupsGuerrilaOld	= AllGroupsGuerrila;

_arr13453=[
	[["Man"], 					missionNamespace getVariable "Man"],
	[["Air"], 					missionNamespace getVariable "Air"],
	[["Tank"], 					missionNamespace getVariable "Tank"],
	[["Car","Motorcycle","Ship"], missionNamespace getVariable "Car"],
	[["StaticWeapon"], 0]
];

// _arr13453=[
	// [["Man"], 				0],
	// [["Air"], 				0],
	// [["Tank"], 				0],
	// [["Ship"], 				1],
	// [["Car","Motorcycle"], 0]
// ];

// AllGroupsWestOld 		= ([AllGroupsWestOld, [[["Air"],0.5]]] call _fnc4);
// AllGroupsEastOld 		= ([AllGroupsEastOld, [[["Air"],0.5]]] call _fnc4);
// AllGroupsGuerrilaOld 	= ([AllGroupsGuerrilaOld, [[["Air"],0.5]]] call _fnc4);

AllGroupsWest = ([AllGroupsWest, _arr13453] call _fnc4);
AllGroupsEast = ([AllGroupsEast, _arr13453] call _fnc4);
AllGroupsGuer = ([AllGroupsGuer, _arr13453] call _fnc4);

GroupsStarted=true;
