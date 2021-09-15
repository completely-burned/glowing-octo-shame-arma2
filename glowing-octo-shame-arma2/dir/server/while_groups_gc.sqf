/*скрипт ищет пустые неиспользуемые группы и удаляет их
 */

// _t time, _g group, _rm remove
private["_t","_g","_rm"];

// group_system_units это специальная группа в которой создаются боты единоразово, например для единичного выстрела
waitUntil {!isNil "group_system_units"}; // TODO: нужна приставка к переменной

diag_log format ["Log: [while_gc_groups.sqf] start %1", time];

while{true}do{
	sleep 5; // performance
	{
		_g = _x;
		// время создания группам нужно чтобы они не удалялись до формирования отряда
		// время создания обычно уже установленно при формировании отряда
		_t = (_g getVariable "grp_created_time"); // TODO: нужна приставка к переменной
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
					if(alive _x)exitWith{_rm = false}; // FIXME: лишняя проверка т.к. группа с живыми юнитамн не удаляется
				} forEach units _g;

				//--- удаление
				if(_rm)then{
					diag_log format ["Log: [while_gc_groups.sqf] deleteGroup %1, count alive %2", _g, {alive _x} count units _g];
					deleteGroup _g;
				};
			};
		};
		
		sleep 0.01; // FIXME: эта команда сама по себе не нагружает cpu ?? performance

	} forEach allGroups-[group_system_units];
};

diag_log format ["Log: [while_gc_groups.sqf] scriptDone %1, ошибка, этот скрипт не должен завершаться", time];
