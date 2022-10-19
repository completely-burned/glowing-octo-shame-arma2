#define __A2OA__
/*
В этом файле формируется меню позиций для телепортации.
*/
private ["_item","_obj","_num","_str","_for","_pos"];

waitUntil{!isNil "gosa_fnc_CheckIsKindOfArray"};
waitUntil{!isNil "civilianBasePos"};
waitUntil{!isNil "CivilianLocation"};
waitUntil{!isNil "MHQ_list"};

private ["_list","_list2","_reapawnPlayer","_teleport_list"];
_list=[];
_teleport_list=[];
_list2=[];
switch (playerSide) do {
	case (west):
	{
		_reapawnPlayer = "respawn_west";
	};
	case (east):
	{
		_reapawnPlayer = "respawn_east";
	};
	case (civilian):
	{
		_reapawnPlayer = "respawn_civilian";
	};
	case (resistance):
	{
		_reapawnPlayer = "respawn_guerrila";
	};
	default {};
};

// _teleportLocations = ((nearestLocations [civilianBasePos, ["CityCenter"],5000])-[CivilianLocation]);
// _teleportLocations resize (5 min count _teleportLocations);

private ["_gosa_objectsTeleportTmp","_gosa_objectsTeleport"];
_gosa_objectsTeleportTmp = [];
_gosa_objectsTeleport = [];

//-- Аэропорты, пока только для пилотов.
// TODO: Возможность телепортироваться обратно.
if (gosa_playerStartingClass == 1) then {
	_for = [] call gosa_fnc_initAirports;
	for "_i" from 0 to (count _for - 1) do {
		_item = _for select _i;
		_obj = _item select 1;
		_pos = _item select 4;

		_num = count _list;
		_str = format ["%1, %2", text ((nearestLocations [_pos,
				["nameCity","NameCityCapital","NameVillage","NameLocal","NameMarine","Hill"],5000])
					select 0),
				getText(configfile >> "CfgVehicles" >> typeof _obj >> "displayName")];

		_list set [_num, _num];
		_teleport_list set [_num, _obj];
		_list2 set [_num, _str];
	};
};

#ifdef __A2OA__
{
	_gosa_objectsTeleportTmp = _gosa_objectsTeleportTmp + allMissionObjects _x;
} foreach gosa_objectsTeleport;
#endif

{
	if(toLower typeOf _x in (MHQ_list select 0))then{
		_gosa_objectsTeleportTmp set [count _gosa_objectsTeleportTmp, _x];
	};
} foreach vehicles;

{
	if!(_x in _gosa_objectsTeleport)then{
		_gosa_objectsTeleport set [count _gosa_objectsTeleport, _x];
	};
} foreach _gosa_objectsTeleportTmp;


_teleportLocations = [];
{
	switch (typeName _x) do {
		case ("OBJECT"):
		{
				if (alive _x) then {
				if !(getNumber(configFile >> "CfgVehicles">> typeOf _x >> "side") call gosa_fnc_getSide getFriend playerSide < 0.6) then {
					_list = _list + [count _list];
					_teleport_list = _teleport_list + [_x];
					_list2= _list2 + [format ["%1, %2", text ((nearestLocations [position _x, ["nameCity","NameCityCapital","NameVillage","NameLocal","NameMarine","Hill"],5000]) select 0), getText(configfile >> "CfgVehicles" >> typeof _x >> "displayName")]];
				};
				};
		};
		case ("STRING"):
		{
			_list = _list + [count _list];
			_teleport_list = _teleport_list + [_x];
			_list2= _list2 + [format ["%1, %2", text ((nearestLocations [getMarkerPos _x, ["nameCity","NameCityCapital","NameVillage","NameLocal","NameMarine","Hill"],5000]) select 0), _x]];
		};
		case ("LOCATION"):
		{
			_list = _list + [count _list];
			_teleport_list = _teleport_list + [_x];
			_list2= _list2 + [format ["%1", text ((nearestLocations [position _x, ["nameCity","NameCityCapital","NameVillage","NameLocal","NameMarine","Hill"],5000]) select 0)]];
		};
		default {};
	};
} foreach _gosa_objectsTeleport
+_teleportLocations;

diag_log format ["Log: [fnc_teleport] n %1", _list];
diag_log format ["Log: [fnc_teleport] t %1", _list2];
diag_log format ["Log: [fnc_teleport] o %1", _teleport_list];

teleport_list = _teleport_list;
["teleport", "teleport", [_list,_list2], "","(teleport_list select %1) call gosa_fnc_teleport2"] call BIS_FNC_createmenu;
