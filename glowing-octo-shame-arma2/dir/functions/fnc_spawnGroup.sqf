#define __A2OA__
/*
 * TODO: Рефакторинг.
 */

diag_log format ["Log: [gosa_fnc_spawnGroup] %1", _this];
private ["_pos","_side","_groups","_vehicles","_roads","_z","_for",
	"_tmpArr","_grp","_types","_positions","_ranks","_crewType","_azimuth",
	"_relPos","_positions_static","_positions_used","_best","_vr","_arr0",
	"_unit", "_type","_itemPos","_rank","_cfgVeh","_str","_entry","_n"];

_side = _this select 1;
_roads = (_this select 0 select 1);
_pos = (_this select 0 select 0);

_groups = [];
_vehicles = [];
_cfgVeh = LIB_cfgVeh;
_positions_used = [];

// Выбирается одна группа если десант отключен.
// FIXME: Можел лучше вынести участок кода за файл.
if (missionNamespace getVariable "gosa_landing" > 0) then {
	_for = _this select 2;
}else{
	_for = [(_this select 2) select 0];
};

if (count _this > 3) then {
	_positions_static = _this select 3;
}else{
	_positions_static = [];
};

if (missionNamespace getVariable "gosa_gamemode_vr" > 0) then {_vr = true} else {_vr = false};

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
					_relPos = _positions select _i;
					_itemPos = [
						(_pos select 0) + (_relPos select 0),
						(_pos select 1) + (_relPos select 1)
					];
				} else {
					_itemPos = _pos;
				};
				
				if (count _positions_static > 0) then {
					_arr = _positions_static select _i;
					if (count _arr > 0) then {
						for "_i0" from 0 to (count _arr -1) do {
							// FIXME: Эта проверка не работает.
							if ({_arr select _i0 distance _x < 5} count _positions_used <= 0) then {
								if (isNil "_best") then {
									_best = _arr select _i0;
								}else{
									if (_arr select _i0 distance _pos < _best distance _pos) then {
										_best = _arr select _i0;
									};
								};
							};
						};
						if (isNil "_best") then {
							diag_log format ["Log: [fnc_spawnGroup] %1 _i %2 позиция недоступна", _grp, _i];
						}else{
							_itemPos = _best;
							_positions_used set [count _positions_used, _itemPos];
							_best = nil;
						};
					};
				};

				if (count _ranks > 0) then {
					_rank = _ranks select _i;
					if (typeName _rank == typeName 0) then {
						_rank = _rank call gosa_fnc_rankConv;
					};
					_rank = toUpper _rank;
				}else{
					// TODO: Нужна функция.
					_n = getNumber (_cfgVeh >> _type >> "cost");
					_rank="PRIVATE";
					if(_n>=50000)then{_rank="CORPORAL"};
					if(_n>=150000)then{_rank="SERGEANT"};
					if(_n>=250000)then{_rank="LIEUTENANT"};
					if(_n>=350000)then{_rank="CAPTAIN"};
					if(_n>=500000)then{_rank="MAJOR"};
					if(_n>=750000)then{_rank="COLONEL"};
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
					_unit = [_grp, [_type, _itemPos, [], 0, "NONE"], _vr, [_side, _type]] call gosa_fnc_createUnit;

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
						//if (_side getFriend playerSide >= 0.6) then
						if (_side == gosa_friendlyside select 0) then
						{
							addSwitchableUnit _unit;
							#ifdef __ARMA3__
								_n = [_unit, "menu"] call BIS_fnc_addCommMenuItem;
							#endif
						};
					};

					if (_rank != "PRIVATE") then {
						#ifdef __ARMA3__
							_unit setRank _rank;
						#else
							// До A3 движок не синхронизирует ранги самостоятельно.
							[nil, _unit, rsetRank, _rank] call RE;
						#endif
					};

				// Для транспорта.
				} else {
					// FIXME: Название переменной вводит в заблуждения.
					private ["_fnc_spawnVehicle"];
					if (count _crewType > 0) then {
						_arr = [_itemPos, _azimuth, _type, _grp, _crewType select _i, _side];
					}else{
						_arr = [_itemPos, _azimuth, _type, _grp, [], _side]
					};
					if (_rank != "PRIVATE") then {
						_arr set [6, _rank];
					};
					_fnc_spawnVehicle = _arr call gosa_fnc_spawnVehicle;
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
						#ifdef __ARMA3__
							_n = boundingBoxReal _unit select 1 select 2;
						#else
							_n = boundingBox _unit select 1 select 2;
						#endif
						if !(isNil "_n") then {_itemPos set [2, _n]};
						diag_log format ["Log: [fnc_spawnGroup] %1, %2, pos %3", _grp, _unit, [_itemPos, _azimuth]];

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
						if (_side == gosa_friendlyside select 0) then
						{
							{
								addSwitchableUnit _x;
								#ifdef __ARMA3__
									_n = [_x, "menu"] call BIS_fnc_addCommMenuItem;
								#endif
							} forEach (_fnc_spawnVehicle select 1);
						};
					};
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

	#ifdef __ARMA3__
		// ТС не начинают движение.
		// FIXME: Помогает только частично.
		units _grp spawn {
			sleep 5;
			{_x doFollow _x} forEach _this;
		};
	#endif
} forEach _for;

_groups;
