#define __A2OA__
///--- бардак, комментировать нечего
waitUntil {!isNil "bis_fnc_init"};
locationTypes=["CityCenter"];
// if(worldName == "Shapur_BAF")then{
	// locationTypes=["NameLocal","NameVillage","NameCity","NameCityCapital"];
// };
// private["_fnc_Locations_1"];
gosa_fnc_Locations_weights={
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

waitUntil {!isNil "AllGroupsWest"};
waitUntil {!isNil "AllGroupsEast"};
waitUntil {!isNil "AllGroupsGuer"};
waitUntil {!isNil "GroupsStarted"};
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
		CivilianLocation = (_NextLocations call gosa_fnc_Locations_weights) call BIS_fnc_selectRandomWeighted;
		civilianBasePos = locationPosition CivilianLocation;
		civilianBasePos resize 2;
		publicVariable "civilianBasePos";
		publicVariable "CivilianLocation";
		_sizeLocation = (((size CivilianLocation) select 0) max 250);
		{
			private["_grp"];
			_grp = _x;
			if({_x call gosa_fnc_isPlayer} count units _grp == 0)then{
				{
					_x setVariable ["time", time];
					if!(side _x in gosa_friendlyside)then{
						_x allowFleeing 1;
					};
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

	private["_grps_rarity"];
	_grps_rarity = CivilianLocation getVariable "_grps_rarity";
		LocationAllGroupsWest =+ AllGroupsWest;
		LocationAllGroupsEast =+ AllGroupsEast;
		LocationAllGroupsGuer =+ AllGroupsGuer;
	if (!isNil {_grps_rarity}) then {
		[LocationAllGroupsWest, _grps_rarity] call gosa_fnc_groupsRarity;
		[LocationAllGroupsEast, _grps_rarity] call gosa_fnc_groupsRarity;
		[LocationAllGroupsGuer, _grps_rarity] call gosa_fnc_groupsRarity;
	};

	sizeLocation=_sizeLocation;
	publicVariable "sizeLocation";
};

waitUntil{!isNil{MHQ_list}};
while{isNil{civilianBasePos}}do{
	{
		if(toLower typeOf _x in ((MHQ_list select 0) + (MHQ_list select 1)) && alive _x)then{
			civilianBasePos = getPos _x;
		};
#ifdef __A2OA__
	} forEach vehicles + allMissionObjects "Warfare_HQ_base_unfolded";
#else
	} forEach vehicles;
#endif
};
sizeLocation = 250;

[] call locationNext;
locationStarted = true;
