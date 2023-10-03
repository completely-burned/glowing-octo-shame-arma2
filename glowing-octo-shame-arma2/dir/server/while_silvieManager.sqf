/*
 * Припаркованный гражданский транспорт в городах.
 * TODO: Оптимизировать код.
 */

#ifdef __ARMA3__
	if (true) exitWith {
		diag_log format ["Log: [while_silvieManager] exitWith %1", time];
	};
#endif

private ["_twns","_mash","_mashType","_players","_twn","_twnpos",
	"_actual","_scope","_side","_cfgVeh","_houselist","_bbox",
	"_blacklist","_veh","_sm_vehicles","_dir","_pos","_roads",
	"_road","_obj",
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
_blacklist = silvieManagerBlacklist;
_sm_vehicles = silvieManagerVehicles;

_distance = 750;

_twns = [];
while{sleep 20; true}do{
	_twns resize 0;
	_players = ([] call gosa_fnc_listPlayers);
	for "_i" from 0 to (count _players -1) do {
		_player = _players select _i;
		_twn = nearestLocation [_player, "CityCenter"];
		if !(_twn in _twns) then {
			_twns set [count _twns, _twn];
				_twnpos = position _twn;
				_twnpos resize 2;
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

				_houselist = (_twn getVariable "_houselist");
				if (isNil "_houselist") then {
					// -50 потому что ТС создаётся рядом и может оказаться за пределами.
					_houselist = (_twnpos nearobjects ["House", _distance -50]);

					for "_i0" from 0 to (count _houselist -1) do {
						_obj = (_houselist select _i0);

						if (_obj in _blacklist) then {
							_houselist = (_houselist - [_obj]);
						}else{
							_bbox = abs((boundingbox _obj select 1) select 0)
								min abs((boundingbox _obj select 1) select 1);
							if (_bbox < 3) then {
								_houselist = (_houselist - [_obj]);
							};
						};
					};
					_twn setVariable ["_houselist", _houselist];
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

				if (count _houselist > 0) then {
					_maxVehicles = ((count _houselist / 8) max 2);
					if (_count_vehicles < _maxVehicles)then{
						for "_i0" from 0 to (_maxVehicles-_count_vehicles) do {
							_obj = _houselist call BIS_fnc_selectRandom;
							_pos = getpos _obj;// modeltoworld [0,0,0];
							_dir = direction _obj + (floor random 4)*90;
							_roads =  (_pos nearroads 20);
							scopeName "house";
							if (count _roads > 0) then {
								{
								private ["_bbox","_bboxA","_bboxB","_bboxX","_bboxY","_difmin","_difmax","_dif"];
								_road = _roads call BIS_fnc_selectRandom;;
								_roads = _roads - [_road];
								//---  Straight road
								if (count (roadsconnectedto _road) <= 2) then {
									_dir = direction _road;
									_bbox = boundingbox _road;
									_bboxA = (_bbox select 0);
									_bboxB = (_bbox select 1);
									_bboxX = abs(_bboxA select 0) + abs(_bboxB select 0);
									_bboxY = abs(_bboxA select 1) + abs(_bboxB select 1);
									_difmin = (_bboxX min _bboxY);
									_difmax = (_bboxX max _bboxY);
									_dif = _difmin/2 + sqrt(_difmin)*0.3;

									if (_difmax < 15) then {
										_pos = position _road;
										_pos = [
											(_pos select 0)+(sin (_dir + 90) * _dif),
											(_pos select 1)+(cos (_dir + 90) * _dif)
										];
										breakTo "house";
									}else{
										_road = objNull;
									};
								};
								} foreach _roads;
							}else{ // diag_log Undefined variable
								_road = objNull; // diag_log Undefined variable
							};
							_veh = createVehicle [_sm_vehicles call BIS_fnc_selectRandom, _pos, [], 0, "NONE"];
							[nil, _veh, rvehInit] call RE;
							_veh setDir (_dir - 10 + random 20);
							// _veh setPosATL _pos;
							//--- Inside Building Check
							if (count(nearestObjects [_veh, [], if (_veh isKindOf "Truck") then {5}else{3}] - [_veh]) > 0) exitWith {
								diag_log format ["Log: [silvieManager] %1, Inside Building %2", _twn, _veh];
								deleteVehicle _veh;
							};

							// TODO: setVectorUp вызывает синхронизацию по сети, нужно его заменить.
							_veh setVectorUp [0,0,1];

							_veh setFuel 0.5 + ((random 1)^3 - (random 1)^3)/2;

							diag_log format ["Log: [silvieManager] %1, %2 создано у %3", _twn, _veh, [_obj, _road]];
						};
					};
				};
			};
		};

};
