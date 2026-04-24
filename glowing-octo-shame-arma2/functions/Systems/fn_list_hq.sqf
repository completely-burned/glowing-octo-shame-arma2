#define __A2OA__
/*
// Генерирует стартовый список штабов и других построек для одной стороны.
[
	// штаб например.
	[
		0.	Объект логики (createUnit "Logic").
		1.	Тип постройки цифрой (штаб, казармы).
		2.	Статус построки цифрой.
			(стройка, развернут, мобилизация и тп).
			От статичных к мобильным.
			Значения виртуальные <0.
		3.	[заменяемый,objHQ,objMHQ].
			Думаю нужно использовать массив объектов, для совместимости с GC.
		4.	Другие данные...
		5.
	],
	[другая база также],
	[и другие объекты бызы в подобном представлении]
]
*/
diag_log format ["Log: [init_listHQ]: _this %1", _this];
private ["_side","_return","_arr","_obj","_types","_logic","_grp","_pos",
	"_class","_status","_completed","_str","_n","_code"];

_side = _this select 0;

_return = [];
_completed = [];

// TODO: Виртуальные типы.
waitUntil {!isNil "gosa_types_mhq"};
_types = gosa_types_mhq;

waitUntil {!isNil "gosa_grpLogic"};
_grp = gosa_grpLogic;

_code = {
	//params ["_unit", "_killer"];
	private ["_logic","_unit"];
	_unit = _this select 0;
	_logic = _unit getVariable "gosa_logic_hq";
	_logic setDamage 1;
	diag_log format ["Log: [eh_hq]: %1, %2, %3", _logic, _this, alive _logic];
};

//--- Поиск уже имеющихся объектов на карте.
// BASE.
_class = 0;
// Транспорт.
_status = 2;
_arr = vehicles;
for "_i" from 0 to (count _arr -1) do {
	_obj = _arr select _i;
	_n = (_types select 1) find toLower typeOf _obj;
	if (_n >= 0) then {
	if (alive _obj
		&& !(_obj in _completed)
		&& (_side == (_types select 0 select _n)) ) then
	{
		_completed set [count _completed, _obj];
		_pos = getPos _obj;
		_logic = _grp createUnit ["Logic", _pos, [], 0, "CAN_COLLIDE"];
		_logic attachTo [_obj];

		_obj setVariable ["gosa_logic_hq", _logic, false];
		#ifdef __A2OA__
			_obj addMPEventHandler ["MPKilled", _code];
		#else
			_obj addEventHandler ["Killed", _code];
		#endif
		// отказоустойчивость
		if !(alive _obj) then {
			_logic setDamage 1;
		};

		// marker.
		// FIXME: Имена не уникальные.
		_str = format["%1", _logic];
		_return set [count _return,
			[_logic, _class, _status, [_obj,objNull,_obj], _side, _str]
		];
	};
	};
};

#ifdef __A2OA__
// Развернутая база.
_status = 1;
_arr = [];
{
	if !(isNil "_x") then {
		_arr = _arr + allMissionObjects _x;
	};
} forEach (_types select 2);
for "_i" from 0 to (count _arr -1) do {
	_obj = _arr select _i;
	_n = (_types select 2) find toLower typeOf _obj;
	if (_n >= 0) then {
	if (alive _obj
		&& !(_obj in _completed)
		&& (_side == (_types select 0 select _n)) ) then
	{
		_completed set [count _completed, _obj];
		_pos = getPos _obj;
		_logic = _grp createUnit ["Logic", _pos, [], 0, "CAN_COLLIDE"];
		_logic attachTo [_obj];

		_obj setVariable ["gosa_logic_hq", _logic, false];
		// TODO: Нужна функция.
		_obj addMPEventHandler ["MPKilled", _code];
		// отказоустойчивость
		if !(alive _obj) then {
			_logic setDamage 1;
		};

		_str = format["%1", _logic];
		_return set [count _return,
			[_logic, _class, _status, [_obj,_obj,objNull], _side, _str]
		];
	};
	};
};
#endif
diag_log format ["Log: [init_listHQ]: _return %1", _return];

_return;
