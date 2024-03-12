/*
 * Стартовый список штабов.
 */

private ["_arr"];
waitUntil {!isNil "gosa_grpLogic"};
waitUntil {!isNil "gosa_types_mhq"};
//--- В переменной gosa_listHQ_%1 будет информация о штабах и постройках стороны.
{
	_arr = ([_x] call gosa_fnc_list_HQ);
	_arr call compile format["gosa_listHQ_%1 = _this", _x];
	publicVariable format["gosa_listHQ_%1", _x];
	diag_log format ["Log: [server_init_HQ]: gosa_listHQ_%1 %2", _x, _arr];
} forEach [east, west, resistance, civilian, sideLogic];
init_list_HQ = true;

#ifndef __ARMA3__
	// Проблема синхронизации publicVariable Arma 2.
	sleep 1;
#endif
gosa_listHQ_init_done = init_list_HQ;
publicVariable "gosa_listHQ_init_done";

diag_log format ["Log: [server_init_HQ]: Done.", nil];
