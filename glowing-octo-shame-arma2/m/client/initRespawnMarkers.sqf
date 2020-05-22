private ["_side_str","_markerColor"];
switch (playerSide) do {
	case (resistance):
	{
		_side_str = "guerrila";
		_markerColor = "ColorGreen";
	};
	case (civilian):
	{
		_side_str = "civilian";
		_markerColor = "ColorYellow";
	};
	case (west):
	{
		_side_str = "west";
		_markerColor = "ColorBlue";
	};
	case (east):
	{
		_side_str = "east";
		_markerColor = "ColorRed";
	};
	default {
		_side_str = str playerSide;
		_markerColor = "Default";
	};
};

private ["_objects"];
_objects = [];
{
	_objects = _objects + allMissionObjects _x;
} forEach HQ;

private ["_respawnMarkers"];
_respawnMarkers = [];

// -- статичные точки возрождения
for "_i" from 0 to (count _objects - 1) do {
	private ["_obj","_marker","_pos"];
	_obj = _objects select _i;
	_pos = getPos _obj;

	// WarfareBDepot бункеры
	if(_obj isKindOf "WarfareBDepot")then{
		private ["_dir","_dist2"];
		_dir = getDir _obj;
		_dist2 = 3;
		_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir]; // в центре нет выхода
	};

	_marker = createMarkerLocal [format["respawn_%1_%2",_side_str,_i+1], _pos];
	_marker setMarkerTypeLocal "Depot";
	_marker setMarkerColorLocal _markerColor;
	_respawnMarkers set [count _respawnMarkers, _marker];
};

private ["_markerMHQ","_markerMHQtype"];
_markerMHQ = format["respawn_%1_MHQ",_side_str];
_markerMHQtype = "Headquarters";

waitUntil {!isNil {MHQ_list}};

private ["_dynamicMarkers"];
_dynamicMarkers = [];

draga_respawnMarkers = _respawnMarkers;

if(true)then{

	private ["_markers","_units"];
	_markers = [];
	_units = [];

	while {true} do {

		// -- мобильная база, один маркер
		{
			if(toLower typeOf _x in ((MHQ_list select 0) + (MHQ_list select 1)) && alive _x)then{
				private ["_pos"];
				_pos = getPos _x;
				if(_x isKindOf "Warfare_HQ_base_unfolded")then{
					private ["_dir","_dist2"];
					_dir = getDir _x - 90 - 20 + random 10;
					_dist2 = 3 + random 2;
					_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir]; // в центре нет выхода
				};
				if(getMarkerType _markerMHQ != _markerMHQtype)then{
					_markerMHQ = createMarkerLocal [_markerMHQ, _pos];
					_markerMHQ setMarkerTypeLocal _markerMHQtype;
					_markerMHQ setMarkerColorLocal _markerColor;
					draga_respawnMarkers = [_markerMHQ]+_respawnMarkers;
				}else{
					_markerMHQ setMarkerPos _pos;
				};
			};
		} forEach vehicles + allMissionObjects "Warfare_HQ_base_unfolded";

		// -- удаление лишних динамичных маркеров
		for "_i" from 0 to (count _dynamicMarkers - 1) do {
			if(!alive (_dynamicMarkers select _i select 1))then{
				deleteMarkerLocal (_dynamicMarkers select _i select 0);
				_dynamicMarkers set [_i, -1];
			};
		};
		_dynamicMarkers = _dynamicMarkers - [-1];

		// -- создать динамичные маркеры казарм
		{
			private ["_obj"];
			_obj = _x;
			if(true)then{ // нужно сделать проверку фракции
				private ["_pos"];
				_pos = getPos _obj;
				private ["_dir","_dist"];
				_dir = random 360;
				_dist = random 10;
				_pos = [(_pos select 0) + _dist*sin _dir, (_pos select 1) + _dist*cos _dir];
				if({_obj == (_x select 1)} count _dynamicMarkers == 0) then {
					_marker = createMarkerLocal ["respawn_"+_side_str+"_Barracks_"+str count _dynamicMarkers, _pos];
					_dynamicMarkers set [count _dynamicMarkers, [_marker, _obj]];
				}else{
					for "_i" from 0 to (count _dynamicMarkers - 1) do {
						if (_obj == (_dynamicMarkers select _i select 1)) then {
							(_dynamicMarkers select _i select 0) setMarkerPos _pos;
						};
					};
				};
			};
		} forEach allMissionObjects "Base_WarfareBBarracks" + allMissionObjects "BASE_WarfareBFieldhHospital";

		// -- игроки
		{
			if(!(_x in _units) && (side _x == playerSide))then{
				_units set [count _units, _x];
				_markers set [count _markers, createMarkerLocal [str _x,position _x]];
			};
		}forEach playableUnits;

		// -- объекты базы
		{
				_units set [count _units, _x];
				_markers set [count _markers, createMarkerLocal [str _x + "_veh",position _x]];
		}forEach (allMissionObjects "WarfareBBaseStructure")+(allMissionObjects "BASE_WarfareBFieldhHospital");


		// -- маркеры
		for "_i" from 0 to (count _units - 1) do {
			private ["_unit","_marker"];
			_unit = (_units select _i);
			_marker = (_markers select _i);
			if (!isNull _unit && alive _unit) then {
				if([[_unit],Warfare_HQ+(MHQ_list select 0)+["WarfareBBaseStructure","BASE_WarfareBFieldhHospital"]] call m_fnc_CheckIsKindOfArray && !(getNumber(configFile >> "CfgVehicles">> typeOf _unit >> "side") call m_fnc_getSide getFriend playerSide < 0.6))then{
					if ({isPlayer _x} count crew _unit == 0) then {
						_marker setMarkerPosLocal (position _unit);
						_marker setMarkerTypeLocal "vehicle";
						_marker setMarkerDirLocal getDir _unit;
						_marker setMarkerSizeLocal [3,3];
						_marker setMarkerColorLocal _markerColor;
					}else{
						_marker setMarkerPosLocal [35000,35000];
					};
				}else{
					private ["_veh"];
					_veh = vehicle _unit;
					if (((_veh == _unit) || (_unit == (effectiveCommander _veh))) && !(getNumber(configFile >> "CfgVehicles">> typeOf _unit >> "side") call m_fnc_getSide getFriend playerSide < 0.6)) then {
						_marker setMarkerPosLocal (position _veh);
						_marker setMarkerTypeLocal "vehicle";
						_marker setMarkerDirLocal getDir _veh;
						_marker setMarkerSizeLocal [3,3];
						_marker setMarkerColorLocal "ColorBlack";
						private ["_text"];
						_text = "";
						_text = (_text + " " + getText(configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'displayName'));
						_text = (_text + " " + name _unit);
						if (lifeState _unit == "UNCONSCIOUS") then {
							_text = _text + (" " + Localize "str_reply_injured");
						};
						_marker setMarkerTextLocal _text;
					}else{
						_marker setMarkerPosLocal [35000,35000];
					};
				};
			}else{
				deleteMarkerLocal _marker;
				_units set [_i,-1];
				_markers set [_i,-1];
			};
		};

		_units = (_units - [-1]);
		_markers = (_markers - [-1]);

		sleep 0.1
	};
};
