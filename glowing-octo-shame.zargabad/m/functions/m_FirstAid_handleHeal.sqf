private["_unit","_healer","_isMedic"];

_unit = _this select 0;
_healer = _this select 1;
_isMedic = _this select 2;

if (isNil {_unit getVariable "BIS_lifeState"}) exitWith {false};
if (_unit getVariable "BIS_lifeState" == "ALIVE") exitWith {false};

_healer attachto [_unit,[-0.75,0.1,0],""];
_healer setdir 90;

_healer playActionNow "medicStart";
sleep 5;
_healer playActionNow "medicStop";

AISFinishHeal _this;
detach _healer;
_unit setdamage (damage _unit / 2);

_unit setvariable ["BIS_lifeState","ALIVE",true];
_unit setvariable ["BIS_IS_inAgony",false,true];

true;