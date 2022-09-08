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
	"_tmp_obj",
	"_markerMHQ","_markerMHQtype","_dynamicMarkers","_hq","_pos","_marker"];

_fnc_MarkerInitUnit = {
	diag_log format ["Log: [while_markers] %1 Marker init %2", _this select 0, _this];
	createMarkerLocal [_this select 0, _this select 1];
	#ifdef __ARMA3__
		_this select 0 setMarkerTypeLocal "hd_dot";
	#else
		_this select 0 setMarkerTypeLocal "vehicle";
	#endif
	_this select 0 setMarkerSizeLocal [3,3];
	_this select 0 setMarkerColorLocal (_this select 2);
};

// тип возрождения
if (missionNamespace getVariable "respawn" == 0 or missionNamespace getVariable "gosa_MHQ" == 1) then {
	_rBase = true;
} else {
	_rBase = false;
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


// Объекты используются для поиска статичных позиций возрождения.
_objects = [];
#ifdef __A2OA__
{
	_objects = _objects + allMissionObjects _x;
} forEach HQ;
#endif

_respawnMarkers = [];
// FIXME: Вылет с "OutOfMemory" может быть если объекты далеко.
_markerPosHiden = [-1600,0];

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

//-- Отказоустойчивый маркер возрождения если нет базы.
// TODO: Сделать должным образом, для совместимости с pvp.
if (count _respawnMarkers < 1) then {
	diag_log format ["Log: [while_markers] no base", nil];
	_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor");
	_marker = createMarkerLocal [format["respawn_%1",_side_str], _pos];
	_respawnMarkers = [_marker];
};
diag_log format ["Log: [while_markers] Markers static %1", _respawnMarkers];

waitUntil {!isNil {MHQ_list}};

_dynamicMarkers = [];

gosa_respawnMarkers = _respawnMarkers;

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

		if (_rBase) then {
			// -- мобильная база (мобилизованная), один маркер
			_hq = call gosa_fnc_getHQ select 0;
			if !(isNull _hq) then {
				private ["_pos"];
				_pos = getPos _hq;
				_pos resize 2;
					if(getMarkerType _markerMHQ != _markerMHQtype)then{
						_markerMHQ = createMarkerLocal [_markerMHQ, _pos];
						_markerMHQ setMarkerTypeLocal _markerMHQtype;
						_markerMHQ setMarkerColorLocal _markerColor;
						gosa_respawnMarkers = [_markerMHQ]+_respawnMarkers;
					}else{
						_markerMHQ setMarkerPos _pos;
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
							_tmp_str = str _x + "_veh";
							[_tmp_str, position _x, _markerColor] call _fnc_MarkerInitUnit;
							_markers set [count _markers, _tmp_str];

						};
					}forEach (allMissionObjects "WarfareBBaseStructure")+(allMissionObjects "BASE_WarfareBFieldhHospital");
				};
			#endif

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
			{
				if(!(_x in _units) && (side _x == playerSide) && alive _x && (_x call gosa_fnc_isPlayer))then{
					_units set [count _units, _x];
					_tmp_str = str _x;
					[_tmp_str, position _x, "ColorBlack"] call _fnc_MarkerInitUnit;
					_markers set [count _markers, _tmp_str];
				};
			}forEach allUnits;


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
