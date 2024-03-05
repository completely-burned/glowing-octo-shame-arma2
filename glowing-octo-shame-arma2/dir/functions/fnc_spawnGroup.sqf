#define __A2OA__
/*
 * TODO: Рефакторинг.
 */

diag_log format ["Log: [gosa_fnc_spawnGroup] %1", _this];
private ["_pos","_side","_groups","_vehicles","_roads","_z","_tmp_num","_for",
	"_tmpArr","_grp","_types","_positions","_ranks","_crewType","_azimuth",
	"_unit", "_type","_itemPos","_rank","_cfgVeh","_str","_entry"];

_side = _this select 1;
_roads = (_this select 0 select 1);
_pos = (_this select 0 select 0);

_groups = [];
_vehicles = [];
_cfgVeh = LIB_cfgVeh;

// Выбирается одна группа если десант отключен.
// FIXME: Можел лучше вынести участок кода за файл.
if (missionNamespace getVariable "gosa_landing" > 0) then {
	_for = _this select 2;
}else{
	_for = [(_this select 2) select 0];
};

{
	_grp = createGroup _side;
	_groups set [count _groups, _grp];

	// Если достигнуто максимальное для движка количество group, то будет grpNull.
	if !(isNull _grp) then {
		// Эта переменная проверяется.
		private ["_bestCandidate"];

		if ((count _x) > 1) then {
			_positions = _x select 1;
		} else {
			_positions = [];
		};
		if ((count _x) > 2) then {
			_ranks = _x select 2;
		}else{
			_ranks = [];
		};
		if ((count _x) > 3) then {
			_crewType = _x select 3;
		} else {
			_crewType = [];
		};
		if ((count _x) > 4) then {
			_bestCandidate = _x select 4;
		};
		_types = _x select 0;
		_azimuth = random 360;

		for "_i" from 0 to ((count _types) - 1) do {
				_type = _types select _i;
				_entry = (_cfgVeh >> _type);

				if ((count _positions) > 0) then {
					private ["_relPos"];
					_relPos = _positions select _i;
					_itemPos = [
						(_pos select 0) + (_relPos select 0),
						(_pos select 1) + (_relPos select 1)
					];
				} else {
					_itemPos = _pos;
				};
				// Чтобы не застряли.
				_itemPos set [2,2];

				// Для пехоты.

				// Некоторые модификации выдают bool вместо цифры.
				#define true 1
				#define false 0
				if (getNumber(_entry >> "isMan") > 0) then {
					#undef true
					#undef false
					_unit = _grp createUnit [_type, _itemPos, [], 0, "NONE"];

					#ifdef __A2OA__
						_str = getText (_entry >> "backpack");
						if (_str != "") then {
							if (isNull unitBackpack _unit) then {_unit addBackpack _str};
							diag_log format ["Log: [fnc_spawnGroup] %1, %2, %3 backpack added %4", _grp, _unit, _str, unitBackpack _unit];
						};
					#endif

					#ifdef __ARMA3__
						[_unit, "fnc_spawnGroup"] remoteExec ["gosa_fnc_vehInit2"];
					#else
						[nil, _unit, rvehInit] call RE;
					#endif
					#ifndef __A2OA__
						_unit addEventHandler ["killed", {[_this select 0] call BIS_GC_trashItFunc}];
					#endif
					//_unit setDir _azimuth;

					//-- Одиночная игра.
					if !(isMultiplayer) then {
						//-- Баланс.
						if (_side getFriend playerSide >= 0.6) then {
							addSwitchableUnit _unit;
							#ifdef __ARMA3__
								_tmp_num = [_unit,"menu"] call BIS_fnc_addCommMenuItem;
							#endif
						};
					};

				// Для транспорта.
				} else {
					private ["_fnc_spawnVehicle"];
					if (count _crewType > 0) then {
						_fnc_spawnVehicle = [_itemPos, _azimuth, _type, _grp, _crewType select _i, _side] call gosa_fnc_spawnVehicle;
					}else{
						_fnc_spawnVehicle = [_itemPos, _azimuth, _type, _grp, [], _side] call gosa_fnc_spawnVehicle;
					};
					_unit = _fnc_spawnVehicle select 0;

					//-- ТС на дороге размещается.
					if(count _roads > 0)then{
						if(count _roads > 1)then{
							_azimuth = 180 + ([_roads select 0, _roads select 1] call BIS_fnc_dirTo);
						};
						_itemPos = getPos (_roads select 0);
						// a3 тс на некоторых позициях взрываются,
						// вероятно из-за наклона поверхности.
						//_itemPos resize 2;
						_itemPos set [2, boundingBox _unit select 2];
						_unit setPos _itemPos;
						_unit setDir _azimuth;
						#ifdef __ARMA3__
							_roads deleteAt 0;
						#else
						_roads set [0,-1];
						_roads = _roads - [-1];
						#endif
					}else{//diag_log
						diag_log format ["Log: [fnc_spawnGroup] %1, %2, no roads %3", _grp, _unit, _roads];
					};

					//-- Одиночная игра.
					if !(isMultiplayer) then {
						//-- Баланс.
						if (_side getFriend playerSide >= 0.6) then {
							{
								addSwitchableUnit _x;
								#ifdef __ARMA3__
									_tmp_num = [_x,"menu"] call BIS_fnc_addCommMenuItem;
								#endif
							} forEach (_fnc_spawnVehicle select 1);
						};
					};
				};

				//-- Звания.
				if (((count _ranks) > 0)) then {
					_rank = _ranks select _i;
					if (typeName _rank == typeName 0) then {
						_rank = _rank call gosa_fnc_rankConv;
					};
				}else{
					// TODO: Нужна функция.
							_tmp_num = getNumber (_cfgVeh >> _type >> "cost");
							_rank="PRIVATE";
							if(_tmp_num>=50000)then{_rank="CORPORAL"};
							if(_tmp_num>=150000)then{_rank="SERGEANT"};
							if(_tmp_num>=250000)then{_rank="LIEUTENANT"};
							if(_tmp_num>=350000)then{_rank="CAPTAIN"};
							if(_tmp_num>=500000)then{_rank="MAJOR"};
							if(_tmp_num>=750000)then{_rank="COLONEL"};
				};
				if (toUpper _rank != "PRIVATE") then {
					#ifdef __ARMA3__
						_unit setRank _rank;
					#else
						// До A3 движок не синхронизирует ранги самостоятельно.
						[nil, _unit, rsetRank, _rank] call RE;
					#endif
				};

				// Командир указан в параметрах.
				if !(isNil "_bestCandidate") then {
					if (_i == _bestCandidate) then {
						_grp selectLeader _unit;
					};
				};
		};

		// Командир не указан в параметрах, автовыбор.
		// TODO: Нужна функция и учёт score (хотя здесь он не нужен).
		if (isNil "_bestCandidate") then {
			_tmpArr = units _grp;
			if ((count _tmpArr) > 0) then {
				_bestCandidate = _tmpArr select 0;
				if ((count _ranks) > 0) then {
					{
						if ((rankId _x) > (rankId _bestCandidate)) then {
							_bestCandidate = _x;
						};
					}forEach _tmpArr;
				};
				_grp selectLeader _bestCandidate;
			};
		};
	};

} forEach _for;

_groups;
