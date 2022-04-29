#define __A2OA__

diag_log format ["Log: [gosa_fnc_spawnGroup.sqf] %1", _this];
// diag_log str _this;
private ["_pos","_side","_groups","_vehicles","_roads","_z"];
_side = _this select 1;
_groups = [];

_vehicles = [];
_roads = _this select 0 select 1;
_pos = _this select 0 select 0;

if(count _pos == 0 && count _roads == 0)exitWith{
		diag_log format ["spawn_group.sqf %1", "count _pos == 0 && count _roads == 0"];
	[grpNull];
};

	diag_log format ["spawn_group.sqf create pos %1 grp %2", _this select 0, _this select 2];

if (missionNamespace getVariable "gosa_landing" == 1) then {
	_z = _this select 2;
}else{
	_z = [(_this select 2) select 0];
};

{
	private ["_grp"];
	_grp = createGroup _side;
	_groups set [count _groups, _grp];

	if(!isNull _grp)then{
		private ["_types","_positions","_ranks","_crewType","_azimuth"];
		_types = _x;

		if ((count _types) > 1) then {
			_positions = _types select 1;
		} else {
			_positions = [];
		};
		if ((count _types) > 2) then {
			_ranks = _types select 2;
		}else{
			_ranks = [];
		};
		if ((count _types) > 3) then {
			_crewType = _types select 3;
		} else {
			_crewType = [];
		};

		_types = _types select 0;

		_azimuth = random 360;

		for "_i" from 0 to ((count _types) - 1) do {

				private ["_unit", "_type"];
				_type = _types select _i;

				private ["_itemPos"];
				if ((count _positions) > 0) then {
					private ["_relPos"];
					_relPos = _positions select _i;
					_itemPos = [(_pos select 0) + (_relPos select 0), (_pos select 1) + (_relPos select 1)];
				} else {
					_itemPos = _pos;
				};

				if (getNumber(configFile >> "CfgVehicles" >> _type >> "isMan") == 1) then {
					_unit = _grp createUnit [_type, _itemPos, [], 0, "FORM"];
					#ifdef __ARMA3__
						[_unit] call gosa_fnc_vehInit2;
					#else
					[nil, _unit, rvehInit] call RE;
					#endif
#ifndef __A2OA__
					_unit addEventHandler ["killed", {[_this select 0] call BIS_GC_trashItFunc}];
#endif
					_unit setDir _azimuth;
				} else {
					private ["_fnc_spawnVehicle"];
					if (((count _crewType) > 0)) then {
						_fnc_spawnVehicle = [_itemPos, _azimuth, _type, _grp, _crewType select _i] call gosa_fnc_spawnVehicle;
					}else{
						_fnc_spawnVehicle = [_itemPos, _azimuth, _type, _grp] call gosa_fnc_spawnVehicle;
					};
					_unit = _fnc_spawnVehicle select 0;

					if(count _roads > 0)then{
						_unit setPos getPos (_roads select 0);
						if(count _roads > 1)then{
							_azimuth = 180 + ([_roads select 0, _roads select 1] call BIS_fnc_dirTo);
						};
						_unit setDir _azimuth;
						_roads set [0,-1];
						_roads = _roads - [-1];
					}else{
							diag_log format ["spawn_group.sqf no roads %1 grp %2", _roads, _this];
					};
				};

				private ["_rank"];
				if (((count _ranks) > 0)) then {
					_rank = _ranks select _i;
					if (typeName _rank == typeName 0) then {
						_rank = _rank call gosa_fnc_rankConv;
					};
					_unit setRank _rank;
					#ifndef __ARMA3__
						[nil, _unit, rsetRank, _rank] call RE;
					#endif
				}else{
							Private["_cost"];
							_cost = getNumber (configFile >> "CfgVehicles" >> _type >> "cost");
							_rank="PRIVATE";
							if(_cost>=50000)then{_rank="CORPORAL"};
							if(_cost>=150000)then{_rank="SERGEANT"};
							if(_cost>=250000)then{_rank="LIEUTENANT"};
							if(_cost>=350000)then{_rank="CAPTAIN"};
							if(_cost>=500000)then{_rank="MAJOR"};
							if(_cost>=750000)then{_rank="COLONEL"};
							[nil, _unit, rsetRank, _rank] call RE;
				};

		};

		private ["_bestCandidate","_units"];
		_units = units _grp;
		if ((count _units) > 0) then {
			_bestCandidate = _units select 0;
			if ((count _ranks) > 0) then {
				{
					if ((rankId _x) > (rankId _bestCandidate)) then {
						_bestCandidate = _x;
					};
				}forEach _units;
			};
			_grp selectLeader _bestCandidate;
		};
	};

} forEach _z;

_groups;
