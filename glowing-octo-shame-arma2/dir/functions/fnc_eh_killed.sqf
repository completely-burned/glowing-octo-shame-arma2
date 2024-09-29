// [unit, killer]

diag_log format ["Log: [fnc_eh_killed] %1", _this];

// TODO: выключать прожекторы.

//_this select 0 setVariable ["gosa_killed", [time, _this select 1]];
//_this select 0 setVariable ["gosa_killedTime", time];

_this select 0 call gosa_fnc_clean_vars;

// TODO: бонус за сложность

// TODO: бонус за помощь
