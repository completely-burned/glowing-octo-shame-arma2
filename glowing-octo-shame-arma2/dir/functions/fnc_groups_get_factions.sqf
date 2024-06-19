/*
 * Фракции отрядов.
 */
diag_log format ["Log: [fnc_groups_get_factions] %1", _this];
private ["_arr","_return","_str","_cfgVeh"];

_arr = _this select 0;
_arr = _arr select 0;

_cfgVeh = LIB_cfgVeh;
_return = [];

for "_i" from 0 to (count _arr -1) do {
	_str = (_arr select _i select 0 select 0 select 0 select 0);
	_str = getText (_cfgVeh >> _str >> "faction");
	_str = configName (configFile >> "CfgFactionClasses" >> _str);
	if (_str != "") then {
		if !(_str in _return) then {
			_return set [count _return, _str];
		};
	};
};

diag_log format ["Log: [fnc_groups_get_factions] _return %1", _return];
_return;
