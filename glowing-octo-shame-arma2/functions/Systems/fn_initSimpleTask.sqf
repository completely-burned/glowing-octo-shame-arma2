/*
 * Задача.
 * Пока что это всего лишь общее задание с описанием, чтобы игроки не запутались.
 * https://community.bistudio.com/wiki/Arma_3:_Task_Framework_Tutorial
 */
private ["_Task","_unit","_var"];
_unit = _this select 0;

_var = "gosa_Task_Global";

_Task = _unit getVariable _var;
if (isNil "_Task") then {
	_Task = _unit createSimpleTask [_var];
	_unit setVariable [_var, _Task];
	_Task setTaskState "Assigned";
};

_Task setSimpleTaskDescription [
	localize "STR_gosa_Task_Global_LongText",
	localize "STR_gosa_Task_Global",
	""
];
