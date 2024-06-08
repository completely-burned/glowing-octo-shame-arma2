#define __A2OA__
/*
 * Аргументы [_new_obj_player, _dead_body, _str_name]
 */
diag_log format ["Log: [fnc_eh_playerSelected] %1", _this];

setGroupIconsVisible gosa_GroupIconsVisible;

#ifdef __ARMA3__
if (isMultiplayer) then {
	// В одиночной игре меню дублируется.
	[_this select 0, "menu"] call BIS_fnc_addCommMenuItem;
};
#endif

// Заметки приходится добавлять для нового объекта снова.
_this select 0 call gosa_fnc_initBriefing;

if (gosa_loglevel > 0) then { //diag_log
	_this select 0 setVariable ["MARTA_showRules", gosa_MARTA_showRules]; //diag_log
}; //diag_log

if (count _this > 2) then {
	// Информирование других игроков о возрождении в отряде.
	#ifdef __ARMA3__
		[nil, _this select 0, _this select 2] remoteExec ["rhintresurrectedcode"];
	#else
		[nil, _this select 0, rhintresurrected, _this select 2] call RE;
	#endif
};

// Теоретически это должно улучшить качество респавнов, исправив возникшие проблемы, но после их возникновения и не на 100%.
// TODO: Устранить открытие меню, применение эффектов и другие проблемы. Но на данный момент нет времени искать проблему.
#ifdef __ARMA3__
	["close"] call BIS_fnc_showRespawnMenu;
	if !(isNil "BIS_DeathBlur") then {
		ppEffectDestroy BIS_DeathBlur;
	};
#endif
