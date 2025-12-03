private ["_pos","_dist","_types","_arr0","_arr","_Barracks","_str","_arr1"];
_pos = _this select 0;
_dist = _this select 1;
//_types = _this select 2;

_arr0 = [];
_arr1 = [];
_arr = _pos nearObjects ["House", _dist];
if (count _arr > 0) then {
	_Barracks = gosa_typesKindOf_bunker;
	for "_i" from 0 to (count _arr -1) do {
		scopeName "scope0";
		for "_i0" from 0 to (count _Barracks -1) do {
			if (typeName (_Barracks select _i0) == typename []) then {
				_str = _Barracks select _i0 select 0;
			}else{
				_str = _Barracks select _i0;
			};
			if (_arr select _i isKindOf _str) then {
				_arr0 set [count _arr1, _arr select _i];
				_arr1 set [count _arr1, _Barracks select _i0];
				breakTo "scope0";
			};
		};
	};
};

diag_log format ["Log: [fnc_base_findRespawnPositions] %1, %2", _this, [_arr0, _arr1]];
[_arr0, _arr1];
