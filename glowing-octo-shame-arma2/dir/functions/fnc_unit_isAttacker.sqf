#ifdef __ARMA3__
	if !(isNull getAttackTarget (_this select 0)) exitWith {
		diag_log format ["Log: [fnc_unit_isAttacker] %1 getAttackTarget %2", [_this select 0, typeOf (_this select 0)], [getAttackTarget (_this select 0), typeOf getAttackTarget (_this select 0)]];
		true;
	};
#endif

if !(isNull assignedTarget (_this select 0)) exitWith {
	diag_log format ["Log: [fnc_unit_isAttacker] %1 assignedTarget %2", [_this select 0, typeOf (_this select 0)], [assignedTarget (_this select 0), typeOf assignedTarget (_this select 0)]];
	true;
};

//diag_log format ["Log: [fnc_unit_isAttacker] currentCommand %1", currentCommand (_this select 0)];
currentCommand (_this select 0) in ["ATTACK","FIRE","ATTACKFIRE"];
