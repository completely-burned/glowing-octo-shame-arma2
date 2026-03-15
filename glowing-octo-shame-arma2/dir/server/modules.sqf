private ["_z","_grp"];
#ifndef __ARMA3__
	waitUntil {!isNil "BIS_fnc_init"};
#endif
waitUntil {!isNil "gosa_grpLogic"};
_grp = gosa_grpLogic;

#ifndef __ARMA3__
	#define __str I44_Module_tankPenetration
	if (missionNamespace getVariable "gosa___str" > 0
		&& configName(configFile >> "CfgVehicles" >> "__str") != "") then
	{
		// FIXME: Эта функция просто делает I44_tankPenetration = true;
		_z = (_grp) createUnit ["__str",[1000,10,0],[],0,"NONE"];
		gosa_module___str = _z;
		publicVariable "gosa_module___str";
		diag_log format ["Log: [modules] __str %1 created", _z];
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
#define __str MartaManager
if (missionNamespace getVariable "gosa___str" > 0
	or (missionNamespace getVariable "gosa___str" == -1 && cadetMode)) then
{
	_z = (_grp) createUnit ["__str",[1000,10,0],[],0,"NONE"];
	_z setVariable ["duration", 60, true];
	//--- 3 цвета
	if (missionNamespace getVariable "gosa___str" == 3) then {
		_z setVariable ["disableEnemyColors", true, true];
	};
};
