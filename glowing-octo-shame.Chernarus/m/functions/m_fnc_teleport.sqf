waitUntil{!isNil "m_fnc_CheckIsKindOfArray"};
waitUntil{!isNil "civilianBasePos"};
waitUntil{!isNil "CivilianLocation"};
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

_draga_objectsTeleport = [];
{
	_draga_objectsTeleport = _draga_objectsTeleport + allMissionObjects _x;
} foreach draga_objectsTeleport;

_teleportLocations = [];
{
	switch (typeName _x) do {
		case ("OBJECT"):
		{
			if([[_x],draga_objectsTeleport] call m_fnc_CheckIsKindOfArray)then{
				if (alive _x) then {
				if !(getNumber(configFile >> "CfgVehicles">> typeOf _x >> "side") call m_fnc_getSide getFriend playerSide < 0.6) then {
					_list = _list + [count _list];
					_teleport_list = _teleport_list + [_x];
					_list2= _list2 + [format ["%1, %2", text ((nearestLocations [position _x, ["nameCity","NameCityCapital","NameVillage","NameLocal","NameMarine","Hill"],5000]) select 0), getText(configfile >> "CfgVehicles" >> typeof _x >> "displayName")]];
				};
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
} foreach _draga_objectsTeleport
+_teleportLocations;


teleport_list = _teleport_list;
["teleport", "teleport", [_list,_list2], "","(teleport_list select %1) call m_fnc_teleport2"] call BIS_FNC_createmenu; 
