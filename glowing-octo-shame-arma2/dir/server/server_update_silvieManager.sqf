/* припаркованный гражданский транспорт в городах
 */

private ["_twns"];
while{true}do{
		_twns=[];
		{
			private ["_twn"];
			_twn = nearestLocation [getPos _x, "CityCenter"];
			if!(_twn in _twns)then{
				private ["_twnpos","_vehicles"];
				_twns set [count _twns,_twn];
				_twnpos = position _twn;
				_twnpos resize 2;
				_vehicles = (_twnpos nearEntities [["Car", "Motorcycle"], 750]);
				private ["_count_vehicles","_maxVehicles"];
				_count_vehicles=0;//(civilian countSide _vehicles);
				{
					private ["_actual"];
					_actual = (configfile >> "cfgVehicles">> typeOf _x) ;
					private ["_scope","_side"];
					_scope = getnumber (_actual >> "scope");
					_side = getnumber (_actual >> "side");
					if (_x iskindof "LandVehicle" && _scope == 2 && _side == 3 && canMove _x) then {
						_count_vehicles=_count_vehicles+1;
					};
				}forEach _vehicles;

				private ["_houselist"];
				_houselist = (_twn getVariable "_houselist");
				if (isNil "_houselist")then{
					_houselist = _twnpos nearobjects ["House",750];


					{
						private ["_bbox"];
						_bbox = abs((boundingbox _x select 1) select 0) min abs((boundingbox _x select 1) select 1);
						if (_bbox < 2 || typeof _x in silvieManagerBlacklist) then {_houselist = _houselist - [_x]};
					} foreach _houselist;
					_twn setVariable ["_houselist",_houselist];
				};

				_maxVehicles = ((count _houselist / 8) max 2);

				if (_count_vehicles < _maxVehicles)then{
					if (count _houselist > 0) then {
						for "_i" from 0 to (_maxVehicles-_count_vehicles) do {
							private ["_pos","_dir","_obj","_roads"];
							_obj = _houselist call BIS_fnc_selectRandom;
							_pos = _obj modeltoworld [0,0,0];
							_dir = direction _obj + (floor random 4)*90;
							_roads =  (_pos nearroads 20);
							if (count _roads > 0) then {
								private ["_road","_bbox","_bboxA","_bboxB","_bboxX","_bboxY","_difmin","_difmax","_dif"];
								_road = _roads call BIS_fnc_selectRandom;;
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
										(_pos select 1)+(cos (_dir + 90) * _dif),
										0
									];
								};
							};
							private ["_veh1"];
							_veh1 = createVehicle [ (silvieManagerVehicles call BIS_fnc_selectRandom), _pos, [], 0, "NONE"];
							_veh1 setDir _dir;
							// _veh1 setPosATL _pos;
							_veh1 setVectorUp [0,0,1];
							_veh1 setVelocity [0, 0, -1];
							// _veh1 addEventHandler ["GetIn",{_this call gosa_fnc_EH_GetIn}];

								diag_log format ["silvieManager createVehicle %1", _veh1];

							[_veh1] spawn {
								sleep 5;

								if(getPos (_this select 0) select 2 > 0.1)then{

										diag_log format ["silvieManager height > deleteVehicle %1", (_this select 0)];

									deleteVehicle (_this select 0);
								};
							};
						};
					};
				};
			};
		}forEach ([] call BIS_fnc_listPlayers);

	sleep 10;
};
