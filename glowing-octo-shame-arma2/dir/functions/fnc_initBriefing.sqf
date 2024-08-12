/*
	Скрипт создает записи инструктажа.
	полезно на новом юните
*/

waitUntil {!isNil "CivilianLocation"};
waitUntil {!isNil "civilianBasePos"};

private["_civilianBasePos","_task","_pos"];
_civilianBasePos = civilianBasePos;

// заметки
player createDiaryRecord ["Diary", [localize "STR_gosa_Situation", localize "STR_gosa_Situation2"]];
