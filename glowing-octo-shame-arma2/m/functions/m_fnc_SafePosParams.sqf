private["_types"];
_types = _this select 0;
private ["_playerDist", "_maxDist", "_objDist", "_waterMode", "_maxGradient", "_shoreMode", "_defaultPos", "_blacklist","_safePositionRadius","_preferRoads","_roadSize"];
_playerDist = safeSpawnDistance select 0;
_objDist = 2;
_waterMode = 0;
_maxGradient = -1;
_shoreMode = 0;
_defaultPos=[];

if (isNil {PosBlacklist}) then {
	_blacklist=[];
} else {
	_blacklist = PosBlacklist;
};

_maxDist = 2000;
_safePositionRadius =  (getNumber(configfile>> "cfgWorlds">> worldname >> "safePositionRadius"));
// if (_safePositionRadius < 4000) then {_safePositionRadius = 4000};

if ([_types, ["LandVehicle"]] call m_fnc_CheckIsKindOfArray) then{
	_playerDist = safeSpawnDistance select 1;
	_maxDist = 3000;
	_waterMode = 0;
	// if("canfloat" in _types)then{_waterMode = 1};
	_objDist = 15;
};

if ([_types, ["Air"]] call m_fnc_CheckIsKindOfArray) then{
	_playerDist = safeSpawnDistance select 2;
	_maxDist = 7000;
	_waterMode = -1;
	_objDist = -1;
	_blacklist=[];
	if ([_types, ["Plane"]] call m_fnc_CheckIsKindOfArray) then{
		_maxGradient= (100 * (pi / 180));
	};
}else{
	if(worldname in ["utes"])then {
		_playerDist = (_safePositionRadius / 5 min _playerDist);
		_maxDist = (_safePositionRadius min _playerDist*2);
	}else{
	};
};

_preferRoads=false;
if ([_types, ["Car","Wheeled_APC","LandVehicle"]] call m_fnc_CheckIsKindOfArray) then{
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

if ([_types, ["Ship"]] call m_fnc_CheckIsKindOfArray) then{
	_playerDist = safeSpawnDistance select 3;
	_maxDist = 3000;
	_waterMode = 2;
	_objDist = 15;
	_blacklist=[];
};

if ([_types, ["StaticWeapon"]] call m_fnc_CheckIsKindOfArray) then{
	_playerDist = safeSpawnDistance select 4;
	_maxDist = sizeLocation;
	_waterMode = 0;
	_objDist = 30;
};

_roadSize = ({_x isKindOf "LandVehicle"} count _types);

[_playerDist,_maxDist, _objDist, _waterMode, _maxGradient, _shoreMode, _blacklist, _defaultPos, [_preferRoads, _roadSize]];
