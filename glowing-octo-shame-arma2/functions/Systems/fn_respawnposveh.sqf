/*
 * Позиции спавна ТС относительно объектов.
 */

private ["_obj","_pos","_dir","_asl","_n","_r","_center","_types","_dist_max",
	"_arr","_return","_var","_hangars","_box","_type","_hangars_size","_size"];


_center = _this select 0;
_types = _this select 1;
_dist_max = _this select 2;
if (count _this > 3) then {
	_type = _this select 3;
};
if (count _this > 4) then {
	_box = _this select 4;
}else{
	if !(isNil "_type") then {
		#ifdef __ARMA3__
			_box = boundingBoxReal _type;
		#else
			_box = boundingBox _type;
		#endif
	};
};
if (count _this > 5) then {
	_size = _this select 5;
}else{
	if !(isNil "_type") then {
		_size = sizeOf _type;
	};
};

_return = [];

// Cписок зданий.
_arr_obj = [];
if (21 in _types) then {
	_hangars = gosa_types_Airport;
	_hangars_size = gosa_params_Airport;
	_arr = nearestObjects [_center, _hangars, _dist_max];
	for "_i" from 0 to (count _arr -1) do {
		scopeName "obj";
		_obj = _arr select _i;
		if (alive _obj) then {
			if !(isNil "_size") then {
				_n = (_hangars_size select 0 find typeOf _obj);
				if (_n >= 0) then {
					if (_size >= (_hangars_size select 1 select _n)) then {
						breakTo "obj";
					};
				};
			};
			if !(_obj in _arr_obj) then {
				if ({_obj distance _x < 20} count _arr_obj <= 0) then {
					_arr_obj set [count _arr_obj, _obj];
				};
			};
		};
	};
	_box = nil;
};
if ({_x in [23,22,20]} count _types > 0) then {
	_helipads = gosa_types_helipad;
	_arr = nearestObjects [_center, _helipads, _dist_max];
	for "_i" from 0 to (count _arr -1) do {
		_obj = _arr select _i;
		if (alive _obj) then {
			if !(_obj in _arr_obj) then {
				if ({_obj distance _x < 20} count _arr_obj <= 0) then {
					_arr_obj set [count _arr_obj, _obj];
				};
			};
		};
	};
};

// Список позиций.
for "_i" from 0 to (count _arr_obj -1) do {
	_obj = _arr_obj select _i;

	_asl = true;
	_pos = getPosASL _obj;
	_dir = getDir _obj;

	if ({_obj isKindOf _X} 
		count ["Land_TentHangar_V1_F","Land_ServiceHangar_01_L_F"] <= 0) then
	{
		_dir = _dir +180;
	};
	// Уже размещенные на карте некоторые Land_TentHangar_V1_F не повернуты, но некоторые да, искать я их конечно же не буду.
	if (_obj isKindOf "Land_TentHangar_V1_F") then {
		// Для настойчивых, чтобы они всё же смогли улететь, но хоть и через одно место.
		if (random 10 >= 9) then {
			_dir = _dir +180;
		};
	};

	// big, right distance left =~35
	//_n = 35/2;
	//_pos = [(_pos select 0) + _n*sin (_dir -90), (_pos select 1) + _n*cos (_dir-90), _pos select 2];
	if ({_obj isKindOf _X} 
		count ["Land_Airport_02_hangar_left_F","Land_vn_airport_02_hangar_left_f"] > 0) then
	{
		_n = 6;
		_pos = [(_pos select 0) + _n*sin (_dir -90), (_pos select 1) + _n*cos (_dir -90), _pos select 2];
	};
	if ({_obj isKindOf _X} 
		count ["Land_Airport_02_hangar_right_F","Land_vn_airport_02_hangar_right_f"] > 0) then
	{
		_n = 6;
		_pos = [(_pos select 0) + _n*sin (_dir +90), (_pos select 1) + _n*cos (_dir +90), _pos select 2];
	};

	// Платформы выступают над поверхностью.
	if (_obj isKindOf "Land_CSLA_UL_V1") then {
		_pos set [2, (_pos select 2) +0.2];
	};
	if (_obj isKindOf "Land_ServiceHangar_01_L_F") then {
		_pos set [2, (_pos select 2) +0.2];
		_n = 9;
		// Enoch
		_pos = [(_pos select 0) + _n*sin (_dir +90), (_pos select 1) + _n*cos (_dir +90), _pos select 2];
	};
	if (_obj isKindOf "Land_ServiceHangar_01_R_F") then {
		_pos set [2, (_pos select 2) +0.2];
		_n = 6;
		_pos = [(_pos select 0) + _n*sin (_dir -90), (_pos select 1) + _n*cos (_dir -90), _pos select 2];
	};

	//- _helipads
	if (_obj isKindOf "Land_AirstripPlatform_01_F") then {
		_pos set [2, (_pos select 2) +5.1];
	};

	//- boundingBox
	if !(isNil "_box") then {
		_pos set [2, (_pos select 2) + (_box select 1 select 2)];
	};

	_return set [count _return, [_obj, _pos, _dir, _asl]];
};

diag_log format ["Log: [fnc_respawnPosVeh] %1 -> %2", _this, _return];
_return;
