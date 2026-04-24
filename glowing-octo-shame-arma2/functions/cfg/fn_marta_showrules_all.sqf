private ["_arr"];
// Военные обозначения, показ всех, чтобы видеть как и где создаются боты.
_arr = ([] call BIS_fnc_getFactions);
// player setVariable ["MARTA_showRules", ["USMC", 1, "CDF", 0]];
if (typeName (_arr select 0) == typeName (_arr select 1)) then {
	_arr resize count _arr *2;
	for "_i" from (count _arr -1) to 1 step -2 do {
		diag_log format ["Log: [fn_MARTA_showRules_all] _arr set [%1, 1]", _i];
		_arr set [_i, 1];
	};
	for "_i" from (count _arr -2) to 0 step -2 do {
		diag_log format ["Log: [fn_MARTA_showRules_all] _arr set [%1, %2]", _i, _arr select _i];
		_arr set [_i, _arr select (_i/2)];
	};
};
diag_log format ["Log: [fn_MARTA_showRules_all] %1", _arr];
_arr;
