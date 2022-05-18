if (({alive _x} count crew _this)>0) exitWith {true};
if (alive assignedDriver    _this) exitWith {true};
if (alive assignedGunner    _this) exitWith {true};
if (alive assignedCommander _this) exitWith {true};
if (({alive _x} count assignedCargo _this)>0) exitWith {true};
false;
