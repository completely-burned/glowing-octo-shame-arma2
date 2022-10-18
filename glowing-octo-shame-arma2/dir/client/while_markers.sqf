#define __A2OA__

/*---------------------------------------------------------------------------
Скрипт обновляет маркеры у игрока локально
Создает при старте статичные маркеры.
Обновляет динамичные маркеры
на открытой карте игрока.
TODO: сделть совместимость с pvp.
TODO: Устранить быдлокод.
TODO: Подсветка авиационного ангара в pvp.
---------------------------------------------------------------------------*/

private ["_side_str","_markerColor","_rBase","_objects","_respawnMarkers",
	"_fnc_MarkerInitUnit","_markerPosHiden","_tmp_arr","_tmp_str","_text",
	"_tmp_obj","_rMHQ","_tmp_num","_item","_startingClass","_airports",
	"_markerMHQ","_markerMHQtype","_dynamicMarkers","_hq","_pos","_marker"];

_fnc_MarkerInitUnit = {
	diag_log format ["Log: [while_markers] %1 Marker init %2", _this select 0, _this];
	createMarkerLocal [_this select 0, _this select 1];
	#ifdef __ARMA3__
		_this select 0 setMarkerTypeLocal "hd_dot";
	#else
		_this select 0 setMarkerTypeLocal "vehicle";
		_this select 0 setMarkerSizeLocal [3,3];
	#endif
	_this select 0 setMarkerColorLocal (_this select 2);
};

//-- MHQ
if (missionNamespace getVariable "gosa_MHQ" == 1) then {
	_rMHQ = true;
} else {
	_rMHQ = false;
};
// тип возрождения
if (missionNamespace getVariable "respawn" == 0 or _rMHQ) then {
	_rBase = true;
} else {
	_rBase = false;
};

if (isNil "gosa_playerStartingClass") then {
	_startingClass = 0;
}else{
	_startingClass = gosa_playerStartingClass;
};

// Имена маркеров, маркеры локальные и не должны конфликтовать в pvp.
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

// FIXME: Вылет с "OutOfMemory" может быть если объекты далеко.
_markerPosHiden = [-1600,0];


//-- Подготовка маркеров аэропорта.
_markers_airport = [];
_airports = [];
if (_startingClass == 1) then {
	_airports_tmp = [];

	//-- Поиск по всем объектам карты.
	/*
	// Не работает
	#ifdef __A2OA__
		_tmp_arr = allMissionObjects "";
		for "_i" from 0 to (count _tmp_arr -1) do {
			_tmp_obj = _tmp_arr select _i;
			if ([[_tmp_obj], gosa_typesOf_airports] call gosa_fnc_CheckIsKindOfArray) then {
				_airports_tmp set [count _airports_tmp, _tmp_obj];
			};
		};
		diag_log format ["Log: [while_markers] _airports_tmp %1", _airports_tmp];
	#endif
	*/

	//-- Заранее заданные объекты.
	for "_i" from 0 to 99 do {
		_tmp_str = format["gosa_airportHangar%1", _i];
		if !(isNil _tmp_str) then {
			_tmp_obj = call compile _tmp_str;
			// Нужно отсеить дубликаты.
			if !(_tmp_obj in _airports_tmp) then {
				_airports_tmp set [count _airports_tmp, _tmp_obj];
			};
		};
	};
	diag_log format ["Log: [while_markers] _airports_tmp %1", _airports_tmp];


	for "_i" from 0 to (count _airports_tmp - 1) do {
		_tmp_obj = _airports_tmp select _i;
		if (isNil "_tmp_obj") then {
			_tmp_obj = objNull;
		};
		if (_tmp_obj isKindOf "Logic") then {
			_tmp_obj = nearestBuilding position _tmp_obj;
		};
		_pos = getPos _tmp_obj;
		if (alive _tmp_obj) then {
			_marker = format["respawn_%1_%2",_side_str,_tmp_obj];
			createMarkerLocal [_marker, _pos];
			_marker setMarkerTypeLocal "Airport";
			_marker setMarkerColorLocal _markerColor;
			diag_log format ["Log: [while_markers] %1 airport created %2", _marker, _pos];
			// [[логика,объект, имя маркера, статус]]
			_airports set [_i,[objNull,_tmp_obj,_marker,1]];
			_markers_airport set [count _markers_airport, _marker];
		};
	};
	diag_log format ["Log: [while_markers] Airports %1", _airports];
};


_respawnMarkers = [];
_objects = [];
if (_startingClass != 1 or count _markers_airport == 0) then {
    //code
// Объекты используются для поиска статичных позиций возрождения.
#ifdef __A2OA__
{
	_objects = _objects + allMissionObjects _x;
} forEach HQ;
#endif
diag_log format ["Log: [while_markers] HQ's %1", _objects];

// -- статичные точки возрождения
for "_i" from 0 to (count _objects - 1) do {
	private ["_obj","_marker","_pos"];
	_obj = _objects select _i;
	_pos = [_obj, getPos _obj, getDir _obj] call gosa_fnc_getSafePosForObject;

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

//-- Инициализация маркера мобильной базы.
if (_rMHQ) then {
	// FIXME: waitUntil{_t < time} Некорректно работает при низком fps.
	_tmp_num = time+15;
	waitUntil {
		_hq = call gosa_fnc_getHQ select 0;
		if (isNil "_hq") then {_hq = objNull};
		_tmp_num < time or alive _hq;
	};
	if (alive _hq) then {
		_pos = getPos _hq;
		createMarkerLocal [_markerMHQ, _pos];
		diag_log format ["Log: [while_markers] %1 Marker init %2", _markerMHQ, _pos];
		_markerMHQ setMarkerTypeLocal _markerMHQtype;
		_markerMHQ setMarkerColorLocal _markerColor;
		_respawnMarkers set [count _respawnMarkers, _markerMHQ];
	};
	diag_log format ["Log: [while_markers] %1 Init %2", _markerMHQ, _hq];
};
};


//-- Отказоустойчивый маркер возрождения если нет базы.
// TODO: Сделать должным образом, для совместимости с pvp.
if (count (_respawnMarkers+_markers_airport) < 1) then {
	diag_log format ["Log: [while_markers] no base", nil];
	_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor");
	_marker = createMarkerLocal [format["respawn_%1",_side_str], _pos];
	_respawnMarkers = [_marker];
};
diag_log format ["Log: [while_markers] Markers static %1", _respawnMarkers];

waitUntil {!isNil {MHQ_list}};

// FIXME: Имя переменной сбивает с толку.
_dynamicMarkers = [];

if (_startingClass == 1 && count _markers_airport > 0) then {
	gosa_respawnMarkers = _markers_airport;
}else{
	gosa_respawnMarkers = _respawnMarkers;
};
diag_log format ["Log: [while_markers] respawnMarkers %1", gosa_respawnMarkers];

//-- Маркер основной локации.
// TODO: Совместимость с несколькими локациями.
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

		if (_rMHQ) then {
			// -- мобильная база (мобилизованная), один маркер
			_hq = call gosa_fnc_getHQ select 0;
			if !(isNull _hq) then {
				_pos = [_hq, getPos _hq, getDir _hq] call gosa_fnc_getSafePosForObject;
				_pos resize 2;
				_tmp_arr = getMarkerPos _markerMHQ;
				if (_tmp_arr distance _pos > 1) then {
					diag_log format ["Log: [while_markers] %1 Новая позиция %2, %3", _markerMHQ, _pos, _hq];
					_markerMHQ setMarkerPosLocal _pos;
				};
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
							_pos = [_x, getPos _x, getDir _x] call gosa_fnc_getSafePosForObject;
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
							_pos = [_obj, getPos _obj, getDir _obj] call gosa_fnc_getSafePosForObject;
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
							_tmp_str = str _x + "_veh";
							[_tmp_str, position _x, _markerColor] call _fnc_MarkerInitUnit;
							_markers set [count _markers, _tmp_str];

						};
					}forEach (allMissionObjects "WarfareBBaseStructure")+(allMissionObjects "BASE_WarfareBFieldhHospital");
				};
			#endif

			// -- Обновление маркеров аэропорта.
			for "_i" from 0 to (count _airports - 1) do {
				_item = _airports select _i;
					_tmp_obj = _item select 1;
					_marker = _item select 2;
					_tmp_num = _item select 3;
				if (_tmp_num < 1) then {
					_pos = getPos _tmp_obj;
					if (alive _tmp_obj) then {
						createMarkerLocal [_marker, _pos];
						_marker setMarkerTypeLocal "Airport";
						_marker setMarkerColorLocal _markerColor;
						gosa_respawnMarkers = gosa_respawnMarkers+[_marker];
						diag_log format ["Log: [while_markers] %1 airport created %2", _marker, _pos];
					};
				};
				// Один маркер всегда присутствует для устойчивости.
				if (!alive _tmp_obj && _tmp_num > 0 && count gosa_respawnMarkers > 1) then {
					diag_log format ["Log: [while_markers] %1 airport delete", _marker];
					gosa_respawnMarkers = gosa_respawnMarkers-[_marker];
					deleteMarkerLocal _marker;
				};
			};

			// -- удаление лишних динамичных маркеров
			for "_i" from 0 to (count _dynamicMarkers - 1) do {
				if( !alive (_dynamicMarkers select _i select 1) )then
				{
					deleteMarkerLocal (_dynamicMarkers select _i select 0);
					_dynamicMarkers set [_i, -1];
				};
			};
			_dynamicMarkers = _dynamicMarkers - [-1];


			// -- игроки
			if (isMultiplayer) then {
				_tmp_arr = allUnits;
				for "_i" from 0 to (count _tmp_arr - 1) do {
					_item = _tmp_arr select _i;

					if( !(_item in _units) &&
						(side _item == playerSide) &&
						#ifdef __A2OA__
							{alive _item} && {_item call gosa_fnc_isPlayer} )then
						#else
							alive _item && (_item call gosa_fnc_isPlayer) )then
						#endif
					{
						_units set [count _units, _item];
						_tmp_str = str _item;
						[_tmp_str, position _item, "ColorBlack"] call _fnc_MarkerInitUnit;
						_markers set [count _markers, _tmp_str];
					};
				};
			};

			// -- маркеры
			for "_i" from 0 to (count _units - 1) do {
				private ["_unit","_marker"];
				_unit = (_units select _i);
				_marker = (_markers select _i);
				// TODO: нужна проверка на отключеных игроков
				if (alive _unit) then {
					// FIXME: Может разделить на два массива, юниты и объекты, вместо проверок.
					if([[_unit],Warfare_HQ+(MHQ_list select 0)+["WarfareBBaseStructure","BASE_WarfareBFieldhHospital"]
						]call gosa_fnc_CheckIsKindOfArray &&
						(playerSide getFriend (typeOf _unit call gosa_fnc_getTypeOfSide) >= 0.6))then
					{
						if ({_x call gosa_fnc_isPlayer} count crew _unit == 0) then {
							_pos = position _unit;
						}else{
							_pos = _markerPosHiden;
						};
						// Проверка дистанции теоритически меньше нагружает цп.
						_tmp_arr = getMarkerPos _marker;
						if (_tmp_arr distance _pos > 10) then {
							diag_log format ["Log: [while_markers] %1 Новая позиция %2", _marker, _pos];
							_marker setMarkerPosLocal _pos;
						};
					}else{
						_tmp_obj = vehicle _unit;
						// TODO: Если эф.командир ии, то отобразить первого игрока из экипажа.
						if (((_tmp_obj == _unit) || (_unit == effectiveCommander _tmp_obj)) &&
							(playerSide getFriend side _unit >= 0.6)) then
						{
							_pos = position _tmp_obj;

							_text = "";
							// _text = (_text + " " + getText(configFile >> 'CfgVehicles' >> (typeOf _tmp_obj) >> 'displayName'));
							_text = (_text + " " + name _unit);
							if (lifeState _unit == "UNCONSCIOUS") then {
								_text = _text + (" " + Localize "str_reply_injured");
							};
						}else{
							_pos = _markerPosHiden;
						};
						_tmp_arr = getMarkerPos _marker;
						if (_tmp_arr distance _pos > 10) then {
							diag_log format ["Log: [while_markers] %1 Новая позиция %2", _marker, _pos];
							_marker setMarkerPosLocal _pos;
						};
						if (markerText _marker != _text) then {
							_marker setMarkerTextLocal _text;
						};
					};
				}else{
					diag_log format ["Log: [while_markers] deleteMarker %1", _marker];
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
