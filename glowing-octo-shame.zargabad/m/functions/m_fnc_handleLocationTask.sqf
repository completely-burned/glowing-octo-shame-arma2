waitUntil {!isNil "CivilianLocation"};
waitUntil {!isNil "civilianBasePos"};

private["_CivilianLocation","_task"];
_CivilianLocation = CivilianLocation;
_task = player createSimpleTask ["currentTask"];
_task setSimpleTaskDestination civilianBasePos;
_task setTaskState "Created";
_task SetSimpleTaskDescription [localize "str_disp_xbox_desc_cityconflict",localize "str_ac_guard",localize "str_ac_guard"];
player setCurrentTask _task;
[objNull,objNull,_task, "Created"] execVM "ca\Modules\MP\data\scriptCommands\taskHint.sqf";

while {true} do {
	if(CivilianLocation != _CivilianLocation)then {
		_task setTaskState "succeeded";
		[objNull,objNull,_task, "succeeded"] call compile (preprocessFileLineNumbers "ca\Modules\MP\data\scriptCommands\taskHint.sqf");
		_task = player createSimpleTask ["currentTask"];
		_task setSimpleTaskDestination civilianBasePos;
		_task setTaskState "Created";
		_task SetSimpleTaskDescription [localize "str_disp_xbox_desc_cityconflict",localize "str_ac_guard",localize "str_ac_guard"];
		player setCurrentTask _task;
		[objNull,objNull,_task, "Created"] call compile (preprocessFileLineNumbers "ca\Modules\MP\data\scriptCommands\taskHint.sqf");
		_CivilianLocation = CivilianLocation;
	};
	sleep 0.5;
};
