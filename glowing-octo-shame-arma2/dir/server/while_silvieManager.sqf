/*
 * Припаркованный гражданский транспорт в городах.
 * TODO: Оптимизировать код.
 */

private ["_twns","_mash","_mashType","_players","_twn","_twnpos",
	"_actual","_scope","_side","_cfgVeh","_houselist","_bbox",
	"_blacklist","_veh","_sm_vehicles","_dir","_pos","_roads",
	"_road","_obj","_createVehicle_special","_type","_n",
	"_houselist_roads","_arr",
	"_vehicles","_distance","_count_vehicles","_maxVehicles"];

if (missionNamespace getVariable "gosa_MASH" == 1) then {
	_mashType = "MASH_EP1";
	if (configName(configFile >> "CfgVehicles" >> _mashType) == "") then {
		_mashType = "MASH";
		if (configName(configFile >> "CfgVehicles" >> _mashType) == "") then {
			_mashType == "";
		};
	};
	_mash = [];
}else{
	_mashType = "";
};

_cfgVeh = LIB_cfgVeh;
_twns = gosa_towns;
_blacklist = silvieManagerBlacklist;
_sm_vehicles = silvieManagerVehicles;
// +50 потому что ТС создаётся рядом и может оказаться за пределами.
_distance = gosa_dist_houselist + 50;
_dist_player = gosa_silvieManager_dist_player;
if (gosa_loglevel > 0) then {_dist_player = 10};

while{sleep 20; true}do{
	for "_i" from 0 to (count _twns -1) do {
		_twn = _twns select _i;
		_twnpos = position _twn;
		_twnpos resize 2;

		if !([_twnpos, _dist_player] call gosa_fnc_CheckPlayersDistance) then {
			_arr = (_twnpos nearEntities [["Car", "Motorcycle"], _distance]);
			//(civilian countSide _arr);
			_count_vehicles = 0;
			for "_i0" from 0 to (count _arr -1) do {
				_obj = (_arr select _i0);
				_actual = (_cfgVeh >> typeOf _obj);
				_scope = getnumber (_actual >> "scope");
				_side = getnumber (_actual >> "side");
				// TODO: Тест производительности.
				if (_obj iskindof "LandVehicle" && _scope == 2 && _side == 3 && canMove _obj) then {
					_count_vehicles = _count_vehicles + 1;
				};
			};


			if (_mashType != "") then {

				//if ({alive _x} count _mash == 0) then {
					// TODO: нужно оптимизировать код
					_mash = _twnpos nearObjects [_mashType, _distance -100];
				//};

				// мого разрушенных палаток не красиво выглядит
				if (count _mash < 3) then {
					if ({alive _x} count _mash < 1) then {
						ScopeName "PlaceSafe";
						private ["_attempts","_posX","_posY","_dist2","_testPos"];
						_attempts = 0;
						while {_attempts < 500} do {

							// эта комаднда находит позицию ближе к центру и поэтому не подходит
							// _testPos = _twnpos findEmptyPosition [5,500,_mashType];

							_posX = _twnpos select 0;
							_posY = _twnpos select 1;

							_dir = random 360;
							_dist2 = random 500;
							_testPos = [_posX + _dist2*sin _dir, _posY + _dist2*cos _dir];
							if !(SurfaceIsWater _testPos) then {
								if (count (_testPos nearRoads 10) < 1) then {
									if (count nearestObjects [_testPos, ["Static","LandVehicle","Air"], 5] == 0) then {
										_mash = [
											createVehicle [_mashType, _testPos, [], random 360, "NONE"]
										];
										diag_log format ["Log: [silvieManager] %1, %2 _mash создано у %3", _twn, _mash, _testPos];
										BreakTo "PlaceSafe";
									};
								};
							};
							_attempts = _attempts + 1;
							sleep 0.005;
						};
					};
				};
			};


			_houselist = _twn getVariable "gosa_houselist";
			if (isNil "_houselist") then {_houselist = []};
			if (count _houselist > 0) then {
				_houselist_roads = _twn getVariable "gosa_houselist_roads";
				_maxVehicles = _twn getVariable "gosa_maxVehicles";
				if (isNil "_maxVehicles") then {_maxVehicles = (count _houselist / 8) max 2};
				if (_count_vehicles < _maxVehicles)then{
					for "_i0" from 0 to (_maxVehicles-_count_vehicles) do {
						_n = floor random count _houselist;
						_obj = _houselist select _n;
						_arr = _houselist_roads select _n;
						if (count _arr > 0) then {
							_road = _arr call BIS_fnc_selectRandom;
							_dir = direction (_road select 0);
							_pos = (_road select 1);
							_createVehicle_special = "NONE";
						} else {
							_road = [];//diag_log
							_dir = direction _obj + (floor random 4)*90;
							_pos = getPos _obj;
							_createVehicle_special = "NONE";
						};

						if (({count (roadsconnectedto _x) > 2} count (_pos nearRoads 7)) <= 0) then {
							_type = _sm_vehicles call BIS_fnc_selectRandom;
							_veh = createVehicle [_type, _pos, [], 0, _createVehicle_special];
							[nil, _veh, rvehInit] call RE;
							_veh setDir (_dir - 10 + random 20);
							if (isMultiplayer) then {_veh setPos _pos};
							//--- Inside Building Check
							if (count(nearestObjects [_veh, [], if (_veh isKindOf "Truck") then {5}else{3}] - [_veh]) > 0) exitWith {
								diag_log format ["Log: [silvieManager] %1, Inside Building %2", _twn, _veh];
								deleteVehicle _veh;
							};

							// TODO: setVectorUp вызывает синхронизацию по сети, нужно его заменить.
							_veh setVectorUp [0,0,1];

							_veh setFuel 0.5 + ((random 1)^3 - (random 1)^3)/2;

							_veh setVariable ["gosa_diag_log_silvieManager_spawnInfo", [_twn, _veh, [_pos, _obj, typeOf _obj, _road]]];
							diag_log format ["Log: [silvieManager] %1, %2 created %3",  _twn, _veh, [_pos, _obj, typeOf _obj, _road]];
						}else{//diag_log
							diag_log format ["Log: [silvieManager] %1, ignore, roadsconnectedto %2",  _twn, [_veh, [_pos, _obj, typeOf _obj, _road]]];
						};
					};
				};
			};
		};
	};
};
