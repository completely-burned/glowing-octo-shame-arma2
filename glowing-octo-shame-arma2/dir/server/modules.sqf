waitUntil {!isNil "BIS_fnc_init"};
waitUntil {!isNil "group_logic"};

// вылазит ни на что не влияющая ошибка при старте миссии где то во встроенных в игру модулях, конкретно в MartaManager
// нет желания ее искать в fsm файлах, нужен запуск arma tools и распаковка файлов игры
// пока сделаю просто задержку инициализации, нет необходимости срочном запуске модуля
waitUntil {time > 15};
// военные обозначения
if (missionNamespace getVariable "gosa_MartaManager" == 1 or (missionNamespace getVariable "gosa_MartaManager" == -1 && cadetMode)) then {
	private ["_BIS_marta_mainscope"];
	_BIS_marta_mainscope = (group_logic) createUnit ["MartaManager",[1000,10,0],[],0,"none"];
	_BIS_marta_mainscope setVariable ["duration", 60, true];
};
