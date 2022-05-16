#define __A2OA__

/*---------------------------------------------------------------------------
Скрипт обновляет маркеры у игрока локально
Создает при старте статичные маркеры.
Обновляет динамичные маркеры
на открытой карте игрока.
TODO: сделть совместимость с pvp.
---------------------------------------------------------------------------*/

private ["_side_str","_markerColor","_rBase","_objects","_respawnMarkers",
	"_markerMHQ","_markerMHQtype","_dynamicMarkers","_hq"];

// тип возрождения
if (missionNamespace getVariable "respawn" == 0 or missionNamespace getVariable "gosa_MHQ" == 1) then {
	_rBase = true;
} else {
	_rBase = false;
};

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

if (_rBase) then {
	_markerMHQ = format["respawn_%1_MHQ",_side_str];
	_markerMHQtype = "Headquarters";
};

_objects = [];
#ifdef __A2OA__
{
	_objects = _objects + allMissionObjects _x;
} forEach HQ;
#endif

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
		// в центре нет выхода
		_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
	};

	if(_i == 0)then{
		_marker = createMarkerLocal [format["respawn_%1",_side_str], _pos];
	}else{
		_marker = createMarkerLocal [format["respawn_%1_%2",_side_str,_i], _pos];
	};
	diag_log format ["Log: [while_markers] marker %1 created %2", _marker, _pos];
	// FOB, без базы, подсвеченный, и не игровой, сбивает игроков с толку.
	if(missionNamespace getVariable "respawn" == 0)then{
		#ifdef __ARMA3__
			_marker setMarkerTypeLocal "respawn_inf";
		#else
			_marker setMarkerTypeLocal "Depot";
		#endif
		_marker setMarkerColorLocal _markerColor;
	};
	_respawnMarkers set [count _respawnMarkers, _marker];
};

waitUntil {!isNil {MHQ_list}};

_dynamicMarkers = [];

gosa_respawnMarkers = _respawnMarkers;

waitUntil {!isNil {civilianBasePos}};
createMarkerLocal ["MainMarker", civilianBasePos];
"MainMarker" setMarkerShapeLocal "ELLIPSE";
"MainMarker" setMarkerColorLocal "ColorBlack";
waitUntil {!isNil {gosa_locationSize}};

if(true)then{

	private ["_markers","_units"];
	_markers = [];
	_units = [];

	while {true} do {

		if (_rBase) then {
			// -- мобильная база (мобилизованная), один маркер
			_hq = call gosa_fnc_getHQ select 0;
					private ["_pos"];
		      _pos = getPos _hq;
					if(getMarkerType _markerMHQ != _markerMHQtype)then{
						_markerMHQ = createMarkerLocal [_markerMHQ, _pos];
						_markerMHQ setMarkerTypeLocal _markerMHQtype;
						_markerMHQ setMarkerColorLocal _markerColor;
						gosa_respawnMarkers = [_markerMHQ]+_respawnMarkers;
					}else{
						_markerMHQ setMarkerPos _pos;
					};
		};

		if (visibleMap) then {


			//--- главный маркер поля боя
				if(markerSize "MainMarker" select 0 != gosa_locationSize)then{
					"MainMarker" setMarkerSizeLocal [gosa_locationSize, gosa_locationSize];
				};
				if(civilianBasePos distance getMarkerPos "MainMarker" > 1)then{
					"MainMarker" setMarkerPosLocal civilianBasePos;
				};

			// -- мобильная база (развернутая), один маркер
			// TODO: если игрок не открывал карту маркер находиться на последней позиции мобильная база (мобилизованная)
			#ifdef __A2OA__
				if (_rBase) then {
					{
						// TODO: устранить конфликт множества штабов
						if(toLower typeOf _x in ((MHQ_list select 0) + (MHQ_list select 1)) && alive _x)then{
							private ["_pos"];
							_pos = getPos _x;
							if(_x isKindOf "Warfare_HQ_base_unfolded")then{
								private ["_dir","_dist2"];
								_dir = getDir _x - 90 - 10 + random 20;
								_dist2 = 3 + random 2;
								// в центре нет выхода
								_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
							};
							if(getMarkerType _markerMHQ != _markerMHQtype)then{
								_markerMHQ = createMarkerLocal [_markerMHQ, _pos];
								_markerMHQ setMarkerTypeLocal _markerMHQtype;
								_markerMHQ setMarkerColorLocal _markerColor;
								gosa_respawnMarkers = [_markerMHQ]+_respawnMarkers;
							}else{
								// TODO: нужна проверка дистанции перед сменой позиции.
								_markerMHQ setMarkerPos _pos;
							};
						};
					} forEach allMissionObjects "Warfare_HQ_base_unfolded";
					// -- создать динамичные маркеры казарм
					{
						private ["_obj"];
						_obj = _x;
						// TODO: нужно сделать проверку фракции. FIXME: приоритет фракции?
						if(true)then{
							private ["_pos"];
							_pos = getPos _obj;
							private ["_dir","_dist"];
							_dir = random 360;
							_dist = random 10;
							// позиция не должна быть всегда в центре
							// TODO: не нужно менять позицию каждый раз
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
					// FIXME: может можно объединить все нужные типы в один зпрос allMissionObjects, нагрузка на цп
					} forEach allMissionObjects "Base_WarfareBBarracks" + allMissionObjects "BASE_WarfareBFieldhHospital";
					// -- объекты базы
					{
						if(!(_x in _units) && alive _x)then{
							_units set [count _units, _x];
							_markers set [count _markers, createMarkerLocal [str _x + "_veh",position _x]];
						};
					}forEach (allMissionObjects "WarfareBBaseStructure")+(allMissionObjects "BASE_WarfareBFieldhHospital");
				};
			#endif

			// -- удаление лишних динамичных маркеров
			for "_i" from 0 to (count _dynamicMarkers - 1) do {
				if(!alive (_dynamicMarkers select _i select 1) or ((_dynamicMarkers select _i select 1) isKindOf "Man" && !((_dynamicMarkers select _i select 1) call gosa_fnc_isPlayer)))then{
					deleteMarkerLocal (_dynamicMarkers select _i select 0);
					_dynamicMarkers set [_i, -1];
				};
			};
			_dynamicMarkers = _dynamicMarkers - [-1];


			// -- игроки
			{
				if(!(_x in _units) && (side _x == playerSide) && alive _x && (_x call gosa_fnc_isPlayer))then{
					_units set [count _units, _x];
					_markers set [count _markers, createMarkerLocal [str _x,position _x]];
				};
			}forEach allUnits;


			// -- маркеры
			for "_i" from 0 to (count _units - 1) do {
				private ["_unit","_marker"];
				_unit = (_units select _i);
				_marker = (_markers select _i);
				// TODO: нужна проверка на отключеных игроков
				if (!isNull _unit && alive _unit) then {
					if([[_unit],Warfare_HQ+(MHQ_list select 0)+["WarfareBBaseStructure","BASE_WarfareBFieldhHospital"]] call gosa_fnc_CheckIsKindOfArray && !(getNumber(configFile >> "CfgVehicles">> typeOf _unit >> "side") call gosa_fnc_getSide getFriend playerSide < 0.6))then{
						if ({_x call gosa_fnc_isPlayer} count crew _unit == 0) then {
							// TODO: setMarker* код оптимизировать
							_marker setMarkerPosLocal (position _unit);
							#ifdef __ARMA3__
								_marker setMarkerTypeLocal "hd_dot";
							#else
								_marker setMarkerTypeLocal "vehicle";
							#endif
							_marker setMarkerDirLocal getDir _unit;
							_marker setMarkerSizeLocal [3,3];
							_marker setMarkerColorLocal _markerColor;
						}else{
							_marker setMarkerPosLocal [35000,35000];
						};
					}else{
						private ["_veh"];
						_veh = vehicle _unit;
						if (((_veh == _unit) || (_unit == (effectiveCommander _veh))) && !(getNumber(configFile >> "CfgVehicles">> typeOf _unit >> "side") call gosa_fnc_getSide getFriend playerSide < 0.6)) then {
							_marker setMarkerPosLocal (position _veh);
							#ifdef __ARMA3__
								_marker setMarkerTypeLocal "hd_dot";
							#else
								_marker setMarkerTypeLocal "vehicle";
							#endif
							_marker setMarkerDirLocal getDir _veh;
							_marker setMarkerSizeLocal [3,3];
							_marker setMarkerColorLocal "ColorBlack";
							private ["_text"];
							_text = "";
							// _text = (_text + " " + getText(configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'displayName'));
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

			sleep 0.1;
		}else{
			sleep 2;
		};
	};
};
