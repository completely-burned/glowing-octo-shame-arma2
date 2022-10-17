/*
Безопасная позиция для возрождения рядом или внутри здания.
*/
diag_log format ["Log: [fnc_getSafePosForObject] _this %1", _this];

private ["_obj","_pos","_dir","_type","_dist"];
_obj = _this select 0;
_pos = _this select 1;
_dir = _this select 2;
/*
if (count _this > 3) then {
	_type = _this select 3;
}else{
	_type = typeOf _obj;
};
*/

//-- Для тс делаем позицию немного сбоку, но в зоне видимости водителя.
// Сначала проверяются передвигающиеся объекты.
if (_obj isKindOf "LandVehicle") exitWith
{
	_dir = (_dir -65);
	_dist = 15;
	_pos = [(_pos select 0) + _dist*sin _dir, (_pos select 1) + _dist*cos _dir];
	diag_log format ["Log: [fnc_getSafePosForObject] %1, LandVehicle", _pos];
	_pos;
};

//-- Нет выхода в центре мобильной базы (развёрнута).
if (_obj isKindOf "Warfare_HQ_base_unfolded") exitWith
{
	// -90 +-10
	_dir = _dir - 100 + random 20;
	_dist = 3 + random 2;
	_pos = [(_pos select 0) + _dist*sin _dir, (_pos select 1) + _dist*cos _dir];
	diag_log format ["Log: [fnc_getSafePosForObject] %1, Warfare_HQ_base_unfolded", _pos];
	_pos;
};

//-- Случаная позиция для казарм и других посроек.
// TODO: У казарм позиция не должна быть в центре из-за столика.
if (_obj isKindOf "Base_WarfareBBarracks"
	or _obj isKindOf "BASE_WarfareBFieldhHospital") exitWith
{
	_dir = random 360;
	_dist = random 10;
	_pos = [(_pos select 0) + _dist*sin _dir, (_pos select 1) + _dist*cos _dir];
	diag_log format ["Log: [fnc_getSafePosForObject] %1, Barracks", _pos];
	_pos;
};

// TODO: Ангар авиации.

//-- Нет выхода в центре.
if (_obj isKindOf "WarfareBDepot") exitWith
{
	_dist = 3;
	_pos = [(_pos select 0) + _dist*sin _dir, (_pos select 1) + _dist*cos _dir];
	diag_log format ["Log: [fnc_getSafePosForObject] %1, WarfareBDepot", _pos];
	_pos;
};

diag_log format ["Log: [fnc_getSafePosForObject] %1, End", _pos];
_pos;
