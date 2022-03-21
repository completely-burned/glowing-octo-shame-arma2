waitUntil {alive player};
player removeAction (player getVariable "_join_grpNull");
player setvariable ["_join_grpNull",nil];
player setvariable ["resetActions_handleBuyMenu", true];
