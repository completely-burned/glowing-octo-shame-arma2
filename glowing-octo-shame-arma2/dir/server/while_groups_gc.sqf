/*
скрипт ищет пустые неиспользуемые группы и удаляет их
*/

// _t time, _g group, _rm remove
private["_t","_g","_rm"];

// group_system_units это специальная группа в которой создаются боты единоразово, например для единичного выстрела
// TODO: нужна приставка к переменной
waitUntil {!isNil "group_system_units"};

diag_log format ["Log: [while_gc_groups.sqf] start %1", time];

while{true}do{
	sleep 5; // performance
	{
		_g = _x;
		// время создания группам нужно чтобы они не удалялись до формирования отряда
		// время создания обычно уже установленно при формировании отряда
		// TODO: нужна приставка к переменной
		_t = (_g getVariable "grp_created_time");
		if ( isNil "_t" ) then {
			//--- время еще не установленно, группа еще не готова, проверяется в следующем заходе
			_t = time;
			_g setVariable ["grp_created_time", _t];
			diag_log format ["Log: [while_gc_groups.sqf] %1 grp_created_time %2", _g, _t ];
		} else {
			//--- времени с момента создания группы прошло достаточно для проверки
			if(_t < (time - 10))then{
				_rm = true;

				//--- проверка живых юнитов в группе
				{
					// FIXME: лишняя проверка т.к. группа с живыми юнитамн не удаляется
					if(alive _x)exitWith{_rm = false};
				} forEach units _g;

				//--- удаление
				if(_rm)then{
					_g call gosa_fnc_deleteGroup;
				};
			};
		};

		// FIXME: эта команда сама по себе не нагружает cpu ?? performance
		sleep 0.01;

	} forEach allGroups-[group_system_units];
};

diag_log format ["Log: [while_gc_groups.sqf] scriptDone %1, ошибка, этот скрипт не должен завершаться", time];
