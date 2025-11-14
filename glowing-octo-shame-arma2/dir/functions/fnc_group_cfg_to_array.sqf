private ["_cfg","_arr0","_arr1","_arr2","_n","_item"];
diag_log format ["Log: [fnc_group_cfg_to_array] _this %1", _this];

_cfg = _this select 0;
_arr0 = [];
_arr1 = [];
_arr2 = [];

for "_i" from 0 to (count _cfg -1) do {
	_item = _cfg select _i;
	if (isClass _item) then {
		_arr0 set [count _arr2, getText (_item >> "vehicle")];
		_arr1 set [count _arr2, getArray (_item >> "position")];
		_arr2 set [count _arr2, getText (_item >> "rank")];
	};
};

if (isNumber(_cfg >> "rarityGroup")) then {
	_n = getNumber(_cfg >> "rarityGroup");
}else{
	_n = 0;
};

[_arr0, _arr1, _arr2, _n];
