/*
 * Черновик.
 * Типичная миссия захвата.
 */

private ["_mission_type","_battlefield_size","_towns","_pos","_location","_time_startup",
	"_par_safeSpawnDistance","_n","_var_patrol","_var_timeDeleteVehicle",
	"_locationRandom","_arr",
	"_var_grps_rarity","_grps_rarity","_grp","_sides_friendly","_towns_weighted"];

_sides_friendly = gosa_friendlyside;
_par_safeSpawnDistance = safeSpawnDistance;
_mission_type = "capture_location";
_var_grps_rarity = "_grps_rarity";
_var_patrol = "patrol";
_var_timeDeleteVehicle = "gosa_timeDeleteVehicle";
_battlefield_size = 250;

waitUntil {!isNil "gosa_param_init_done"};

if (missionNamespace getVariable "gosa_locationType" in [1,2]) then {
	waitUntil {!isNil "gosa_towns"};
	_towns = gosa_towns;
	//_towns_weighted = [];
	//for "_i" from 0 to (count _towns -1) do {};
}else{
	_towns = [];
};

waitUntil {!isNil "gosa_fnc_init"};

if (count _towns > 0) then {
	_location = _towns call BIS_fnc_selectRandom;
	_pos = getPos _location;
}else{
	_pos = [false] call gosa_fnc_getRandomWorldPos;
	_location = objNull;
};
_time_startup = time;
diag_log Format ["Log: [Mission capture] %1", [_location, count _towns, _pos, _time_startup]];


waitUntil {!isNil "AllGroupsWest"};
waitUntil {!isNil "AllGroupsEast"};
waitUntil {!isNil "AllGroupsGuer"};
waitUntil {!isNil "GroupsStarted"};
LocationAllGroupsWest =+ AllGroupsWest;
LocationAllGroupsEast =+ AllGroupsEast;
LocationAllGroupsGuer =+ AllGroupsGuer;
_grps_rarity = _location getVariable _var_grps_rarity;
if !(isNil "_grps_rarity") then {
	[LocationAllGroupsWest, _grps_rarity] call gosa_fnc_groupsRarity;
	[LocationAllGroupsEast, _grps_rarity] call gosa_fnc_groupsRarity;
	[LocationAllGroupsGuer, _grps_rarity] call gosa_fnc_groupsRarity;
};


// Если отряд далеко от новой локации дабавить его в очередь на удаление.
// Союзные отряды тоже лишние.
{
	_grp = _x;
	if ({_x call gosa_fnc_isPlayer} count units _grp <= 0) then {
		if (vehicle leader _grp distance _pos > ((_par_safeSpawnDistance select 1) max 2000) or
			side _grp in _sides_friendly) then
		{
			// Чтобы отряды ушли от точки можно их сделать патрулями.
			_grp setVariable [_var_patrol, true, true];
			// Мусоросборщик вычисляет дистанцию удаления из длины очереди.
			_n = 60*2 + random (60*5);
			{
				_x setVariable [_var_timeDeleteVehicle, _n];
				vehicle _x setVariable [_var_timeDeleteVehicle, _n];
			} forEach units _grp;
		};
	};
} forEach allGroups;


gosa_locationSize = _battlefield_size;
CivilianBasePos = _pos;
CivilianLocationStartTime = _time_startup;
CivilianLocation = _location;
publicVariable "gosa_locationSize";
publicVariable "CivilianBasePos";
publicVariable "CivilianLocation";
locationStarted = true;
// Headless Client ожидает переменную.
sleep 1;
publicVariable "locationStarted";

_arr = [_location, _pos, _battlefield_size, _time_startup];
diag_log Format ["Log: [Mission capture] %1", _arr];
_arr;
