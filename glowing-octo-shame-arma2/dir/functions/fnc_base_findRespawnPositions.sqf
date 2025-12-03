private ["_pos","_dist","_types","_arr0","_arr","_Barracks"];
_pos = _this select 0;
_dist = _this select 1;
//_types = _this select 2;

_arr0 = [];
_arr = _pos nearObjects ["House", _dist];
if (count _arr > 0) then {
	_Barracks = gosa_typesKindOf_bunker;
	for "_i" from 0 to (count _arr -1) do {
		if ([[_arr select _i], _Barracks] call gosa_fnc_CheckIsKindOfArray) then {
			_arr0 set [count _arr0, _arr select _i];
		};
	};
};
_arr0;
