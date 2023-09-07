#define __A2OA__
/*
 * Аргументы [_new_obj_player, _dead_body, _str_name]
 */

#ifdef __ARMA3__
	[_this select 0, "menu"] call BIS_fnc_addCommMenuItem;
#endif

// Заметки приходится добавлять для нового объекта снова.
_this select 0 call gosa_fnc_initBriefing;

if (gosa_loglevel > 0) then { //diag_log
	_this select 0 setVariable ["MARTA_showRules", gosa_MARTA_showRules]; //diag_log
	SetGroupIconsVisible [true,true]; //diag_log
}; //diag_log

if (count _this > 2) then {
	// Информирование других игроков о возрождении в отряде.
	[nil, _this select 0, rhintresurrected, _this select 2] call RE;
};
