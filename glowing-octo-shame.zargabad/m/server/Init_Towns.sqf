///--- бардак, комментировать нечего
waitUntil {!isNil "bis_fnc_init"};
locationTypes=["CityCenter"];
// if(worldName == "Shapur_BAF")then{
	// locationTypes=["NameLocal","NameVillage","NameCity","NameCityCapital"];
// };
// private["_fnc_Locations_1"];
m_fnc_Locations_weights={
	private["_weights","_timeMax"];
	_weights=[]; _timeMax=0;
	{
		private "_time";
		_time = _x getVariable "time";
		if (isNil "_time") then {
			_time = 0;
		};
		_timeMax = _timeMax max _time;
	}
	forEach _this;
	for "_i" from 0 to ((count _this) - 1) do {
		private ["_time","_rarity"];
		_time = _this select _i getVariable "time";
		if (isNil "_time") then {
			_time = 0;
		};
		if (_time != 0 && _timeMax != 0) then {
			_rarity = _timeMax / _time;
			_rarity = _rarity min 1;
		}else{
			_rarity = 1
		};
		_rarity = _rarity * (1-((_i+1)/(count _this)));
		_weights = _weights + [_rarity];
	};
	[_this,_weights];
};
// private["_locationNext"];
locationNext={
	CivilianLocation setVariable ["time",time];
	
	private["_sizeLocation"];
			_sizeLocation = 500;
	private["_NextLocations"];
		private["_NextLocation"];
	_NextLocations = (nearestLocations [civilianBasePos, locationTypes, 5000] - [CivilianLocation]);
	if(count _NextLocations >0 )then{
		_NextLocation = (_NextLocations call m_fnc_Locations_weights) call BIS_fnc_selectRandomWeighted;
		CivilianLocation = _NextLocation;
		civilianBasePos = getPos CivilianLocation;
		civilianBasePos resize 2;
		publicVariable "civilianBasePos";
		publicVariable "CivilianLocation";
		_sizeLocation = (((size CivilianLocation) select 0) max 250);
		{
			if !(isPlayer (leader _x)) then {
				// _x fire "SmokeShellMuzzle";
				_x setVariable ["time", time];
			};
		} forEach allUnits;
		{_x setDamage 0} forEach (nearestObjects [civilianBasePos, [], 1000]);
		// {_x setDamage 0} forEach (nearestObjects [getMarkerpos "", [], 1000]);
		// {_x setDamage 0} forEach (nearestObjects [getMarkerpos "", [], 1000]);
		// {_x setDamage 0} forEach (nearestObjects [getMarkerpos "", [], 1000]);
	// }else{
		// CivilianLocation = locationNull;
	};



	"MainTown" setMarkerPos civilianBasePos;
	"MainTown" setMarkerSize [_sizeLocation,_sizeLocation];
	sizeLocation=_sizeLocation;
	publicVariable "sizeLocation";
};

CreateMarker ["MainTown", getPos player];
"MainTown" setMarkerShape "ELLIPSE";
"MainTown" setMarkerColor "ColorBlack";

CivilianLocation = locationNull;
if(isMultiplayer)then{
	private["_locationNull"];
	_locationNull = true;
	while{_locationNull}do{
		{
			if(alive _x)then{civilianBasePos = position _x};
			_locationNull = false;
		}foreach playableunits
	};
}else{
	civilianBasePos = position player;
};

[] call locationNext;
locationStarted = true;
