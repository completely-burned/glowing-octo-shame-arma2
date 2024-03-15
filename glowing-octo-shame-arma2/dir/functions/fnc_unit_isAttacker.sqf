#ifdef __ARMA3__
	if !(isNull getAttackTarget (_this select 0)) exitWith {
		true;
	};
#endif

if !(isNull assignedTarget (_this select 0)) exitWith {
	true;
};

currentCommand (_this select 0) in ["ATTACK","FIRE","ATTACKFIRE"];
