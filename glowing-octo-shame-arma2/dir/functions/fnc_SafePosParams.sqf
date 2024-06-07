/*
 * Агрументы этой функции используются в другом коде так,
 * что функцию сложно модифицировать,
 * например
 * _pos_resp = ([_pos]+_SafePosParams+[_side]+[_dir] call gosa_fnc_findSafePos);
 * поэтому она объявлена устаревшей, не используйте ее,
 * но оставлена для совместимости.
 */

_this call gosa_fnc_SafePosParams_v2 resize 9;
