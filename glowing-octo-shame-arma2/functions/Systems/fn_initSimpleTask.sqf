/*
 * Задача.
 * Пока что это всего лишь общее задание с описанием, чтобы игроки не запутались.
 * https://community.bistudio.com/wiki/Arma_3:_Task_Framework_Tutorial
 */
private ["_Task","_unit","_var","_description","_civ"];
_unit = _this select 0;

if (side _unit in [civilian,sideLogic]) then {
	_civ = true;
}else{
	_civ = false;
};

_var = "gosa_Task_Global";
_description = [
	localize "STR_gosa_Task_Global_LongText",
	localize "STR_gosa_Task_Global",
	""
];

#ifdef __ARMA3__
	if (_civ) then {
		[_unit, _var, _description] call BIS_fnc_taskCreate;
	}else{
		[_unit, _var, _description, objNull, "ASSIGNED"] call BIS_fnc_taskCreate;
	};
#else
	_Task = _unit getVariable _var;
	if (isNil "_Task") then {
		_Task = _unit createSimpleTask [_var];
		_unit setVariable [_var, _Task];
		if !(_civ) then {
			_Task setTaskState "Assigned";
		};
	};
	_Task setSimpleTaskDescription _description;
#endif

if (_civ) then {
	_var = "gosa_Task_Chill";
	_description = [
		localize "STR_gosa_Task_Chill_LongText",
		localize "STR_gosa_Task_Chill",
		""
	];
	#ifdef __ARMA3__
		[_unit, _var, _description, objNull, "ASSIGNED"] call BIS_fnc_taskCreate;
	#else
		_Task = _unit getVariable _var;
		if (isNil "_Task") then {
			_Task = _unit createSimpleTask [_var];
			_unit setVariable [_var, _Task];
			_Task setTaskState "Assigned";
		};
		_Task setSimpleTaskDescription _description;
	#endif
};
