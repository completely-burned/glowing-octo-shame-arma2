private["_types"];
_types = _this select 0;	
private ["_minDist", "_maxDist", "_objDist", "_waterMode", "_maxGradient", "_shoreMode", "_defaultPos", "_blacklist","_safePositionRadius","_preferRoads"];
_minDist = 1000;
_objDist = 2;
_waterMode = 0;
_maxGradient = -1;
_shoreMode = 0;
_defaultPos=[];
_blacklist=PosBlacklist;
_maxDist = _minDist*2;
_safePositionRadius =  (getNumber(configfile>> "cfgWorlds">> worldname >> "safePositionRadius"));
// if (_safePositionRadius < 4000) then {_safePositionRadius = 4000};

if ([_types, ["LandVehicle"]] call m_fnc_CheckIsKindOfArray) then{
	_minDist = 1500;
	_maxDist = _minDist*2;
	_waterMode = 0;
	// if("canfloat" in _types)then{_waterMode = 1};
	_objDist = 15;
};

if ([_types, ["Air"]] call m_fnc_CheckIsKindOfArray) then{
	_minDist = 3500;
	_maxDist = _minDist*2;
	_waterMode = -1;
	_objDist = -1;
	_blacklist=[];
	if ([_types, ["Plane"]] call m_fnc_CheckIsKindOfArray) then{
		_maxGradient= (100 * (pi / 180));
	};
}else{
	if(worldname in ["utes"])then {
		_minDist = (_safePositionRadius / 5 min _minDist);
		_maxDist = (_safePositionRadius min _minDist*2);
	}else{
	};
};

_preferRoads=false;
// if(worldname in ["Chernarus", "Takistan"])then {
	// ScopeName "_preferRoads";
	// {
		// _preferRoads = getnumber (configfile >> "cfgvehicles" >>  _x >> "preferRoads") > 0;
		// if (_preferRoads) then {
			// BreakTo "_preferRoads";
		// };
	// } forEach _types;
// };

if ([_types, ["Ship"]] call m_fnc_CheckIsKindOfArray) then{
	_minDist = 1500;
	_maxDist = _minDist*2;
	_waterMode = 2;
	_objDist = 15;
	_blacklist=[];
};

[_minDist,_maxDist, _objDist, _waterMode, _maxGradient, _shoreMode, _blacklist, _defaultPos, _preferRoads];
