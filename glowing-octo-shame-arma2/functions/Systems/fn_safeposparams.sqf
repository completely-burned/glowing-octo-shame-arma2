/*
 * Агрументы этой функции используются в другом коде так,
 * что функцию сложно модифицировать,
 * например
 * _pos_resp = ([_pos]+_SafePosParams+[_side]+[_dir] call gosa_fnc_findSafePos);
 * поэтому она объявлена устаревшей, не используйте ее,
 * но оставлена для совместимости.
 */

private ["_arr"];
_arr = _this call gosa_fnc_SafePosParams_v2;
_arr resize 9;
diag_log format ["Log: [fnc_SafePosParams] %1, %2", _this, _arr];
_arr;
