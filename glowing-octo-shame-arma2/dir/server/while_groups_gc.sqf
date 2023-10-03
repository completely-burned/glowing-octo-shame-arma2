/*
скрипт ищет пустые неиспользуемые группы и удаляет их
*/

// _t time, _g group, _rm remove
private["_t","_g","_rm","_arr"];

// group_system_units это специальная группа в которой создаются боты единоразово, например для единичного выстрела
// TODO: нужна приставка к переменной
waitUntil {!isNil "group_system_units"};

diag_log format ["Log: [while_gc_groups.sqf] start %1", time];

while{true}do{
	_arr = (allGroups -[group_system_units]);
	sleep 15;

	for "_i" from 0 to (count _arr -1) do {
		scopeName "grp";
		_g = (_arr select _i);
		sleep 0.01;

		// время создания группам нужно чтобы они не удалялись до формирования отряда
		// время создания обычно уже установленно при формировании отряда
		// TODO: нужна приставка к переменной
		_t = (_g getVariable "grp_created_time");
		if (isNil "_t") then {
			//--- время еще не установленно, группа еще не готова, проверяется в следующем заходе
			_t = time;
			_g setVariable ["grp_created_time", _t];
			diag_log format ["Log: [while_gc_groups.sqf] %1 grp_created_time %2", _g, _t];
		} else {
			//--- времени с момента создания группы прошло достаточно для проверки
			if(_t < (time - 10))then{
				//--- проверка живых юнитов в группе
				_units = units _g;
				for "_i0" from 0 to (count _units -1) do {
					if (alive (_units select _i0)) then {
						diag_log format ["Log: [while_gc_groups.sqf] %1, breakTo 'grp', %2", _g, _t];
						breakTo "grp";
					};
				};
				_g call gosa_fnc_deleteGroup;
			};
		};
	};
};

diag_log format ["Log: [while_gc_groups.sqf] scriptDone %1, ошибка, этот скрипт не должен завершаться", time];
