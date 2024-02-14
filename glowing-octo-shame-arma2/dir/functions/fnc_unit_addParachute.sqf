private ["_unit","_type","_arr","_item","_str","_cfgVeh"];

_unit = _this select 0;
if (count _this > 1) then {
	_type = _this select 1;
}else{
	_cfgVeh = LIB_cfgVeh;

	_str = "gm_backpack_t10_parachute";
	if (configName (_cfgVeh >> _str) != "") then {
		_type = _str;
	};

	if (isNil "_type") then {
		_type = "B_Parachute";
	};
};
diag_log format ["Log: [fnc_unit_addParachute] #landing %1, %2", _this, _type];

_arr = backpackItems _unit;
diag_log format ["Log: [fnc_unit_addParachute] #landing backpackItems %1", _arr];

removeBackpack _unit;
_unit addBackpack _type;

// FIXME: Бесполезно т.к. парашют удаляется и вместе с ним его содержимое.
for "_i" from 0 to (count _arr -1) do {
	_item = _arr select _i;
	_unit addItemToBackpack _item;
};
