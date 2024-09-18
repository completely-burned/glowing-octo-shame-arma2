#define __A2OA__

/*---------------------------------------------------------------------------
Скрипт обновляет маркеры у игрока локально
Создает при старте статичные маркеры.
Обновляет динамичные маркеры
на открытой карте игрока.
TODO: сделть совместимость с pvp.
TODO: Рефакторинг.
TODO: Подсветка авиационного ангара в pvp.
---------------------------------------------------------------------------*/

private ["_side_str","_markerColor","_rBase","_objects","_respawnMarkers",
	"_fnc_MarkerInitUnit","_markerPosHiden","_tmp_arr","_tmp_str","_text",
	"_tmp_obj","_rMHQ","_tmp_num","_item","_startingClass","_airports",
	"_logic","_obj","_num","_fnc_update_HQ","_markersHQ","_listHQ_str",
	"_markers_airport","_respawn_type_Pilot","_respawn_type_All","_markers_alive",
	"_list","_arr","_b","_marker_type","_marker_type_respawn_unknown",
	"_marker_type_respawn_plane","_fnc_update_LocationAirport",
	"_markers_LocationBase","_fnc_update_LocationBase","_types_respawn_blacklist",
	"_markerMHQ","_markerMHQtype","_dynamicMarkers","_hq","_pos","_marker"];
diag_log format ["Log: [while_markers] %1 start", time];

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

_types_respawn_blacklist = gosa_types_location;

waitUntil{!isNil "bis_fnc_init"};
waitUntil{!isNil "gosa_fnc_init"};

// Имена маркеров, маркеры локальные и не должны конфликтовать в pvp.
_tmp_arr = [] call gosa_fnc_getPlayerParam;
_side_str = _tmp_arr select 0;
_markerColor = _tmp_arr select 1;


if (_rBase) then {
	_markerMHQ = format["respawn_%1_MHQ",_side_str];
	#ifdef __ARMA3__
		switch (playerSide) do {
			case EAST: 		{_markerMHQtype = "o_hq"};
			case WEST:		{_markerMHQtype = "b_hq"};
			default {_markerMHQtype = "n_hq"};
		};
	#else
	_markerMHQtype = "Headquarters";
	#endif
};

// FIXME: Вылет с "OutOfMemory" может быть если объекты далеко.
_markerPosHiden = [-1600,0];

_marker_type_respawn_unknown = "Start";
_marker_type_respawn_plane = "Airport";
#ifdef __ARMA3__
	_marker_type_respawn_unknown = "respawn_unknown";
	_marker_type_respawn_plane = "respawn_plane";
#endif

_respawn_type_Pilot = 1;
_respawn_type_All = 0;

_markers_airport = [];
_startingClass = _respawn_type_All;

//-- Подготовка маркеров аэропорта.
if (true) then {

	_fnc_update_LocationAirport = {
		if !(isNil "gosa_list_LocationAirport") then {

		_markers_alive = [];
		_list = gosa_list_LocationAirport;
		for "_i" from 0 to (count _list -1) do {
			scopeName "for_b";
			_logic = _list select _i;
			// TODO: Side.

			// объекты аэропорта.
			_arr = synchronizedObjects _logic;

			// Для совместимости.
			// Дедупликация.
			_b = true;
			for "_iS" from 0 to (count _arr -1) do {
				_obj = _arr select _iS;
				_num = _obj getVariable "gosa_Location_type";
				if !(isNil "_num") then {
					if (_num in [_respawn_type_Pilot, _respawn_type_All]) then {
						_b = false;
						breakTo "for_b";
					};
				};
			};
			if (_b) then {
			if (count _arr < 1) then {
				_arr = [_logic];
			};

			for "_i0" from 0 to (count _arr -1) do {
				_logic = _arr select _i0;

				if !(typeOf _logic in _types_respawn_blacklist) then {
					// тип возрождения.
					_num = _logic getVariable "gosa_respawn_type";
					if (isNil "_num") then {_num = _respawn_type_All};
					switch (_num) do {
						case _respawn_type_Pilot: {
							if (_startingClass == 1) then {
								_b = true;
								_marker_type = _marker_type_respawn_plane;
							}else{
								_b = false;
							};
						};
						case _respawn_type_All: {
							_b = true;
							_marker_type = _marker_type_respawn_unknown;
						};
						default {
							_b = false;
						};
					};

					if (_b) then {
						_marker = format["respawn_%1_%2", _side_str, _logic];
						_markers_alive set [count _markers_alive, _marker];
						if !(_marker in _markers_airport) then {
							_obj = _logic getVariable "gosa_building";
							if (isNil "_obj") then {_obj = _logic};
							_pos = getPos _obj;
							_num = getDir _obj;

							if !(isNull _obj) then {
								_pos = [_obj, _pos, _num] call gosa_fnc_getSafePosForObject;
							};

							createMarkerLocal [_marker, _pos];
							diag_log format ["Log: [while_markers] %1 createMarker %2, %3", _marker, _pos, _obj];

							_marker setMarkerTypeLocal _marker_type;

							// A3 устанавливает цвет самостоятельно.
							#ifdef __ARMA3__
							if !(playerSide in [east,west,resistance]) then {
							#endif
								_marker setMarkerColorLocal _markerColor;
							#ifdef __ARMA3__
							};
							#endif
							_markers_airport set [count _markers_airport, _marker];
						};
					};
				};
			};
			};
		};

		for "_i" from 0 to (count _markers_airport -1) do {
			_marker = _markers_airport select _i;
			// Airport: Удаление маркеров.
			if !(_marker in _markers_alive) then {
				diag_log format ["Log: [while_markers] %1 deleteMarker", _marker];
				deleteMarkerLocal _marker;
				_markers_airport set [_i, -1];
			};
		};
		_markers_airport = _markers_airport -[-1];

		};
	};


	_num = time+300;
	waitUntil {
		_num < time
		or !isNil "gosa_list_LocationAirport";
	};
	[] call _fnc_update_LocationAirport;
};
diag_log format ["Log: [while_markers] _markers_airport %1", _markers_airport];

// TODO: Объединить с _fnc_update_LocationAirport.
_markers_LocationBase = [];
if (true) then {

	_fnc_update_LocationBase = {
		if !(isNil "gosa_list_LocationBase") then {

		_markers_alive = [];
		_list = gosa_list_LocationBase;
		for "_i" from 0 to (count _list -1) do {
			scopeName "for_b";
			_logic = _list select _i;
			// TODO: Side.

			// объекты аэропорта.
			_arr = synchronizedObjects _logic;

			// Для совместимости.
			// Дедупликация.
			_b = true;
			for "_iS" from 0 to (count _arr -1) do {
				_obj = _arr select _iS;
				_num = _obj getVariable "gosa_Location_type";
				if !(isNil "_num") then {
					if (_num in [_respawn_type_Pilot, _respawn_type_All]) then {
						_b = false;
						breakTo "for_b";
					};
				};
			};
			if (_b) then {
			if (count _arr < 1) then {
				_arr = [_logic];
			};

			for "_i0" from 0 to (count _arr -1) do {
				_logic = _arr select _i0;
					if !(toLower typeOf _logic in _types_respawn_blacklist) then {

					// тип возрождения.
					_num = _logic getVariable "gosa_respawn_type";
					if (isNil "_num") then {_num = _respawn_type_All};
					switch (_num) do {
						case _respawn_type_Pilot: {
							if (_startingClass == 1) then {
								_b = true;
								_marker_type = _marker_type_respawn_plane;
							}else{
								_b = false;
							};
						};
						case _respawn_type_All: {
							_b = true;
							_marker_type = _marker_type_respawn_unknown;
						};
						default {
							_b = false;
						};
					};

					if (_b) then {
						_marker = format["respawn_%1_%2", _side_str, _logic];
						_markers_alive set [count _markers_alive, _marker];
						if !(_marker in _markers_LocationBase) then {
							_obj = _logic getVariable "gosa_building";
							if (isNil "_obj") then {_obj = _logic};
							_pos = getPos _obj;
							_num = getDir _obj;

							if !(isNull _obj) then {
								_pos = [_obj, _pos, _num] call gosa_fnc_getSafePosForObject;
							};

							createMarkerLocal [_marker, _pos];
							diag_log format ["Log: [while_markers] %1 createMarker %2, %3", _marker, _pos, _obj];

							_marker setMarkerTypeLocal _marker_type;

							// A3 устанавливает цвет самостоятельно.
							#ifdef __ARMA3__
							if !(playerSide in [east,west,resistance]) then {
							#endif
								_marker setMarkerColorLocal _markerColor;
							#ifdef __ARMA3__
							};
							#endif
							_markers_LocationBase set [count _markers_LocationBase, _marker];
						};
					};
				};
			};
			};
		};

		for "_i" from 0 to (count _markers_LocationBase -1) do {
			_marker = _markers_LocationBase select _i;
			// Airport: Удаление маркеров.
			if !(_marker in _markers_alive) then {
				diag_log format ["Log: [while_markers] %1 deleteMarker", _marker];
				deleteMarkerLocal _marker;
				_markers_LocationBase set [_i, -1];
			};
		};
		_markers_LocationBase = _markers_LocationBase -[-1];

		};
	};


	_num = time+15;
	waitUntil {
		_num < time
		or !isNil "gosa_list_LocationBase";
	};
	[] call _fnc_update_LocationBase;
};
diag_log format ["Log: [while_markers] _markers_LocationBase %1", _markers_LocationBase];

// Для совместимости.
_respawnMarkers = [];
_objects = [];
if ((count _markers_airport
	+ count _markers_LocationBase) < 1) then
{
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
};


	_markersHQ = [];
	//-- Обновление маркеров объектов базы.
	if (_rMHQ) then {
		_listHQ_str = format["gosa_listHQ_%1", playerSide];

		_tmp_num = time+15;
		waitUntil {
			_tmp_num < time
			or !isNil _listHQ_str;
		};

		// TODO: Совместимость `gosa_respawnMarkers`.

		// HQ: Обновление всех маркеров.
		_fnc_update_HQ = {
			private ["_listHQ"];
			// FIXME: Каждый раз считывать?
			_listHQ = [] call compile _listHQ_str;
			if !(isNil "_listHQ") then {
				diag_log format ["Log: [while_markers] HQ, _listHQ %1", _listHQ];
				private ["_logic","_class","_markersHQ_alive","_status"];
				// Живые постройки.
				_markersHQ_alive = [];
				for "_i" from 0 to (count _listHQ -1) do {
					_tmp_arr = _listHQ select _i;
					_logic = _tmp_arr select 0;
					if (alive _logic) then {
						_class = _tmp_arr select 1;
						// Штаб.
						if (_class < 1) then {
							_marker = (format["respawn_%1_", _side_str] + (_tmp_arr select 5));
							diag_log format ["Log: [while_markers] %1 Обновление", _marker];
							_markersHQ_alive set [count _markersHQ_alive, _marker];
							_status = _tmp_arr select 2;
							if (_marker in _markersHQ) then {
								// Обновление позиции маркера только для мобилизированого штаба.
								if (_status > 1) then {
									_obj = _tmp_arr select 3 select _status;
									// Перед проверкой для надежности.
									_pos = getPos _obj;
									_num = getDir _obj;
									// Пропускаем если объект отсутствует.
									if !(isNull _obj) then {
										_pos = [_obj, _pos, _num] call gosa_fnc_getSafePosForObject;
										_tmp_arr = getMarkerPos _marker;
										if (_tmp_arr distance _pos > 10) then {
											diag_log format ["Log: [while_markers] %1 Новая позиция %2", _marker, _pos];
											_marker setMarkerPosLocal _pos;
										};
									};
								};
							}else{
								// Новый маркер.
								_obj = _tmp_arr select 3 select _status;
								_pos = getPos _obj;
								_num = getDir _obj;
								if (isNull _obj) then {
									// Позиция логики если объект отсутствует.
									_pos = getPos _logic;
								}else{
									_pos = [_obj, _pos, _num] call gosa_fnc_getSafePosForObject;
								};
								_markersHQ set [count _markersHQ, _marker];
								createMarkerLocal [_marker, _pos];
								diag_log format ["Log: [while_markers] %1 createMarker %2", _marker, _pos];
								_marker setMarkerTypeLocal _markerMHQtype;

								// A3 устанавливает цвет самостоятельно.
								#ifdef __ARMA3__
								if !(playerSide in [east,west,resistance]) then {
								#endif
									_marker setMarkerColorLocal _markerColor;
								#ifdef __ARMA3__
								};
								#endif
							};
						};
					};
				};

				for "_i" from 0 to (count _markersHQ -1) do {
					_marker = _markersHQ select _i;
					// HQ: Удаление маркеров.
					if !(_marker in _markersHQ_alive) then {
						diag_log format ["Log: [while_markers] %1 deleteMarker", _marker];
						deleteMarkerLocal _marker;
						_markersHQ set [_i, -1];
					};
				};
				_markersHQ = _markersHQ -[-1];
			};
		};
		[] call _fnc_update_HQ;
		diag_log format ["Log: [while_markers] HQ, Init %1", _markersHQ];
	};


//-- Отказоустойчивый маркер возрождения если нет базы.
// TODO: Сделать должным образом, для совместимости с pvp.
if ((count _respawnMarkers
	+ count _markers_airport
	+ count _markers_LocationBase
	+ count _markersHQ) <= 0 && 
	playerSide != sideLogic) then
{
	diag_log format ["Log: [while_markers] no base", nil];
	_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor");
	_marker = createMarkerLocal [format["respawn_%1",_side_str], _pos];
	_respawnMarkers = [_marker];
};
diag_log format ["Log: [while_markers] Markers static %1", _respawnMarkers];

// FIXME: Имя переменной сбивает с толку.
_dynamicMarkers = [];

if (_startingClass == 1 && count _markers_airport > 0) then {
	gosa_respawnMarkers = _markers_airport;
}else{
	gosa_respawnMarkers = _respawnMarkers + _markers_LocationBase;
};

waitUntil{!isNil "gosa_playerStartingClass"};
_startingClass = gosa_playerStartingClass;

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
			[] call _fnc_update_HQ;
		};

		// TODO: Перенести в скрипт обновления локаций.
		[] call _fnc_update_LocationAirport;


		if (visibleMap) then {


			//--- главный маркер поля боя
				if(markerSize "MainMarker" select 0 != gosa_locationSize)then{
					"MainMarker" setMarkerSizeLocal [gosa_locationSize, gosa_locationSize];
				};
				if(civilianBasePos distance getMarkerPos "MainMarker" > 1)then{
					"MainMarker" setMarkerPosLocal civilianBasePos;
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
							{alive _item} && {_item call gosa_fnc_isPlayer}
						#else
							alive _item && (_item call gosa_fnc_isPlayer)
						#endif
						) then
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
				private ["_unit"];
				_unit = (_units select _i);
				_marker = (_markers select _i);
				// TODO: нужна проверка на отключеных игроков
				if (alive _unit) then {
						if (playerSide getFriend side _unit >= 0.6) then
						{
							_tmp_obj = vehicle _unit;

							// Отобразить первого игрока из экипажа.
							if (_unit != _tmp_obj) then {
								_tmp_arr = crew _tmp_obj;
								for "_i" from 0 to (count _tmp_arr -1) do {
									_tmp_obj = _tmp_arr select _i;
									if (_tmp_obj call gosa_fnc_isPlayer) exitWith {
										diag_log format ["Log: [while_markers] %1 crew %2", _unit, _tmp_obj];
										_unit = _tmp_obj;
									};
								};
							};

							_pos = position vehicle _unit;

							_text = "";
							// _text = (_text + " " + getText(configFile >> 'CfgVehicles' >> (typeOf _tmp_obj) >> 'displayName'));
							_text = (_text + " " + name _unit);
							if (lifeState _unit == "UNCONSCIOUS") then {
								_text = _text + (" " + Localize "str_reply_injured");
							};
							if (markerText _marker != _text) then {
								_marker setMarkerTextLocal _text;
							};
						}else{
							_pos = _markerPosHiden;
						};
						_tmp_arr = getMarkerPos _marker;
						if (_tmp_arr distance _pos > 10) then {
							diag_log format ["Log: [while_markers] %1 Новая позиция %2", _marker, _pos];
							_marker setMarkerPosLocal _pos;
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
