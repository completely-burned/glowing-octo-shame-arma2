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
	if(count _weights == 1)then{
		_weights = [1];
	};
	[_this,_weights];
};

waitUntil {!isNil "AllGroupsWestOld"};
waitUntil {!isNil "AllGroupsEastOld"};
waitUntil {!isNil "AllGroupsGuerrilaOld"};
// private["_locationNext"];
locationNext={
	if(!isNil {CivilianLocation})then{
		CivilianLocation setVariable ["time",time];
	};
	
	private["_sizeLocation"];
	_sizeLocation = + 500;
	private["_NextLocations"];
	_NextLocations = (nearestLocations [civilianBasePos, locationTypes, 5000]);
	if(!isNil {CivilianLocation})then{
		_NextLocations = (_NextLocations - [CivilianLocation]);
	};
	if(count _NextLocations >0 )then{
		CivilianLocationStartTime = time;
		CivilianLocation = (_NextLocations call m_fnc_Locations_weights) call BIS_fnc_selectRandomWeighted;
		civilianBasePos = locationPosition CivilianLocation;
		civilianBasePos resize 2;
		publicVariable "civilianBasePos";
		publicVariable "CivilianLocation";
		_sizeLocation = (((size CivilianLocation) select 0) max 250);
		{
			private["_grp"];
			_grp = _x;
			if({isPlayer _x} count units _grp == 0)then{
				[_grp] spawn m_fnc_waypoints;
				{
					_x setVariable ["time", time];
				}forEach units _grp;
			};
		}forEach allGroups;
		{
			// _x fire "SmokeShellMuzzle";
		}forEach allUnits;
		{_x setDamage 0} forEach (nearestObjects [civilianBasePos, [], 1000]);
		// {_x setDamage 0} forEach (nearestObjects [getMarkerpos "", [], 1000]);
		// {_x setDamage 0} forEach (nearestObjects [getMarkerpos "", [], 1000]);
		// {_x setDamage 0} forEach (nearestObjects [getMarkerpos "", [], 1000]);
	// }else{
		// CivilianLocation = locationNull;
	};

	if (isNil {CivilianLocation getVariable "infantry"}) then {
		AllGroupsWest 		= AllGroupsWestOld;
		AllGroupsEast 		= AllGroupsEastOld;
		AllGroupsGuerrila 	= AllGroupsGuerrilaOld;
	}else{
		private["_fnc4"];
		_fnc4={
			private["_grp","_types"];
			_grp = +(_this select 0);
			for "_i" from 0 to ((count (_grp select 0)) - 1) do {
				_types = [_grp, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement;
				{
					if ([_types, _x select 0] call m_fnc_CheckIsKindOfArray) then {
						private["_rarity"];
						_rarity = ([_grp, [1, _i]] call BIS_fnc_returnNestedElement);
						_rarity = (_rarity * (_x select 1));
						[_grp, [1, _i],  _rarity] call BIS_fnc_setNestedElement;
					};
				
				}forEach (_this select 1);
			};
			_grp
		};

		private["_infantry"];
		_infantry=[
			[["Air"], 				0],
			[["Tank"], 				0],
			[["Car","Motorcycle"], 0]
		];

		AllGroupsWest 		= ([AllGroupsWestOld, _infantry] call _fnc4);
		AllGroupsEast 		= ([AllGroupsEastOld, _infantry] call _fnc4);
		AllGroupsGuerrila 	= ([AllGroupsGuerrilaOld, _infantry] call _fnc4);
	};

	"MainTown" setMarkerPos civilianBasePos;
	"MainTown" setMarkerSize [_sizeLocation,_sizeLocation];
	sizeLocation=_sizeLocation;
	publicVariable "sizeLocation";
};

CreateMarker ["MainTown", getPos player];
"MainTown" setMarkerShape "ELLIPSE";
"MainTown" setMarkerColor "ColorBlack";

// CivilianLocation = locationNull;
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
