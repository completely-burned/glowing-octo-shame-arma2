private ["_unit","_type","_arr","_item","_str","_cfgVeh","_faction"];

_unit = _this select 0;
if (vehicle _unit isKindOf "ParachuteBase") exitWith {[false]};

_cfgVeh = LIB_cfgVeh;
_str = backpack _unit;

if (getText (_cfgVeh >> _str >> "ParachuteClass") != "") exitWith {[false, _str]};
if (toLower getText (_cfgVeh >> _str >> "backpackSimulation")
	in ["parachutesteerable"]) exitWith {[false, _str]};

scopeName "root";

if (count _this > 1) then {
	_type = _this select 1;
}else{
	_faction = toUpper getText (_cfgVeh >> typeOf _unit >> "faction");

	if (_faction in ["SPE_WEHRMACHT","SPE_STURM","SPE_MILICE","SPEX_GER_DAK"]) then {
		{
		if (configName (_cfgVeh >> _str) != "") then {
			_type = _str;
			breakTo "root";
		};
		} forEach ["B_SPE_GER_FSJ_Paradrop","B_SPE_GER_LW_Paradrop"];
	};
	if (_faction in ["SPEX_CW_ARMY","SPEX_CW_ARMY_TROP","SPEX_PL_ARMY"]) then {
		{
			if (configName (_cfgVeh >> _x) != "") then {
				_type = _x;
				breakTo "root";
			};
		} forEach ["B_spex_cw_chute_x","B_spex_cw_chute_x_dday","B_spex_cw_chute_x_mk5"];
	};
	if (_faction in ["SPE_US_ARMY","SPEX_CW_ARMY","SPEX_CW_ARMY_TROP","SPEX_PL_ARMY","SPE_FR_ARMY","SPE_FFI"]) then {
		{
			if (configName (_cfgVeh >> _x) != "") then {
				_type = _x;
				breakTo "root";
			};
		} forEach ["B_SPE_US_TypeA3","B_SPE_US_QAC","B_SPEX_CW_RAF_Paradrop","B_SPE_US_T5_M6","B_SPE_US_T5_M7","B_SPE_US_T5_erla"];
	};

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
_unit addBackpackGlobal _type;

// FIXME: Бесполезно т.к. парашют удаляется и вместе с ним его содержимое.
for "_i" from 0 to (count _arr -1) do {
	_item = _arr select _i;
	_unit addItemToBackpack _item;
};

[true, _type];
