/*
 * Вычисление параметров поиска безопасной позиции для возрождения ии.
 * TODO: _withinMap
 */

diag_log format ["Log: [fnc_SafePosParams_v2] %1", _this];

private["_types","_playerDist", "_searchDistMax", "_objDist", "_waterMode",
	"_maxGradient", "_shoreMode", "_defaultPos", "_blacklist","_distances",
	"_island_isolate",
	"_safePositionRadius","_preferRoads","_roadSize","_roles","_arr"];
_types = _this select 0;
_objDist = 2;
_waterMode = 0;
_maxGradient = -1;
_shoreMode = 0;
_defaultPos=[];
_island_isolate = true;

if (isNil {PosBlacklist}) then {
	_blacklist=[];
} else {
	_blacklist = PosBlacklist;
};

_distances = safeSpawnDistance;
_safePositionRadius =  (getNumber(configfile>> "cfgWorlds">> worldname >> "safePositionRadius"));
// if (_safePositionRadius < 4000) then {_safePositionRadius = 4000};

_playerDist = _distances select 0;
_searchDistMax = _playerDist*3;

if ([_types, ["LandVehicle"]] call gosa_fnc_CheckIsKindOfArray) then{
	_playerDist = _distances select 1;
	_searchDistMax = _playerDist*3;
	_waterMode = 0;
	/*
	if ("canfloat" in _types) then {
		_island_isolate = false;
	};
	*/
	_objDist = 15;
};

if ([_types, ["Air"]] call gosa_fnc_CheckIsKindOfArray) then{
	_playerDist = _distances select 2;
	_searchDistMax = _playerDist*2;
	_waterMode = -1;
	_objDist = -1;
	_blacklist=[];
	_island_isolate = false;
	if ([_types, ["Plane"]] call gosa_fnc_CheckIsKindOfArray) then{
		_maxGradient= (100 * (pi / 180));
	};
}else{
	// TODO: Переместить к глобальным параметрам.
	if(worldname in ["utes"])then {
		_playerDist = (_safePositionRadius / 5 min _playerDist);
		_searchDistMax = (_safePositionRadius min _playerDist*2);
	};
};

_preferRoads=false;
if ([_types, ["Car","Wheeled_APC","LandVehicle"]] call gosa_fnc_CheckIsKindOfArray) then{
	_preferRoads = true;
}else{
	// if(worldname in ["Chernarus", "Takistan"])then {
		ScopeName "_preferRoads";
		{
			if (getnumber (configfile >> "cfgvehicles" >>  _x >> "preferRoads") > 0) then {
				BreakTo "_preferRoads";
				_preferRoads = true;
			};
		} forEach _types;
	// };
};

if ([_types, ["Ship"]] call gosa_fnc_CheckIsKindOfArray) then{
	_playerDist = _distances select 3;
	_searchDistMax = _playerDist*2;
	_waterMode = 2;
	_objDist = 15;
	_blacklist=[];
	_island_isolate = false;
};

if ([_types, ["StaticWeapon"]] call gosa_fnc_CheckIsKindOfArray) then{
	_playerDist = _distances select 4;
	_searchDistMax = gosa_locationSize;
	_waterMode = 0;
	_objDist = 30;
	_preferRoads = false;
	_blacklist = [];
	_island_isolate = false;
};

_roles = _types call gosa_fnc_getGroupType;

if ("MenDiver" in _roles) then {
	_waterMode = 0;
	_blacklist = [];
	_island_isolate = false;
};

if ("Artillery" in _roles) then {
	_preferRoads = false;
	_arr = [_types] call gosa_fnc_returnVehicleRange;
	// Минимальный рекмендуемый радиус обстрела.
	_playerDist = _playerDist max (_arr select 2);
	// Максимальный рекмендуемый радиус обстрела.
	_searchDistMax = _arr select 3;
	_island_isolate = false;
};

_roadSize = ({_x isKindOf "LandVehicle"} count _types);

_arr = [_playerDist,_searchDistMax, _objDist, _waterMode, _maxGradient, _shoreMode, _blacklist, _defaultPos, [_preferRoads, _roadSize], _island_isolate];
diag_log format ["Log: [fnc_SafePosParams_v2] return %1", _arr];
_arr;
