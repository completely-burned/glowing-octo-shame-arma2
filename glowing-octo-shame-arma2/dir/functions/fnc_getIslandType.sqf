/*
100 - Зима
160 - Лес, Зима, Вода.
180 - Лес, вокруг много воды.
190 - Лес, у моря
200 - Лес
250 - Пустыня, Лес
300 - Пустыня

TODO: Проверка по зависимостям карты и другой информации.
*/

if !(isNil "gosa_IslandType") exitWith {gosa_IslandType};

private ["_w"];
_w = toLower worldName;

if (_w in ["namalsk"]) exitWith {160};
if (_w in ["utes"]) exitWith {180};
if (_w in ["fdf_isle1_a","chernarus"]) exitWith {190};
if (_w in ["woodland_acr","bootcamp_acr"]) exitWith {200};
if (_w in ["zargabad"]) exitWith {250};
if (_w in ["takistan","desert_e","shapur_baf","mountains_acr"]) exitWith {300};

-1;
