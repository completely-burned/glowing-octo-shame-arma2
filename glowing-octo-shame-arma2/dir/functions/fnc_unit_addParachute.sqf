private ["_unit","_type","_arr","_item"];

_unit = _this select 0;
_type = "gm_backpack_t10_parachute";
diag_log format ["Log: [fnc_unit_addParachute] #landing %1, %2", _this, _type];

_arr = backpackItems _unit;
diag_log format ["Log: [fnc_unit_addParachute] #landing backpackItems %1", _arr];

removeBackpack _unit;
_unit addBackpack _type;

for "_i" from 0 to (count _arr -1) do {
	_item = _arr select _i;
	_unit addItemToBackpack _item;
};
