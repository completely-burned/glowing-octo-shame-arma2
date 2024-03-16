/*
Создает объект штаба и необходимые переменны,
для последующего добавления в список объектов стороны.
*/

// Должно выполнять централизованно.
if !(isServer) exitWith {
	diag_log format ["Log: [fnc_createHQ]: not server", nil];
};
diag_log format ["Log: [fnc_createHQ]: _this %1", _this];

private ["_r","_grp","_logic","_pos","_class","_status","_str","_side",
	"_obj","_arr","_type","_type_fixed","_code"];

_pos = _this select 0;
_type = _this select 1;
_status = _this select 2;
_side = _this select 3;
_type_fixed = _this select 6;

// BASE (HQ or MHQ)
_class = 0;

#ifdef __ARMA3__
	// Невозможно сразу указать наклон при создании объекта.
	_pos set [2,1900];
#else
	_pos resize 2;
#endif

if (_type == _type_fixed) then {
	_str = _type;
}else{
	_str = _type_fixed;
};
_obj = (createVehicle [_str, _pos, [], 0, "CAN_COLLIDE"]);

//-- направление
if (count _this > 5) then {
	_obj setDir (_this select 5);
};

#ifdef __ARMA3__
	// a3, тс на некоторых позициях взрываются из-за наклона поверхности.
	_obj setVectorUp surfaceNormal _pos;
	// a3, ии покидают тс после ранения от столкновения.
	// Высота не должна быть большой или малой.
	private _box = boundingBox _obj;
	diag_log format ["Log: [fnc_createHQ] %1, boundingBox %2", _this, _box];
	_pos set [2, _box select 1 select 2];
	_obj setPos _pos;
#endif

_grp = gosa_grpLogic;
_logic = _grp createUnit ["Logic", _pos, [], 0, "CAN_COLLIDE"];
_logic attachTo [_obj];

_obj setVariable ["gosa_logic_hq", _logic, false];
// FIXME: ТС становится локальным для водителя,
// и возможно поэтому обычный addEventHandler удаляется.

_code = {
	//params ["_unit", "_killer"];
	private ["_logic","_unit"];
	_unit = _this select 0;
	_logic = _unit getVariable "gosa_logic_hq";
	_logic setDamage 1;
	diag_log format ["Log: [eh_hq]: %1, %2, %3", _logic, _this, alive _logic];
};
#ifdef __A2OA__
	_obj addMPEventHandler ["MPKilled", _code];
#else
	// TODO: Проверить.
	_obj addEventHandler ["Killed", _code];
#endif
// отказоустойчивость
if !(alive _obj) then {
	_logic setDamage 1;
};

// имя маркера
_str = format["%1", _logic];

if (_status > 1) then {
	// MHQ, 2
	_arr = [_obj,objNull,_obj];
}else{
	// HQ,  1
	_arr = [_obj,_obj,objNull];
};

_r = [_logic, _class, _status, _arr, _side, _str];
diag_log format ["Log: [fnc_createHQ]: _r %1", _r];

//--- Добавление штаба в список штабов.
[_r] call compile format["
	gosa_listHQ_%1 = gosa_listHQ_%1 + _this;
	publicVariable 'gosa_listHQ_%1';
", _side];


//-- reveal
if (count _this > 4) then {
	group (_this select 4) addVehicle _obj;
	// FIXME: Local effect.
	(_this select 4) reveal _obj;
};

//-- Синхронизация.
if (isMultiplayer) then {
	_obj setPos _pos;
};

//-- Выравнивание по наклону.
// TODO: Нужна функция.
_obj setVectorUp [0,0,1];

_r;
