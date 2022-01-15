#define __A2OA__

/*---------------------------------------------------------------------------
TODO: в этом файле ничего не понятно
---------------------------------------------------------------------------*/

//--- параметры
	diag_log format ["Log: [Init_Towns] locationTypes %1", missionNamespace getVariable "gosa_locationType"];


scopeName "a";
waitUntil {!isNil "bis_fnc_init"};
locationTypes=["CityCenter"];
// if(worldName == "Shapur_BAF")then{
	// locationTypes=["NameLocal","NameVillage","NameCity","NameCityCapital"];
// };
// private["_fnc_Locations_1"];
gosa_fnc_Locations_weights={
	// TODO: эта функция вероятно 99% работает не правильно, ее нужно проверить
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

	private["_sizeLocation","_NextLocations","_grps_rarity","_z"];
	_sizeLocation = + 500;
	if (missionNamespace getVariable "gosa_locationType" in [1,2]) then {
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

				/* если отряд далеко от новой локации дабавить его в очередь на удаление.
				союзные отряды тоже лишние.
				*/
				if ( leader _grp distance civilianBasePos > ((safeSpawnDistance select 1) max 2000) or
				 side _grp in gosa_friendlyside ) then {
					// чтобы отряды ушли от точки можно их сделать патрулями
					_grp setVariable ["patrol", true, true];
					// мусоросборщик вычисляет дистанцию удаления из длины очереди
					_z = 60*2 + random (60*5);
					{
						_x setVariable ["gosa_timeDeleteVehicle", _z];
						vehicle _x setVariable ["gosa_timeDeleteVehicle", _z];
					}forEach units _grp;
				};

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
	} else {
		//--- случайная позиция центра
		_sizeLocation = 250;
		CivilianLocationStartTime = time;
		CivilianLocation = objNull;

		private ["_x", "_y", "_z"];
		_z = 1000 min ((gosa_worldSize select 0)/4); // _z = отступ
			_x = gosa_worldSize select 0;
			_x = _x - (_z*2);
			_x = _z + random _x;
		_z = 1000 min ((gosa_worldSize select 1)/4);
			_y = gosa_worldSize select 1;
			_y = _y - (_z*2);
			_y = _z + random _y;
		CivilianBasePos = [_x, _y]; // TODO: нужно исключить позицию на воде

		publicVariable "CivilianBasePos";
		publicVariable "CivilianLocation";
	};

	// TODO: исправить Error Неопределенная переменная в выражении: civilianlocation

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
		if(toLower typeOf _x in ((MHQ_list select 0) + (MHQ_list select 1)) && alive _x)exitWith{
			civilianBasePos = getPos _x;
			breakTo "a";
		};
#ifdef __A2OA__
	} forEach vehicles + allMissionObjects "Warfare_HQ_base_unfolded";
#else
	} forEach vehicles;
#endif

	if (time > 5) then {
		diag_log format ["Log: [Init_Towns] %1 fnc_getRandomWorldPos", time];
		civilianBasePos = [false] call gosa_fnc_getRandomWorldPos;
		if (count civilianBasePos == 0) then {
			civilianBasePos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
			diag_log format ["Log: [Init_Towns] %1 civilianBasePos set worldName centerPosition", time];
		};
	};
};
sizeLocation = 250;

[] call locationNext;
locationStarted = true;
