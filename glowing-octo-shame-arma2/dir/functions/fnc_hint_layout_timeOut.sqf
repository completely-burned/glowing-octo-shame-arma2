#define __A2OA__
private ["_str","_obj_name"];

_obj_name = _this select 0;

_str = format ["obj: %1, stat: %2", _obj_name, localize "STR_gosa_placing_pos_not_found"];

#ifdef __A2OA__
	systemChat _str;
#else
	player groupRadio _str;
#endif
