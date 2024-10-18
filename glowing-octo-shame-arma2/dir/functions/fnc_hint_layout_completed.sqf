#define __A2OA__
/*
 * Сообщение в чате о том что вызванный объект размещен на позиции.
 */

private ["_obj","_str","_obj_name"];

_obj = _this select 0;
_obj_name = _this select 1;

_str = format ["obj: %1, pos: %2, stat: %3", _obj_name, mapGridPosition _obj, localize "str_support_done"];

if (isMultiplayer) then {
	#ifdef __ARMA3__
		[gosa_playerSide, "HQ"] sideChat _str;
	#else
		player sideChat _str;
	#endif
}else{
	#ifdef __A2OA__
		systemChat _str;
	#else
		player groupRadio _str;
	#endif
};
