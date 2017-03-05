waitUntil {!isNil "CivilianLocation"};
waitUntil {!isNil "civilianBasePos"};

private["_civilianBasePos","_task"];
_civilianBasePos = civilianBasePos;
_task = player createSimpleTask ["currentTask"];
_task setSimpleTaskDestination civilianBasePos;
_task setTaskState "Created";
_task SetSimpleTaskDescription [localize "str_disp_xbox_desc_cityconflict",localize "str_ac_guard",localize "str_ac_guard"];
player setCurrentTask _task;
[objNull,objNull,_task, "Created"] execVM "ca\Modules\MP\data\scriptCommands\taskHint.sqf";

private["_pos"];
while {true} do {
	_pos = civilianBasePos;
	if(((_pos select 0) != (_civilianBasePos select 0)) or ((_pos select 1) != (_civilianBasePos select 1)))then {
		_civilianBasePos = _pos;
		_task setTaskState "succeeded";
		[objNull,objNull,_task, "succeeded"] call compile (preprocessFileLineNumbers "ca\Modules\MP\data\scriptCommands\taskHint.sqf");
		_task = player createSimpleTask ["currentTask"];
		_task setSimpleTaskDestination _pos;
		_task setTaskState "Created";
		_task SetSimpleTaskDescription [localize "str_disp_xbox_desc_cityconflict",localize "str_ac_guard",localize "str_ac_guard"];
		player setCurrentTask _task;
		[objNull,objNull,_task, "Created"] call compile (preprocessFileLineNumbers "ca\Modules\MP\data\scriptCommands\taskHint.sqf");
	};
	sleep 0.5;
};
