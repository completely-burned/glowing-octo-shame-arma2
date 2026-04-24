/*
Возвращает сторону типа объекта в формате side.

Примеры:
_side = ("BMP3" call fnc_getTypeOfSide);

TODO: Имя функции.
*/

getNumber(configFile >> "CfgVehicles">> _this >> "side") call gosa_fnc_getSide
