/*
 * По умолчанию дистанция и высота вычисляется из типа боеприпаса.
*/
private ["_arr","_str","_n","_flareHeightOffset"];
_arr = _this select 0;
_str = _this select 1;
_flareHeightOffset = _this select 2;
diag_log format["Log: [fn_spawnFlare] %1", _this];

// Радиус освещения.
_n = _str call gosa_fnc_flareDist;

// TODO: Сделать круг.
_arr set [0, (_arr select 0) - _n + random (_n*2)];
_arr set [1, (_arr select 1) - _n + random (_n*2)];

// Высота (зависит от скорости падения).
_n = _str call gosa_fnc_flareHeight;
// +-10% + смещение
_arr set [2, (_n - (_n/10) + random (_n/5)) + _flareHeightOffset];

[_arr, _str] call gosa_fnc_createFlare;
