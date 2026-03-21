private ["_z","_grp"];
#ifndef __ARMA3__
	waitUntil {!isNil "BIS_fnc_init"};
#endif
waitUntil {!isNil "gosa_grpLogic"};
_grp = gosa_grpLogic;
diag_log format ["Log: [modules] waitUntil post, %1, %2", _grp, time];

#ifndef __ARMA3__
	if (missionNamespace getVariable "gosa_I44_Module_tankPenetration" > 0
		&& configName(configFile >> "CfgVehicles" >> "I44_Module_tankPenetration") != "") then
	{
		// FIXME: Эта функция просто делает I44_tankPenetration = true;
		_z = (_grp) createUnit ["I44_Module_tankPenetration",[1000,10,0],[],0,"NONE"];
		gosa_module_I44_Module_tankPenetration = _z;
		publicVariable "gosa_module_I44_Module_tankPenetration";
		diag_log format ["Log: [modules] I44_Module_tankPenetration %1 created", _z];
	}else{
		// Error Undefined variable in expression: i44_tankpenetration
		// File x\inv44\addons\i44_scripts_vehicles\s\post_init.sqf, line 3
		I44_tankPenetration = false;
		publicVariable "I44_tankPenetration";
	};
#endif

// вылазит ни на что не влияющая ошибка при старте миссии где то во встроенных в игру модулях, конкретно в MartaManager
// нет желания ее искать в fsm файлах, нужен запуск arma tools и распаковка файлов игры
// пока сделаю просто задержку инициализации, нет необходимости срочном запуске модуля
waitUntil {time > 15};
// военные обозначения
if ((missionNamespace getVariable "gosa_MartaManager" > 0
	or (missionNamespace getVariable "gosa_MartaManager" == -1 && cadetMode))
	&& configName(configFile >> "CfgVehicles" >> "MartaManager") != "") then
{
		diag_log format ["Log: [modules] MartaManager create", time];
	_z = (_grp) createUnit ["MartaManager",[1000,10,0],[],0,"NONE"];
	_z setVariable ["duration", 60, true];
	//--- 3 цвета
	if (missionNamespace getVariable "gosa_MartaManager" == 3) then {
		_z setVariable ["disableEnemyColors", true, true];
	};
		diag_log format ["Log: [modules] MartaManager %1 created", _z];
};

diag_log format ["Log: [modules] end %1", time];
