_logic = player;
player setvariable ["BIS_HC_scope",player];

//--- Radio activations
_radios = if (isnil {_logic getvariable "radios"}) then {[]} else {_logic getvariable "radios"};
_logic setvariable ["radios",_radios,true];

//--- Chain of Command
_coc = if (isnil {_logic getvariable "chainofcommand"}) then {false} else {_logic getvariable "chainofcommand"};
_logic setvariable ["chainofcommand",_coc,true];

//--- Task created
_onTaskCreated = if (isnil {_logic getvariable "onTaskCreated"}) then {{}} else {_logic getvariable "onTaskCreated"};
_logic setvariable ["onTaskCreated",_onTaskCreated,true];

//--- Task assigned
_onTaskAssigned = if (isnil {_logic getvariable "onTaskAssigned"}) then {{}} else {_logic getvariable "onTaskAssigned"};
_logic setvariable ["onTaskAssigned",_onTaskAssigned,true];
