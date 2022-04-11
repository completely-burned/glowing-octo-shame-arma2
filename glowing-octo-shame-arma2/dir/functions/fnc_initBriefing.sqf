/*
	Скрипт создает записи инструктажа.
	полезно на новом юните
*/

waitUntil {!isNil "CivilianLocation"};
waitUntil {!isNil "civilianBasePos"};

private["_civilianBasePos","_task","_pos"];
_civilianBasePos = civilianBasePos;

// заметки
player createDiaryRecord ["Diary", [localize "STR_gosa_Сontacts", localize "STR_gosa_Сontacts2"]];
player createDiaryRecord ["Diary", [localize "STR_gosa_Situation", localize "STR_gosa_Situation2"]];

// задание
_task = _this createSimpleTask ["currentTask"];
_task setSimpleTaskDestination _civilianBasePos;
_task setTaskState "Created";
_task SetSimpleTaskDescription [localize "str_disp_xbox_desc_cityconflict", localize "str_ac_guard", localize "str_ac_guard"];
_this setCurrentTask _task;
